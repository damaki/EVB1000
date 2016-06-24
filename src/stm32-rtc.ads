--  This spec has been automatically generated from STM32F105xx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;

with System;

package STM32.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   ------------------
   -- CRH_Register --
   ------------------

   subtype CRH_SECIE_Field is STM32.Bit;
   subtype CRH_ALRIE_Field is STM32.Bit;
   subtype CRH_OWIE_Field is STM32.Bit;

   --  RTC Control Register High
   type CRH_Register is record
      --  Second interrupt Enable
      SECIE         : CRH_SECIE_Field := 16#0#;
      --  Alarm interrupt Enable
      ALRIE         : CRH_ALRIE_Field := 16#0#;
      --  Overflow interrupt Enable
      OWIE          : CRH_OWIE_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : STM32.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRH_Register use record
      SECIE         at 0 range 0 .. 0;
      ALRIE         at 0 range 1 .. 1;
      OWIE          at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   ------------------
   -- CRL_Register --
   ------------------

   subtype CRL_SECF_Field is STM32.Bit;
   subtype CRL_ALRF_Field is STM32.Bit;
   subtype CRL_OWF_Field is STM32.Bit;
   subtype CRL_RSF_Field is STM32.Bit;
   subtype CRL_CNF_Field is STM32.Bit;
   subtype CRL_RTOFF_Field is STM32.Bit;

   --  RTC Control Register Low
   type CRL_Register is record
      --  Second Flag
      SECF          : CRL_SECF_Field := 16#0#;
      --  Alarm Flag
      ALRF          : CRL_ALRF_Field := 16#0#;
      --  Overflow Flag
      OWF           : CRL_OWF_Field := 16#0#;
      --  Registers Synchronized Flag
      RSF           : CRL_RSF_Field := 16#0#;
      --  Configuration Flag
      CNF           : CRL_CNF_Field := 16#0#;
      --  Read-only. RTC operation OFF
      RTOFF         : CRL_RTOFF_Field := 16#1#;
      --  unspecified
      Reserved_6_31 : STM32.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRL_Register use record
      SECF          at 0 range 0 .. 0;
      ALRF          at 0 range 1 .. 1;
      OWF           at 0 range 2 .. 2;
      RSF           at 0 range 3 .. 3;
      CNF           at 0 range 4 .. 4;
      RTOFF         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -------------------
   -- PRLH_Register --
   -------------------

   subtype PRLH_PRLH_Field is STM32.UInt4;

   --  RTC Prescaler Load Register High
   type PRLH_Register is record
      --  Write-only. RTC Prescaler Load Register High
      PRLH          : PRLH_PRLH_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : STM32.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRLH_Register use record
      PRLH          at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -------------------
   -- PRLL_Register --
   -------------------

   subtype PRLL_PRLL_Field is STM32.Short;

   --  RTC Prescaler Load Register Low
   type PRLL_Register is record
      --  Write-only. RTC Prescaler Divider Register Low
      PRLL           : PRLL_PRLL_Field := 16#8000#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRLL_Register use record
      PRLL           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- DIVH_Register --
   -------------------

   subtype DIVH_DIVH_Field is STM32.UInt4;

   --  RTC Prescaler Divider Register High
   type DIVH_Register is record
      --  Read-only. RTC prescaler divider register high
      DIVH          : DIVH_DIVH_Field;
      --  unspecified
      Reserved_4_31 : STM32.UInt28;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIVH_Register use record
      DIVH          at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -------------------
   -- DIVL_Register --
   -------------------

   subtype DIVL_DIVL_Field is STM32.Short;

   --  RTC Prescaler Divider Register Low
   type DIVL_Register is record
      --  Read-only. RTC prescaler divider register Low
      DIVL           : DIVL_DIVL_Field;
      --  unspecified
      Reserved_16_31 : STM32.Short;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIVL_Register use record
      DIVL           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- CNTH_Register --
   -------------------

   subtype CNTH_CNTH_Field is STM32.Short;

   --  RTC Counter Register High
   type CNTH_Register is record
      --  RTC counter register high
      CNTH           : CNTH_CNTH_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNTH_Register use record
      CNTH           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- CNTL_Register --
   -------------------

   subtype CNTL_CNTL_Field is STM32.Short;

   --  RTC Counter Register Low
   type CNTL_Register is record
      --  RTC counter register Low
      CNTL           : CNTL_CNTL_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNTL_Register use record
      CNTL           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- ALRH_Register --
   -------------------

   subtype ALRH_ALRH_Field is STM32.Short;

   --  RTC Alarm Register High
   type ALRH_Register is record
      --  Write-only. RTC alarm register high
      ALRH           : ALRH_ALRH_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRH_Register use record
      ALRH           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -------------------
   -- ALRL_Register --
   -------------------

   subtype ALRL_ALRL_Field is STM32.Short;

   --  RTC Alarm Register Low
   type ALRL_Register is record
      --  Write-only. RTC alarm register low
      ALRL           : ALRL_ALRL_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : STM32.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRL_Register use record
      ALRL           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Real time clock
   type RTC_Peripheral is record
      --  RTC Control Register High
      CRH  : CRH_Register;
      --  RTC Control Register Low
      CRL  : CRL_Register;
      --  RTC Prescaler Load Register High
      PRLH : PRLH_Register;
      --  RTC Prescaler Load Register Low
      PRLL : PRLL_Register;
      --  RTC Prescaler Divider Register High
      DIVH : DIVH_Register;
      --  RTC Prescaler Divider Register Low
      DIVL : DIVL_Register;
      --  RTC Counter Register High
      CNTH : CNTH_Register;
      --  RTC Counter Register Low
      CNTL : CNTL_Register;
      --  RTC Alarm Register High
      ALRH : ALRH_Register;
      --  RTC Alarm Register Low
      ALRL : ALRL_Register;
   end record
     with Volatile;

   for RTC_Peripheral use record
      CRH  at 0 range 0 .. 31;
      CRL  at 4 range 0 .. 31;
      PRLH at 8 range 0 .. 31;
      PRLL at 12 range 0 .. 31;
      DIVH at 16 range 0 .. 31;
      DIVL at 20 range 0 .. 31;
      CNTH at 24 range 0 .. 31;
      CNTL at 28 range 0 .. 31;
      ALRH at 32 range 0 .. 31;
      ALRL at 36 range 0 .. 31;
   end record;

   --  Real time clock
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

end STM32.RTC;
