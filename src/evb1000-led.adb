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

with Interfaces; use Interfaces;
with STM32.GPIO;
with STM32.RCC;

package body EVB1000.LED
  with SPARK_Mode => Off
is
   LED_Pin_Mapping : constant array (LED_Number) of Natural :=
     (1 => 8,
      2 => 6,
      3 => 9,
      4 => 7);

   LED_On_Table : constant array (LED_Number, Boolean) of Unsigned_16
     := (1 => (True  => 16#0100#,
               False => 0),
         2 => (True  => 16#0040#,
               False => 0),
         3 => (True  => 16#0200#,
               False => 0),
         4 => (True  => 16#0080#,
               False => 0));

   LED_Off_Table : constant array (LED_Number, Boolean) of Unsigned_16
     := (1 => (True  => 0,
               False => 16#0100#),
         2 => (True  => 0,
               False => 16#0040#),
         3 => (True  => 0,
               False => 16#0200#),
         4 => (True  => 0,
               False => 16#0080#));

   LED_BSRR_Table : constant
     array (LED_Number, Boolean)
     of STM32.GPIO.BSRR_Register :=
       (1 => (True  => (BS => (As_Array => False,
                               Val      => 16#0100#),
                        BR => (As_Array => False,
                               Val      => 0)),
              False => (BS => (As_Array => False,
                               Val      => 0),
                        BR => (As_Array => False,
                               Val      => 16#0100#))),

        2 => (True  => (BS => (As_Array => False,
                               Val      => 16#0040#),
                        BR => (As_Array => False,
                               Val      => 0)),
              False => (BS => (As_Array => False,
                               Val      => 0),
                        BR => (As_Array => False,
                               Val      => 16#0040#))),

        3 => (True  => (BS => (As_Array => False,
                               Val      => 16#0200#),
                        BR => (As_Array => False,
                               Val      => 0)),
              False => (BS => (As_Array => False,
                               Val      => 0),
                        BR => (As_Array => False,
                               Val      => 16#0200#))),

        4 => (True  => (BS => (As_Array => False,
                               Val      => 16#0080#),
                        BR => (As_Array => False,
                               Val      => 0)),
              False => (BS => (As_Array => False,
                               Val      => 0),
                        BR => (As_Array => False,
                               Val      => 16#0080#))));

   procedure Set_LED(LED : in LED_Number;
                     On  : in Boolean)
   is
   begin
      STM32.GPIO.GPIOC_Periph.BSRR := LED_BSRR_Table (LED, On);
   end Set_LED;

   procedure Set_LEDs(LEDs : in LED_Array)
   is
   begin
      STM32.GPIO.GPIOC_Periph.BSRR :=
        (BS => (As_Array => False,
                Val      => (LED_On_Table (1, LEDs (1))
                             or LED_On_Table (2, LEDs (2))
                             or LED_On_Table (3, LEDs (3))
                             or LED_On_Table (4, LEDs (4)))),
         BR => (As_Array => False,
                Val      => (LED_Off_Table (1, LEDs (1))
                             or LED_Off_Table (2, LEDs (2))
                             or LED_Off_Table (3, LEDs (3))
                             or LED_Off_Table (4, LEDs (4)))));
   end Set_LEDs;

   procedure Toggle_LED (LED : in LED_Number)
   is
      use type STM32.Bit;

      ODR : constant STM32.GPIO.ODR_Field := STM32.GPIO.GPIOC_Periph.ODR.ODR;

   begin
      STM32.GPIO.GPIOC_Periph.BSRR := LED_BSRR_Table
        (LED, ODR.Arr (LED_Pin_Mapping (LED)) = 0);
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
