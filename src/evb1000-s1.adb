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

with STM32.GPIO;
with STM32.RCC;

package body EVB1000.S1
with SPARK_Mode => Off
is

   procedure Read_Switch(Switch : in     Switch_Number;
                         State  :    out Bit)
   is
      IDR : STM32.GPIO.IDR_Field;

   begin
      IDR   := STM32.GPIO.GPIOC_Periph.IDR.IDR;

      --  The switch is 'on' when the pin is low.
      State := not Bit (IDR.Arr (Integer (Switch - 3)));
   end Read_Switch;

   procedure Read_All(Switches : out Switch_Bit_Array)
   is
      IDR : STM32.GPIO.IDR_Field;

   begin
      IDR := STM32.GPIO.GPIOC_Periph.IDR.IDR;

      --  The switch is 'on' when the pin is low.
      Switches := (3 => not Bit (IDR.Arr (0)),
                   4 => not Bit (IDR.Arr (1)),
                   5 => not Bit (IDR.Arr (2)),
                   6 => not Bit (IDR.Arr (3)),
                   7 => not Bit (IDR.Arr (4)),
                   8 => not Bit (IDR.Arr (5)));
   end Read_All;


begin
   --  Enable peripheral clock
   STM32.RCC.RCC_Periph.APB2ENR.IOPCEN := 1;

   --  Configure GPIOs (Floating input)
   STM32.GPIO.GPIOC_Periph.CRL.MODE0 := 2#00#;
   STM32.GPIO.GPIOC_Periph.CRL.MODE1 := 2#00#;
   STM32.GPIO.GPIOC_Periph.CRL.MODE2 := 2#00#;
   STM32.GPIO.GPIOC_Periph.CRL.MODE3 := 2#00#;
   STM32.GPIO.GPIOC_Periph.CRL.MODE4 := 2#00#;
   STM32.GPIO.GPIOC_Periph.CRL.MODE5 := 2#00#;
   STM32.GPIO.GPIOC_Periph.CRL.CNF0  := 2#01#;
   STM32.GPIO.GPIOC_Periph.CRL.CNF1  := 2#01#;
   STM32.GPIO.GPIOC_Periph.CRL.CNF2  := 2#01#;
   STM32.GPIO.GPIOC_Periph.CRL.CNF3  := 2#01#;
   STM32.GPIO.GPIOC_Periph.CRL.CNF4  := 2#01#;
   STM32.GPIO.GPIOC_Periph.CRL.CNF5  := 2#01#;

end EVB1000.S1;
