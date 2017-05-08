with EVB1000.LCD;
with EVB1000.LED;
with EVB1000.USB;

procedure USB_Echo
is
   Str   : String (1 .. 128);
   Count : Natural;

begin

   loop
      --  Toggle the first LED each time we read data.
      EVB1000.LED.Toggle_LED (1);

      EVB1000.USB.Buffer.Read (Str, Count);
      EVB1000.USB.Buffer.Write (Str (1 .. Count));

      if Count > 16 then
         Count := 16;
      end if;

      --  Also display the contents of the last data to the LCD.
      --  The top line shows the content of the last data read.
      --  The bottom line shows the number of characters read.
      EVB1000.LCD.Driver.Put
        (Text_1 => Str (1 .. Count),
         Text_2 => Integer'Image (Count));
   end loop;

end USB_Echo;
