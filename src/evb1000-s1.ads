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

--  Provides an API for reading the state of the S1 switches on the
--  EVB1000 board.
--
--  On S1 there are 8 individual switches that can be toggled on or off.
--  Out of these switches, only switches 3 .. 8 are available to the
--  STM32F105 host processor, as switches 1 and 2 are used to set the BOOT0
--  and BOOT1 pins.
package EVB1000.S1
with SPARK_Mode => On,
  Abstract_State => (Switch_State with External),
  Initializes => Switch_State
is

   type Bit is mod 2 with Size => 1;

   type Switch_Number is range 3 .. 8;
   -- Only switches 3 .. 8 are available on S1 to the host processor.
   -- Switches 1 and 2 determine the BOOT pins' setting.

   type Switch_Bit_Array is array (Switch_Number) of Bit;

   procedure Read_Switch(Switch : in     Switch_Number;
                         State  :    out Bit)
     with Global => (Input => Switch_State),
     Depends => (State => (Switch_State, Switch));
   --  Read the current state of a switch.
   --
   --  The state of the switch is 1 if the switch is 'on', otherwise it is 0 if
   --  the switch is 'off'.

   procedure Read_All(Switches : out Switch_Bit_Array)
     with Global => (Input => Switch_State),
     Depends => (Switches => Switch_State);
   --  Read the current state of all 6 switches.
   --
   --  The state of each switch is 1 if the switch is 'on', otherwise it is 0 if
   --  the switch is 'off'.

end EVB1000.S1;
