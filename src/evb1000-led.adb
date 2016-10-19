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

package body EVB1000.LED
  with SPARK_Mode => Off
is

   procedure Set_LED(LED : in LED_Number;
                     On  : in Boolean)
   is
   begin
      if On Then
         STM32.GPIO.GPIOC_Periph.BSRR.BS :=
           STM32.GPIO.BSRR_BS_Field'
             (As_Array => True,
              Arr      => (6      => (if LED = 2 then 1 else 0),
                           7      => (if LED = 4 then 1 else 0),
                           8      => (if LED = 1 then 1 else 0),
                           9      => (if LED = 3 then 1 else 0),
                           others => 0));

      else
         STM32.GPIO.GPIOC_Periph.BSRR.BR :=
           STM32.GPIO.BSRR_BR_Field'
             (As_Array => True,
              Arr      => (6      => (if LED = 2 then 1 else 0),
                           7      => (if LED = 4 then 1 else 0),
                           8      => (if LED = 1 then 1 else 0),
                           9      => (if LED = 3 then 1 else 0),
                           others => 0));
      end if;
   end Set_LED;

   procedure Set_LEDs(LEDs : in LED_Array)
   is
   begin
      STM32.GPIO.GPIOC_Periph.BSRR.BS :=
        STM32.GPIO.BSRR_BS_Field'
          (As_Array => True,
           Arr      => (6      => (if LEDs (2) then 1 else 0),
                        7      => (if LEDs (4) then 1 else 0),
                        8      => (if LEDs (1) then 1 else 0),
                        9      => (if LEDs (3) then 1 else 0),
                        others => 0));

      STM32.GPIO.GPIOC_Periph.BSRR.BR :=
        STM32.GPIO.BSRR_BR_Field'
          (As_Array => True,
           Arr      => (6      => (if not LEDs (2) then 1 else 0),
                        7      => (if not LEDs (4) then 1 else 0),
                        8      => (if not LEDs (1) then 1 else 0),
                        9      => (if not LEDs (3) then 1 else 0),
                        others => 0));
   end Set_LEDs;

   procedure Toggle_LED (LED : in LED_Number)
   is
      use type STM32.Bit;

   begin
      case LED is
         when 1 =>
            STM32.GPIO.GPIOC_Periph.BSRR.BR.Arr (8) :=     STM32.GPIO.GPIOC_Periph.ODR.ODR.Arr (8);
            STM32.GPIO.GPIOC_Periph.BSRR.BS.Arr (8) := not STM32.GPIO.GPIOC_Periph.ODR.ODR.Arr (8);
         when 2 =>
            STM32.GPIO.GPIOC_Periph.BSRR.BR.Arr (6) :=     STM32.GPIO.GPIOC_Periph.ODR.ODR.Arr (6);
            STM32.GPIO.GPIOC_Periph.BSRR.BS.Arr (6) := not STM32.GPIO.GPIOC_Periph.ODR.ODR.Arr (6);
         when 3 =>
            STM32.GPIO.GPIOC_Periph.BSRR.BR.Arr (9) :=     STM32.GPIO.GPIOC_Periph.ODR.ODR.Arr (9);
            STM32.GPIO.GPIOC_Periph.BSRR.BS.Arr (9) := not STM32.GPIO.GPIOC_Periph.ODR.ODR.Arr (9);
         when 4 =>
            STM32.GPIO.GPIOC_Periph.BSRR.BR.Arr (7) :=     STM32.GPIO.GPIOC_Periph.ODR.ODR.Arr (7);
            STM32.GPIO.GPIOC_Periph.BSRR.BS.Arr (7) := not STM32.GPIO.GPIOC_Periph.ODR.ODR.Arr (7);
      end case;
   end Toggle_LED;


begin
   --  Enable peripheral clock
   STM32.RCC.RCC_Periph.APB2ENR.IOPCEN := 1;

   --  Configure GPIOs (output 50 MHz, push-pull)
   declare
      CRL : STM32.GPIO.CRL_Register;
      CRH : STM32.GPIO.CRH_Register;
   begin
      CRL := STM32.GPIO.GPIOC_Periph.CRL;
      CRH := STM32.GPIO.GPIOC_Periph.CRH;
      CRL.MODE6 := 2#11#;
      CRL.MODE7 := 2#11#;
      CRH.MODE8 := 2#11#;
      CRH.MODE9 := 2#11#;
      CRL.CNF6  := 2#00#;
      CRL.CNF7  := 2#00#;
      CRH.CNF8  := 2#00#;
      CRH.CNF9  := 2#00#;
      STM32.GPIO.GPIOC_Periph.CRL := CRL;
      STM32.GPIO.GPIOC_Periph.CRH := CRH;
   end;

   Set_LEDs ( (others => False) );

end EVB1000.LED;
