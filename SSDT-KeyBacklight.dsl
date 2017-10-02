/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLPRbT37.aml, Mon Oct  2 22:41:48 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000177 (375)
 *     Revision         0x01
 *     Checksum         0xC5
 *     OEM ID           "hack"
 *     OEM Table ID     "backligh"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 1, "hack", "backligh", 0x00003000)
{
    External (_SB_.ATKD, DeviceObj)    // (from opcode)
    External (_SB_.ATKD.PWKB, BuffObj)    // (from opcode)
    External (_SB_.KBLV, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.RALS, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.WRAM, MethodObj)    // 2 Arguments (from opcode)
    External (KBLV, IntObj)    // (from opcode)
    External (PWKB, UnknownObj)    // (from opcode)

    Scope (\_SB.ATKD)
    {
        Name (BOFF, Zero)
        Method (SKBL, 1, NotSerialized)
        {
            If (Or (LEqual (Arg0, 0xED), LEqual (Arg0, 0xFD)))
            {
                If (And (LEqual (Arg0, 0xED), LEqual (BOFF, 0xEA)))
                {
                    Store (Zero, Local0)
                    Store (Arg0, BOFF)
                }
                ElseIf (And (LEqual (Arg0, 0xFD), LEqual (BOFF, 0xFA)))
                {
                    Store (Zero, Local0)
                    Store (Arg0, BOFF)
                }
                Else
                {
                    Return (BOFF)
                }
            }
            ElseIf (Or (LEqual (Arg0, 0xEA), LEqual (Arg0, 0xFA)))
            {
                Store (KBLV, Local0)
                Store (Arg0, BOFF)
            }
            Else
            {
                Store (Arg0, Local0)
                Store (Arg0, KBLV)
            }

            Store (DerefOf (Index (PWKB, Local0)), Local1)
            ^^PCI0.LPCB.EC0.WRAM (0x04B1, Local1)
            Return (Local0)
        }

        Method (GKBL, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0xFF))
            {
                Return (BOFF)
            }
            Else
            {
                Return (KBLV)
            }
        }

        Method (ALSS, 0, NotSerialized)
        {
            Return (^^PCI0.LPCB.EC0.RALS ())
        }
    }
}

