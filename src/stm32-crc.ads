--  This spec has been automatically generated from STM32F105xx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package STM32.CRC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- IDR_Register --
   ------------------

   subtype IDR_IDR_Field is STM32.Byte;

   --  Independent Data register
   type IDR_Register is record
      --  Independent Data register
      IDR           : IDR_IDR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      IDR           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_RESET_Field is STM32.Bit;

   --  Control register
   type CR_Register is record
      --  Write-only. Reset bit
      RESET         : CR_RESET_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : STM32.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      RESET         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  CRC calculation unit
   type CRC_Peripheral is record
      --  Data register
      DR  : STM32.Word;
      --  Independent Data register
      IDR : IDR_Register;
      --  Control register
      CR  : CR_Register;
   end record
     with Volatile;

   for CRC_Peripheral use record
      DR  at 0 range 0 .. 31;
      IDR at 4 range 0 .. 31;
      CR  at 8 range 0 .. 31;
   end record;

   --  CRC calculation unit
   CRC_Periph : aliased CRC_Peripheral
     with Import, Address => CRC_Base;

end STM32.CRC;
