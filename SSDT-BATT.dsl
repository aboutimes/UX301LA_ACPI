// battery status patched for Ausu VM510LI

DefinitionBlock ("", "SSDT", 2, "hack", "batt", 0)
{
    External(\BSLF, IntObj)
    External(\_SB.PCI0, DeviceObj)
    External(\_SB.PCI0.BAT0, DeviceObj)
    External(\_SB.PCI0.BAT0.NBIX, PkgObj)
    External(\_SB.PCI0.BAT0.PBIF, PkgObj)
    External(\_SB.PCI0.BAT0.BIXT, PkgObj)
    External(\_SB.PCI0.BAT0._BIF, MethodObj)
    External(\_SB.PCI0.LPCB, DeviceObj)
    External(\_SB.PCI0.LPCB.EC0, DeviceObj)
    External(\_SB.PCI0.LPCB.EC0.ECAV, MethodObj)
    External(\_SB.PCI0.LPCB.EC0.BATP, MethodObj)
    External(\_SB.PCI0.LPCB.EC0.GBTT, MethodObj)
    External(\_SB.PCI0.LPCB.EC0.RDBL, IntObj)
    External(\_SB.PCI0.LPCB.EC0.RDWD, IntObj)
    External(\_SB.PCI0.LPCB.EC0.RDBT, IntObj)
    External(\_SB.PCI0.LPCB.EC0.RCBT, IntObj)
    External(\_SB.PCI0.LPCB.EC0.RDQK, IntObj)
    External(\_SB.PCI0.LPCB.EC0.MUEC, MutexObj)
    External(\_SB.PCI0.LPCB.EC0.PRTC, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.SBBY, IntObj)
    External(\_SB.PCI0.LPCB.EC0.ADDR, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.CMDB, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.SWTC, MethodObj)
    External(\_SB.PCI0.LPCB.EC0.BCNT, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.DAT0, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.PRT2, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.DAT1, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.ADD2, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.CMD2, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.BCN2, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.DA20, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.DA21, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.SSTS, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.SST2, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC0.WRBL, IntObj)
    External(\_SB.PCI0.LPCB.EC0.WRWD, IntObj)
    External(\_SB.PCI0.LPCB.EC0.WRBT, IntObj)
    External(\_SB.PCI0.LPCB.EC0.SDBT, IntObj)
    External(\_SB.PCI0.LPCB.EC0.WRQK, IntObj)
    
    
    Scope(\_SB.PCI0.LPCB.EC0)
    {
        // This is an override for battery methods that access EC fields
        // larger than 8-bit.
        OperationRegion (ECOR, EmbeddedControl, Zero, 0xFF)
        Field (ECOR, ByteAcc, Lock, Preserve)
        {
            //Offset (0x04), 
            //CMD1,   8, 
            //...
            Offset (0x93),
            TA00,8,TA01,8, 
            TA20,8,TA21,8, 
            //...
            Offset (0xBE), 
            ,   16, //B0TM,   16
            ,   16, //B0C1,   16,
            ,   16, //B0C2,   16,
            B001,8,B002,8, 
            //...
            Offset (0xF4), 
            B0S0,8,B0S1,8, 
            //Offset (0xF8), 
            //Offset (0xFA), 
            Offset (0xFC), 
            B1S0,8,B1S1,8
        }
        OperationRegion (SMBX, EmbeddedControl, 0x18, 0x28)
        Field (SMBX, ByteAcc, NoLock, Preserve)
        {
            Offset (0x04), 
            DT01,8,DT02,8
        }
             
        // TACH methods are renamed in native DSDT, so calls land here...
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
                        Store (B1B2(TA00,TA01), Local0)
                        Break
                    }
                    ElseIf (LEqual (_T_0, One))
                    {
                        Store (B1B2(TA20,TA21), Local0)
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
                    Store(Local1, Local1) // Fix Warnings
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
            // RE1B,RECB,WE1B,WECB Fix 64 128 256 Method
            Method (RE1B, 1, NotSerialized)
            {
                OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
                Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
                Return(BYTE)
            }
            Method (RECB, 2, Serialized)
            {
                ShiftRight(Arg1, 3, Arg1)
                Name(TEMP, Buffer(Arg1) { })
                Add(Arg0, Arg1, Arg1)
                Store(0, Local0)
                While (LLess(Arg0, Arg1))
                {
                    Store(RE1B(Arg0), Index(TEMP, Local0))
                    Increment(Arg0)
                    Increment(Local0)
                }
                Return(TEMP)
            }
            Method (WE1B, 2, NotSerialized)
            {
                OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
                Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
                Store(Arg1, BYTE)
            }
            Method (WECB, 3, Serialized)
            {
                ShiftRight(Arg1, 3, Arg1)
                Name(TEMP, Buffer(Arg1) { })
                Store(Arg2, TEMP)
                Add(Arg0, Arg1, Arg1)
                Store(0, Local0)
                While (LLess(Arg0, Arg1))
                {
                    WE1B(Arg0, DerefOf(Index(TEMP, Local0)))
                    Increment(Arg0)
                    Increment(Local0)
                }
            }
        Method (BIFA, 0, NotSerialized)
        {
            If (ECAV ())
            {
                If (BSLF)
                {
                    Store (B1B2(B1S0,B1S1), Local0)
                }
                Else
                {
                    Store (B1B2(B0S0,B0S1), Local0)
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

                WECB(0x1c,256,Zero)
                Store (Arg0, PRTC)
                Store (SWTC (Arg0), Index (Local0, Zero))
                If (LEqual (DerefOf (Index (Local0, Zero)), Zero))
                {
                    If (LEqual (Arg0, RDBL))
                    {
                        Store (BCNT, Index (Local0, One))
                        Store (RECB(0x1c,256), Index (Local0, 0x02))
                    }

                    If (LEqual (Arg0, RDWD))
                    {
                        Store (0x02, Index (Local0, One))
                        Store (B1B2(DT01,DT02), Index (Local0, 0x02))
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
                            WECB(0x1c,256,DerefOf (Index (Arg6, One)))
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
                            WECB(0x44,256,DerefOf (Index (Arg6, One)))
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
                            Store (RECB(0x1c,256), Index (Local1, 0x04))
                        }
                        Else
                        {
                            Store (SST2, Local0)
                            Store (DA20, Index (Local1, One))
                            Store (DA21, Index (Local1, 0x02))
                            Store (BCN2, Index (Local1, 0x03))
                            Store (RECB(0x44,256), Index (Local1, 0x04))
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
                WECB(0x1c,256,Zero)
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
                    WECB(0x1c,256,Arg4)
                }

                If (LEqual (Arg0, WRWD))
                {
                    Store (ShiftRight(Arg4,8),DT02)
                    Store (Arg4,DT01)
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

    }
    
    Scope(\_SB.PCI0.BAT0)
    {
            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                If (LNot (\_SB.PCI0.LPCB.EC0.BATP (Zero)))
                {
                    Return (NBIX)
                }

                If (LEqual (\_SB.PCI0.LPCB.EC0.GBTT (Zero), 0xFF))
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

                Store (B1B2(^^LPCB.EC0.B001,^^LPCB.EC0.B002), Index (BIXT, 0x08))
                Store (0x0001869F, Index (BIXT, 0x09))
                Return (BIXT)
            }
    }
    
        Method (B1B2, 2, NotSerialized)
        {
            ShiftLeft (Arg1, 8, Local0)
            Or (Arg0, Local0, Local0)
            Return (Local0)
        }
}