with Ada.Interrupts.Names;
with System;

package EVB1000.USB
with SPARK_Mode => On
is

   Driver_Priority : constant System.Interrupt_Priority := System.Interrupt_Priority'First;
     --  By default, use lowest interrupt priority.
     --  Any interrupt priority value can be used, though.


   Rx_Buffer_Size : constant Positive := 1024;
   --  Configures the size of the USB receive buffer.


   subtype Rx_Length_Number is Natural range 0 .. Rx_Buffer_Size;

   type Rx_Index is mod Rx_Buffer_Size;


   protected Buffer
     with Interrupt_Priority => Driver_Priority
   is

      function Is_Connected return Boolean;
      --  Check if the USB is currently connected.


      function Can_Read return Boolean
        with Global => null;
      --  Check if there is received data waiting to be read.


      entry Read (Str   : in out String;
                  Count :    out Natural)
      with Global => null,
        Depends => (Buffer => + Str,
                    Count  => (Buffer, Str),
                    Str    => + Buffer),
        Contract_Cases => (Str'Length = 0 => Count = 0,
                           Str'Length > 0 => Count in 1 .. Str'Length);
      --  Read data received over USB.
      --
      --  Data is written to the @Str@ buffer. The number of characters read is
      --  written to @Count@. This subprogram will try to fill the @Str@ buffer
      --  but will only read as many characters as available.
      --
      --  This entry blocks until at least 1 byte is available to be read.


      procedure Write (Str : in String);
      --  Write data to be sent via USB.
      --
      --  If the USB is not currently connected then the data is discarded
      --  and this procedure has no effect.


      procedure Data_Received (Str : in String);
      --  Notifies this protected object of data received via USB.
      --
      --  This procedure is called by the USB drivers. It should not be called
      --  by the user.

   private
      Rx_Buffer : String (1 .. Rx_Buffer_Size) := (others => Character'First);
      Rx_Length : Rx_Length_Number             := 0;
      Rx_First  : Rx_Index                     := 0;
      Has_Data  : Boolean                      := False;

   end Buffer;


private

   protected Driver
     with Interrupt_Priority => Driver_Priority
   is

      procedure Write (Str : in String);

      procedure USB_OTG_Interrupt_Handler
        with Attach_Handler => Ada.Interrupts.Names.OTG_FS_Interrupt;

   end Driver;

end EVB1000.USB;
