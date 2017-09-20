/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLChCnok.aml, Wed Sep 20 23:28:19 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000A9 (169)
 *     Revision         0x02
 *     Checksum         0xCB
 *     OEM ID           "hack"
 *     OEM Table ID     "Fn"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "Fn", 0x00000000)
{
    External (_SB_.ATKD.IANE, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)    // (from opcode)
    External (ATKP, IntObj)    // (from opcode)

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Method (_Q0E, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x20)
            }
        }

        Method (_Q0F, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x10)
            }
        }
    }
}

