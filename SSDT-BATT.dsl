/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLltQ03b.aml, Fri Nov  3 22:55:00 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000D4B (3403)
 *     Revision         0x02
 *     Checksum         0xB6
 *     OEM ID           "hack"
 *     OEM Table ID     "batt"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20170831 (538380337)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "batt", 0x00000000)
{
    /*
     * iASL Warning: There were 6 external control methods found during
     * disassembly, but only 5 were resolved (1 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods. Note: SSDTs can be dynamically loaded at
     * runtime and may or may not be available via the host OS.
     *
     * To specify the tables needed to resolve external control method
     * references, the -e option can be used to specify the filenames.
     * Example iASL invocations:
     *     iasl -e ssdt1.aml ssdt2.aml ssdt3.aml -d dsdt.aml
     *     iasl -e dsdt.aml ssdt2.aml -d ssdt1.aml
     *     iasl -e ssdt*.aml -d dsdt.aml
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_BIF, MethodObj)    // Warning: Unknown method, guessing 0 arguments
    External (_SB_.PCI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.BAT0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.BAT0._BIF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.BAT0.BIXT, IntObj)    // (from opcode)
    External (_SB_.PCI0.BAT0.NBIX, IntObj)    // (from opcode)
    External (_SB_.PCI0.BAT0.PBIF, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.ADD2, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.ADDR, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.BATP, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.BCN2, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.BCNT, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.BSLF, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.CMD2, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.CMDB, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.DA20, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.DA21, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.DAT0, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.DAT1, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.ECAV, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.GBTT, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.MUEC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.PRT2, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.PRTC, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.RCBT, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.RDBL, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.RDBT, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.RDQK, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.RDWD, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.SBBY, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.SDBT, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.SST2, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.SSTS, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.SWTC, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.WRBL, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.WRBT, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.WRQK, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.WRWD, IntObj)    // (from opcode)
    External (ADD2, UnknownObj)    // Warning: Unknown object
    External (ADDR, UnknownObj)    // Warning: Unknown object
    External (BCN2, IntObj)    // Warning: Unknown object
    External (BCNT, IntObj)    // Warning: Unknown object
    External (BIXT, IntObj)    // Warning: Unknown object
    External (BSLF, IntObj)    // Warning: Unknown object
    External (CMD2, UnknownObj)    // Warning: Unknown object
    External (CMDB, UnknownObj)    // Warning: Unknown object
    External (DA20, IntObj)    // Warning: Unknown object
    External (DA21, IntObj)    // Warning: Unknown object
    External (DAT0, IntObj)    // Warning: Unknown object
    External (DAT1, IntObj)    // Warning: Unknown object
    External (ECAV, IntObj)    // Warning: Unknown object
    External (MUEC, UnknownObj)    // Warning: Unknown object
    External (NBIX, IntObj)    // Warning: Unknown object
    External (PBIF, UnknownObj)    // Warning: Unknown object
    External (PRT2, IntObj)    // Warning: Unknown object
    External (PRTC, IntObj)    // Warning: Unknown object
    External (RCBT, UnknownObj)    // Warning: Unknown object
    External (RDBL, UnknownObj)    // Warning: Unknown object
    External (RDBT, UnknownObj)    // Warning: Unknown object
    External (RDQK, UnknownObj)    // Warning: Unknown object
    External (RDWD, UnknownObj)    // Warning: Unknown object
    External (SBBY, IntObj)    // Warning: Unknown object
    External (SDBT, UnknownObj)    // Warning: Unknown object
    External (SST2, IntObj)    // Warning: Unknown object
    External (SSTS, IntObj)    // Warning: Unknown object
    External (SWTC, IntObj)    // Warning: Unknown object
    External (WRBL, UnknownObj)    // Warning: Unknown object
    External (WRBT, UnknownObj)    // Warning: Unknown object
    External (WRQK, UnknownObj)    // Warning: Unknown object
    External (WRWD, UnknownObj)    // Warning: Unknown object

    Scope (\_SB.PCI0.BAT0)
    {
        Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
        {
            If (LNot (^^LPCB.EC0.BATP (Zero)))
            {
                Return (NBIX)
            }

            If (LEqual (^^LPCB.EC0.GBTT (Zero), 0xFF))
            {
                Return (NBIX)
            }

            _BIF ()
            Store (DerefOf (Index (PBIF, Zero)), Index (BIXT, One))
            Store (DerefOf (Index (PBIF, One)), Index (BIXT, 0x02))
            Store (DerefOf (Index (PBIF, 0x02)), Index (BIXT, 0x03))
            Store (DerefOf (Index (PBIF, 0x03)), Index (BIXT, 0x04))
            Store (DerefOf (Index (PBIF, 0x04)), Index (BIXT, 0x05))
            Store (DerefOf (Index (PBIF, 0x05)), Index (BIXT, 0x06))
            Store (DerefOf (Index (PBIF, 0x06)), Index (BIXT, 0x07))
            Store (DerefOf (Index (PBIF, 0x07)), Index (BIXT, 0x0E))
            Store (DerefOf (Index (PBIF, 0x08)), Index (BIXT, 0x0F))
            Store (DerefOf (Index (PBIF, 0x09)), Index (BIXT, 0x10))
            Store (DerefOf (Index (PBIF, 0x0A)), Index (BIXT, 0x11))
            Store (DerefOf (Index (PBIF, 0x0B)), Index (BIXT, 0x12))
            Store (DerefOf (Index (PBIF, 0x0C)), Index (BIXT, 0x13))
            If (LEqual (DerefOf (Index (BIXT, One)), One))
            {
                Store (Zero, Index (BIXT, One))
                Store (DerefOf (Index (BIXT, 0x05)), Local0)
                Multiply (DerefOf (Index (BIXT, 0x02)), Local0, Index (BIXT, 0x02))
                Multiply (DerefOf (Index (BIXT, 0x03)), Local0, Index (BIXT, 0x03))
                Multiply (DerefOf (Index (BIXT, 0x06)), Local0, Index (BIXT, 0x06))
                Multiply (DerefOf (Index (BIXT, 0x07)), Local0, Index (BIXT, 0x07))
                Multiply (DerefOf (Index (BIXT, 0x0E)), Local0, Index (BIXT, 0x0E))
                Multiply (DerefOf (Index (BIXT, 0x0F)), Local0, Index (BIXT, 0x0F))
                Divide (DerefOf (Index (BIXT, 0x02)), 0x03E8, Local0, Index (BIXT, 0x02))
                Divide (DerefOf (Index (BIXT, 0x03)), 0x03E8, Local0, Index (BIXT, 0x03))
                Divide (DerefOf (Index (BIXT, 0x06)), 0x03E8, Local0, Index (BIXT, 0x06))
                Divide (DerefOf (Index (BIXT, 0x07)), 0x03E8, Local0, Index (BIXT, 0x07))
                Divide (DerefOf (Index (BIXT, 0x0E)), 0x03E8, Local0, Index (BIXT, 0x0E))
                Divide (DerefOf (Index (BIXT, 0x0F)), 0x03E8, Local0, Index (BIXT, 0x0F))
            }

            Store (B1B2 (^^LPCB.EC0.B030, ^^LPCB.EC0.B031), Index (BIXT, 0x08))
            Store (0x0001869F, Index (BIXT, 0x09))
            Return (BIXT)
        }
    }

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        OperationRegion (ECOR, EmbeddedControl, Zero, 0xFF)
        Field (ECOR, ByteAcc, Lock, Preserve)
        {
            Offset (0x93), 
            AH00,   8, 
            AH01,   8, 
            AH10,   8, 
            AH11,   8, 
            Offset (0xBE), 
            Offset (0xC0), 
            Offset (0xC2), 
            Offset (0xC4), 
            B030,   8, 
            B031,   8, 
            Offset (0xF4), 
            B0N0,   8, 
            B0N1,   8, 
            Offset (0xFC), 
            B1N0,   8, 
            B1N1,   8
        }

        Name (SMBF, Zero)
        OperationRegion (SMBX, EmbeddedControl, 0x18, 0x28)
        Field (SMBX, ByteAcc, NoLock, Preserve)
        {
            Offset (0x01), 
                ,   5, 
                ,   1, 
                ,   1, 
            Offset (0x02), 
            Offset (0x03), 
            Offset (0x04), 
            BDAX,   256
        }

        Field (SMBX, ByteAcc, NoLock, Preserve)
        {
            Offset (0x04), 
            T2B0,   8, 
            T2B1,   8
        }

        OperationRegion (SMB2, EmbeddedControl, 0x40, 0x28)
        Field (SMB2, ByteAcc, NoLock, Preserve)
        {
            Offset (0x01), 
                ,   5, 
                ,   1, 
                ,   1, 
            Offset (0x02), 
            Offset (0x03), 
            Offset (0x04), 
            BDAY,   256
        }

        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Return (BYTE)
        }

        Method (RECB, 2, Serialized)
        {
            ShiftRight (Arg1, 0x03, Arg1)
            Name (TEMP, Buffer (Arg1) {})
            Add (Arg0, Arg1, Arg1)
            Store (Zero, Local0)
            While (LLess (Arg0, Arg1))
            {
                Store (RE1B (Arg0), Index (TEMP, Local0))
                Increment (Arg0)
                Increment (Local0)
            }

            Return (TEMP)
        }

        Method (WE1B, 2, NotSerialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Store (Arg1, BYTE)
        }

        Method (WECB, 3, Serialized)
        {
            ShiftRight (Arg1, 0x03, Arg1)
            Name (TEMP, Buffer (Arg1) {})
            Store (Arg2, TEMP)
            Add (Arg0, Arg1, Arg1)
            Store (Zero, Local0)
            While (LLess (Arg0, Arg1))
            {
                WE1B (Arg0, DerefOf (Index (TEMP, Local0)))
                Increment (Arg0)
                Increment (Local0)
            }
        }

        Method (TACH, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            If (ECAV ())
            {
                While (One)
                {
                    Store (Arg0, _T_0)
                    If (LEqual (_T_0, Zero))
                    {
                        Store (B1B2 (AH00, AH01), Local0)
                        Break
                    }
                    ElseIf (LEqual (_T_0, One))
                    {
                        Store (B1B2 (AH10, AH11), Local0)
                        Break
                    }
                    Else
                    {
                        Return (Ones)
                    }

                    Break
                }

                Multiply (Local0, 0x02, Local0)
                If (LNotEqual (Local0, Zero))
                {
                    Divide (0x0041CDB4, Local0, Local1, Local0)
                    Return (Local0)
                }
                Else
                {
                    Return (Ones)
                }
            }
            Else
            {
                Return (Ones)
            }
        }

        Method (BIFA, 0, NotSerialized)
        {
            If (ECAV ())
            {
                If (BSLF)
                {
                    Store (B1B2 (B1N0, B1N1), Local0)
                }
                Else
                {
                    Store (B1B2 (B0N0, B0N1), Local0)
                }
            }
            Else
            {
                Store (Ones, Local0)
            }

            Return (Local0)
        }

        Method (SMBR, 3, Serialized)
        {
            Store (Package (0x03)
                {
                    0x07, 
                    Zero, 
                    Zero
                }, Local0)
            If (LNot (ECAV ()))
            {
                Return (Local0)
            }

            If (LNotEqual (Arg0, RDBL))
            {
                If (LNotEqual (Arg0, RDWD))
                {
                    If (LNotEqual (Arg0, RDBT))
                    {
                        If (LNotEqual (Arg0, RCBT))
                        {
                            If (LNotEqual (Arg0, RDQK))
                            {
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Acquire (MUEC, 0xFFFF)
            Store (PRTC, Local1)
            Store (Zero, Local2)
            While (LNotEqual (Local1, Zero))
            {
                Stall (0x0A)
                Increment (Local2)
                If (LGreater (Local2, 0x03E8))
                {
                    Store (SBBY, Index (Local0, Zero))
                    Store (Zero, Local1)
                }
                Else
                {
                    Store (PRTC, Local1)
                }
            }

            If (LLessEqual (Local2, 0x03E8))
            {
                ShiftLeft (Arg1, One, Local3)
                Or (Local3, One, Local3)
                Store (Local3, ADDR)
                If (LNotEqual (Arg0, RDQK))
                {
                    If (LNotEqual (Arg0, RCBT))
                    {
                        Store (Arg2, CMDB)
                    }
                }

                WECB (0x1C, 0x0100, Zero)
                Store (Arg0, PRTC)
                Store (SWTC (Arg0), Index (Local0, Zero))
                If (LEqual (DerefOf (Index (Local0, Zero)), Zero))
                {
                    If (LEqual (Arg0, RDBL))
                    {
                        Store (BCNT, Index (Local0, One))
                        Store (RECB (0x1C, 0x0100), Index (Local0, 0x02))
                    }

                    If (LEqual (Arg0, RDWD))
                    {
                        Store (0x02, Index (Local0, One))
                        Store (B1B2 (T2B0, T2B1), Index (Local0, 0x02))
                    }

                    If (LEqual (Arg0, RDBT))
                    {
                        Store (One, Index (Local0, One))
                        Store (DAT0, Index (Local0, 0x02))
                    }

                    If (LEqual (Arg0, RCBT))
                    {
                        Store (One, Index (Local0, One))
                        Store (DAT0, Index (Local0, 0x02))
                    }
                }
            }

            Release (MUEC)
            Return (Local0)
        }

        Method (SMBW, 5, Serialized)
        {
            Store (Package (0x01)
                {
                    0x07
                }, Local0)
            If (LNot (ECAV ()))
            {
                Return (Local0)
            }

            If (LNotEqual (Arg0, WRBL))
            {
                If (LNotEqual (Arg0, WRWD))
                {
                    If (LNotEqual (Arg0, WRBT))
                    {
                        If (LNotEqual (Arg0, SDBT))
                        {
                            If (LNotEqual (Arg0, WRQK))
                            {
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Acquire (MUEC, 0xFFFF)
            Store (PRTC, Local1)
            Store (Zero, Local2)
            While (LNotEqual (Local1, Zero))
            {
                Stall (0x0A)
                Increment (Local2)
                If (LGreater (Local2, 0x03E8))
                {
                    Store (SBBY, Index (Local0, Zero))
                    Store (Zero, Local1)
                }
                Else
                {
                    Store (PRTC, Local1)
                }
            }

            If (LLessEqual (Local2, 0x03E8))
            {
                WECB (0x1C, 0x0100, Zero)
                ShiftLeft (Arg1, One, Local3)
                Store (Local3, ADDR)
                If (LNotEqual (Arg0, WRQK))
                {
                    If (LNotEqual (Arg0, SDBT))
                    {
                        Store (Arg2, CMDB)
                    }
                }

                If (LEqual (Arg0, WRBL))
                {
                    Store (Arg3, BCNT)
                    WECB (0x1C, 0x0100, Arg4)
                }

                If (LEqual (Arg0, WRWD))
                {
                    Store (Arg4, T2B0)
                    Store (ShiftRight (Arg4, 0x08), T2B1)
                }

                If (LEqual (Arg0, WRBT))
                {
                    Store (Arg4, DAT0)
                }

                If (LEqual (Arg0, SDBT))
                {
                    Store (Arg4, DAT0)
                }

                Store (Arg0, PRTC)
                Store (SWTC (Arg0), Index (Local0, Zero))
            }

            Release (MUEC)
            Return (Local0)
        }

        Method (ECSB, 7, NotSerialized)
        {
            Store (Package (0x05)
                {
                    0x11, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Buffer (0x20) {}
                }, Local1)
            If (LGreater (Arg0, One))
            {
                Return (Local1)
            }

            If (ECAV ())
            {
                Acquire (MUEC, 0xFFFF)
                If (LEqual (Arg0, Zero))
                {
                    Store (PRTC, Local0)
                }
                Else
                {
                    Store (PRT2, Local0)
                }

                Store (Zero, Local2)
                While (LNotEqual (Local0, Zero))
                {
                    Stall (0x0A)
                    Increment (Local2)
                    If (LGreater (Local2, 0x03E8))
                    {
                        Store (SBBY, Index (Local1, Zero))
                        Store (Zero, Local0)
                    }
                    ElseIf (LEqual (Arg0, Zero))
                    {
                        Store (PRTC, Local0)
                    }
                    Else
                    {
                        Store (PRT2, Local0)
                    }
                }

                If (LLessEqual (Local2, 0x03E8))
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg2, ADDR)
                        Store (Arg3, CMDB)
                        If (LOr (LEqual (Arg1, 0x0A), LEqual (Arg1, 0x0B)))
                        {
                            Store (DerefOf (Index (Arg6, Zero)), BCNT)
                            WECB (0x1C, 0x0100, DerefOf (Index (Arg6, One)))
                        }
                        Else
                        {
                            Store (Arg4, DAT0)
                            Store (Arg5, DAT1)
                        }

                        Store (Arg1, PRTC)
                    }
                    Else
                    {
                        Store (Arg2, ADD2)
                        Store (Arg3, CMD2)
                        If (LOr (LEqual (Arg1, 0x0A), LEqual (Arg1, 0x0B)))
                        {
                            Store (DerefOf (Index (Arg6, Zero)), BCN2)
                            WECB (0x44, 0x0100, DerefOf (Index (Arg6, One)))
                        }
                        Else
                        {
                            Store (Arg4, DA20)
                            Store (Arg5, DA21)
                        }

                        Store (Arg1, PRT2)
                    }

                    Store (0x7F, Local0)
                    If (LEqual (Arg0, Zero))
                    {
                        While (PRTC)
                        {
                            Sleep (One)
                            Decrement (Local0)
                        }
                    }
                    Else
                    {
                        While (PRT2)
                        {
                            Sleep (One)
                            Decrement (Local0)
                        }
                    }

                    If (Local0)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Store (SSTS, Local0)
                            Store (DAT0, Index (Local1, One))
                            Store (DAT1, Index (Local1, 0x02))
                            Store (BCNT, Index (Local1, 0x03))
                            Store (RECB (0x1C, 0x0100), Index (Local1, 0x04))
                        }
                        Else
                        {
                            Store (SST2, Local0)
                            Store (DA20, Index (Local1, One))
                            Store (DA21, Index (Local1, 0x02))
                            Store (BCN2, Index (Local1, 0x03))
                            Store (RECB (0x44, 0x0100), Index (Local1, 0x04))
                        }

                        And (Local0, 0x1F, Local0)
                        If (Local0)
                        {
                            Add (Local0, 0x10, Local0)
                        }

                        Store (Local0, Index (Local1, Zero))
                    }
                    Else
                    {
                        Store (0x10, Index (Local1, Zero))
                    }
                }

                Release (MUEC)
            }

            Return (Local1)
        }
    }

    Method (B1B2, 2, NotSerialized)
    {
        Return (Or (Arg0, ShiftLeft (Arg1, 0x08)))
    }
}

