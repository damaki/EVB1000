-------------------------------------------------------------------------------
-- Copyright (c) 2016 Daniel King
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
-- deal in the Software without restriction, including without limitation the
-- rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-- sell copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.
-------------------------------------------------------------------------------

with Ada.Real_Time;
with Interfaces;  use Interfaces;
with STM32.GPIO;
with STM32.RCC;
with STM32.SPI;

package body EVB1000.LCD
with SPARK_Mode => Off
is

   RW_Pin   : constant Integer := 10;
   RS_Pin   : constant Integer := 11;
   CS_Pin   : constant Integer := 12;
   MISO_Pin : constant Integer := 14;

   procedure Set_RS(State : in STM32.Bit)
   is
      use type STM32.Bit;
   begin
      if State = 1 then
         STM32.GPIO.GPIOB_Periph.BSRR.BS :=
           STM32.GPIO.BSRR_BS_Field'(As_Array => True,
                                     Arr      => (RS_Pin => 1, others => 0));
      else
         STM32.GPIO.GPIOB_Periph.BSRR.BR :=
           STM32.GPIO.BSRR_BR_Field'(As_Array => True,
                                     Arr      => (RS_Pin => 1, others => 0));
      end if;
   end Set_RS;

   procedure Select_LCD
   is
   begin
      STM32.GPIO.GPIOB_Periph.BSRR.BR :=
        STM32.GPIO.BSRR_BR_Field'(As_Array => True,
                                  Arr      => (CS_Pin => 1, others => 0));
   end Select_LCD;

   procedure Deselect_LCD
   is
   begin
      STM32.GPIO.GPIOB_Periph.BSRR.BS :=
        STM32.GPIO.BSRR_BS_Field'(As_Array => True,
                                  Arr      => (CS_Pin => 1, others => 0));
   end Deselect_LCD;

   --  Send data to the LCD via the SPI bus.
   --
   --  When RS is set to True the RS pin is asserted during the SPI transaction
   procedure Send_To_LCD(RS   : in Boolean;
                         Data : in String)
     with Pre => Data'Length > 0 and Data'Length <= 80
   is
      use type Ada.Real_Time.Time;
      use type Ada.Real_Time.Time_Span;
      use type STM32.Bit;

      First_Byte : Unsigned_8 := Unsigned_8 (Character'Pos (Data (Data'First)));

      Delay_Time : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
      Delay_End  : Ada.Real_Time.Time;

   begin
      Set_RS (if RS then 1 else 0);

      if (not RS) and ((First_Byte and 3) /= 0) then
         -- If the command = 1 or 2 then the execution time is > 1 ms
         Delay_Time := Ada.Real_Time.Milliseconds(2);
      end if;

      Select_LCD;

      for I in Data'Range loop
         loop
            exit when STM32.SPI.SPI2_Periph.SR.TXE = 1;
         end loop;

         STM32.SPI.SPI2_Periph.DR.DR := Unsigned_16 (Character'Pos (Data (I)));
      end loop;

      --  Wait for last byte to finish transmitting
      loop
         exit when STM32.SPI.SPI2_Periph.SR.BSY = 0;
      end loop;

      Set_RS (0);

      Deselect_LCD;

      if Delay_Time > Ada.Real_Time.Time_Span_Zero then
         Delay_End := Ada.Real_Time.Clock + Delay_Time;

         --  Don't use 'delay until' so that this procedure can be called from
         --  protected objects.
         loop
            exit when Ada.Real_Time.Clock >= Delay_End;
         end loop;
      end if;

   end Send_To_LCD;

   --  Send the command to the LCD to reset the cursor back to the origin.
   procedure Cursor_Home
   is
      Command : constant String(1 .. 1) := (others => Character'Val (2));

   begin
      Send_To_LCD (RS   => False,
                   Data => Command);
   end Cursor_Home;

   protected body Driver_Type
   is

      procedure Clear_LCD
      is
         Command : constant String(1 .. 1) := (others => Character'Val (1));

      begin
         Send_To_LCD (RS   => False,
                      Data => Command);
      end Clear_LCD;

      procedure Put(Text_1 : in String;
                    Text_2 : in String)
      is
         Data : String (1 .. 80) := (others => ' ');

      begin
         Clear_LCD;
         Cursor_Home;

         Data (1 .. Text_1'Length)       := Text_1;
         Data (41 .. 40 + Text_2'Length) := Text_2;
         Send_To_LCD (RS   => True,
                      Data => Data);
      end Put;

   end Driver_Type;

begin
   -- Enable SPI and GPIO peripheral clocks
   STM32.RCC.RCC_Periph.APB2ENR.IOPBEN := 1;
   STM32.RCC.RCC_Periph.APB2ENR.AFIOEN := 1;
   STM32.RCC.RCC_Periph.APB1ENR.SPI2EN := 1;

   -- Configure GPIO pins
   STM32.GPIO.GPIOB_Periph.CRH.MODE10 := 2#11#;
   STM32.GPIO.GPIOB_Periph.CRH.MODE11 := 2#11#;
   STM32.GPIO.GPIOB_Periph.CRH.MODE12 := 2#11#;
   STM32.GPIO.GPIOB_Periph.CRH.MODE13 := 2#11#;
   STM32.GPIO.GPIOB_Periph.CRH.MODE14 := 2#00#;
   STM32.GPIO.GPIOB_Periph.CRH.MODE15 := 2#11#;
   STM32.GPIO.GPIOB_Periph.CRH.CNF10  := 2#00#;
   STM32.GPIO.GPIOB_Periph.CRH.CNF11  := 2#00#;
   STM32.GPIO.GPIOB_Periph.CRH.CNF12  := 2#00#;
   STM32.GPIO.GPIOB_Periph.CRH.CNF13  := 2#10#;
   STM32.GPIO.GPIOB_Periph.CRH.CNF14  := 2#10#;
   STM32.GPIO.GPIOB_Periph.CRH.CNF15  := 2#10#;

   -- Deselect LCD
   STM32.GPIO.GPIOB_Periph.BSRR.BS :=
     (As_Array => True,
      Arr      => (CS_Pin   => 1, --  Deselect LCD
                   MISO_Pin => 1, --  Enable pull-up
                   others   => 0));

   -- Clear LCD RS + RW lines
   STM32.GPIO.GPIOB_Periph.BSRR.BR :=
     (As_Array => True,
      Arr      => (RW_Pin => 1,
                   RS_Pin => 1,
                   others => 0));

   -- Reset SPI
   STM32.RCC.RCC_Periph.APB1RSTR.SPI2RST := 1;
   STM32.RCC.RCC_Periph.APB1RSTR.SPI2RST := 0;

   -- Configure SPI
   STM32.SPI.SPI2_Periph.CR1 := (CPHA           => 1,
                                 CPOL           => 1,
                                 MSTR           => 1,
                                 BR             => 2#110#, --  /128 prescaler
                                 SPE            => 0,
                                 LSBFIRST       => 0, --  MSB first
                                 SSI            => 1,
                                 SSM            => 1,
                                 RXONLY         => 0, --  Full duplex
                                 DFF            => 0, --  8-bit data
                                 CRCNEXT        => 0,
                                 CRCEN          => 0, --  No CRC
                                 BIDIOE         => 0,
                                 BIDIMODE       => 0, --  Bidirectional
                                 Reserved_16_31 => 0);
   STM32.SPI.SPI2_Periph.CRCPR.CRCPOLY := 7;
   STM32.SPI.SPI2_Periph.CR1.SPE := 1;

   --  Send init sequence
   declare
      use type Ada.Real_Time.Time;

      --  These constants have been ported from the DecaWave C code.
      Init_Sequence : constant String(1 .. 9) :=
                        (1 => Character'Val (16#39#),
                         2 => Character'Val (16#14#),
                         3 => Character'Val (16#55#),
                         4 => Character'Val (16#6D#),
                         5 => Character'Val (16#78#),
                         6 => Character'Val (16#38#),
                         7 => Character'Val (16#0C#),
                         8 => Character'Val (16#01#),
                         9 => Character'Val (16#06#));

      Now : Ada.Real_Time.Time;
   begin
      --  Give some time for the LCD to start-up before sending the init seq.
      Now := Ada.Real_Time.Clock;
      delay until Now + Ada.Real_Time.Milliseconds(10);

      Send_To_LCD (RS   => False,
                   Data => Init_Sequence);

      -- Leave some more time for the init sequence to finish.
      Now := Ada.Real_Time.Clock;
      delay until Now + Ada.Real_Time.Milliseconds(2);
   end;

end EVB1000.LCD;
