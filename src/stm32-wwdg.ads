--  This spec has been automatically generated from STM32F105xx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package STM32.WWDG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_T_Field is STM32.UInt7;
   subtype CR_WDGA_Field is STM32.Bit;

   --  Control register (WWDG_CR)
   type CR_Register is record
      --  7-bit counter (MSB to LSB)
      T             : CR_T_Field := 16#7F#;
      --  Activation bit
      WDGA          : CR_WDGA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      T             at 0 range 0 .. 6;
      WDGA          at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   ------------------
   -- CFR_Register --
   ------------------

   subtype CFR_W_Field is STM32.UInt7;
   subtype CFR_WDGTB_Field is STM32.UInt2;
   subtype CFR_EWI_Field is STM32.Bit;

   --  Configuration register (WWDG_CFR)
   type CFR_Register is record
      --  7-bit window value
      W              : CFR_W_Field := 16#7F#;
      --  Timer Base
      WDGTB          : CFR_WDGTB_Field := 16#0#;
      --  Early Wakeup Interrupt
      EWI            : CFR_EWI_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFR_Register use record
      W              at 0 range 0 .. 6;
      WDGTB          at 0 range 7 .. 8;
      EWI            at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -----------------
   -- SR_Register --
   -----------------

   subtype SR_EWI_Field is STM32.Bit;

   --  Status register (WWDG_SR)
   type SR_Register is record
      --  Early Wakeup Interrupt
      EWI           : SR_EWI_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : STM32.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      EWI           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Window watchdog
   type WWDG_Peripheral is record
      --  Control register (WWDG_CR)
      CR  : CR_Register;
      --  Configuration register (WWDG_CFR)
      CFR : CFR_Register;
      --  Status register (WWDG_SR)
      SR  : SR_Register;
   end record
     with Volatile;

   for WWDG_Peripheral use record
      CR  at 0 range 0 .. 31;
      CFR at 4 range 0 .. 31;
      SR  at 8 range 0 .. 31;
   end record;

   --  Window watchdog
   WWDG_Periph : aliased WWDG_Peripheral
     with Import, Address => WWDG_Base;

end STM32.WWDG;
