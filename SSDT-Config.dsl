/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASL9QPlN0.aml, Fri Sep  8 23:11:50 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000030F (783)
 *     Revision         0x02
 *     Checksum         0x64
 *     OEM ID           "hack"
 *     OEM Table ID     "RMCF"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "RMCF", 0x00000000)
{
    Device (RMCF)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (HELP, 0, NotSerialized)
        {
            Store ("TYPE indicates type of the computer. 0: desktop, 1: laptop", Debug)
            Store ("HIGH selects display type. 1: high resolution, 2: low resolution", Debug)
            Store ("IGPI overrides ig-platform-id or snb-platform-id", Debug)
            Store ("DPTS for laptops only. 1: enables/disables DGPU in _WAK/_PTS", Debug)
            Store ("SHUT enables shutdown fix. 1: disables _PTS code when Arg0==5", Debug)
            Store ("XPEE enables XHC.PMEE fix. 1: set XHC.PMEE to zero in _PTS when Arg0==5", Debug)
            Store ("AUDL indicates audio layout-id for patched AppleHDA. Ones: no injection", Debug)
            Store ("BKLT indicates the type of backlight control. 0: IntelBacklight, 1: AppleBacklight", Debug)
            Store ("LMAX indicates max for IGPU PWM backlight. Ones: Use default, other values must match framebuffer", Debug)
        }

        Name (TYPE, One)
        Name (HIGH, One)
        Name (IGPI, 0x0A2E0008)
        Name (DPTS, Zero)
        Name (SHUT, Zero)
        Name (XPEE, Zero)
        Name (AUDL, 0x03)
        Name (BKLT, Zero)
        Name (LMAX, 0x0AD9)
        Name (FBTP, 0x02)
    }
}

