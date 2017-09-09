/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLqPbtoE.aml, Sat Sep  9 22:46:52 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000189 (393)
 *     Revision         0x02
 *     Checksum         0x82
 *     OEM ID           "hack"
 *     OEM Table ID     "IGPU"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "IGPU", 0x00000000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)    // (from opcode)
    External (RMCF.HIGH, IntObj)    // (from opcode)
    External (RMCF.IGPI, IntObj)    // (from opcode)
    External (RMCF.TYPE, IntObj)    // (from opcode)

    Scope (_SB.PCI0.IGPU)
    {
        OperationRegion (RMP1, PCI_Config, Zero, 0x14)
        Field (RMP1, AnyAcc, NoLock, Preserve)
        {
            Offset (0x02), 
            GDID,   16, 
            Offset (0x10), 
            BAR1,   32
        }

        Name (LAPH, Package (0x15)
        {
            0x0A26, 
            0x0A2E, 
            0x0D26, 
            Zero, 
            Package (0x04)
            {
                "AAPL,ig-platform-id", 
                Buffer (0x04)
                {
                     0x08, 0x00, 0x2E, 0x0A                         
                }, 

                "hda-gfx", 
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            }
        })
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Store (Ones, Local1)
            If (CondRefOf (\RMCF.TYPE))
            {
                If (LEqual (One, \RMCF.TYPE))
                {
                    If (CondRefOf (\RMCF.HIGH))
                    {
                        Store (LAPH, Local0)
                        Store (Match (Local0, MEQ, GDID, MTR, Zero, Zero), Local1)
                    }
                }
            }

            If (LNotEqual (Ones, Local1))
            {
                Store (Match (Local0, MEQ, Zero, MTR, Zero, Add (Local1, One)), Local1)
                Store (DerefOf (Index (Local0, Add (Local1, One))), Local0)
                If (CondRefOf (\RMCF.IGPI))
                {
                    If (LNotEqual (Zero, \RMCF.IGPI))
                    {
                        CreateDWordField (DerefOf (Index (Local0, One)), Zero, IGPI)
                        Store (\RMCF.IGPI, IGPI)
                    }
                }

                Return (Local0)
            }

            Return (Package (0x00) {})
        }
    }
}

