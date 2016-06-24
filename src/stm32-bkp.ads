--  This spec has been automatically generated from STM32F105xx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package STM32.BKP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- DR1_Register --
   ------------------

   subtype DR1_D1_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR1_Register is record
      --  Backup data
      D1             : DR1_D1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR1_Register use record
      D1             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- DR2_Register --
   ------------------

   subtype DR2_D2_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR2_Register is record
      --  Backup data
      D2             : DR2_D2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR2_Register use record
      D2             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- DR3_Register --
   ------------------

   subtype DR3_D3_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR3_Register is record
      --  Backup data
      D3             : DR3_D3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR3_Register use record
      D3             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- DR4_Register --
   ------------------

   subtype DR4_D4_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR4_Register is record
      --  Backup data
      D4             : DR4_D4_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR4_Register use record
      D4             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- DR5_Register --
   ------------------

   subtype DR5_D5_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR5_Register is record
      --  Backup data
      D5             : DR5_D5_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR5_Register use record
      D5             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- DR6_Register --
   ------------------

   subtype DR6_D6_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR6_Register is record
      --  Backup data
      D6             : DR6_D6_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR6_Register use record
      D6             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- DR7_Register --
   ------------------

   subtype DR7_D7_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR7_Register is record
      --  Backup data
      D7             : DR7_D7_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR7_Register use record
      D7             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- DR8_Register --
   ------------------

   subtype DR8_D8_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR8_Register is record
      --  Backup data
      D8             : DR8_D8_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR8_Register use record
      D8             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   ------------------
   -- DR9_Register --
   ------------------

   subtype DR9_D9_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR9_Register is record
      --  Backup data
      D9             : DR9_D9_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR9_Register use record
      D9             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR10_Register --
   -------------------

   subtype DR10_D10_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR10_Register is record
      --  Backup data
      D10            : DR10_D10_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR10_Register use record
      D10            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --------------------
   -- RTCCR_Register --
   --------------------

   subtype RTCCR_CAL_Field is STM32.UInt7;
   subtype RTCCR_CCO_Field is STM32.Bit;

   --  RTC clock calibration register (BKP_RTCCR)
   type RTCCR_Register is record
      --  Calibration value
      CAL           : RTCCR_CAL_Field := 16#0#;
      --  Calibration Clock Output
      CCO           : RTCCR_CCO_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTCCR_Register use record
      CAL           at 0 range 0 .. 6;
      CCO           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- CR_Register --
   -----------------

   subtype CR_TPE_Field is STM32.Bit;
   subtype CR_TPAL_Field is STM32.Bit;

   --  Backup control register (BKP_CR)
   type CR_Register is record
      --  Tamper pin enable
      TPE           : CR_TPE_Field := 16#0#;
      --  Tamper pin active level
      TPAL          : CR_TPAL_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : STM32.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      TPE           at 0 range 0 .. 0;
      TPAL          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   ------------------
   -- CSR_Register --
   ------------------

   subtype CSR_CTE_Field is STM32.Bit;
   subtype CSR_CTI_Field is STM32.Bit;
   subtype CSR_TPIE_Field is STM32.Bit;
   subtype CSR_TEF_Field is STM32.Bit;
   subtype CSR_TIF_Field is STM32.Bit;

   --  BKP_CSR control/status register
   type CSR_Register is record
      --  Write-only. Clear Tamper event
      CTE            : CSR_CTE_Field := 16#0#;
      --  Write-only. Clear Tamper Interrupt
      CTI            : CSR_CTI_Field := 16#0#;
      --  Tamper Pin interrupt enable
      TPIE           : CSR_TPIE_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : STM32.UInt5 := 16#0#;
      --  Read-only. Tamper Event Flag
      TEF            : CSR_TEF_Field := 16#0#;
      --  Read-only. Tamper Interrupt Flag
      TIF            : CSR_TIF_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      CTE            at 0 range 0 .. 0;
      CTI            at 0 range 1 .. 1;
      TPIE           at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      TEF            at 0 range 8 .. 8;
      TIF            at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -------------------
   -- DR11_Register --
   -------------------

   subtype DR11_DR11_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR11_Register is record
      --  Backup data
      DR11           : DR11_DR11_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR11_Register use record
      DR11           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR12_Register --
   -------------------

   subtype DR12_DR12_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR12_Register is record
      --  Backup data
      DR12           : DR12_DR12_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR12_Register use record
      DR12           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR13_Register --
   -------------------

   subtype DR13_DR13_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR13_Register is record
      --  Backup data
      DR13           : DR13_DR13_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR13_Register use record
      DR13           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR14_Register --
   -------------------

   subtype DR14_D14_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR14_Register is record
      --  Backup data
      D14            : DR14_D14_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR14_Register use record
      D14            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR15_Register --
   -------------------

   subtype DR15_D15_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR15_Register is record
      --  Backup data
      D15            : DR15_D15_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR15_Register use record
      D15            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR16_Register --
   -------------------

   subtype DR16_D16_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR16_Register is record
      --  Backup data
      D16            : DR16_D16_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR16_Register use record
      D16            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR17_Register --
   -------------------

   subtype DR17_D17_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR17_Register is record
      --  Backup data
      D17            : DR17_D17_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR17_Register use record
      D17            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR18_Register --
   -------------------

   subtype DR18_D18_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR18_Register is record
      --  Backup data
      D18            : DR18_D18_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR18_Register use record
      D18            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR19_Register --
   -------------------

   subtype DR19_D19_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR19_Register is record
      --  Backup data
      D19            : DR19_D19_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR19_Register use record
      D19            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR20_Register --
   -------------------

   subtype DR20_D20_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR20_Register is record
      --  Backup data
      D20            : DR20_D20_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR20_Register use record
      D20            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR21_Register --
   -------------------

   subtype DR21_D21_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR21_Register is record
      --  Backup data
      D21            : DR21_D21_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR21_Register use record
      D21            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR22_Register --
   -------------------

   subtype DR22_D22_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR22_Register is record
      --  Backup data
      D22            : DR22_D22_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR22_Register use record
      D22            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR23_Register --
   -------------------

   subtype DR23_D23_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR23_Register is record
      --  Backup data
      D23            : DR23_D23_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR23_Register use record
      D23            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR24_Register --
   -------------------

   subtype DR24_D24_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR24_Register is record
      --  Backup data
      D24            : DR24_D24_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR24_Register use record
      D24            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR25_Register --
   -------------------

   subtype DR25_D25_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR25_Register is record
      --  Backup data
      D25            : DR25_D25_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR25_Register use record
      D25            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR26_Register --
   -------------------

   subtype DR26_D26_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR26_Register is record
      --  Backup data
      D26            : DR26_D26_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR26_Register use record
      D26            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR27_Register --
   -------------------

   subtype DR27_D27_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR27_Register is record
      --  Backup data
      D27            : DR27_D27_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR27_Register use record
      D27            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR28_Register --
   -------------------

   subtype DR28_D28_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR28_Register is record
      --  Backup data
      D28            : DR28_D28_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR28_Register use record
      D28            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR29_Register --
   -------------------

   subtype DR29_D29_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR29_Register is record
      --  Backup data
      D29            : DR29_D29_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR29_Register use record
      D29            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR30_Register --
   -------------------

   subtype DR30_D30_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR30_Register is record
      --  Backup data
      D30            : DR30_D30_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR30_Register use record
      D30            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR31_Register --
   -------------------

   subtype DR31_D31_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR31_Register is record
      --  Backup data
      D31            : DR31_D31_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR31_Register use record
      D31            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR32_Register --
   -------------------

   subtype DR32_D32_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR32_Register is record
      --  Backup data
      D32            : DR32_D32_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR32_Register use record
      D32            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR33_Register --
   -------------------

   subtype DR33_D33_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR33_Register is record
      --  Backup data
      D33            : DR33_D33_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR33_Register use record
      D33            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR34_Register --
   -------------------

   subtype DR34_D34_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR34_Register is record
      --  Backup data
      D34            : DR34_D34_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR34_Register use record
      D34            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR35_Register --
   -------------------

   subtype DR35_D35_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR35_Register is record
      --  Backup data
      D35            : DR35_D35_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR35_Register use record
      D35            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR36_Register --
   -------------------

   subtype DR36_D36_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR36_Register is record
      --  Backup data
      D36            : DR36_D36_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR36_Register use record
      D36            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR37_Register --
   -------------------

   subtype DR37_D37_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR37_Register is record
      --  Backup data
      D37            : DR37_D37_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR37_Register use record
      D37            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR38_Register --
   -------------------

   subtype DR38_D38_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR38_Register is record
      --  Backup data
      D38            : DR38_D38_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR38_Register use record
      D38            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR39_Register --
   -------------------

   subtype DR39_D39_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR39_Register is record
      --  Backup data
      D39            : DR39_D39_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR39_Register use record
      D39            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR40_Register --
   -------------------

   subtype DR40_D40_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR40_Register is record
      --  Backup data
      D40            : DR40_D40_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR40_Register use record
      D40            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR41_Register --
   -------------------

   subtype DR41_D41_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR41_Register is record
      --  Backup data
      D41            : DR41_D41_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR41_Register use record
      D41            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DR42_Register --
   -------------------

   subtype DR42_D42_Field is STM32.Short;

   --  Backup data register (BKP_DR)
   type DR42_Register is record
      --  Backup data
      D42            : DR42_D42_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR42_Register use record
      D42            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Backup registers
   type BKP_Peripheral is record
      --  Backup data register (BKP_DR)
      DR1   : DR1_Register;
      --  Backup data register (BKP_DR)
      DR2   : DR2_Register;
      --  Backup data register (BKP_DR)
      DR3   : DR3_Register;
      --  Backup data register (BKP_DR)
      DR4   : DR4_Register;
      --  Backup data register (BKP_DR)
      DR5   : DR5_Register;
      --  Backup data register (BKP_DR)
      DR6   : DR6_Register;
      --  Backup data register (BKP_DR)
      DR7   : DR7_Register;
      --  Backup data register (BKP_DR)
      DR8   : DR8_Register;
      --  Backup data register (BKP_DR)
      DR9   : DR9_Register;
      --  Backup data register (BKP_DR)
      DR10  : DR10_Register;
      --  RTC clock calibration register (BKP_RTCCR)
      RTCCR : RTCCR_Register;
      --  Backup control register (BKP_CR)
      CR    : CR_Register;
      --  BKP_CSR control/status register
      CSR   : CSR_Register;
      --  Backup data register (BKP_DR)
      DR11  : DR11_Register;
      --  Backup data register (BKP_DR)
      DR12  : DR12_Register;
      --  Backup data register (BKP_DR)
      DR13  : DR13_Register;
      --  Backup data register (BKP_DR)
      DR14  : DR14_Register;
      --  Backup data register (BKP_DR)
      DR15  : DR15_Register;
      --  Backup data register (BKP_DR)
      DR16  : DR16_Register;
      --  Backup data register (BKP_DR)
      DR17  : DR17_Register;
      --  Backup data register (BKP_DR)
      DR18  : DR18_Register;
      --  Backup data register (BKP_DR)
      DR19  : DR19_Register;
      --  Backup data register (BKP_DR)
      DR20  : DR20_Register;
      --  Backup data register (BKP_DR)
      DR21  : DR21_Register;
      --  Backup data register (BKP_DR)
      DR22  : DR22_Register;
      --  Backup data register (BKP_DR)
      DR23  : DR23_Register;
      --  Backup data register (BKP_DR)
      DR24  : DR24_Register;
      --  Backup data register (BKP_DR)
      DR25  : DR25_Register;
      --  Backup data register (BKP_DR)
      DR26  : DR26_Register;
      --  Backup data register (BKP_DR)
      DR27  : DR27_Register;
      --  Backup data register (BKP_DR)
      DR28  : DR28_Register;
      --  Backup data register (BKP_DR)
      DR29  : DR29_Register;
      --  Backup data register (BKP_DR)
      DR30  : DR30_Register;
      --  Backup data register (BKP_DR)
      DR31  : DR31_Register;
      --  Backup data register (BKP_DR)
      DR32  : DR32_Register;
      --  Backup data register (BKP_DR)
      DR33  : DR33_Register;
      --  Backup data register (BKP_DR)
      DR34  : DR34_Register;
      --  Backup data register (BKP_DR)
      DR35  : DR35_Register;
      --  Backup data register (BKP_DR)
      DR36  : DR36_Register;
      --  Backup data register (BKP_DR)
      DR37  : DR37_Register;
      --  Backup data register (BKP_DR)
      DR38  : DR38_Register;
      --  Backup data register (BKP_DR)
      DR39  : DR39_Register;
      --  Backup data register (BKP_DR)
      DR40  : DR40_Register;
      --  Backup data register (BKP_DR)
      DR41  : DR41_Register;
      --  Backup data register (BKP_DR)
      DR42  : DR42_Register;
   end record
     with Volatile;

   for BKP_Peripheral use record
      DR1   at 0 range 0 .. 31;
      DR2   at 4 range 0 .. 31;
      DR3   at 8 range 0 .. 31;
      DR4   at 12 range 0 .. 31;
      DR5   at 16 range 0 .. 31;
      DR6   at 20 range 0 .. 31;
      DR7   at 24 range 0 .. 31;
      DR8   at 28 range 0 .. 31;
      DR9   at 32 range 0 .. 31;
      DR10  at 36 range 0 .. 31;
      RTCCR at 40 range 0 .. 31;
      CR    at 44 range 0 .. 31;
      CSR   at 48 range 0 .. 31;
      DR11  at 60 range 0 .. 31;
      DR12  at 64 range 0 .. 31;
      DR13  at 68 range 0 .. 31;
      DR14  at 72 range 0 .. 31;
      DR15  at 76 range 0 .. 31;
      DR16  at 80 range 0 .. 31;
      DR17  at 84 range 0 .. 31;
      DR18  at 88 range 0 .. 31;
      DR19  at 92 range 0 .. 31;
      DR20  at 96 range 0 .. 31;
      DR21  at 100 range 0 .. 31;
      DR22  at 104 range 0 .. 31;
      DR23  at 108 range 0 .. 31;
      DR24  at 112 range 0 .. 31;
      DR25  at 116 range 0 .. 31;
      DR26  at 120 range 0 .. 31;
      DR27  at 124 range 0 .. 31;
      DR28  at 128 range 0 .. 31;
      DR29  at 132 range 0 .. 31;
      DR30  at 136 range 0 .. 31;
      DR31  at 140 range 0 .. 31;
      DR32  at 144 range 0 .. 31;
      DR33  at 148 range 0 .. 31;
      DR34  at 152 range 0 .. 31;
      DR35  at 156 range 0 .. 31;
      DR36  at 160 range 0 .. 31;
      DR37  at 164 range 0 .. 31;
      DR38  at 168 range 0 .. 31;
      DR39  at 172 range 0 .. 31;
      DR40  at 176 range 0 .. 31;
      DR41  at 180 range 0 .. 31;
      DR42  at 184 range 0 .. 31;
   end record;

   --  Backup registers
   BKP_Periph : aliased BKP_Peripheral
     with Import, Address => BKP_Base;

end STM32.BKP;
