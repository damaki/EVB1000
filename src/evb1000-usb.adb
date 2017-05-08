with Interfaces; use Interfaces;
with STM32.GPIO;
with STM32.RCC;

package body EVB1000.USB
with SPARK_Mode => Off
is

   Connected  : Boolean := False;
   Configured : Boolean := False;
   Suspended  : Boolean := False;

   ----------------------------------------------------------------------------
   --  Imported subprograms from the ST USB library
   --  (implemented in C, called by Ada)
   ----------------------------------------------------------------------------

   procedure USB_Init
     with Convention => C,
     Import => True,
     External_Name => "USB_Init";


   procedure OTG_FS_IRQHandler
     with Convention => C,
     Import => True,
     External_Name => "OTG_FS_IRQHandler";


   function VCP_DataTx (Buffer : in System.Address;
                        Length : in Interfaces.Unsigned_32)
                        return Interfaces.Unsigned_16
     with Convention => C,
     Import => True,
     External_Name => "VCP_DataTx";


   ----------------------------------------------------------------------------
   --  Exported programs
   --  (implemented in Ada, called by C)
   ----------------------------------------------------------------------------
   function VCP_DataRx (Buffer_Ptr : in System.Address;
                        Length     : in Interfaces.Unsigned_32)
                        return Interfaces.Unsigned_16
     with Convention => C,
     Export => True,
     External_Name => "VCP_DataRx";


   procedure USBD_USR_DeviceConfigured
     with Convention => C,
     Export => True,
     External_Name => "USBD_USR_DeviceConfigured";


   procedure USBD_USR_DeviceConnected
     with Convention => C,
     Export => True,
     External_Name => "USBD_USR_DeviceConnected";

   procedure USBD_USR_DeviceDisconnected
     with Convention => C,
     Export => True,
     External_Name => "USBD_USR_DeviceDisconnected";


   procedure USBD_USR_DeviceSuspended
     with Convention => C,
     Export => True,
     External_Name => "USBD_USR_DeviceSuspended";

   procedure USBD_USR_DeviceResumed
     with Convention => C,
     Export => True,
     External_Name => "USBD_USR_DeviceResumed";



   function VCP_DataRx (Buffer_Ptr : in System.Address;
                        Length     : in Interfaces.Unsigned_32)
                        return Interfaces.Unsigned_16
   is
      subtype Overlay_String is String (1 .. Natural (Length));

      Buffer_Overlay : aliased Overlay_String
        with Address => Buffer_Ptr;

   begin
      if Connected and Configured then
         Buffer.Data_Received (Buffer_Overlay);
      end if;
      return 0; -- USBD_OK
   end VCP_DataRx;


   procedure USBD_USR_DeviceConfigured
   is
   begin
      Configured := True;
   end USBD_USR_DeviceConfigured;


   procedure USBD_USR_DeviceConnected
   is
   begin
      Connected := True;
   end USBD_USR_DeviceConnected;


   procedure USBD_USR_DeviceDisconnected
   is
   begin
      Connected  := False;
      Configured := False;
   end USBD_USR_DeviceDisconnected;


   procedure USBD_USR_DeviceSuspended
   is
   begin
      Suspended := True;
   end USBD_USR_DeviceSuspended;


   procedure USBD_USR_DeviceResumed
   is
   begin
      Suspended := False;
   end USBD_USR_DeviceResumed;


   protected body Buffer
   is

      function Is_Connected return Boolean
      is
      begin
         return Connected;
      end Is_Connected;


      function Can_Read return Boolean
      is
      begin
         return Has_Data;
      end Can_Read;


      entry Read (Str   : in out String;
                  Count :    out Natural)
        when Has_Data
      is
         Str_Pos : Integer := Str'First;

      begin
         Count := 0;

         while Count < Str'Length and Count < Rx_Length loop
            Str (Str_Pos) := Rx_Buffer (Integer (Rx_First) + 1);

            Str_Pos  := Str_Pos  + 1;
            Rx_First := Rx_First + 1;
            Count    := Count    + 1;
         end loop;

         Rx_Length := Rx_Length - Count;
         Has_Data  := Rx_Length > 0;
      end Read;


      procedure Write (Str : in String)
      is
      begin
         --if Is_Connected then
            Driver.Write (Str);
         --end if;
      end Write;


      procedure Data_Received (Str : in String)
      is
         Str_Length : Natural;
         Free_Space : Rx_Length_Number;
         Buffer_Pos : Rx_Index;
         Str_Pos    : Integer;

      begin
         if Str'Length > 0 then

            if Str'Length <= Rx_Buffer_Size then
               Str_Length := Str'Length;

            else
               --  Discard any data past the maximum buffer size.
               Str_Length := Rx_Buffer_Size;
            end if;


            if Rx_Length = 0 then
               --  Rx buffer is empty.
               Rx_Buffer (1 .. Str_Length) :=
                 Str (Str'First .. Str'First + Str_Length - 1);

               Rx_Length := Str_Length;
               Rx_First  := 0;

            else
               Free_Space := Rx_Buffer_Size - Rx_Length;

               if Free_Space > 0 then

                  if Str_Length > Free_Space then
                  --  Not enough free space to store all data.
                  --  Only store the first data.
                     Str_Length := Free_Space;
                  end if;

                  Buffer_Pos := Rx_First + Rx_Index (Rx_Length);
                  Str_Pos    := Str'First;

                  while Str_Length > 0 loop
                     Rx_Buffer (Integer (Buffer_Pos) + 1) := Str (Str_Pos);

                     Buffer_Pos := Buffer_Pos + 1;
                     Str_Pos    := Str_Pos    + 1;
                     Str_Length := Str_Length - 1;
                  end loop;

               end if;
            end if;

            Has_Data := True;
         end if;
      end Data_Received;

   end Buffer;



   protected body Driver
   is

      procedure Write (Str : in String)
      is
         Result : Unsigned_16;

      begin
         Result := VCP_DataTx (Str'Address, Unsigned_32 (Str'Length));
         pragma Unreferenced (Result);
      end Write;


      procedure USB_OTG_Interrupt_Handler
      is
      begin
         --  Forward to ST's USB library in C land.
         OTG_FS_IRQHandler;
      end USB_OTG_Interrupt_Handler;

   end Driver;


begin
   --  Set PA9 to floating input
   --  Set PA10 to input with pull-up
   --  Set PA11 and PA12 to output push-pull @ 50 MHz
   STM32.GPIO.GPIOA_Periph.CRH.MODE9  := 2#00#; -- input
   STM32.GPIO.GPIOA_Periph.CRH.MODE10 := 2#00#; -- input
   STM32.GPIO.GPIOA_Periph.CRH.MODE11 := 2#11#; -- output 50 MHz
   STM32.GPIO.GPIOA_Periph.CRH.MODE12 := 2#11#; -- output 50 MHz

   STM32.GPIO.GPIOA_Periph.CRH.CNF9  := 2#01#; -- Floating input
   STM32.GPIO.GPIOA_Periph.CRH.CNF10 := 2#10#; -- Input with pull up/down
   STM32.GPIO.GPIOA_Periph.CRH.CNF11 := 2#00#; -- GP output push-pull
   STM32.GPIO.GPIOA_Periph.CRH.CNF12 := 2#00#; -- GP output push-pull

   STM32.GPIO.GPIOA_Periph.BSRR.BS.Arr (10) := 1;  -- Use pull-up

   --  Enable USB peripheral clock
   STM32.RCC.RCC_Periph.AHBENR.OTGFSEN := 1;

   USB_Init; --  ST's C library initialization routine.

end EVB1000.USB;
