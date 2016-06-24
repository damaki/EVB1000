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

pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy(Sequential);

with System;

--  Provides an API for writing ASCII text to the two-line LCD on the EVB1000
--  board.
--
--  The LCD has two rows capable of displaying ASCII text. Each row can display
--  a maximum of 16 characters.
--
--  The LCD driver is implemented as a protected object in order to protect
--  the SPI interface against race conditions.
--
--  Below is an example of using this API:
--
--     EVB1000.LCD.Driver.Put(Line_1 => "Hello",
--                            Line_2 => "World!");
package EVB1000.LCD
with SPARK_Mode => On,
  Abstract_State => (LCD_State with External),
  Initializes    => LCD_State
is

   protected type Driver_Type with Priority => System.Priority'Last
   is
      procedure Clear_LCD
        with Global => (In_Out => LCD_State),
        Depends => (LCD_State    => LCD_State,
                    Driver_Type  => Driver_Type);
      --  Clear the LCD.

      procedure Put(Text_1 : in String;
                    Text_2 : in String)
        with Global => (In_Out => LCD_State),
        Depends => (LCD_State    => + (Text_1, Text_2),
                    Driver_Type  => Driver_Type),
        Pre => Text_1'Length <= 16 and Text_2'Length <= 16;
      --  Set the text for lines 1 (top line) and 2 (bottom line) on the LCD.
      --
      --  Both lines can display a maximum of 16 characters.
   end Driver_Type;

   Driver : Driver_Type;

end EVB1000.LCD;
