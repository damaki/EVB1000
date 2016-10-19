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


--  Provides an API for controlling the four LEDs on the EVB1000 that are
--  available to the host processor (STM32F105).
--
--  The LEDs are numbered 1 .. 4 in this API, with LED 1 being the leftmost LED
--  and LED 4 being the rightmost LED.
--
--  LEDs 1 and 2 are yellow, and LEDs 3 and 4 are red in color.
package EVB1000.LED
with SPARK_Mode => On,
  Abstract_State => (LEDs_State with External),
  Initializes => LEDs_State
is
   type LED_Number is range 1 .. 4;

   type LED_Array is array (LED_Number) of Boolean;

   procedure Set_LED(LED : in LED_Number;
                     On  : in Boolean)
     with Global => (In_Out => LEDs_State),
     Depends => (LEDs_State => + (LED, On));

   procedure Set_LEDs(LEDs : in LED_Array)
     with Global => (Output => LEDs_State),
     Depends => (LEDs_State => LEDs);

   procedure Toggle_LED (LED : in LED_Number)
     with Global => (In_Out => LEDs_State),
     Depends => (LEDs_State => + LED);

end EVB1000.LED;
