/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLIvFSty.aml, Mon Sep 11 22:04:49 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000DE (222)
 *     Revision         0x02
 *     Checksum         0xA6
 *     OEM ID           "hack"
 *     OEM Table ID     "HDAU"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "HDAU", 0x00000000)
{
    External (_SB_.PCI0.HDAU, DeviceObj)    // (from opcode)
    External (RMCF.AUDL, IntObj)    // (from opcode)

    Method (_SB.PCI0.HDAU._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (CondRefOf (\RMCF.AUDL))
        {
            If (LEqual (Ones, \RMCF.AUDL))
            {
                Return (Zero)
            }
        }

        If (LNot (Arg2))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Store (Package (0x04)
            {
                "layout-id", 
                Buffer (0x04)
                {
                     0x03, 0x00, 0x00, 0x00                         
                }, 

                "hda-gfx", 
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            }, Local0)
        If (CondRefOf (\RMCF.AUDL))
        {
            CreateDWordField (DerefOf (Index (Local0, One)), Zero, AUDL)
            Store (\RMCF.AUDL, AUDL)
        }

        Return (Local0)
    }
}

