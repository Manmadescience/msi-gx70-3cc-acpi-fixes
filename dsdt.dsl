/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130117-64 [Jul 11 2015]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of dsdt.dat, Sat Jul 11 16:21:23 2015
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000089CE (35278)
 *     Revision         0x02
 *     Checksum         0x91
 *     OEM ID           "MSI_NB"
 *     OEM Table ID     "MEGABOOK"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */

DefinitionBlock ("dsdt.aml", "DSDT", 2, "MSI_NB", "MEGABOOK", 0x00000000)
{
    External (ALIB, MethodObj)    // 2 Arguments
    External (APTS, MethodObj)    // 1 Arguments
    External (AWAK, MethodObj)    // 1 Arguments

    Name (SMBB, 0x0B20)
    Name (SMBL, 0x20)
    Name (SMB0, 0x0B00)
    Name (SMBM, 0x10)
    Name (PMBS, 0x0800)
    Name (PMLN, 0xA0)
    Name (SMIO, 0xB2)
    Name (GPBS, Zero)
    Name (GPLN, Zero)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (SPIB, 0xFEC10000)
    Name (SPIL, 0x1000)
    Name (HPTB, 0xFED00000)
    Name (HPTL, 0x1000)
    Name (GIOB, 0xFED80100)
    Name (IOMB, 0xFED80D00)
    Name (SSMB, 0xFED80200)
    Name (PEBS, 0xE0000000)
    Name (PEBL, 0x10000000)
    Name (PXNO, 0x03)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (SRSI, 0xB2)
    Name (CSMI, 0x61)
    Name (CPVD, One)
    Name (HIDM, "MSFT0003")
    Name (CIDK, 0x0303D041)
    Name (CIDM, 0x030FD041)
    Name (ATIS, 0xB0)
    Name (MBEC, Zero)
    Name (MDID, 0x04)
    Name (HIDK, "MSNB1001")
    Name (PEPM, Zero)
    Name (BDID, One)
    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            Store (0xAA, DBG8)
        }
        Else
        {
            Store (0xAC, DBG8)
        }

        Store (Arg0, PICM)
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR)
        }

        If (LEqual (PICM, Zero))
        {
            Store (0xAC, DBG8)
        }

        Store (0x03, OSVR)
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Windows 2001"))
            {
                Store (0x04, OSVR)
            }

            If (_OSI ("Windows 2001.1"))
            {
                Store (0x05, OSVR)
            }

            If (_OSI ("FreeBSD"))
            {
                Store (0x06, OSVR)
            }

            If (_OSI ("HP-UX"))
            {
                Store (0x07, OSVR)
            }

            If (_OSI ("OpenVMS"))
            {
                Store (0x08, OSVR)
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                Store (0x09, OSVR)
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                Store (0x0A, OSVR)
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                Store (0x0B, OSVR)
            }

            If (_OSI ("Windows 2006"))
            {
                Store (0x0C, OSVR)
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                Store (0x0D, OSVR)
            }

            If (_OSI ("Windows 2009"))
            {
                Store (0x0E, OSVR)
            }

            If (_OSI ("Windows 2012"))
            {
                Store (0x0F, OSVR)
            }

            If (_OSI ("Windows 2013"))
            {
                Store (0x10, OSVR)
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (Zero, OSVR)
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                Store (One, OSVR)
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                Store (0x02, OSVR)
            }

            If (MCTH (_OS, "Linux"))
            {
                Store (0x03, OSVR)
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                Store (0x06, OSVR)
            }

            If (MCTH (_OS, "HP-UX"))
            {
                Store (0x07, OSVR)
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                Store (0x08, OSVR)
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (ShiftLeft (SS1, One), Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, Zero)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (IOST, 0x4400)
    Name (TOPM, 0x00000000)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    OperationRegion (DEB2, SystemIO, 0x80, 0x02)
    Field (DEB2, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    Name (OSTY, Ones)
    OperationRegion (ACMS, SystemIO, 0x72, 0x10)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ICMS,   8, 
        DCMS,   8, 
        Offset (0x0E), 
        P80,    8
    }

    Name (PCIE, 0xE0000000)
    Name (OSCF, Zero)
    Name (GGN2, One)
    OperationRegion (CMPT, SystemIO, 0x0C50, 0x03)
    Field (CMPT, ByteAcc, NoLock, Preserve)
    {
        CMID,   8, 
            ,   6, 
        GPCT,   2, 
        GP0I,   1, 
        GP1I,   1, 
        GP2I,   1, 
        GP3I,   1, 
        GP4I,   1, 
        GP5I,   1, 
        GP6I,   1, 
        GP7I,   1
    }

    OperationRegion (PCFG, SystemMemory, PCIE, 0x02000000)
    Field (PCFG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x20078), 
        Offset (0x2007A), 
        PMSA,   1, 
        Offset (0x28078), 
        Offset (0x2807A), 
        PMSB,   1, 
        Offset (0x48078), 
        Offset (0x4807A), 
        PMSC,   1, 
        Offset (0x8800A), 
        STCL,   16, 
        Offset (0x880FC), 
        RMBA,   32, 
        Offset (0xA0004), 
        SMIE,   1, 
        SMME,   1, 
        Offset (0xA0008), 
        RVID,   8, 
        Offset (0xA0014), 
        SMB1,   32, 
        Offset (0xA0082), 
            ,   2, 
        G31O,   1, 
        Offset (0xA00E1), 
            ,   6, 
        ACIR,   1, 
        Offset (0xA4004), 
        PCMD,   2, 
        Offset (0xA807A), 
        PMS0,   1, 
        Offset (0xA8088), 
        TLS0,   4, 
        Offset (0xA907A), 
        PMS1,   1, 
        Offset (0xA9088), 
        TLS1,   4, 
        Offset (0xAA07A), 
        PMS2,   1, 
        Offset (0xAA088), 
        TLS2,   4, 
        Offset (0xAB07A), 
        PMS3,   1, 
        Offset (0xAB088), 
        TLS3,   4
    }

    OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        INPM,   8, 
        DAPM,   8
    }

    IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
    {
        Offset (0x24), 
        MMSO,   32, 
        Offset (0x50), 
        HPAD,   32, 
        Offset (0x60), 
        P1EB,   16
    }

    OperationRegion (ERMM, SystemMemory, MMSO, 0x1000)
    Field (ERMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x105), 
            ,   5, 
        G06E,   1, 
        G06O,   1, 
        G06I,   1, 
        G07B,   8, 
        Offset (0x10A), 
        G0BB,   8, 
        Offset (0x10D), 
        G0EB,   8, 
        Offset (0x113), 
            ,   5, 
        G14E,   1, 
        G14O,   1, 
        G14I,   1, 
            ,   5, 
        G15E,   1, 
        G15O,   1, 
        G15I,   1, 
        Offset (0x11B), 
            ,   7, 
        G1CI,   1, 
        Offset (0x11F), 
            ,   7, 
        G20I,   1, 
        Offset (0x122), 
            ,   5, 
        G23E,   1, 
        G23O,   1, 
        G23I,   1, 
        Offset (0x12B), 
            ,   5, 
        G2CE,   1, 
        G2CO,   1, 
        G2CI,   1, 
            ,   5, 
        G2DE,   1, 
        G2DO,   1, 
        G2DI,   1, 
        Offset (0x132), 
            ,   5, 
        G33E,   1, 
        G33O,   1, 
        G33I,   1, 
        Offset (0x134), 
            ,   5, 
        G35E,   1, 
        G35O,   1, 
        Offset (0x136), 
            ,   5, 
        G37E,   1, 
        G37O,   1, 
        G37I,   1, 
        Offset (0x13F), 
            ,   7, 
        G40I,   1, 
        Offset (0x164), 
            ,   7, 
        GE05,   1, 
            ,   7, 
        GE06,   1, 
        Offset (0x16E), 
            ,   7, 
        GE15,   1, 
            ,   7, 
        GE16,   1, 
        Offset (0x175), 
            ,   7, 
        GE22,   1, 
        Offset (0x1A9), 
            ,   5, 
        GAAE,   1, 
        GAAO,   1, 
        GAAI,   1, 
            ,   5, 
        GABE,   1, 
        GABO,   1, 
        Offset (0x1AE), 
        GAFB,   8, 
        GB0B,   8, 
        Offset (0x1FF), 
            ,   9, 
        GESA,   1, 
        Offset (0x207), 
            ,   5, 
        E05C,   1, 
        E06C,   1, 
        Offset (0x208), 
        E08C,   1, 
        E09C,   1, 
        Offset (0x209), 
        E10C,   1, 
        Offset (0x20A), 
            ,   5, 
        E1DC,   1, 
        Offset (0x2AF), 
            ,   2, 
        SLPS,   2, 
        Offset (0x376), 
        EPNM,   1, 
        DPPF,   1, 
        Offset (0x3BA), 
            ,   6, 
        PWDE,   1, 
        Offset (0x3BD), 
            ,   5, 
        ALLS,   1, 
        Offset (0x3EF), 
        PHYD,   1, 
            ,   1, 
            ,   1, 
        US5R,   1, 
        Offset (0x3F5), 
        GECD,   1, 
        Offset (0xD05), 
        G06M,   8, 
        G07M,   8, 
        Offset (0xD0A), 
        G0BM,   8, 
        Offset (0xD0D), 
        G0EM,   8, 
        Offset (0xD13), 
        G14M,   8, 
        Offset (0xD1B), 
        G1CM,   8, 
        Offset (0xD1F), 
        G20M,   8, 
        Offset (0xD22), 
        G23M,   8, 
        Offset (0xD2C), 
        G2DM,   8, 
        Offset (0xD36), 
        G37M,   8, 
        Offset (0xD6F), 
        G70M,   8, 
        Offset (0xD75), 
        G76M,   8, 
        Offset (0xDA9), 
        GAAM,   8, 
        Offset (0xDAE), 
        GAFM,   8, 
        GB0M,   8, 
        Offset (0xE7F), 
            ,   2, 
        IMCS,   1
    }

    OperationRegion (ABIO, SystemIO, 0x0CD8, 0x08)
    Field (ABIO, DWordAcc, NoLock, Preserve)
    {
        INAB,   32, 
        DAAB,   32
    }

    Method (RDAB, 1, NotSerialized)
    {
        Store (Arg0, INAB)
        Return (DAAB)
    }

    Method (WTAB, 2, NotSerialized)
    {
        Store (Arg0, INAB)
        Store (Arg1, DAAB)
    }

    Method (RWAB, 3, NotSerialized)
    {
        And (RDAB (Arg0), Arg1, Local0)
        Or (Local0, Arg2, Local1)
        WTAB (Arg0, Local1)
    }

    Method (CABR, 3, NotSerialized)
    {
        ShiftLeft (Arg0, 0x05, Local0)
        Add (Local0, Arg1, Local1)
        ShiftLeft (Local1, 0x18, Local2)
        Add (Local2, Arg2, Local3)
        Return (Local3)
    }

    Method (GHPS, 2, NotSerialized)
    {
        If (LEqual (Arg0, Zero))
        {
            RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFBFFF, Zero)
            RWAB (CABR (One, Zero, 0x65), 0xFFFFFBFB, Zero)
            Stall (0xC8)
        }

        If (LEqual (Arg0, One))
        {
            RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFBFFF, 0x4000)
            RWAB (CABR (One, Zero, 0x65), 0xFFFFFBFB, 0x0404)
            Stall (0xC8)
        }

        If (GGN2)
        {
            If (LEqual (Arg0, Zero))
            {
                GEN2 ()
                Store (RDAB (CABR (0x03, 0x02, 0xA5)), Local0)
                And (Local0, 0xFF, Local0)
                Store (0x01F4, Local1)
                While (LAnd (LGreater (Local1, Zero), LNotEqual (Local0, 0x10)))
                {
                    Store (RDAB (CABR (0x03, 0x02, 0xA5)), Local0)
                    And (Local0, 0xFF, Local0)
                    Decrement (Local1)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                If (LNotEqual (Local0, 0x10))
                {
                    GEN1 ()
                }
            }
        }
    }

    Method (GEN2, 0, NotSerialized)
    {
        Store (0x02, TLS2)
        RWAB (CABR (0x03, 0x02, 0xA4), 0xFFFFFFFE, One)
        RWAB (CABR (0x03, 0x02, 0xA2), 0xFFFFDFFF, 0x2000)
        RWAB (CABR (0x03, 0x02, 0xC0), 0xFFFF7FFF, 0x8000)
        RWAB (CABR (0x03, 0x02, 0xA4), 0xDFFFFFFF, 0x20000000)
        Stall (0xC8)
        Stall (0xC8)
    }

    Method (GEN1, 0, NotSerialized)
    {
        Store (One, TLS2)
        RWAB (CABR (0x03, 0x02, 0xA4), 0xFFFFFFFE, Zero)
        RWAB (CABR (0x03, 0x02, 0xA2), 0xFFFFDFFF, 0x2000)
        Stall (0xC8)
        Stall (0xC8)
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    Method (SPTS, 1, NotSerialized)
    {
        Store (One, PCMD)
        Store (Arg0, P80)
        If (IMCS)
        {
            IBSE ()
        }

        CPMS ()
        CPMS ()
        Store (One, PEWS)
    }

    Method (SWAK, 1, NotSerialized)
    {
        If (PICM)
        {
            \_SB.IRQC ()
        }

        CPMS ()
        CPMS ()
        Store (One, PEWS)
        If (IMCS)
        {
            IBWE ()
        }
    }

    Method (TRMD, 1, NotSerialized)
    {
    }

    Method (CPMS, 0, NotSerialized)
    {
        If (LEqual (EPNM, Zero))
        {
            Store (One, PMSA)
            Store (One, PMSB)
            Store (One, PMSC)
            Store (One, PMS0)
            Store (One, PMS1)
            Store (One, PMS2)
            Store (One, PMS3)
        }
    }

    Scope (_GPE)
    {
    }

    OperationRegion (IMIO, SystemIO, 0x3E, 0x02)
    Field (IMIO, ByteAcc, NoLock, Preserve)
    {
        IMCX,   8, 
        IMCA,   8
    }

    IndexField (IMCX, IMCA, ByteAcc, NoLock, Preserve)
    {
        Offset (0x80), 
        MSTI,   8, 
        MITS,   8, 
        MRG0,   8, 
        MRG1,   8, 
        MRG2,   8, 
        MRG3,   8
    }

    Method (WACK, 0, NotSerialized)
    {
        Store (Zero, Local0)
        While (LNotEqual (Local0, 0xFA))
        {
            Store (MRG0, Local0)
            Sleep (0x0A)
        }
    }

    Method (IBSE, 0, NotSerialized)
    {
        Store (Zero, MRG0)
        Store (0xB5, MRG1)
        Store (Zero, MRG2)
        Store (0x96, MSTI)
        WACK ()
        Store (Zero, MRG0)
        Store (Zero, MRG1)
        Store (Zero, MRG2)
        Store (0x80, MSTI)
        WACK ()
        Store (MRG2, Local0)
        And (Local0, 0xFE, Local0)
        Store (Zero, MRG0)
        Store (Zero, MRG1)
        Store (Local0, MRG2)
        Store (0x81, MSTI)
        WACK ()
        Store (Zero, MRG0)
        Store (One, MRG1)
        Store (Zero, MRG2)
        Store (0x98, MSTI)
        WACK ()
        Store (Zero, MRG0)
        Store (0xB4, MRG1)
        Store (Zero, MRG2)
        Store (0x96, MSTI)
        WACK ()
    }

    Method (IBWE, 0, NotSerialized)
    {
        Store (Zero, MRG0)
        Store (0xB5, MRG1)
        Store (Zero, MRG2)
        Store (0x96, MSTI)
        WACK ()
        Store (Zero, MRG0)
        Store (Zero, MRG1)
        Store (Zero, MRG2)
        Store (0x80, MSTI)
        WACK ()
        Store (MRG2, Local0)
        Or (Local0, One, Local0)
        Store (Zero, MRG0)
        Store (Zero, MRG1)
        Store (Local0, MRG2)
        Store (0x81, MSTI)
        WACK ()
    }

    Scope (_SB)
    {
        Name (PR00, Package (0x2B)
        {
            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x03, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x03, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0010FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0010FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKC, 
                Zero
            }
        })
        Name (AR00, Package (0x2B)
        {
            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x03, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0010FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0010FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x12
            }
        })
        Name (PR20, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR20, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR21, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR21, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR22, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR22, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR23, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR23, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {4,5,7,10,11,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))  // _HID: Hardware ID
            Name (_ADR, 0x00180000)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Name (CPRB, One)
            Name (LVGA, 0x01)
            Name (STAV, 0x0F)
            Name (BRB, 0x0000)
            Name (BRL, 0x0100)
            Name (IOB, 0x1000)
            Name (IOL, 0xF000)
            Name (MBB, 0xC0000000)
            Name (MBL, 0x40000000)
            Name (MABL, 0x00000000)
            Name (MABH, 0x00000000)
            Name (MALL, 0x00000000)
            Name (MALH, 0x00000000)
            Name (MAML, 0x00000000)
            Name (MAMH, 0x00000000)
            Name (CRS1, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y00)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x03AF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x03B0,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x03E0,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0918,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y02, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y01, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFDFC0000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
            })
            Name (CRS2, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0080,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y06)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y08, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y07, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x80000000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (STAV)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MIN, MIN0)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MAX, MAX0)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._LEN, LEN0)  // _LEN: Length
                    Store (BRB, MIN0)
                    Store (BRL, LEN0)
                    Store (LEN0, Local0)
                    Add (MIN0, Decrement (Local0), MAX0)
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MIN, MIN1)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MAX, MAX1)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._LEN, LEN1)  // _LEN: Length
                    If (LEqual (IOB, 0x1000))
                    {
                        Store (IOL, Local0)
                        Add (IOB, Decrement (Local0), MAX1)
                        Subtract (MAX1, MIN1, Local0)
                        Add (Local0, One, LEN1)
                    }
                    Else
                    {
                        Store (IOB, MIN1)
                        Store (IOL, LEN1)
                        Store (LEN1, Local0)
                        Add (MIN1, Decrement (Local0), MAX1)
                    }

                    If (LOr (LEqual (LVGA, One), LEqual (LVGA, 0x55)))
                    {
                        If (VGAF)
                        {
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MIN, IMN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MAX, IMX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._LEN, ILN1)  // _LEN: Length
                            Store (0x03B0, IMN1)
                            Store (0x03DF, IMX1)
                            Store (0x30, ILN1)
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MIN, VMN1)  // _MIN: Minimum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MAX, VMX1)  // _MAX: Maximum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._LEN, VLN1)  // _LEN: Length
                            Store (0x000A0000, VMN1)
                            Store (0x000BFFFF, VMX1)
                            Store (0x00020000, VLN1)
                            Store (Zero, VGAF)
                        }
                    }

                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MIN, MIN3)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MAX, MAX3)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._LEN, LEN3)  // _LEN: Length
                    Store (MBB, MIN3)
                    Store (MBL, LEN3)
                    Store (LEN3, Local0)
                    Add (MIN3, Decrement (Local0), MAX3)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MIN, MN8L)  // _MIN: Minimum Base Address
                        Add (0xB4, 0x04, Local0)
                        CreateDWordField (CRS1, Local0, MN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MAX, MX8L)  // _MAX: Maximum Base Address
                        Add (0xBC, 0x04, Local1)
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._LEN, LN8L)  // _LEN: Length
                        Add (0xCC, 0x04, Local2)
                        CreateDWordField (CRS1, Local2, LN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        Store (MALL, LN8L)
                        Store (MALH, LN8H)
                        Store (MAML, MX8L)
                        Store (MAMH, MX8H)
                    }

                    Return (CRS1)
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MIN, MIN2)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MAX, MAX2)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._LEN, LEN2)  // _LEN: Length
                    Store (BRB, MIN2)
                    Store (BRL, LEN2)
                    Store (LEN2, Local1)
                    Add (MIN2, Decrement (Local1), MAX2)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MIN, MIN4)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MAX, MAX4)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._LEN, LEN4)  // _LEN: Length
                    Store (IOB, MIN4)
                    Store (IOL, LEN4)
                    Store (LEN4, Local1)
                    Add (MIN4, Decrement (Local1), MAX4)
                    If (LVGA)
                    {
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MIN, IMN2)  // _MIN: Minimum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MAX, IMX2)  // _MAX: Maximum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._LEN, ILN2)  // _LEN: Length
                        Store (0x03B0, IMN2)
                        Store (0x03DF, IMX2)
                        Store (0x30, ILN2)
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MIN, VMN2)  // _MIN: Minimum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MAX, VMX2)  // _MAX: Maximum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._LEN, VLN2)  // _LEN: Length
                        Store (0x000A0000, VMN2)
                        Store (0x000BFFFF, VMX2)
                        Store (0x00020000, VLN2)
                    }

                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MIN, MIN5)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MAX, MAX5)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._LEN, LEN5)  // _LEN: Length
                    Store (MBB, MIN5)
                    Store (MBL, LEN5)
                    Store (LEN5, Local1)
                    Add (MIN5, Decrement (Local1), MAX5)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MIN, MN9L)  // _MIN: Minimum Base Address
                        Add (0x72, 0x04, Local0)
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MAX, MX9L)  // _MAX: Maximum Base Address
                        Add (0x7A, 0x04, Local1)
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._LEN, LN9L)  // _LEN: Length
                        Add (0x8A, 0x04, Local2)
                        CreateDWordField (CRS2, Local2, LN9H)
                        Store (MABL, MN9L)
                        Store (MABH, MN9H)
                        Store (MALL, LN9L)
                        Store (MALH, LN9H)
                        Store (MAML, MX9L)
                        Store (MAMH, MX9H)
                    }

                    Return (CRS2)
                }
            }

            Scope (\_SB)
            {
                Scope (PCI0)
                {
                    Device (AMDN)
                    {
                        Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                        Name (_UID, 0xC8)  // _UID: Unique ID
                        Name (_STA, 0x0F)  // _STA: Status
                        Name (NPTR, ResourceTemplate ()
                        {
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y0C)
                        })
                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            CreateDWordField (NPTR, \_SB.PCI0.AMDN._Y0C._LEN, PL)  // _LEN: Length
                            CreateDWordField (NPTR, \_SB.PCI0.AMDN._Y0C._BAS, PB)  // _BAS: Base Address
                            Store (PEBS, PB)
                            Store (PEBL, PL)
                            Return (NPTR)
                        }
                    }
                }
            }

            Method (NPTS, 1, NotSerialized)
            {
                APTS (Arg0)
            }

            Method (NWAK, 1, NotSerialized)
            {
                AWAK (Arg0)
            }

            Device (IDEC)
            {
                Name (_ADR, 0x00140001)  // _ADR: Address
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    0x0F, 
                    Zero
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    Zero
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    Zero
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, AnyAcc, NoLock, Preserve)
                {
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                    Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                    Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, One), Add (Local1, 
                        One))))
                }

                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, PIT1)
                    CreateByteField (Arg0, One, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        /* 0000 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
                        /* 0008 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
                        /* 0010 */   0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, Zero, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, One))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, One))
                    {
                        Or (FLAG, One, FLAG)
                        Store (DerefOf (Index (UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        Store (GETT (MDT0), DMA0)
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        Store (GETT (MDT1), DMA1)
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, Zero, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                         0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, Zero, PIT1)
                    CreateByteField (BUF, One, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (PIOT, MLE, PIO0, MTR, Zero, Zero), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (PIOT, MLE, PIO1, MTR, Zero, Zero), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (PITR, Local0)), PIT0)
                    Store (DerefOf (Index (PITR, Local1)), PIT1)
                    If (And (FLAG, One))
                    {
                        Store (Match (UDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, One, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (Match (MDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (UDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (Match (MDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, Zero, MDT1)
                    CreateByteField (Arg1, One, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, One, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x15)
                    {
                        /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03,
                        /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x00, 0x00,
                        /* 0010 */   0x00, 0x00, 0x00, 0x00, 0xF5
                    })
                    CreateByteField (BUF, One, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    CreateByteField (BUF, 0x13, CMDC)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Store (Arg0, CMDC)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        Store (Match (MDMT, MLE, GETT (Local1), MTR, Zero, Zero), Local4)
                        If (LLess (Local4, 0x03))
                        {
                            Or (0x20, Local4, DMOD)
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (PPIT, VPIT)
                        Store (PMDT, VMDT)
                        Store (PPIC, VPIC)
                        Store (PUDC, VUDC)
                        Store (PUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, PPIT)
                        Store (VMDT, PMDT)
                        Store (VPIM, PPIM)
                        Store (VUDC, PUDC)
                        Store (VUDM, PUDM)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (PMDT, VMDT)
                            Store (PPIM, VPIM)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (PMDT, VMDT)
                            Store (PPIM, VPIM)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (SPIT, VPIT)
                        Store (SMDT, VMDT)
                        Store (SPIC, VPIC)
                        Store (SUDC, VUDC)
                        Store (SUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, SPIT)
                        Store (VMDT, SMDT)
                        Store (VPIM, SPIM)
                        Store (VUDC, SUDC)
                        Store (VUDM, SUDM)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (SMDT, VMDT)
                            Store (SPIM, VPIM)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (SMDT, VMDT)
                            Store (SPIM, VPIM)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                OperationRegion (RMBS, PCI_Config, Zero, 0x0100)
                Field (RMBS, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x6C), 
                    LR2S,   16, 
                    LR2E,   16
                }

                Method (SPTS, 1, NotSerialized)
                {
                }

                Method (SWAK, 1, NotSerialized)
                {
                    If (PICM)
                    {
                        IRQC ()
                    }
                }

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                }

                OperationRegion (SMI0, SystemIO, SMIO, One)
                Field (SMI0, ByteAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Device (S900)
                        {
                            Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                            Name (_UID, 0x0700)  // _UID: Unique ID
                            Name (_STA, 0x0F)  // _STA: Status
                            Name (CRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0010,             // Range Minimum
                                    0x0010,             // Range Maximum
                                    0x00,               // Alignment
                                    0x10,               // Length
                                    )
                                IO (Decode16,
                                    0x0022,             // Range Minimum
                                    0x0022,             // Range Maximum
                                    0x00,               // Alignment
                                    0x1E,               // Length
                                    )
                                IO (Decode16,
                                    0x0063,             // Range Minimum
                                    0x0063,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0065,             // Range Minimum
                                    0x0065,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0067,             // Range Minimum
                                    0x0067,             // Range Maximum
                                    0x00,               // Alignment
                                    0x09,               // Length
                                    )
                                IO (Decode16,
                                    0x0072,             // Range Minimum
                                    0x0072,             // Range Maximum
                                    0x00,               // Alignment
                                    0x0E,               // Length
                                    )
                                IO (Decode16,
                                    0x0080,             // Range Minimum
                                    0x0080,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0084,             // Range Minimum
                                    0x0084,             // Range Maximum
                                    0x00,               // Alignment
                                    0x03,               // Length
                                    )
                                IO (Decode16,
                                    0x0088,             // Range Minimum
                                    0x0088,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x008C,             // Range Minimum
                                    0x008C,             // Range Maximum
                                    0x00,               // Alignment
                                    0x03,               // Length
                                    )
                                IO (Decode16,
                                    0x0090,             // Range Minimum
                                    0x0090,             // Range Maximum
                                    0x00,               // Alignment
                                    0x10,               // Length
                                    )
                                IO (Decode16,
                                    0x00A2,             // Range Minimum
                                    0x00A2,             // Range Maximum
                                    0x00,               // Alignment
                                    0x1E,               // Length
                                    )
                                IO (Decode16,
                                    0x00B1,             // Range Minimum
                                    0x00B1,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x00E0,             // Range Minimum
                                    0x00E0,             // Range Maximum
                                    0x00,               // Alignment
                                    0x10,               // Length
                                    )
                                IO (Decode16,
                                    0x04D0,             // Range Minimum
                                    0x04D0,             // Range Maximum
                                    0x00,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x040B,             // Range Minimum
                                    0x040B,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x04D6,             // Range Minimum
                                    0x04D6,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0C00,             // Range Minimum
                                    0x0C00,             // Range Maximum
                                    0x00,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x0C14,             // Range Minimum
                                    0x0C14,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0C50,             // Range Minimum
                                    0x0C50,             // Range Maximum
                                    0x00,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x0C52,             // Range Minimum
                                    0x0C52,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0C6C,             // Range Minimum
                                    0x0C6C,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0C6F,             // Range Minimum
                                    0x0C6F,             // Range Maximum
                                    0x00,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0CD0,             // Range Minimum
                                    0x0CD0,             // Range Maximum
                                    0x00,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x0CD2,             // Range Minimum
                                    0x0CD2,             // Range Maximum
                                    0x00,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x0CD4,             // Range Minimum
                                    0x0CD4,             // Range Maximum
                                    0x00,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x0CD6,             // Range Minimum
                                    0x0CD6,             // Range Maximum
                                    0x00,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x0CD8,             // Range Minimum
                                    0x0CD8,             // Range Maximum
                                    0x00,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0D)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y10)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0F)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0E)
                                IO (Decode16,
                                    0x0900,             // Range Minimum
                                    0x0900,             // Range Maximum
                                    0x00,               // Alignment
                                    0x10,               // Length
                                    )
                                IO (Decode16,
                                    0x0910,             // Range Minimum
                                    0x0910,             // Range Maximum
                                    0x00,               // Alignment
                                    0x10,               // Length
                                    )
                                IO (Decode16,
                                    0xFE00,             // Range Minimum
                                    0xFE00,             // Range Maximum
                                    0x00,               // Alignment
                                    0xFF,               // Length
                                    )
                                IO (Decode16,
                                    0x0060,             // Range Minimum
                                    0x0060,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    )
                                IO (Decode16,
                                    0x0064,             // Range Minimum
                                    0x0064,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    )
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y11)
                                Memory32Fixed (ReadWrite,
                                    0xFEE00000,         // Address Base
                                    0x00001000,         // Address Length
                                    )
                                Memory32Fixed (ReadWrite,
                                    0xFED80000,         // Address Base
                                    0x00010000,         // Address Length
                                    )
                                Memory32Fixed (ReadWrite,
                                    0xFED61000,         // Address Base
                                    0x00010000,         // Address Length
                                    )
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y12)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y13)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y14)
                            })
                            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                            {
                                CreateWordField (CRS, \_SB.PCI0.S900._Y0D._MIN, PBB)  // _MIN: Minimum Base Address
                                CreateWordField (CRS, \_SB.PCI0.S900._Y0D._MAX, PBH)  // _MAX: Maximum Base Address
                                CreateByteField (CRS, \_SB.PCI0.S900._Y0D._LEN, PML)  // _LEN: Length
                                Store (PMBS, PBB)
                                Store (PMBS, PBH)
                                Store (PMLN, PML)
                                If (SMBB)
                                {
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y0E._MIN, SMB1)  // _MIN: Minimum Base Address
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y0E._MAX, SMH1)  // _MAX: Maximum Base Address
                                    CreateByteField (CRS, \_SB.PCI0.S900._Y0E._LEN, SML1)  // _LEN: Length
                                    Store (SMBB, SMB1)
                                    Store (SMBB, SMH1)
                                    Store (SMBL, SML1)
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y0F._MIN, SMB0)  // _MIN: Minimum Base Address
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y0F._MAX, SMH0)  // _MAX: Maximum Base Address
                                    CreateByteField (CRS, \_SB.PCI0.S900._Y0F._LEN, SML0)  // _LEN: Length
                                    Store (SMB0, SMB0)
                                    Store (SMB0, SMH0)
                                    Store (SMBM, SML0)
                                }

                                If (GPBS)
                                {
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y10._MIN, IGB)  // _MIN: Minimum Base Address
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y10._MAX, IGH)  // _MAX: Maximum Base Address
                                    CreateByteField (CRS, \_SB.PCI0.S900._Y10._LEN, IGL)  // _LEN: Length
                                    Store (GPBS, IGB)
                                    Store (GPBS, IGH)
                                    Store (GPLN, IGL)
                                }

                                If (APCB)
                                {
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y11._BAS, APB)  // _BAS: Base Address
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y11._LEN, APL)  // _LEN: Length
                                    Store (APCB, APB)
                                    Store (APCL, APL)
                                }

                                If (SPIB)
                                {
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y12._BAS, SPIB)  // _BAS: Base Address
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y12._LEN, SPIL)  // _LEN: Length
                                    Store (\SPIB, SPIB)
                                    Store (\SPIL, SPIL)
                                }

                                If (HPTB)
                                {
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y13._BAS, HXTB)  // _BAS: Base Address
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y13._LEN, HXTL)  // _LEN: Length
                                    Store (HPTB, HXTB)
                                    Store (HPTL, HXTL)
                                }

                                CreateDWordField (CRS, \_SB.PCI0.S900._Y14._BAS, ROMB)  // _BAS: Base Address
                                CreateDWordField (CRS, \_SB.PCI0.S900._Y14._LEN, ROML)  // _LEN: Length
                                If (^^SBRG.LR2S)
                                {
                                    Store (ShiftLeft (^^SBRG.LR2S, 0x10), ROMB)
                                    Store (ShiftLeft (Add (Subtract (^^SBRG.LR2E, ^^SBRG.LR2S), One), 0x10
                                        ), ROML)
                                }
                                Else
                                {
                                    Store (ROMS, ROMB)
                                    Subtract (Zero, ROMS, ROML)
                                }

                                Return (CRS)
                            }
                        }
                    }
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (NBRM)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x99)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (CRS)
                    }
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x00,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x034D,             // Range Minimum
                            0x034D,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x00,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x034D,             // Range Minimum
                            0x034D,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (And (MBEC, 0xFFFF))
                        {
                            Return (CRS1)
                        }
                        Else
                        {
                            Return (CRS2)
                        }
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (PS2K)
                {
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        Return (HIDK)
                    }

                    Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
                    {
                        Return (CIDK)
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x0060,             // Range Minimum
                                0x0060,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0064,             // Range Minimum
                                0x0064,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        Store (Arg0, KBFG)
                    }
                }

                Scope (\)
                {
                    Name (KBFG, One)
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("ETD0300"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (IOST, 0x4000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (CRS1)
                        }
                        Else
                        {
                            Return (CRS2)
                        }
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        Store (Arg0, MSFG)
                    }
                }

                Scope (\)
                {
                    Name (MSFG, One)
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
                    Name (_GPE, 0x03)  // _GPE: General Purpose Events
                    Name (CTID, Zero)
                    Name (MYEC, One)
                    Name (CTSD, Zero)
                    Name (PCOU, Zero)
                    Name (THRF, Zero)
                    Name (F1RD, Zero)
                    Name (WAKM, Zero)
                    Method (EOSV, 0, NotSerialized)
                    {
                        If (_OSI ("Windows 2013"))
                        {
                            Store (0x05, OSTP)
                            Return (Zero)
                        }

                        If (_OSI ("Windows 2012"))
                        {
                            Store (0x04, OSTP)
                        }
                        Else
                        {
                            If (_OSI ("Windows 2009"))
                            {
                                Store (0x03, OSTP)
                            }
                            Else
                            {
                                If (_OSI ("Windows 2006"))
                                {
                                    Store (0x02, OSTP)
                                }
                                Else
                                {
                                    If (_OSI ("Windows 2001"))
                                    {
                                        Store (One, OSTP)
                                    }
                                }
                            }
                        }
                    }

                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If (LEqual (F1RD, Zero))
                        {
                            EOSV ()
                            Store (One, F1RD)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, MYEC)
                        }

                        Store (Zero, CTSD)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                    OperationRegion (EC, EmbeddedControl, Zero, 0x0100)
                    Field (EC, ByteAcc, NoLock, Preserve)
                    {
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   264, 
                        SMAA,   8, 
                        Offset (0x2E), 
                        BTPO,   1, 
                        WCPO,   1, 
                        TVPO,   1, 
                        WLPO,   1, 
                        GSMP,   1, 
                        LANP,   1, 
                        DPWR,   1, 
                        Offset (0x2F), 
                            ,   6, 
                        DGEN,   1, 
                        Offset (0x30), 
                        POWS,   1, 
                        LIDS,   1, 
                        KBCS,   1, 
                        Offset (0x31), 
                        MBTS,   1, 
                        MBCS,   1, 
                        MBDS,   1, 
                        MBFS,   1, 
                        MBWS,   1, 
                        MBLS,   1, 
                        MBCL,   1, 
                        MBFL,   1, 
                        Offset (0x34), 
                        HSKS,   3, 
                            ,   1, 
                        OSTP,   4, 
                        Offset (0x38), 
                        MDCL,   8, 
                        MDCH,   8, 
                        MDVL,   8, 
                        MDVH,   8, 
                        MCAL,   8, 
                        MCAH,   8, 
                        MSTL,   8, 
                        MSTH,   8, 
                        MCCL,   8, 
                        MCCH,   8, 
                        MPOL,   8, 
                        MPOH,   8, 
                        MFCL,   8, 
                        MFCH,   8, 
                        MCUL,   8, 
                        MCUH,   8, 
                        MRCL,   8, 
                        MRCH,   8, 
                        MVOL,   8, 
                        MVOH,   8, 
                        MTEL,   8, 
                        MTEH,   8, 
                        RSV1,   8, 
                        RSV2,   8, 
                        SDCL,   8, 
                        SDCH,   8, 
                        SDVL,   8, 
                        SDVH,   8, 
                        SCAL,   8, 
                        SCAH,   8, 
                        SSTL,   8, 
                        SSTH,   8, 
                        SCCL,   8, 
                        SCCH,   8, 
                        SPOL,   8, 
                        SPOH,   8, 
                        SFCL,   8, 
                        SFCH,   8, 
                        SCUL,   8, 
                        SCUH,   8, 
                        SRCL,   8, 
                        SRCH,   8, 
                        SVOL,   8, 
                        SVOH,   8, 
                        STEL,   8, 
                        STEH,   8, 
                        Offset (0x68), 
                        CPUT,   8, 
                        Offset (0x7E), 
                            ,   3, 
                        THFG,   1, 
                        Offset (0x7F), 
                        Offset (0x80), 
                        SYST,   8, 
                        Offset (0xBE), 
                        AUTO,   8, 
                            ,   1, 
                        SUSP,   1, 
                        Offset (0xED), 
                        QID,    8, 
                        Offset (0xEF), 
                        BRTP,   8, 
                        Offset (0xF1), 
                        BRLV,   8, 
                        Offset (0xFE), 
                        DCBL,   8, 
                        ACBL,   8
                    }

                    OperationRegion (APMP, SystemIO, 0xB2, 0x02)
                    Field (APMP, ByteAcc, NoLock, Preserve)
                    {
                        APMC,   8, 
                        APMS,   8
                    }

                    Device (KB9X)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (LGreaterEqual (OSFL (), 0x0F))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (_HID, "KB9XRADIOBTN")  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            Memory32Fixed (ReadWrite,
                                0xFC0008DB,         // Address Base
                                0x00000002,         // Address Length
                                )
                            Memory32Fixed (ReadWrite,
                                0xFC000000,         // Address Base
                                0x000008DB,         // Address Length
                                )
                            Memory32Fixed (ReadWrite,
                                0xFC0008DD,         // Address Base
                                0x0000F723,         // Address Length
                                )
                        })
                    }

                    Device (ADP1)
                    {
                        Name (_HID, "ACPI0003")  // _HID: Hardware ID
                        Name (BFLG, One)
                        Name (ACP, One)
                        Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
                        {
                            If (POWS)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            _SB
                        })
                    }

                    Name (BIF0, Package (0x0D)
                    {
                        One, 
                        0x1130, 
                        0x1130, 
                        One, 
                        0x39D0, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        "MS-16FK", 
                        "1", 
                        "LION", 
                        "MSI Corp."
                    })
                    Name (STAT, Package (0x04)
                    {
                        0x02, 
                        0x0500, 
                        0x0800, 
                        0x03E8
                    })
                    Device (BAT1)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
                        Name (_UID, One)  // _UID: Unique ID
                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            _SB
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (MYEC)
                            {
                                If (MBTS)
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x0F)
                                }
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
                        {
                            If (MYEC)
                            {
                                UPBI ()
                            }
                            Else
                            {
                                IVBI ()
                                Store (0x99, DBG8)
                                Sleep (0x03E8)
                            }

                            Return (BIF0)
                        }

                        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                        {
                            If (MYEC)
                            {
                                UPBS ()
                            }
                            Else
                            {
                                IVBS ()
                            }

                            Return (STAT)
                        }

                        Method (IVBI, 0, NotSerialized)
                        {
                            Store (0xFFFFFFFF, Index (BIF0, One))
                            Store (0xFFFFFFFF, Index (BIF0, 0x02))
                            Store (0xFFFFFFFF, Index (BIF0, 0x04))
                            Store ("Wrong", Index (BIF0, 0x09))
                            Store (" ", Index (BIF0, 0x0A))
                            Store ("Wrong", Index (BIF0, 0x0B))
                            Store ("Wrong", Index (BIF0, 0x0C))
                        }

                        Method (IVBS, 0, NotSerialized)
                        {
                            Store (Zero, Index (STAT, Zero))
                            Store (0xFFFFFFFF, Index (STAT, One))
                            Store (0xFFFFFFFF, Index (STAT, 0x02))
                            Store (0x2710, Index (STAT, 0x03))
                        }

                        Method (UPBI, 0, NotSerialized)
                        {
                            Store (Zero, Local0)
                            Store (Zero, Local1)
                            Store (Zero, Local2)
                            Store (Zero, Local3)
                            Store (MDCH, Local0)
                            Store (MDCL, Local1)
                            ShiftLeft (Local0, 0x08, Local0)
                            Or (Local0, Local1, Local0)
                            Store (Local0, Index (BIF0, One))
                            Store (MFCH, Local0)
                            Store (MFCL, Local1)
                            ShiftLeft (Local0, 0x08, Local0)
                            Or (Local0, Local1, Local1)
                            Store (Local1, Index (BIF0, 0x02))
                            Store (MDVH, Local0)
                            Store (MDVL, Local2)
                            ShiftLeft (Local0, 0x08, Local0)
                            Or (Local0, Local2, Local2)
                            Store (Local2, Index (BIF0, 0x04))
                            Store ("\n", Index (BIF0, 0x0A))
                            Store ("LION\n", Index (BIF0, 0x0B))
                            Store (CTID, Local0)
                            If (LEqual (Local0, Zero))
                            {
                                Store ("MS-145B\n", Index (BIF0, 0x09))
                                Store ("MSI Corp.\n", Index (BIF0, 0x0C))
                            }
                            Else
                            {
                                Store ("?MODEL\n", Index (BIF0, 0x09))
                                Store ("?CUSTOMER\n", Index (BIF0, 0x0C))
                            }
                        }

                        Method (UPBS, 0, NotSerialized)
                        {
                            Store (Zero, Local0)
                            Store (Zero, Local1)
                            Store (Zero, Local2)
                            Store (Zero, Local3)
                            Store (Zero, Local4)
                            Store (Zero, Local7)
                            Store (MBTS, Local0)
                            If (LEqual (Local0, One))
                            {
                                Store (POWS, Local0)
                                If (LEqual (Local0, One))
                                {
                                    Store (MBCS, Local1)
                                    If (LEqual (Local1, One))
                                    {
                                        Or (Local4, 0x02, Local4)
                                    }
                                }
                                Else
                                {
                                    Or (Local4, One, Local4)
                                    Store (MBLS, Local0)
                                    If (LEqual (Local0, One))
                                    {
                                        Or (Local4, 0x04, Local4)
                                    }
                                }

                                Store (POWS, Local0)
                                If (LEqual (Local0, One))
                                {
                                    Store (MBCS, Local0)
                                    If (LEqual (Local0, One))
                                    {
                                        Store (MCUH, Local0)
                                        Store (MCUL, Local1)
                                        ShiftLeft (Local0, 0x08, Local0)
                                        Or (Local0, Local1, Local1)
                                        If (LEqual (Local1, 0xFFFF))
                                        {
                                            Store (0xFFFFFFFF, Local1)
                                        }

                                        Store (Local1, Index (STAT, One))
                                    }
                                    Else
                                    {
                                        Store (Zero, Index (STAT, One))
                                    }
                                }
                                Else
                                {
                                    Store (MCUH, Local0)
                                    Store (MCUL, Local1)
                                    ShiftLeft (Local0, 0x08, Local0)
                                    Or (Local0, Local1, Local1)
                                    XOr (Local1, 0xFFFF, Local1)
                                    If (LEqual (Local1, Zero))
                                    {
                                        Store (0xFFFFFFFF, Local1)
                                    }

                                    Store (Local1, Index (STAT, One))
                                }

                                Store (MRCH, Local0)
                                Store (MRCL, Local2)
                                ShiftLeft (Local0, 0x08, Local0)
                                Or (Local0, Local2, Local2)
                                Store (Local2, Index (STAT, 0x02))
                                Store (MVOH, Local0)
                                Store (MVOL, Local3)
                                ShiftLeft (Local0, 0x08, Local0)
                                Or (Local0, Local3, Local3)
                                Store (Local3, Index (STAT, 0x03))
                                Store (Local4, Index (STAT, Zero))
                                Sleep (0x64)
                            }
                            Else
                            {
                                IVBS ()
                            }
                        }
                    }

                    Device (LID0)
                    {
                        Name (_HID, EisaId ("PNP0C0D"))  // _HID: Hardware ID
                        Method (_LID, 0, NotSerialized)  // _LID: Lid Status
                        {
                            If (MYEC)
                            {
                                Store (LIDS, Local0)
                            }
                            Else
                            {
                                Store (One, Local0)
                            }

                            Return (Local0)
                        }
                    }

                    Method (MPPC, 0, NotSerialized)
                    {
                        Store (THRF, Local0)
                        If (LEqual (Local0, One))
                        {
                            Return (Subtract (PCOU, One))
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_Q75, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x75, DBG8)
                        Store (0x75, QID)
                    }

                    Method (_Q76, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x76, DBG8)
                        Store (0x76, QID)
                    }

                    Method (_Q77, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x77, DBG8)
                        Store (0x77, QID)
                    }

                    Method (_Q80, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x80, DBG8)
                        Store (0x80, QID)
                    }

                    Method (_Q81, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x81, DBG8)
                        Store (0x81, QID)
                        Store (One, THRF)
                        Notify (\_PR.P001, 0x80)
                        Notify (\_PR.P002, 0x80)
                    }

                    Method (_Q82, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x82, DBG8)
                        Store (0x82, QID)
                        Store (Zero, THRF)
                        Notify (\_PR.P001, 0x80)
                        Notify (\_PR.P002, 0x80)
                    }

                    Method (_Q83, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x83, DBG8)
                        Store (0x83, QID)
                        Notify (ADP1, 0x80)
                    }

                    Method (_Q84, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x84, DBG8)
                        Store (0x84, QID)
                        Notify (LID0, 0x80)
                    }

                    Method (_Q85, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x85, DBG8)
                        Store (0x85, QID)
                        Store (One, CTSD)
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Method (_Q86, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x86, DBG8)
                        Store (0x86, QID)
                    }

                    Method (_Q87, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x87, DBG8)
                        Store (0x87, QID)
                        Store (Zero, Local0)
                        Store (MBTS, Local0)
                        If (LEqual (Local0, One))
                        {
                            Notify (BAT1, 0x81)
                        }
                        Else
                        {
                            Notify (BAT1, 0x81)
                        }

                        Notify (ADP1, 0x80)
                    }

                    Method (_Q88, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x88, DBG8)
                        Store (0x88, QID)
                    }

                    Method (_Q89, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x89, DBG8)
                        Store (0x89, QID)
                    }

                    Method (_Q8A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x8A, DBG8)
                        Store (0x8A, QID)
                        Store (One, CTSD)
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Method (_Q8B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x8B, DBG8)
                        Store (0x8B, QID)
                    }

                    Method (_Q8C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x8C, DBG8)
                        Store (0x8C, QID)
                    }

                    Method (_Q90, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x90, DBG8)
                        Store (0x90, QID)
                    }

                    Method (_Q92, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x92, DBG8)
                        Store (0x92, QID)
                    }

                    Method (_QB4, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0xB4, DBG8)
                        Store (0xB4, QID)
                        ^^^VGA.AFN0 ()
                    }

                    Method (_QB5, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0xB5, DBG8)
                        Store (0xB5, QID)
                    }

                    Method (_QB6, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0xB6, DBG8)
                        Store (0xB6, QID)
                    }

                    Method (_QB7, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0xB7, DBG8)
                        Store (0xB7, QID)
                        Notify (^^^VGA.LCD, 0x87)
                    }

                    Method (_QB8, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0xB8, DBG8)
                        Store (0xB8, QID)
                        Notify (^^^VGA.LCD, 0x86)
                    }

                    Method (_QB9, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0xB9, DBG8)
                        Store (0xB9, QID)
                    }

                    Method (_QC0, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0xC0, ^SCM0.TDED)
                        Store (0xC0, DBG8)
                        Notify (SCM0, 0xC0)
                    }

                    Device (SCM0)
                    {
                        Name (_HID, "pnp0c14")  // _HID: Hardware ID
                        Name (_UID, Zero)  // _UID: Unique ID
                        Name (TDVR, 0x14)
                        Name (_WDG, Buffer (0xC8)
                        {
                            /* 0000 */   0x6A, 0x8D, 0x41, 0x24, 0x79, 0x0A, 0x4C, 0x52,
                            /* 0008 */   0x9A, 0xB1, 0x18, 0xB7, 0x8C, 0xA6, 0x8C, 0xE7,
                            /* 0010 */   0x41, 0x41, 0x22, 0x01, 0x6B, 0xD5, 0xFB, 0x4A,
                            /* 0018 */   0x91, 0x9F, 0x49, 0x8F, 0x81, 0xF5, 0x99, 0x5B,
                            /* 0020 */   0xA7, 0x38, 0x22, 0xAF, 0x41, 0x42, 0x04, 0x01,
                            /* 0028 */   0x6C, 0xBA, 0x3C, 0x2D, 0x9C, 0x1C, 0x41, 0x7F,
                            /* 0030 */   0xB5, 0x4C, 0xF5, 0xD5, 0xD5, 0x80, 0xD4, 0x82,
                            /* 0038 */   0x41, 0x43, 0x03, 0x01, 0x6D, 0x02, 0xBA, 0x40,
                            /* 0040 */   0x5D, 0x07, 0x4A, 0xCD, 0x97, 0x10, 0xF7, 0xC5,
                            /* 0048 */   0x73, 0x47, 0xCA, 0xC9, 0x41, 0x44, 0x10, 0x01,
                            /* 0050 */   0x6E, 0xCF, 0xBC, 0x8D, 0xB4, 0x9D, 0x46, 0x0E,
                            /* 0058 */   0xA3, 0xF2, 0x99, 0xAF, 0xAA, 0xA7, 0x7A, 0x7A,
                            /* 0060 */   0x41, 0x45, 0x0E, 0x01, 0x6F, 0x21, 0x2A, 0xBD,
                            /* 0068 */   0xB9, 0x2F, 0x40, 0xA6, 0xB8, 0x07, 0xDD, 0xDB,
                            /* 0070 */   0xAD, 0x65, 0x68, 0x91, 0x41, 0x46, 0x13, 0x01,
                            /* 0078 */   0x7A, 0xEC, 0xC3, 0x1E, 0x9B, 0x1E, 0x4A, 0xE7,
                            /* 0080 */   0x90, 0x26, 0xCF, 0x12, 0x2B, 0x0B, 0xBD, 0x21,
                            /* 0088 */   0x41, 0x47, 0x12, 0x01, 0x7B, 0x3D, 0x75, 0xA1,
                            /* 0090 */   0x21, 0xB6, 0x4A, 0xDE, 0xB4, 0x1A, 0x55, 0x71,
                            /* 0098 */   0x6A, 0x0E, 0xCE, 0x7A, 0x41, 0x48, 0x15, 0x01,
                            /* 00A0 */   0x7C, 0x3D, 0x75, 0xA1, 0x21, 0xB6, 0x4A, 0xDE,
                            /* 00A8 */   0xB4, 0x1A, 0x55, 0x71, 0x6A, 0x0E, 0xCE, 0x7A,
                            /* 00B0 */   0x41, 0x49, 0x08, 0x01, 0x8A, 0xC3, 0x3C, 0x5B,
                            /* 00B8 */   0xD9, 0x40, 0x45, 0x72, 0x8A, 0xE6, 0x11, 0x45,
                            /* 00C0 */   0xB7, 0x51, 0xBE, 0x3F, 0xC0, 0x00, 0x01, 0x09
                        })
                        OperationRegion (EC, EmbeddedControl, Zero, 0x0100)
                        Field (EC, ByteAcc, NoLock, Preserve)
                        {
                            Offset (0x2B), 
                            TD2B,   8, 
                            TD2C,   8, 
                            T2D0,   1, 
                            T2D1,   4, 
                            T2D5,   3, 
                            TD2E,   8, 
                            TD2F,   8, 
                            TD30,   8, 
                            TD31,   8, 
                            TD32,   8, 
                            TD33,   8, 
                            Offset (0x35), 
                            TD35,   8, 
                            TD36,   8, 
                            Offset (0x38), 
                            TD38,   16, 
                            TD3A,   16, 
                            TD3C,   16, 
                            TD3E,   16, 
                            TD40,   16, 
                            TD42,   16, 
                            TD44,   16, 
                            TD46,   16, 
                            TD48,   16, 
                            TD4A,   16, 
                            TD4C,   16, 
                            TD4E,   16, 
                            TD50,   16, 
                            TD52,   16, 
                            TD54,   16, 
                            TD56,   16, 
                            TD58,   16, 
                            TD5A,   16, 
                            TD5C,   16, 
                            TD5E,   16, 
                            TD60,   16, 
                            TD62,   16, 
                            TD64,   16, 
                            TD66,   16, 
                            TD68,   8, 
                            TD69,   8, 
                            TD6A,   8, 
                            TD6B,   8, 
                            TD6C,   8, 
                            TD6D,   8, 
                            TD6E,   8, 
                            TD6F,   8, 
                            TD70,   8, 
                            TD71,   8, 
                            TD72,   8, 
                            TD73,   8, 
                            TD74,   8, 
                            TD75,   8, 
                            TD76,   8, 
                            TD77,   8, 
                            TD78,   8, 
                            TD79,   8, 
                            Offset (0x80), 
                            TD80,   8, 
                            TD81,   8, 
                            TD82,   8, 
                            TD83,   8, 
                            TD84,   8, 
                            TD85,   8, 
                            TD86,   8, 
                            TD87,   8, 
                            TD88,   8, 
                            TD89,   8, 
                            TD8A,   8, 
                            TD8B,   8, 
                            TD8C,   8, 
                            TD8D,   8, 
                            TD8E,   8, 
                            TD8F,   8, 
                            TD90,   8, 
                            Offset (0xA0), 
                            TDA0,   8, 
                            TDA1,   8, 
                            TDA2,   8, 
                            TDA3,   8, 
                            TDA4,   8, 
                            TDA5,   8, 
                            TDA6,   8, 
                            TDA7,   8, 
                            TDA8,   8, 
                            TDA9,   8, 
                            TDAA,   8, 
                            TDAB,   8, 
                            TDAC,   8, 
                            TDAD,   8, 
                            TDAE,   8, 
                            TDAF,   8, 
                            TDB0,   8, 
                            TDB1,   8, 
                            TDB2,   8, 
                            TDB3,   8, 
                            TDB4,   8, 
                            TDB5,   8, 
                            TDB6,   8, 
                            TDB7,   8, 
                            TDB8,   8, 
                            TDB9,   8, 
                            TDBA,   8, 
                            TDBB,   8, 
                            TDBE,   8, 
                            TDBF,   8, 
                            Offset (0xC8), 
                            TDC8,   8, 
                            TDC9,   8, 
                            TDCA,   8, 
                            TDCB,   8, 
                            TDCC,   8, 
                            TDCD,   8, 
                            TDCE,   8, 
                            TDCF,   8, 
                            Offset (0xE0), 
                            TDE0,   8, 
                            Offset (0xE3), 
                            TDE3,   8, 
                            TE40,   3, 
                            TE43,   5, 
                            TDE5,   8, 
                            TDE6,   8, 
                            TDE7,   8, 
                            TDE8,   8, 
                            TDE9,   8, 
                            Offset (0xED), 
                            TDED,   8, 
                            TDEE,   8, 
                            Offset (0xF0), 
                            TDF0,   8, 
                            TDF1,   8, 
                            TDF2,   8, 
                            TDF3,   8, 
                            TDF4,   8, 
                            TDF5,   8, 
                            TDF6,   8, 
                            TDF7,   8, 
                            TDF8,   8, 
                            TDF9,   8, 
                            TDFA,   8, 
                            TDFB,   8, 
                            TDFC,   8, 
                            TDFD,   8, 
                            TDFE,   8, 
                            TDFF,   8
                        }

                        Method (WQAA, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (T2D0, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (T2D1, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TDEE, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (T2D5, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (TDE5, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (TDE6, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (TDA0, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (TDA1, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (TDA2, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (TDA3, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (TDA4, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (TDA5, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (TDA6, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (TDA7, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (TDA8, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (TDA9, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (TDAA, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (TDAB, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x12))
                            {
                                Store (TDAC, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x13))
                            {
                                Store (TDAD, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x14))
                            {
                                Store (TDAE, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x15))
                            {
                                Store (TDAF, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x16))
                            {
                                Store (TDB0, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x17))
                            {
                                Store (TDB1, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x18))
                            {
                                Store (TDB2, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x19))
                            {
                                Store (TDB3, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x1A))
                            {
                                Store (TDB4, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x1B))
                            {
                                Store (TDB5, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x1C))
                            {
                                Store (TDB6, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x1D))
                            {
                                Store (TDB7, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x1E))
                            {
                                Store (TDB8, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x1F))
                            {
                                Store (TDB9, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x20))
                            {
                                Store (TDBA, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x21))
                            {
                                Store (TDBB, Local0)
                                Return (Local0)
                            }
                        }

                        Method (WQAB, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (TD2E, Local1)
                                Return (Local1)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (TD2F, Local1)
                                Return (Local1)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TD2B, Local1)
                                Return (Local1)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (TD2C, Local1)
                                Return (Local1)
                            }
                        }

                        Method (WQAC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (TD30, Local2)
                                Return (Local2)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (TDBE, Local2)
                                Return (Local2)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TDBF, Local2)
                                Return (Local2)
                            }
                        }

                        Method (WQAD, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (TD31, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (TD38, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TD3A, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (TD3C, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (TD3E, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (TD40, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (TD42, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (TD44, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (TD46, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (TD48, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (TD4A, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (TD4C, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (TDE8, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (TD35, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (TD36, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (TD4E, Local0)
                                Return (Local0)
                            }
                        }

                        Method (WQAE, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (TD32, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (TD50, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TD52, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (TD54, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (TD56, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (TD58, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (TD5A, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (TD5C, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (TD5E, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (TD60, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (TD62, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (TD64, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (TDE9, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (TD66, Local0)
                                Return (Local0)
                            }
                        }

                        Method (WQAF, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (TD33, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (TD68, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TD71, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (TD70, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (TD69, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (TD6A, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (TD6B, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (TD6C, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (TD6D, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (TD6E, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (TD6F, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (TD72, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (TD73, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (TD74, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (TD75, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (TD76, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (TD77, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (TD78, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x12))
                            {
                                Store (TD79, Local0)
                                Return (Local0)
                            }
                        }

                        Method (WQAG, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (TD33, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (TD80, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TD89, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (TD88, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (TD81, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (TD82, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (TD83, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (TD84, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (TD85, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (TD86, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (TD87, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (TD8A, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (TD8B, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (TD8C, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (TD8D, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (TD8E, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (TD8F, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (TD90, Local0)
                                Return (Local0)
                            }
                        }

                        Method (WQAH, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (TE40, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (TE43, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TDE7, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (TDF0, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (TDF1, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (TDFE, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (TDFF, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (TDF2, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (TDF3, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (TDF4, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (TDF5, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (TDF6, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (TDF7, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (TDF8, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (TDF9, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (TDFA, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (TDFB, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (TDFC, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x12))
                            {
                                Store (TDFD, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x13))
                            {
                                Store (TDE0, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x14))
                            {
                                Store (TDE3, Local0)
                                Return (Local0)
                            }
                        }

                        Method (WQAI, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (TDCF, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (TDVR, TDCE)
                                Store (TDCE, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (TDCD, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (TDCC, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (TDCB, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (TDCA, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (TDC9, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (TDC8, Local0)
                                Return (Local0)
                            }
                        }

                        Method (WSAA, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, T2D0)
                                Return (T2D0)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, T2D1)
                                Return (T2D1)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TDEE)
                                Return (TDEE)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, T2D5)
                                Return (T2D5)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (Arg1, TDE5)
                                Return (TDE5)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (Arg1, TDE6)
                                Return (TDE6)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg1, TDA0)
                                Return (TDA0)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (Arg1, TDA1)
                                Return (TDA1)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg1, TDA2)
                                Return (TDA2)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (Arg1, TDA3)
                                Return (TDA3)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg1, TDA4)
                                Return (TDA4)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (Arg1, TDA5)
                                Return (TDA5)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (Arg1, TDA6)
                                Return (TDA6)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (Arg1, TDA7)
                                Return (TDA7)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (Arg1, TDA8)
                                Return (TDA8)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (Arg1, TDA9)
                                Return (TDA9)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (Arg1, TDAA)
                                Return (TDAA)
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (Arg1, TDAB)
                                Return (TDAB)
                            }

                            If (LEqual (Arg0, 0x12))
                            {
                                Store (Arg1, TDAC)
                                Return (TDAC)
                            }

                            If (LEqual (Arg0, 0x13))
                            {
                                Store (Arg1, TDAD)
                                Return (TDAD)
                            }

                            If (LEqual (Arg0, 0x14))
                            {
                                Store (Arg1, TDAE)
                                Return (TDAE)
                            }

                            If (LEqual (Arg0, 0x15))
                            {
                                Store (Arg1, TDAF)
                                Return (TDAF)
                            }

                            If (LEqual (Arg0, 0x16))
                            {
                                Store (Arg1, TDB0)
                                Return (TDB0)
                            }

                            If (LEqual (Arg0, 0x17))
                            {
                                Store (Arg1, TDB1)
                                Return (TDB1)
                            }

                            If (LEqual (Arg0, 0x18))
                            {
                                Store (Arg1, TDB2)
                                Return (TDB2)
                            }

                            If (LEqual (Arg0, 0x19))
                            {
                                Store (Arg1, TDB3)
                                Return (TDB3)
                            }

                            If (LEqual (Arg0, 0x1A))
                            {
                                Store (Arg1, TDB4)
                                Return (TDB4)
                            }

                            If (LEqual (Arg0, 0x1B))
                            {
                                Store (Arg1, TDB5)
                                Return (TDB5)
                            }

                            If (LEqual (Arg0, 0x1C))
                            {
                                Store (Arg1, TDB6)
                                Return (TDB6)
                            }

                            If (LEqual (Arg0, 0x1D))
                            {
                                Store (Arg1, TDB7)
                                Return (TDB7)
                            }

                            If (LEqual (Arg0, 0x1E))
                            {
                                Store (Arg1, TDB8)
                                Return (TDB8)
                            }

                            If (LEqual (Arg0, 0x1F))
                            {
                                Store (Arg1, TDB9)
                                Return (TDB9)
                            }

                            If (LEqual (Arg0, 0x20))
                            {
                                Store (Arg1, TDBA)
                                Return (TDBA)
                            }

                            If (LEqual (Arg0, 0x21))
                            {
                                Store (Arg1, TDBB)
                                Return (TDBB)
                            }
                        }

                        Method (WSAB, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, TD2E)
                                Return (TD2E)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, TD2F)
                                Return (TD2F)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TD2B)
                                Return (TD2B)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, TD2C)
                                Return (TD2C)
                            }
                        }

                        Method (WSAC, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, TD30)
                                Return (TD30)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, TDBE)
                                Return (TDBE)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TDBF)
                                Return (TDBF)
                            }
                        }

                        Method (WSAD, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, TD31)
                                Return (TD31)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, TD38)
                                Return (TD38)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TD3A)
                                Return (TD3A)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, TD3C)
                                Return (TD3C)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (Arg1, TD3E)
                                Return (TD3E)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (Arg1, TD40)
                                Return (TD40)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg1, TD42)
                                Return (TD42)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (Arg1, TD44)
                                Return (TD44)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg1, TD46)
                                Return (TD46)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (Arg1, TD48)
                                Return (TD48)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg1, TD4A)
                                Return (TD4A)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (Arg1, TD4C)
                                Return (TD4C)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (Arg1, TDE8)
                                Return (TDE8)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (Arg1, TD35)
                                Return (TD35)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (Arg1, TD36)
                                Return (TD36)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (Arg1, TD4E)
                                Return (TD4E)
                            }
                        }

                        Method (WSAE, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, TD32)
                                Return (TD32)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, TD50)
                                Return (TD50)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TD52)
                                Return (TD52)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, TD54)
                                Return (TD54)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (Arg1, TD56)
                                Return (TD56)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (Arg1, TD58)
                                Return (TD58)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg1, TD5A)
                                Return (TD5A)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (Arg1, TD5C)
                                Return (TD5C)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg1, TD5E)
                                Return (TD5E)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (Arg1, TD60)
                                Return (TD60)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg1, TD62)
                                Return (TD62)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (Arg1, TD64)
                                Return (TD64)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (Arg1, TDE9)
                                Return (TDE9)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (Arg1, TD66)
                                Return (TD66)
                            }
                        }

                        Method (WSAF, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, TD33)
                                Return (TD33)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, TD68)
                                Return (TD68)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TD71)
                                Return (TD71)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, TD70)
                                Return (TD70)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (Arg1, TD69)
                                Return (TD69)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (Arg1, TD6A)
                                Return (TD6A)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg1, TD6B)
                                Return (TD6B)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (Arg1, TD6C)
                                Return (TD6C)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg1, TD6D)
                                Return (TD6D)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (Arg1, TD6E)
                                Return (TD6E)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg1, TD6F)
                                Return (TD6F)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (Arg1, TD72)
                                Return (TD72)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (Arg1, TD73)
                                Return (TD73)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (Arg1, TD74)
                                Return (TD74)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (Arg1, TD75)
                                Return (TD75)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (Arg1, TD76)
                                Return (TD76)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (Arg1, TD77)
                                Return (TD77)
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (Arg1, TD78)
                                Return (TD78)
                            }

                            If (LEqual (Arg0, 0x12))
                            {
                                Store (Arg1, TD79)
                                Return (TD79)
                            }
                        }

                        Method (WSAG, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, TD33)
                                Return (TD33)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, TD80)
                                Return (TD80)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TD89)
                                Return (TD89)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, TD88)
                                Return (TD88)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (Arg1, TD81)
                                Return (TD81)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (Arg1, TD82)
                                Return (TD82)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg1, TD83)
                                Return (TD83)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (Arg1, TD84)
                                Return (TD84)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg1, TD85)
                                Return (TD85)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (Arg1, TD86)
                                Return (TD86)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg1, TD87)
                                Return (TD87)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (Arg1, TD8A)
                                Return (TD8A)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (Arg1, TD8B)
                                Return (TD8B)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (Arg1, TD8C)
                                Return (TD8C)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (Arg1, TD8D)
                                Return (TD8D)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (Arg1, TD8E)
                                Return (TD8E)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (Arg1, TD8F)
                                Return (TD8F)
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (Arg1, TD90)
                                Return (TD90)
                            }
                        }

                        Method (WSAH, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, TE40)
                                Return (TE40)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, TE43)
                                Return (TE43)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TDE7)
                                Return (TDE7)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, TDF0)
                                Return (TDF0)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (Arg1, TDF1)
                                Return (TDF1)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (Arg1, TDFE)
                                Return (TDFE)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg1, TDFF)
                                Return (TDFF)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (Arg1, TDF2)
                                Return (TDF2)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg1, TDF3)
                                Return (TDF3)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (Arg1, TDF4)
                                Return (TDF4)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg1, TDF5)
                                Return (TDF5)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (Arg1, TDF6)
                                Return (TDF6)
                            }

                            If (LEqual (Arg0, 0x0C))
                            {
                                Store (Arg1, TDF7)
                                Return (TDF7)
                            }

                            If (LEqual (Arg0, 0x0D))
                            {
                                Store (Arg1, TDF8)
                                Return (TDF8)
                            }

                            If (LEqual (Arg0, 0x0E))
                            {
                                Store (Arg1, TDF9)
                                Return (TDF9)
                            }

                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (Arg1, TDFA)
                                Return (TDFA)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (Arg1, TDFB)
                                Return (TDFB)
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (Arg1, TDFC)
                                Return (TDFC)
                            }

                            If (LEqual (Arg0, 0x12))
                            {
                                Store (Arg1, TDFD)
                                Return (TDFD)
                            }

                            If (LEqual (Arg0, 0x13))
                            {
                                Store (Arg1, TDE0)
                                Return (TDE0)
                            }

                            If (LEqual (Arg0, 0x14))
                            {
                                Store (Arg1, TDE3)
                                Return (TDE3)
                            }
                        }

                        Method (WSAI, 2, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, TDCF)
                                Return (TDCF)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Store (Arg1, TDCE)
                                Return (TDCE)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, TDCD)
                                Return (TDCD)
                            }

                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, TDCC)
                                Return (TDCC)
                            }

                            If (LEqual (Arg0, 0x04))
                            {
                                Store (Arg1, TDCB)
                                Return (TDCB)
                            }

                            If (LEqual (Arg0, 0x05))
                            {
                                Store (Arg1, TDCA)
                                Return (TDCA)
                            }

                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg1, TDC9)
                                Return (TDC9)
                            }

                            If (LEqual (Arg0, 0x07))
                            {
                                Store (Arg1, TDC8)
                                Return (TDC8)
                            }
                        }

                        Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event
                        {
                            If (LEqual (Arg0, 0xC0))
                            {
                                Name (EVRT, Buffer (0x02)
                                {
                                     0x00, 0x00
                                })
                                Name (TMPB, Zero)
                                Store (TDEE, TMPB)
                                Store (TMPB, Index (EVRT, Zero))
                                If (LEqual (TMPB, 0x08))
                                {
                                    Store (TE43, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x56))
                                {
                                    Store (TD2E, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x57))
                                {
                                    Store (TD2E, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x5F))
                                {
                                    Store (TD2E, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x60))
                                {
                                    Store (TE40, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x62))
                                {
                                    Store (TDF1, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x63))
                                {
                                    Store (TDF1, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x73))
                                {
                                    Store (TE43, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x79))
                                {
                                    Store (TE43, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x7B))
                                {
                                    Store (TD2E, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x84))
                                {
                                    Store (TD2E, Index (EVRT, One))
                                }

                                If (LEqual (TMPB, 0x02))
                                {
                                    Store (TE43, Index (EVRT, One))
                                }

                                Store (Zero, TDEE)
                                Return (EVRT)
                            }

                            Return (Zero)
                        }
                    }

                    Method (MWAK, 1, NotSerialized)
                    {
                        EOSV ()
                        Notify (LID0, 0x80)
                    }

                    Method (MPTS, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x04))
                        {
                            Store (One, SUSP)
                        }
                    }
                }

                Scope (\_TZ)
                {
                    Method (KELV, 1, NotSerialized)
                    {
                        And (Arg0, 0xFF, Local0)
                        Multiply (Local0, 0x0A, Local0)
                        Add (Local0, 0x0AAC, Local0)
                        Return (Local0)
                    }

                    ThermalZone (THRM)
                    {
                        Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
                        {
                            If (\_SB.PCI0.SBRG.EC.MYEC)
                            {
                                If (\_SB.PCI0.SBRG.EC.CTSD)
                                {
                                    Store (Zero, \_SB.PCI0.SBRG.EC.CTSD)
                                    Return (KELV (0x82))
                                }
                                Else
                                {
                                    Store (\_SB.PCI0.SBRG.EC.CPUT, Local0)
                                    Add (Local0, 0x02, Local0)
                                    Return (KELV (Local0))
                                }
                            }
                            Else
                            {
                                Return (KELV (0x2D))
                            }
                        }

                        Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
                        {
                            Return (KELV (0x78))
                        }
                    }
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                }

                OperationRegion (SACS, PCI_Config, Zero, 0x40)
                Field (SACS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x24), 
                    STB5,   32
                }

                Name (SPTM, Buffer (0x14)
                {
                    /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                    /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                    /* 0010 */   0x1F, 0x00, 0x00, 0x00
                })
                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (STCL, 0x0101))
                        {
                            Store (0x0F, Local1)
                        }
                        Else
                        {
                            Store (Zero, Local1)
                        }

                        Return (Local1)
                    }

                    Name (PRIS, Zero)
                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                        Field (BAR, AnyAcc, NoLock, Preserve)
                        {
                            Offset (0x120), 
                                ,   7, 
                            PMBY,   1, 
                            Offset (0x128), 
                            PMS0,   4, 
                            Offset (0x129), 
                            PMS1,   4, 
                            Offset (0x220), 
                                ,   7, 
                            PSBY,   1, 
                            Offset (0x228), 
                            PSS0,   4, 
                            Offset (0x229), 
                            PSS1,   4, 
                            Offset (0x2A0), 
                                ,   7
                        }

                        If (LOr (LEqual (OSVR, 0x06), LEqual (OSVR, 0x04)))
                        {
                            If (PMS1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (PMBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            If (PSS1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (PSBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Store (Zero, PRIS)
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        Store (0x03, PRIS)
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (PRIS)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x128), 
                                PMS0,   4, 
                                Offset (0x129), 
                                PMS1,   4
                            }

                            If (Not (LEqual (PMS1, Zero)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x120), 
                                    ,   7, 
                                PMBY,   1
                            }

                            Store (0x32, Local0)
                            While (LAnd (LEqual (PMBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }

                            Store (Zero, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x228), 
                                PSS0,   4, 
                                Offset (0x229), 
                                PSS1,   4
                            }

                            If (Not (LEqual (PSS1, Zero)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x220), 
                                    ,   7, 
                                PSBY,   1
                            }

                            Store (0x32, Local0)
                            While (LAnd (LEqual (PSBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }

                            Store (Zero, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                    }

                    Name (SECS, Zero)
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (STCL, 0x0101))
                        {
                            Store (0x0F, Local1)
                        }
                        Else
                        {
                            Store (Zero, Local1)
                        }

                        Return (Local1)
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                        Field (BAR, AnyAcc, NoLock, Preserve)
                        {
                            Offset (0x1A0), 
                                ,   7, 
                            SMBY,   1, 
                            Offset (0x1A8), 
                            SMS0,   4, 
                            Offset (0x1A9), 
                            SMS1,   4, 
                            Offset (0x2A0), 
                                ,   7, 
                            SSBY,   1, 
                            Offset (0x2A8), 
                            SSS0,   4, 
                            Offset (0x2A9), 
                            SSS1,   4, 
                            Offset (0x2AC)
                        }

                        If (LOr (LEqual (OSVR, 0x06), LEqual (OSVR, 0x04)))
                        {
                            If (SMS1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (SMBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            If (SSS1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (SSBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Store (Zero, SECS)
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        Store (0x03, SECS)
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (SECS)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x1A8), 
                                SMS0,   4, 
                                Offset (0x1A9), 
                                SMS1,   4
                            }

                            If (Not (LEqual (SMS1, Zero)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x1000)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x1A0), 
                                    ,   7, 
                                SMBY,   1
                            }

                            Store (0x32, Local0)
                            While (LAnd (LEqual (SMBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }

                            Store (Zero, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x2A8), 
                                SSS0,   4, 
                                Offset (0x2A9), 
                                SSS1,   4
                            }

                            If (Not (LEqual (SSS1, Zero)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x2A0), 
                                    ,   7, 
                                SSBY,   1
                            }

                            Store (0x32, Local0)
                            While (LAnd (LEqual (SSBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }

                            Store (Zero, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P)
                        }
                    }
                }
            }

            Device (PE21)
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x10, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR21)
                    }

                    Return (PR21)
                }
            }

            Device (PE22)
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR22)
                    }

                    Return (PR22)
                }
            }

            Device (PE23)
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x12, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR23)
                    }

                    Return (PR23)
                }
            }

            Device (GNBD)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Scope (\)
                {
                    OperationRegion (ATFB, SystemMemory, 0x8D791018, 0x0105)
                    Field (ATFB, AnyAcc, NoLock, Preserve)
                    {
                        BCMD,   8, 
                        DID,    32, 
                        INFO,   2048
                    }

                    Field (ATFB, AnyAcc, NoLock, Preserve)
                    {
                        Offset (0x05), 
                        INF0,   8, 
                        INF1,   8, 
                        INF2,   8, 
                        INF3,   8, 
                        INF4,   8, 
                        INF5,   8, 
                        INF6,   8, 
                        INF7,   8
                    }

                    Field (ATFB, AnyAcc, NoLock, Preserve)
                    {
                        AccessAs (ByteAcc, 0x00), 
                        Offset (0x05), 
                        INF,    8
                    }
                }

                OperationRegion (NBRV, PCI_Config, 0x08, One)
                Field (NBRV, ByteAcc, NoLock, Preserve)
                {
                    PREV,   8
                }

                OperationRegion (NBBR, PCI_Config, 0x1C, 0x08)
                Field (NBBR, DWordAcc, NoLock, Preserve)
                {
                    BR3L,   32, 
                    BR3H,   32
                }

                OperationRegion (NBBI, PCI_Config, 0x84, 0x04)
                Field (NBBI, DWordAcc, NoLock, Preserve)
                {
                    PARB,   32
                }

                OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
                Field (NBMS, DWordAcc, NoLock, Preserve)
                {
                    MIDX,   32, 
                    MIDR,   32
                }

                Mutex (NBMM, 0x00)
                Method (NBMR, 1, NotSerialized)
                {
                    Acquire (NBMM, 0xFFFF)
                    And (Arg0, 0x7F, Local0)
                    Store (Local0, MIDX)
                    Store (MIDR, Local0)
                    Store (0x7F, MIDX)
                    Release (NBMM)
                    Return (Local0)
                }

                Method (NBMW, 2, NotSerialized)
                {
                    Acquire (NBMM, 0xFFFF)
                    And (Arg0, 0x7F, Local0)
                    Or (Local0, 0x80, Local0)
                    Store (Local0, MIDX)
                    Store (Arg1, MIDR)
                    Store (And (Local0, 0x7F, Local0), MIDX)
                    Release (NBMM)
                }

                OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
                Field (NBXP, DWordAcc, NoLock, Preserve)
                {
                    NBXI,   32, 
                    NBXD,   32
                }

                Mutex (NBXM, 0x00)
                Method (NBXR, 1, NotSerialized)
                {
                    Acquire (NBXM, 0xFFFF)
                    Store (Arg0, NBXI)
                    Store (NBXD, Local0)
                    Store (Zero, NBXI)
                    Release (NBXM)
                    Return (Local0)
                }

                Method (NBXW, 2, NotSerialized)
                {
                    Acquire (NBXM, 0xFFFF)
                    Store (Arg0, NBXI)
                    Store (Arg1, NBXD)
                    Store (Zero, NBXI)
                    Release (NBXM)
                }

                Method (GFXM, 0, NotSerialized)
                {
                    Store (NBMR (0x08), Local0)
                    And (Local0, 0x0F, Local0)
                    Return (Local0)
                }

                Method (GPPM, 0, NotSerialized)
                {
                    Store (NBMR (0x67), Local0)
                    And (Local0, 0xF0, Local0)
                    Return (Local0)
                }

                Method (GPPX, 0, NotSerialized)
                {
                    Store (NBMR (0x2D), Local0)
                    ShiftRight (Local0, 0x07, Local0)
                    And (Local0, 0x0F, Local0)
                    Return (Local0)
                }

                Method (XPTR, 2, NotSerialized)
                {
                    If (LAnd (LLess (Arg0, 0x02), LGreater (Arg0, 0x07)))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Store (GPPM (), Local0)
                        Store (GPPX (), Local1)
                        Store (One, Local0)
                        If (LLess (Arg0, 0x04))
                        {
                            Add (Arg0, 0x02, Local1)
                        }
                        Else
                        {
                            Add (Arg0, 0x11, Local1)
                        }

                        ShiftLeft (Local0, Local1, Local0)
                        Store (NBMR (0x08), Local2)
                        If (Arg1)
                        {
                            And (Local2, Not (Local0), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local0, Local2)
                        }

                        NBMW (0x08, Local2)
                        Return (Ones)
                    }
                }

                Name (PX3L, 0x80000000)
                Name (PX3H, 0x80000000)
                Name (PX3S, 0x10000000)
                Name (PX3K, 0xF0000000)
                Mutex (BR3X, 0x00)
                Method (BR3M, 0, NotSerialized)
                {
                    Store (PARB, Local0)
                    ShiftRight (Local0, 0x10, Local0)
                    And (Local0, 0x07, Local0)
                    If (Local0)
                    {
                        ShiftLeft (One, Local0, Local1)
                        Subtract (0x1000, Local1, Local1)
                        ShiftLeft (Local1, 0x14, Local1)
                        Store (Local1, PX3K)
                        ShiftRight (0x00100000, Local0, Local0)
                        Store (Local0, PX3S)
                    }

                    Acquire (BR3X, 0xFFFF)
                    Store (NBMR (Zero), Local0)
                    And (Local0, 0xFFFFFFF7, Local0)
                    NBMW (Zero, Local0)
                    Store (BR3L, Local0)
                    And (Local0, PX3K, Local0)
                    Store (Local0, PX3L)
                    Store (BR3H, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, PX3H)
                    Store (NBMR (Zero), Local0)
                    Or (Local0, 0x08, Local0)
                    NBMW (Zero, Local0)
                    Release (BR3X)
                    Return (PX3L)
                }

                OperationRegion (NB2, PCI_Config, Zero, 0x0100)
                Field (NB2, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    MI,     32, 
                    MD,     32, 
                    Offset (0x90), 
                    TOM,    32, 
                    OI,     32, 
                    OD,     32, 
                    Offset (0xE0), 
                    LI,     32, 
                    LD,     32
                }

                Device (BROD)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x14)  // _UID: Unique ID
                    Name (UMAS, 0x30000000)
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y15)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.PCI0.GNBD.BROD._Y15._BAS, BAS1)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.GNBD.BROD._Y15._LEN, LEN1)  // _LEN: Length
                        Store (UMAS, LEN1)
                        Subtract (TOM, LEN1, BAS1)
                        Return (CRS)
                    }
                }
            }

            Device (BR14)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR14)
                    }

                    Return (PR14)
                }
            }

            Device (BR15)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR15)
                    }

                    Return (PR15)
                }
            }

            Device (BR16)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR16)
                    }

                    Return (PR16)
                }
            }

            Device (BR17)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR17)
                    }

                    Return (PR17)
                }
            }

            Device (BR12)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR12)
                    }

                    Return (PR12)
                }
            }

            Device (PCED)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                OperationRegion (XPEX, SystemMemory, 0xE0018100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x18), 
                        ,   3, 
                    PDC8,   1, 
                        ,   2, 
                    PDS8,   1, 
                    Offset (0x19), 
                    HPC8,   1, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (And (VC0S, 0x00020000))
                    {
                        Store (Ones, Local0)
                    }

                    Return (Local0)
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Store (Zero, Local1)
                    Store (XPPB (), Local0)
                    If (LGreater (0x04, Local0))
                    {
                        Store (Zero, Local1)
                    }

                    If (LGreater (0x08, Local0))
                    {
                        Store (0x00010000, Local1)
                    }

                    If (LGreater (0x0B, Local0))
                    {
                        Store (0x00020000, Local1)
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Store (XPPB (), Local0)
                    Store (^^GNBD.GPPX (), Local2)
                    Store (^^GNBD.GFXM (), Local3)
                    Store (Zero, Local1)
                    If (LEqual (0x10, Local0))
                    {
                        Store (0xFFFF, Local1)
                        If (Local3)
                        {
                            Store (0x0F0F, Local1)
                        }
                    }

                    If (LEqual (0x18, Local0))
                    {
                        Store (0xF0F0, Local1)
                    }

                    If (LEqual (0x20, Local0))
                    {
                        Store (0x1010, Local1)
                    }

                    If (LEqual (0x28, Local0))
                    {
                        Store (0x2020, Local1)
                    }

                    If (LEqual (0x30, Local0))
                    {
                        Store (0x4040, Local1)
                    }

                    If (LEqual (0x38, Local0))
                    {
                        Store (0x8080, Local1)
                    }

                    If (LEqual (0x48, Local0))
                    {
                        Store (Zero, Local1)
                        If (LEqual (0x02, Local2))
                        {
                            Store (0x0303, Local1)
                        }

                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0101, Local1)
                        }
                    }

                    If (LEqual (0x50, Local0))
                    {
                        Store (Zero, Local1)
                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0202, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (XPPD (), Local1)
                    If (LNotEqual (Zero, Local1))
                    {
                        Store (^^GNBD.NBXR (Add (0x65, XPCN ())), Local2)
                        If (Arg0)
                        {
                            And (Local2, Not (Local1), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local1, Local2)
                        }

                        ^^GNBD.NBXW (Add (0x65, XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Store (^^GNBD.GFXM (), Local0)
                    Store (XPPB (), Local1)
                    Store (Zero, Local2)
                    If (LEqual (0x10, Local1))
                    {
                        Store (One, Local2)
                        Store (0x00770070, Local3)
                        If (Local0)
                        {
                            Store (0x00330030, Local3)
                        }
                    }

                    If (LAnd (LEqual (0x18, Local1), Local0))
                    {
                        Store (One, Local2)
                        Store (0x00440040, Local3)
                    }

                    Store (^^GNBD.NBMR (0x07), Local0)
                    Store (^^GNBD.NBXR (0x65), Local1)
                    If (LAnd (Local0, 0x0201F000))
                    {
                        Store (0x00440040, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0xF0F0))
                        {
                            Store (Zero, Local5)
                        }
                    }
                    Else
                    {
                        Store (0x00110010, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0x0F0F))
                        {
                            Store (Zero, Local5)
                        }
                    }

                    If (Local2)
                    {
                        Store (Or (Local3, Local4), Local6)
                        Store (And (Local5, Local4), Local0)
                        Store (Or (Local3, Local0), Local7)
                        Store (^^GNBD.NBMR (0x2E), Local0)
                        If (Arg0)
                        {
                            And (Local0, Not (Local6), Local0)
                        }
                        Else
                        {
                            Or (Local0, Local7, Local0)
                        }

                        ^^GNBD.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (One)
                        XPLP (One)
                        Sleep (0xC8)
                        ^^GNBD.XPTR (ShiftLeft (XPPB (), 0x03), One)
                        Sleep (0x14)
                    }
                    Else
                    {
                        ^^GNBD.XPTR (ShiftLeft (XPPB (), 0x03), Zero)
                        XPLP (Zero)
                        XPLL (Zero)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }

                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        ^^^VGA._DOS (Arg0)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (^^^VGA._DOD)
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (_DCS, 0x1F)  // _DCS: Display Current Status
                        Name (_DGS, One)  // _DGS: Display Graphics State
                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                        }

                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (^^^^VGA.LCD._BCL ())
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            ^^^^VGA.LCD._BCM (Arg0)
                        }

                        Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                        {
                            Return (^^^^VGA.LCD._BQC ())
                        }
                    }

                    Name (SWIT, Zero)
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, PDC2)
                            Store (One, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (XPRD (0xA5), Local6)
                                And (Local6, 0x7F, Local6)
                                If (LAnd (LGreaterEqual (Local6, 0x10), LNotEqual (Local6, 0x7F)))
                                {
                                    Store (Zero, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (XPDL (), Local5)
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (ShiftLeft (XPPB (), 0x03), INFO)
                                    Store (0x87, BCMD)
                                    Store (Zero, ^^SBRG.SMIC)
                                    If (LEqual (XPR2 (), Ones))
                                    {
                                        Store (One, Local0)
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (Zero, Local0)
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (Local0))
                        {
                            XPDT (Zero)
                            XPPR (Zero)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        Store (One, PDC2)
                        Store (^VGA.DVID, Local7)
                        Sleep (0x0A)
                        Store (One, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (XPRD (0xA5), Local6)
                            And (Local6, 0x7F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (Zero, Local4)
                            }
                            Else
                            {
                                Store (^VGA.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Return (Ones)
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR13)
                    }

                    Return (PR13)
                }
            }

            Device (PE20)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x08, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR20)
                    }

                    Return (PR20)
                }
            }

            Device (P0PC)
            {
                Name (_ADR, 0x00140004)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x04, 0x04))
                }
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00120000)  // _ADR: Address
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Device (CAM0)
                        {
                            Method (_ADR, 0, NotSerialized)  // _ADR: Address
                            {
                                Return (^^_ADR)
                            }

                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x25, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0010 */   0x8C, 0x00, 0x2C, 0x01
                                    /*           Revision : 02     */
                                    /*        IgnoreColor : 01     */
                                    /*              Color : 000000 */
                                    /*              Width : 0000   */
                                    /*             Height : 0000   */
                                    /*        UserVisible : 01     */
                                    /*               Dock : 00     */
                                    /*                Lid : 01     */
                                    /*              Panel : 04     */
                                    /*   VerticalPosition : 00     */
                                    /* HorizontalPosition : 01     */
                                    /*              Shape : 07     */
                                    /*   GroupOrientation : 00     */
                                    /*         GroupToken : 00     */
                                    /*      GroupPosition : 00     */
                                    /*                Bay : 00     */
                                    /*          Ejectable : 00     */
                                    /*  OspmEjectRequired : 00     */
                                    /*      CabinetNumber : 00     */
                                    /*     CardCageNumber : 00     */
                                    /*          Reference : 00     */
                                    /*           Rotation : 00     */
                                    /*              Order : 00     */
                                    /*     VerticalOffset : 008C   */
                                    /*   HorizontalOffset : 012C   */
                                }
                            })
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x00120002)  // _ADR: Address
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Device (CAM0)
                        {
                            Method (_ADR, 0, NotSerialized)  // _ADR: Address
                            {
                                Return (^^_ADR)
                            }

                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x25, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0010 */   0x8C, 0x00, 0x2C, 0x01
                                    /*           Revision : 02     */
                                    /*        IgnoreColor : 01     */
                                    /*              Color : 000000 */
                                    /*              Width : 0000   */
                                    /*             Height : 0000   */
                                    /*        UserVisible : 01     */
                                    /*               Dock : 00     */
                                    /*                Lid : 01     */
                                    /*              Panel : 04     */
                                    /*   VerticalPosition : 00     */
                                    /* HorizontalPosition : 01     */
                                    /*              Shape : 07     */
                                    /*   GroupOrientation : 00     */
                                    /*         GroupToken : 00     */
                                    /*      GroupPosition : 00     */
                                    /*                Bay : 00     */
                                    /*          Ejectable : 00     */
                                    /*  OspmEjectRequired : 00     */
                                    /*      CabinetNumber : 00     */
                                    /*     CardCageNumber : 00     */
                                    /*          Reference : 00     */
                                    /*           Rotation : 00     */
                                    /*              Order : 00     */
                                    /*     VerticalOffset : 008C   */
                                    /*   HorizontalOffset : 012C   */
                                }
                            })
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x00130002)  // _ADR: Address
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (OHC3)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (EHC3)
            {
                Name (_ADR, 0x00160002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (OHC4)
            {
                Name (_ADR, 0x00140005)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (XHC0)
            {
                Name (_ADR, 0x00100000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (XHC1)
            {
                Name (_ADR, 0x00100001)  // _ADR: Address
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0x03, 
                            Zero, 
                            Zero
                        })
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0x03, 
                            Zero, 
                            Zero
                        })
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (SBAZ)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, Zero, 0x0100)
                Field (PCI, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x42), 
                    DNSP,   1, 
                    DNSO,   1, 
                    ENSR,   1
                }
            }

            Device (VGA)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x2C), 
                    SVID,   32, 
                    Offset (0x4C), 
                    SMID,   32
                }

                OperationRegion (PCIG, PCI_Config, Zero, 0x50)
                Field (PCIG, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    GBA2,   32
                }

                OperationRegion (GFMM, SystemMemory, GBA2, 0x6000)
                Field (GFMM, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x5F68), 
                    AZPS,   32
                }

                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    Store (Arg0, SWIT)
                }

                Name (_DOD, Package (0x05)  // _DOD: Display Output Devices
                {
                    0x00010100, 
                    0x00010110, 
                    0x0200, 
                    0x00010210, 
                    0x00010220
                })
                Device (LCD)
                {
                    Name (_ADR, 0x0110)  // _ADR: Address
                    Name (_DCS, 0x1F)  // _DCS: Display Current Status
                    Name (_DGS, One)  // _DGS: Display Graphics State
                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                    }

                    Method (BCLA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSFL (), 0x0F))
                        {
                            Return (Package (0x67)
                            {
                                0x64, 
                                0x44, 
                                Zero, 
                                One, 
                                0x02, 
                                0x03, 
                                0x04, 
                                0x05, 
                                0x06, 
                                0x07, 
                                0x08, 
                                0x09, 
                                0x0A, 
                                0x0B, 
                                0x0C, 
                                0x0D, 
                                0x0E, 
                                0x0F, 
                                0x10, 
                                0x11, 
                                0x12, 
                                0x13, 
                                0x14, 
                                0x15, 
                                0x16, 
                                0x17, 
                                0x18, 
                                0x19, 
                                0x1A, 
                                0x1B, 
                                0x1C, 
                                0x1D, 
                                0x1E, 
                                0x1F, 
                                0x20, 
                                0x21, 
                                0x22, 
                                0x23, 
                                0x24, 
                                0x25, 
                                0x26, 
                                0x27, 
                                0x28, 
                                0x29, 
                                0x2A, 
                                0x2B, 
                                0x2C, 
                                0x2D, 
                                0x2E, 
                                0x2F, 
                                0x30, 
                                0x31, 
                                0x32, 
                                0x33, 
                                0x34, 
                                0x35, 
                                0x36, 
                                0x37, 
                                0x38, 
                                0x39, 
                                0x3A, 
                                0x3B, 
                                0x3C, 
                                0x3D, 
                                0x3E, 
                                0x3F, 
                                0x40, 
                                0x41, 
                                0x42, 
                                0x43, 
                                0x44, 
                                0x45, 
                                0x46, 
                                0x47, 
                                0x48, 
                                0x49, 
                                0x4A, 
                                0x4B, 
                                0x4C, 
                                0x4D, 
                                0x4E, 
                                0x4F, 
                                0x50, 
                                0x51, 
                                0x52, 
                                0x53, 
                                0x54, 
                                0x55, 
                                0x56, 
                                0x57, 
                                0x58, 
                                0x59, 
                                0x5A, 
                                0x5B, 
                                0x5C, 
                                0x5D, 
                                0x5E, 
                                0x5F, 
                                0x60, 
                                0x61, 
                                0x62, 
                                0x63, 
                                0x64
                            })
                        }
                        Else
                        {
                            Return (Package (0x0B)
                            {
                                0x64, 
                                0x3C, 
                                0x14, 
                                0x1E, 
                                0x28, 
                                0x32, 
                                0x3C, 
                                0x46, 
                                0x50, 
                                0x5A, 
                                0x64
                            })
                        }
                    }

                    Name (BRTS, Zero)
                    Method (BCMA, 1, NotSerialized)
                    {
                        If (LEqual (AF7E, 0x80000001))
                        {
                            Divide (Multiply (Arg0, 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                            Store (Arg0, BRTS)
                        }
                    }

                    Method (BQCA, 0, NotSerialized)
                    {
                        Return (BRTS)
                    }

                    Method (BCME, 1, NotSerialized)
                    {
                        If (LGreaterEqual (OSFL (), 0x0F))
                        {
                            Store (Match (WBCL, MEQ, Arg0, MTR, Zero, 0x02), Local0)
                            If (LLess (Local0, SizeOf (PWMP)))
                            {
                                Store (ToInteger (DerefOf (Index (PWMP, Local0))), Local0)
                                Store (Local0, ^^^SBRG.EC.BRTP)
                            }

                            Return (Zero)
                        }

                        If (LEqual (Arg0, 0x14))
                        {
                            Store (Zero, Local0)
                        }

                        If (LEqual (Arg0, 0x1E))
                        {
                            Store (One, Local0)
                        }

                        If (LEqual (Arg0, 0x28))
                        {
                            Store (0x02, Local0)
                        }

                        If (LEqual (Arg0, 0x32))
                        {
                            Store (0x03, Local0)
                        }

                        If (LEqual (Arg0, 0x3C))
                        {
                            Store (0x04, Local0)
                        }

                        If (LEqual (Arg0, 0x46))
                        {
                            Store (0x05, Local0)
                        }

                        If (LEqual (Arg0, 0x50))
                        {
                            Store (0x06, Local0)
                        }

                        If (LEqual (Arg0, 0x5A))
                        {
                            Store (0x07, Local0)
                        }

                        If (LEqual (Arg0, 0x64))
                        {
                            Store (0x08, Local0)
                        }

                        Store (Local0, ^^^SBRG.EC.BRLV)
                    }

                    Name (PBCL, Package (0x0B)
                    {
                        0x64, 
                        0x3C, 
                        0x14, 
                        0x1E, 
                        0x28, 
                        0x32, 
                        0x3C, 
                        0x46, 
                        0x50, 
                        0x5A, 
                        0x64
                    })
                    Name (WBCL, Package (0x0D)
                    {
                        0x64, 
                        0x3C, 
                        0x05, 
                        0x0A, 
                        0x14, 
                        0x1E, 
                        0x28, 
                        0x32, 
                        0x3C, 
                        0x46, 
                        0x50, 
                        0x5A, 
                        0x64
                    })
                    Name (PWMP, Package (0x0D)
                    {
                        0x64, 
                        0x44, 
                        0x14, 
                        0x1C, 
                        0x24, 
                        0x2C, 
                        0x34, 
                        0x3C, 
                        0x44, 
                        0x4C, 
                        0x54, 
                        0x5C, 
                        0x64
                    })
                    Method (BCLE, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSFL (), 0x0F))
                        {
                            Return (WBCL)
                        }

                        Return (PBCL)
                    }

                    Method (BQCE, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSFL (), 0x0F))
                        {
                            Store (0x64, Local0)
                            Store (^^^SBRG.EC.BRTP, Local1)
                            Store (Match (PWMP, MEQ, Local1, MTR, Zero, 0x02), Local1)
                            If (LLess (Local1, SizeOf (WBCL)))
                            {
                                Store (ToInteger (DerefOf (Index (WBCL, Local1))), Local0)
                            }

                            Return (Local0)
                        }

                        Store (^^^SBRG.EC.BRLV, Local0)
                        Add (Local0, 0x02, Local0)
                        Store (DerefOf (Index (PBCL, Local0)), Local1)
                        Return (Local1)
                    }

                    Mutex (MUTE, 0x00)
                    Method (RBPE, 1, NotSerialized)
                    {
                        Acquire (MUTE, 0x03E8)
                        Add (Arg0, PEBS, Local0)
                        OperationRegion (PCFG, SystemMemory, Local0, One)
                        Field (PCFG, ByteAcc, NoLock, Preserve)
                        {
                            XCFG,   8
                        }

                        Release (MUTE)
                        Return (XCFG)
                    }

                    Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                    {
                        If (LGreaterEqual (RBPE (0x000A0008), 0x15))
                        {
                            Return (BCLA ())
                        }
                        Else
                        {
                            Return (BCLE ())
                        }
                    }

                    Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                    {
                        If (LGreaterEqual (RBPE (0x000A0008), 0x15))
                        {
                            BCMA (Arg0)
                        }
                        Else
                        {
                            BCME (Arg0)
                        }
                    }

                    Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                    {
                        If (LGreaterEqual (RBPE (0x000A0008), 0x15))
                        {
                            Return (BQCA ())
                        }
                        Else
                        {
                            Return (BQCE ())
                        }
                    }
                }

                Name (SWIT, Zero)
            }
        }

        Scope (\_GPE)
        {
            Method (_L10, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE21, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L11, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE22, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L12, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE23, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE20, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0PC, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.OHC1, 0x02)
                Notify (\_SB.PCI0.EHC1, 0x02)
                Notify (\_SB.PCI0.OHC2, 0x02)
                Notify (\_SB.PCI0.EHC2, 0x02)
                Notify (\_SB.PCI0.OHC3, 0x02)
                Notify (\_SB.PCI0.EHC3, 0x02)
                Notify (\_SB.PCI0.OHC4, 0x02)
                Notify (\_SB.PCI0.XHC0, 0x02)
                Notify (\_SB.PCI0.XHC1, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    Scope (_SB)
    {
        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x10), 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x15), 
            GEC,    8, 
            Offset (0x30), 
            USB1,   8, 
            USB2,   8, 
            USB3,   8, 
            USB4,   8, 
            USB5,   8, 
            USB6,   8, 
            USB7,   8, 
            Offset (0x40), 
            IDE,    8, 
            SATA,   8, 
            Offset (0x50), 
            GPP0,   8, 
            GPP1,   8, 
            GPP2,   8, 
            GPP3,   8
        }

        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }

        Method (IRQC, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Store (PD64, Local1)
            Store (0x1F, PIRE)
            Store (0x1F, PIRF)
            Store (0x1F, PIRG)
            Store (0x1F, PIRH)
        }

        Method (INTA, 1, NotSerialized)
        {
            Store (Arg0, PIRA)
            Store (Arg0, HDAD)
            Store (Arg0, GEC)
            Store (Arg0, GPP0)
            Store (Arg0, GPP0)
        }

        Method (INTB, 1, NotSerialized)
        {
            Store (Arg0, PIRB)
            Store (Arg0, USB2)
            Store (Arg0, USB4)
            Store (Arg0, USB6)
            Store (Arg0, GPP1)
            Store (Arg0, IDE)
        }

        Method (INTC, 1, NotSerialized)
        {
            Store (Arg0, PIRC)
            Store (Arg0, USB1)
            Store (Arg0, USB3)
            Store (Arg0, USB5)
            Store (Arg0, USB7)
            Store (Arg0, GPP2)
        }

        Method (INTD, 1, NotSerialized)
        {
            Store (Arg0, PIRD)
            Store (Arg0, SATA)
            Store (Arg0, GPP3)
        }

        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Name (IPRA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRB, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRD, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRA)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSA)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRA, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                INTA (Local0)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRB)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSB)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRB, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                INTB (Local0)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRC)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSC)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRC, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                INTC (Local0)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRD)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSD)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRD, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                INTD (Local0)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRE)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSE)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRE)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRE, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (PIRE, Local0)
                Decrement (Local0)
                Store (Local0, PIRE)
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRF)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSF)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRF)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRF, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRG)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSG)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRG)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRG, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRH)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSH)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRH)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRH, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            OSFL ()
            If (LLessEqual (RVID, 0x13)) {}
            If (IMCS)
            {
                IBWE ()
            }
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Scope (SBRG)
            {
                Method (RRIO, 4, NotSerialized)
                {
                    Store ("RRIO", Debug)
                }

                Method (RDMA, 3, NotSerialized)
                {
                    Store ("rDMA", Debug)
                }
            }
        }
    }

    Device (HPET)
    {
        Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
        Name (CRS, ResourceTemplate ()
        {
            Memory32Fixed (ReadOnly,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                _Y16)
        })
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (LEqual (And (HPAD, One), One))
            {
                If (LGreaterEqual (OSVR, 0x0C))
                {
                    Return (0x0F)
                }

                Store (And (HPAD, 0xFFFFFFE0), HPAD)
                Return (One)
            }

            Return (One)
        }

        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            CreateDWordField (CRS, \HPET._Y16._BAS, HPT)  // _BAS: Base Address
            Store (0xFED00000, HPT)
            Return (CRS)
        }
    }

    Scope (_SB.PCI0)
    {
        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                        /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                    }))
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                Store (CDW2, SUPP)
                Store (CDW3, CTRL)
                If (LNotEqual (And (SUPP, 0x16), 0x16))
                {
                    And (CTRL, 0x1E)
                }

                If (LNot (PEHP))
                {
                    And (CTRL, 0x1E, CTRL)
                }

                If (LNot (SHPC))
                {
                    And (CTRL, 0x1D, CTRL)
                }

                If (LNot (PEPM))
                {
                    And (CTRL, 0x1B, CTRL)
                }

                If (LNot (PEER))
                {
                    And (CTRL, 0x15, CTRL)
                }

                If (LNot (PECS))
                {
                    And (CTRL, 0x0F, CTRL)
                }

                If (OSCF)
                {
                    If (Not (And (CDW1, One)))
                    {
                        If (And (CTRL, One)) {}
                        If (And (CTRL, 0x04))
                        {
                            Store (One, EPNM)
                        }
                        Else
                        {
                            Store (Zero, EPNM)
                        }

                        If (And (CTRL, 0x10)) {}
                    }
                }

                If (LNotEqual (Arg1, One))
                {
                    Or (CDW1, 0x08, CDW1)
                }

                If (LNotEqual (CDW3, CTRL))
                {
                    Or (CDW1, 0x10, CDW1)
                }

                Store (CTRL, CDW3)
                Return (Arg3)
            }
            Else
            {
                Or (CDW1, 0x04, CDW1)
                Return (Arg3)
            }
        }
    }

    Scope (_SB.PCI0.VGA)
    {
        Name (PXEN, 0x80000001)
        Name (PXID, 0x00030000)
        Name (PXMX, 0x80000001)
        Name (LCDT, 0x80000000)
        Name (DSCT, 0x80000000)
        Name (AF7E, 0x80000001)
        Name (PXDY, 0x80000002)
        Name (PXFX, 0x80000000)
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Scope (\_SB.PCI0.VGA)
        {
            Name (ATIB, Buffer (0x0100) {})
            Method (ATIF, 2, Serialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (AF00 ())
                }

                If (LEqual (Arg0, One))
                {
                    Return (AF01 ())
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (AF02 ())
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                        0x04))))
                }
                Else
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateWordField (ATIB, 0x02, VERN)
                    CreateDWordField (ATIB, 0x04, NMSK)
                    CreateDWordField (ATIB, 0x08, SFUN)
                    Store (Zero, SSZE)
                    Store (Zero, VERN)
                    Store (Zero, NMSK)
                    Store (Zero, SFUN)
                    Return (ATIB)
                }
            }

            Method (AF00, 0, NotSerialized)
            {
                Store (0xF0, P80H)
                CreateWordField (ATIB, Zero, SSZE)
                CreateWordField (ATIB, 0x02, VERN)
                CreateDWordField (ATIB, 0x04, NMSK)
                CreateDWordField (ATIB, 0x08, SFUN)
                Store (0x0C, SSZE)
                Store (One, VERN)
                If (LEqual (PXEN, 0x80000000))
                {
                    Store (0x11, NMSK)
                }
                Else
                {
                    Store (0x51, NMSK)
                }

                If (LEqual (AF7E, 0x80000001))
                {
                    Or (NMSK, 0x80, NMSK)
                }

                Store (NMSK, MSKN)
                Store (0x07, SFUN)
                Return (ATIB)
            }

            Name (NCOD, 0x81)
            Method (AF01, 0, NotSerialized)
            {
                Store (0xF1, P80H)
                CreateWordField (ATIB, Zero, SSZE)
                CreateDWordField (ATIB, 0x02, VMSK)
                CreateDWordField (ATIB, 0x06, FLGS)
                Store (0x0A, SSZE)
                Store (0x03, VMSK)
                Store (0x0A, SSZE)
                Store (One, FLGS)
                Return (ATIB)
            }

            Name (PSBR, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00
            })
            Name (MSKN, Zero)
            Name (SEXM, Zero)
            Name (STHG, Zero)
            Name (STHI, Zero)
            Name (SFPG, Zero)
            Name (SFPI, Zero)
            Name (SSPS, Zero)
            Name (SSDM, 0x0A)
            Name (SCDY, Zero)
            Name (SACT, Buffer (0x0D)
            {
                /* 0000 */   0x01, 0x02, 0x80, 0x08, 0x03, 0x81, 0x09, 0x82,
                /* 0008 */   0x0A, 0x88, 0x0B, 0x89, 0x8A
            })
            Method (AF02, 0, NotSerialized)
            {
                Store (0xF2, P80H)
                CreateBitField (PSBR, Zero, PDSW)
                CreateBitField (PSBR, One, PEXM)
                CreateBitField (PSBR, 0x02, PTHR)
                CreateBitField (PSBR, 0x03, PFPS)
                CreateBitField (PSBR, 0x04, PSPS)
                CreateBitField (PSBR, 0x05, PDCC)
                CreateBitField (PSBR, 0x06, PXPS)
                CreateBitField (PSBR, 0x07, PBRT)
                CreateWordField (ATIB, Zero, SSZE)
                CreateDWordField (ATIB, 0x02, PSBI)
                CreateByteField (ATIB, 0x06, EXPM)
                CreateByteField (ATIB, 0x07, THRM)
                CreateByteField (ATIB, 0x08, THID)
                CreateByteField (ATIB, 0x09, FPWR)
                CreateByteField (ATIB, 0x0A, FPID)
                CreateByteField (ATIB, 0x0B, SPWR)
                CreateByteField (ATIB, 0x0C, BRTL)
                Store (0x0D, SSZE)
                Store (PSBR, PSBI)
                If (PDSW)
                {
                    Store (0x82, P80H)
                    Store (Zero, PDSW)
                }

                If (PEXM)
                {
                    Store (SEXM, EXPM)
                    Store (Zero, SEXM)
                    Store (Zero, PEXM)
                }

                If (PTHR)
                {
                    Store (STHG, THRM)
                    Store (STHI, THID)
                    Store (Zero, STHG)
                    Store (Zero, STHI)
                    Store (Zero, PTHR)
                }

                If (PFPS)
                {
                    Store (SFPG, FPWR)
                    Store (SFPI, FPWR)
                    Store (Zero, SFPG)
                    Store (Zero, SFPI)
                    Store (Zero, PFPS)
                }

                If (PSPS)
                {
                    Store (SSPS, SPWR)
                    Store (Zero, PSPS)
                }

                If (PXPS)
                {
                    Store (0xA2, P80H)
                    Store (Zero, PXPS)
                }

                If (PBRT)
                {
                    Store (0xF7, P80H)
                    Store (Zero, PBRT)
                }

                Return (ATIB)
            }

            Method (AF03, 2, NotSerialized)
            {
                Store (0xF3, P80H)
                CreateWordField (ATIB, Zero, SSZE)
                CreateWordField (ATIB, 0x02, SSDP)
                CreateWordField (ATIB, 0x04, SCDP)
                Store (Arg0, SSDP)
                Store (Arg1, SCDP)
                Name (NXTD, 0x06)
                Name (CIDX, 0x06)
                Store (SSDP, Local1)
                And (Local1, 0x8B, Local1)
                Store (SCDP, Local2)
                Store (Local2, P80H)
                Store (Zero, Local0)
                While (LLess (Local0, SizeOf (SACT)))
                {
                    Store (DerefOf (Index (SACT, Local0)), Local3)
                    If (LEqual (Local3, Local1))
                    {
                        Store (Local0, CIDX)
                        Store (SizeOf (SACT), Local0)
                    }
                    Else
                    {
                        Increment (Local0)
                    }
                }

                Store (CIDX, Local0)
                While (LLess (Local0, SizeOf (SACT)))
                {
                    Increment (Local0)
                    If (LEqual (Local0, SizeOf (SACT)))
                    {
                        Store (Zero, Local0)
                    }

                    Store (DerefOf (Index (SACT, Local0)), Local3)
                    If (LEqual (And (Local3, Local2), Local3))
                    {
                        Store (Local0, NXTD)
                        Store (SizeOf (SACT), Local0)
                    }
                }

                If (LEqual (NXTD, SizeOf (SACT)))
                {
                    Store (Zero, SSDP)
                }
                Else
                {
                    Store (NXTD, Local0)
                    Store (DerefOf (Index (SACT, Local0)), Local3)
                    And (SSDP, 0xFFFFFFFFFFFFFF74, SSDP)
                    Or (SSDP, Local3, SSDP)
                }

                Store (0x04, SSZE)
                Store (SSDP, P80H)
                Return (ATIB)
            }

            Method (AFN0, 0, Serialized)
            {
                If (And (MSKN, One))
                {
                    CreateBitField (PSBR, Zero, PDSW)
                    Store (One, PDSW)
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN3, 2, Serialized)
            {
                If (And (MSKN, 0x08))
                {
                    Store (Arg0, Local0)
                    Store (Local0, SFPI)
                    Store (Arg1, Local0)
                    Store (And (Local0, 0x03, Local0), SFPG)
                    CreateBitField (PSBR, 0x03, PFPS)
                    Store (One, PFPS)
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN4, 1, Serialized)
            {
                If (And (MSKN, 0x10))
                {
                    Store (Arg0, Local0)
                    Store (SSPS, Local1)
                    Store (Local0, SSPS)
                    If (LEqual (Local0, Local1)) {}
                    Else
                    {
                        CreateBitField (PSBR, 0x04, PSPS)
                        Store (One, PSPS)
                        Notify (VGA, NCOD)
                    }
                }
            }

            Method (AFN5, 0, Serialized)
            {
                If (And (MSKN, 0x20))
                {
                    CreateBitField (PSBR, 0x05, PDCC)
                    Store (One, PDCC)
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN6, 0, Serialized)
            {
                If (And (MSKN, 0x40))
                {
                    CreateBitField (PSBR, 0x06, PXPS)
                    Store (One, PXPS)
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN7, 1, Serialized)
            {
                If (And (MSKN, 0x80))
                {
                    CreateBitField (PSBR, 0x07, PBRT)
                    Store (One, PBRT)
                    CreateByteField (ATIB, 0x0C, BRTL)
                    Store (Arg0, BRTL)
                    Notify (VGA, NCOD)
                }
            }

            Name (AT00, Buffer (0xFF) {})
            Name (AT01, Buffer (0x03) {})
            Method (ATCS, 2, Serialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    ATC0 ()
                }

                If (LEqual (Arg0, One))
                {
                    ATC1 ()
                }

                If (LEqual (Arg0, 0x02))
                {
                    ATC2 (Arg1)
                }

                If (LEqual (Arg0, 0x03))
                {
                    ATC3 ()
                }

                If (LEqual (Arg0, 0x04))
                {
                    ATC4 (Arg1)
                }

                Return (AT00)
            }

            Method (ATC0, 0, NotSerialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateWordField (AT00, 0x02, INTF)
                CreateDWordField (AT00, 0x04, SUPP)
                Store (0x08, SZZE)
                Store (One, INTF)
                Store (0x0F, SUPP)
            }

            Method (ATC1, 0, Serialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateDWordField (AT00, 0x02, VFMK)
                CreateDWordField (AT00, 0x06, FLAG)
                CreateField (AT00, 0x30, One, DOCK)
                Store (0x0A, SZZE)
                Store (One, VFMK)
                Store (Zero, FLAG)
                Store (One, DOCK)
            }

            Method (ATC2, 1, Serialized)
            {
                CreateField (Arg0, 0x10, 0x03, FUCC)
                CreateField (Arg0, 0x13, 0x06, DEVV)
                CreateByteField (Arg0, 0x03, BUSS)
                CreateDWordField (Arg0, 0x04, VFMK)
                CreateDWordField (Arg0, 0x06, FLAG)
                CreateField (Arg0, 0x30, One, ADVC)
                CreateField (Arg0, 0x31, One, WFCM)
                CreateByteField (Arg0, 0x08, RQST)
                CreateByteField (Arg0, 0x09, PFRQ)
                CreateWordField (AT00, Zero, SZZE)
                CreateByteField (AT00, 0x02, RETV)
                Store (0x03, SZZE)
                Store (One, RETV)
                Store (ALIB (0x02, Arg0), AT00)
            }

            Method (ATC3, 0, Serialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateByteField (AT00, 0x02, RETV)
                CreateWordField (AT01, Zero, SZZB)
                CreateByteField (AT01, 0x02, PSPP)
                Store (0x03, SZZE)
                Store (One, RETV)
                Store (0x03, SZZB)
                Store (One, PSPP)
                Store (ALIB (0x03, AT01), AT00)
            }

            Method (ATC4, 1, Serialized)
            {
                CreateField (Arg0, 0x10, 0x03, FUCC)
                CreateField (Arg0, 0x13, 0x06, DEVV)
                CreateByteField (Arg0, 0x03, BUSS)
                CreateByteField (Arg0, 0x04, NULN)
                CreateWordField (AT00, Zero, SZZE)
                CreateByteField (AT00, 0x02, NULM)
                Store (0x03, SZZE)
                Store (One, NULM)
                Store (ALIB (0x04, Arg0), AT00)
            }
        }

        Name (ATPB, Buffer (0x0100) {})
        Name (DSID, 0xFFFFFFFF)
        Name (CNT0, Buffer (0x05)
        {
             0x05, 0x00, 0x00, 0x10, 0x01
        })
        Name (CNT1, Buffer (0x05)
        {
             0x05, 0x01, 0x00, 0x00, 0x01
        })
        Name (CNT2, Buffer (0x05)
        {
             0x07, 0x03, 0x00, 0x10, 0x02
        })
        Name (CNT3, Buffer (0x05)
        {
             0x07, 0x07, 0x00, 0x20, 0x02
        })
        Name (CNT4, Buffer (0x05)
        {
             0x00, 0x09, 0x00, 0x30, 0x02
        })
        Name (CNT5, Buffer (0x05)
        {
             0x01, 0x00, 0x01, 0x10, 0x01
        })
        Name (CNT6, Buffer (0x05)
        {
             0x01, 0x01, 0x01, 0x00, 0x01
        })
        Name (CNT7, Buffer (0x05)
        {
             0x03, 0x03, 0x01, 0x10, 0x02
        })
        Name (CNT8, Buffer (0x05)
        {
             0x03, 0x07, 0x01, 0x20, 0x02
        })
        Name (CNT9, Buffer (0x05)
        {
             0x00, 0x09, 0x01, 0x30, 0x02
        })
        OperationRegion (REVD, SystemMemory, 0x8D79111D, 0x00010004)
        Field (REVD, AnyAcc, NoLock, Preserve)
        {
            SROM,   32, 
            VROM,   524288
        }

        Name (TVGA, Buffer (0xFA00)
        {
             0x00
        })
        Method (ATRM, 2, Serialized)
        {
            Add (Arg0, Arg1, Local0)
            If (LLessEqual (Local0, SROM))
            {
                Multiply (Arg1, 0x08, Local1)
                Multiply (Arg0, 0x08, Local2)
                Store (VROM, TVGA)
                CreateField (TVGA, Local2, Local1, TEMP)
                Name (RETB, Buffer (Arg1) {})
                Store (TEMP, RETB)
                Return (RETB)
            }
            Else
            {
                If (LLess (Arg0, SROM))
                {
                    Subtract (SROM, Arg0, Local3)
                    Multiply (Local3, 0x08, Local1)
                    Multiply (Arg0, 0x08, Local2)
                    Store (VROM, TVGA)
                    CreateField (TVGA, Local2, Local1, TEM)
                    Name (RETC, Buffer (Local3) {})
                    Store (TEM, RETC)
                    Return (RETC)
                }
                Else
                {
                    Name (RETD, Buffer (One) {})
                    Return (RETD)
                }
            }
        }

        Method (ATPX, 2, Serialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (PX00 ())
            }

            If (LEqual (Arg0, One))
            {
                Return (PX01 ())
            }

            If (LEqual (Arg0, 0x02))
            {
                PX02 (DerefOf (Index (Arg1, 0x02)))
                Return (ATPB)
            }

            If (LEqual (Arg0, 0x03))
            {
                PX03 (DerefOf (Index (Arg1, 0x02)))
                Return (ATPB)
            }

            If (LEqual (Arg0, 0x04))
            {
                PX04 (DerefOf (Index (Arg1, 0x02)))
                Return (ATPB)
            }

            If (LEqual (Arg0, 0x08))
            {
                Return (PX08 ())
            }

            If (LEqual (Arg0, 0x09))
            {
                Return (PX09 ())
            }

            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, VERN)
            CreateDWordField (ATPB, 0x04, SFUN)
            Store (Zero, SSZE)
            Store (Zero, VERN)
            Store (Zero, SFUN)
            Return (ATPB)
        }

        Method (PX00, 0, NotSerialized)
        {
            Store (0xE0, P80H)
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, VERN)
            CreateDWordField (ATPB, 0x04, SFUN)
            Store (0x08, SSZE)
            Store (One, VERN)
            If (LEqual (PXEN, 0x80000000))
            {
                Store (Zero, SFUN)
                Return (ATPB)
            }

            If (LEqual (PXMX, 0x80000000))
            {
                Store (0x018F, SFUN)
            }
            Else
            {
                Store (0x03, SFUN)
            }

            Store (^^PCED.VGA.SVID, Local0)
            If (LNotEqual (Local0, 0xFFFFFFFF))
            {
                Store (Local0, DSID)
            }

            Return (ATPB)
        }

        Method (PX01, 0, NotSerialized)
        {
            Store (0xE1, P80H)
            CreateWordField (ATPB, Zero, SSZE)
            CreateDWordField (ATPB, 0x02, VMSK)
            CreateDWordField (ATPB, 0x06, FLGS)
            Store (0x0A, SSZE)
            Store (0x07FF, VMSK)
            If (LEqual (PXMX, 0x80000000))
            {
                Store (0x4B, FLGS)
            }
            Else
            {
                Store (Zero, FLGS)
                If (LEqual (PXDY, 0x80000001))
                {
                    Or (FLGS, 0x0680, FLGS)
                }

                If (LEqual (PXDY, 0x80000002))
                {
                    Or (FLGS, 0x0280, FLGS)
                }
            }

            Return (ATPB)
        }

        Method (PX02, 1, NotSerialized)
        {
            CreateWordField (ATPB, Zero, SSZE)
            CreateByteField (ATPB, 0x02, PWST)
            Store (0x03, SSZE)
            Store (Buffer (0x05) {}, Local7)
            CreateWordField (Local7, Zero, SZZE)
            CreateField (Local7, 0x10, 0x03, FUCC)
            CreateField (Local7, 0x13, 0x05, DEVV)
            CreateByteField (Local7, 0x03, BUSS)
            CreateByteField (Local7, 0x04, HPST)
            Store (0x05, SZZE)
            Store (Zero, BUSS)
            Store (Zero, FUCC)
            Store (Buffer (0x04) {}, Local6)
            CreateByteField (Local6, 0x02, HPOX)
            And (Arg0, One, PWST)
            Name (HPOK, Zero)
            If (PWST)
            {
                Store (0x11E2, P80H)
                Store (Zero, ^^PCED.PDC8)
                Store (Zero, ^^PCED.PDS8)
                Store (Zero, ^^PCED.HPC8)
                DPON ()
                Store (Zero, HPOK)
                Sleep (0x64)
                Sleep (0x64)
                Store (PXNO, DEVV)
                Store (One, HPST)
                Store (ALIB (0x06, Local7), Local6)
                Sleep (0x14)
                Store (Zero, Local2)
                While (LLess (Local2, 0x0F))
                {
                    Store (One, ^^PCED.PDC2)
                    Store (One, Local4)
                    Store (0xC8, Local5)
                    While (LAnd (Local4, Local5))
                    {
                        Store (^^PCED.XPRD (0xA5), Local0)
                        And (Local0, 0x7F, Local0)
                        If (LAnd (LGreaterEqual (Local0, 0x10), LNotEqual (Local0, 0x7F)))
                        {
                            Store (Zero, Local4)
                        }
                        Else
                        {
                            Sleep (0x05)
                            Decrement (Local5)
                        }
                    }

                    If (LNot (Local4))
                    {
                        Store (^^PCED.XPDL (), Local5)
                        If (Local5)
                        {
                            ^^PCED.XPRT ()
                            Sleep (0x05)
                            Increment (Local2)
                        }
                        Else
                        {
                            Store (Zero, Local0)
                            If (LEqual (^^PCED.XPR2 (), Ones))
                            {
                                Store (One, Local0)
                            }

                            If (Local0)
                            {
                                Store (One, HPOK)
                                Store (0x10, Local2)
                            }
                            Else
                            {
                                Store (Zero, HPOK)
                                Store (0x10, Local2)
                            }
                        }
                    }
                    Else
                    {
                        Store (0x10, Local2)
                    }
                }

                If (LNot (HPOK))
                {
                    Store (0x13E2, P80H)
                    Store (^^PCED.VGA.DVID, Local1)
                    Sleep (0x0A)
                    Store (One, Local4)
                    Store (0x05, Local5)
                    While (LAnd (Local4, Local5))
                    {
                        Store (^^PCED.XPRD (0xA5), Local0)
                        And (Local0, 0x7F, Local0)
                        If (LLessEqual (Local0, 0x04))
                        {
                            Store (Zero, Local4)
                        }
                        Else
                        {
                            Store (^^PCED.VGA.DVID, Local1)
                            Sleep (0x05)
                            Decrement (Local5)
                        }
                    }

                    Store (PXNO, DEVV)
                    Store (Zero, HPST)
                    ALIB (0x06, Local7)
                }

                Store (0x14E2, P80H)
            }
            Else
            {
                Store (0x02E2, P80H)
                DPOF ()
                Store (One, ^^PCED.PDC2)
                Store (^^PCED.VGA.DVID, Local1)
                Sleep (0x0A)
                Store (One, Local4)
                Store (0x05, Local5)
                While (LAnd (Local4, Local5))
                {
                    Store (^^PCED.XPRD (0xA5), Local0)
                    And (Local0, 0x7F, Local0)
                    If (LLessEqual (Local0, 0x04))
                    {
                        Store (Zero, Local4)
                    }
                    Else
                    {
                        Store (^^PCED.VGA.DVID, Local1)
                        Sleep (0x05)
                        Decrement (Local5)
                    }
                }

                Store (PXNO, DEVV)
                Store (Zero, HPST)
                ALIB (0x06, Local7)
                Store (0x02, HPOK)
                Store (0x04E2, P80H)
            }

            If (HPOK)
            {
                If (LAnd (LEqual (HPOK, One), LNotEqual (DSID, 0xFFFFFFFF)))
                {
                    Store (DSID, Local1)
                    Store (Local1, ^^PCED.VGA.SMID)
                    Sleep (0x0A)
                    Sleep (0x0A)
                }
            }
        }

        Method (PX03, 1, NotSerialized)
        {
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, DPSW)
            Store (0x04, SSZE)
            And (Arg0, One, DPSW)
        }

        Method (PX04, 1, NotSerialized)
        {
            Store (0xE4, P80H)
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, ICSW)
            Store (0x04, SSZE)
            And (Arg0, One, ICSW)
        }

        Method (PX08, 0, NotSerialized)
        {
            Store (0xE8, P80H)
            CreateWordField (ATPB, Zero, CNUM)
            CreateWordField (ATPB, 0x02, CSSZ)
            Store (0x0A, CNUM)
            Store (0x05, CSSZ)
            CreateField (ATPB, 0x20, 0x28, CTI0)
            Store (CNT0, CTI0)
            CreateField (ATPB, 0x48, 0x28, CTI1)
            Store (CNT1, CTI1)
            CreateField (ATPB, 0x70, 0x28, CTI2)
            CreateByteField (CNT2, Zero, FLG2)
            If (LEqual (LCDT, 0x80000001))
            {
                If (LEqual (DSCT, 0x80000001))
                {
                    Store (Zero, FLG2)
                }

                If (LEqual (DSCT, 0x80000002))
                {
                    Store (0x07, FLG2)
                }
            }

            Store (CNT2, CTI2)
            CreateField (ATPB, 0x98, 0x28, CTI3)
            CreateByteField (CNT3, Zero, FLG3)
            If (LEqual (LCDT, 0x80000000))
            {
                Store (0x07, FLG3)
            }

            If (LEqual (LCDT, 0x80000001))
            {
                Store (Zero, FLG3)
                If (LEqual (DSCT, 0x80000002))
                {
                    Store (Zero, FLG3)
                }
            }

            If (LEqual (LCDT, 0x80000002))
            {
                Store (Zero, FLG3)
                If (LEqual (DSCT, 0x80000002))
                {
                    Store (0x07, FLG3)
                }
            }

            Store (CNT3, CTI3)
            CreateField (ATPB, 0xC0, 0x28, CTI4)
            Store (CNT4, CTI4)
            CreateField (ATPB, 0xE8, 0x28, CTI5)
            Store (CNT5, CTI5)
            CreateField (ATPB, 0x0110, 0x28, CTI6)
            Store (CNT6, CTI6)
            CreateField (ATPB, 0x0138, 0x28, CTI7)
            CreateByteField (CNT7, Zero, FLG7)
            If (LEqual (LCDT, 0x80000001))
            {
                If (LEqual (DSCT, 0x80000001))
                {
                    Store (Zero, FLG7)
                }

                If (LEqual (DSCT, 0x80000002))
                {
                    Store (Zero, FLG7)
                }
            }

            Store (CNT7, CTI7)
            CreateField (ATPB, 0x0160, 0x28, CTI8)
            CreateByteField (CNT8, Zero, FLG8)
            If (LEqual (LCDT, 0x80000000))
            {
                Store (0x07, FLG8)
            }

            If (LEqual (LCDT, 0x80000001))
            {
                Store (Zero, FLG8)
            }

            If (LEqual (LCDT, 0x80000002))
            {
                Store (Zero, FLG8)
            }

            If (LEqual (DSCT, 0x80000002))
            {
                Store (0x07, FLG8)
            }

            Store (CNT8, CTI8)
            CreateField (ATPB, 0x0188, 0x28, CTI9)
            CreateByteField (CNT9, Zero, FLG9)
            If (LEqual (DSCT, 0x80000002))
            {
                Store (0x07, FLG9)
            }

            Store (CNT9, CTI9)
            Return (ATPB)
        }

        Method (PX09, 0, NotSerialized)
        {
            Store (0xE9, P80H)
            CreateWordField (ATPB, Zero, CNUM)
            CreateWordField (ATPB, 0x02, CSSZ)
            Store (Zero, CNUM)
            Store (Zero, CSSZ)
            CreateByteField (ATPB, 0x04, ATI0)
            CreateByteField (ATPB, 0x05, HPD0)
            CreateByteField (ATPB, 0x06, DDC0)
            Store (Zero, ATI0)
            Store (Zero, HPD0)
            Store (Zero, DDC0)
            CreateByteField (ATPB, 0x07, ATI1)
            CreateByteField (ATPB, 0x08, HPD1)
            CreateByteField (ATPB, 0x09, DDC1)
            Store (Zero, ATI1)
            Store (Zero, HPD1)
            Store (Zero, DDC1)
            Return (ATPB)
        }
    }

    Field (ERMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x1BE), 
            ,   5, 
        GBFE,   1, 
        GBFO,   1, 
        GBFI,   1, 
            ,   5, 
        GC0E,   1, 
        GC0O,   1, 
        GC0I,   1, 
        Offset (0xD32), 
        G33M,   8
    }

    Method (DPON, 0, NotSerialized)
    {
        Store (Zero, GBFO)
        Store (Zero, GBFE)
        Store (Zero, GC0O)
        Store (Zero, GC0E)
        Sleep (0x0A)
        Store (One, GC0O)
        Store (Zero, GC0E)
        Sleep (0x0A)
        Store (One, G37O)
        Store (Zero, G37E)
        Sleep (0x0A)
        Store (0x02, G33M)
        While (LEqual (G33I, Zero)) {}
        Store (One, \_SB.PCI0.SBRG.EC.DGEN)
        Sleep (0x64)
        Store (One, GBFO)
        Store (Zero, GBFE)
        Store (0x12E2, P80H)
    }

    Method (DPOF, 0, NotSerialized)
    {
        Store (Zero, \_SB.PCI0.SBRG.EC.DGEN)
        Store (Zero, GBFO)
        Store (Zero, GBFE)
        Store (Zero, G37O)
        Store (Zero, G37E)
        Sleep (0x0A)
        Store (Zero, GC0O)
        Store (Zero, GC0E)
        Store (0x03E2, P80H)
    }

    Scope (_PR)
    {
        OperationRegion (SSDT, SystemMemory, 0xFFFF0000, 0xFFFF)
        Name (DCOR, 0x02)
        Name (TBLD, 0x04)
        Name (NPSS, 0x05)
        Name (HNDL, 0x80000000)
        Name (APSS, Package (0x0A)
        {
            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }
        })
        Processor (P000, 0x01, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                Store (DAT0, TYPE)
                If (LAnd (LEqual (TBLD, Zero), LNotEqual (NPSS, Zero)))
                {
                    If (LOr (LEqual (And (TYPE, 0x1B), 0x1B), LEqual (DCOR, 
                        Zero)))
                    {
                        Store (One, TBLD)
                        Load (SSDT, HNDL)
                    }
                }
            }
        }

        Processor (P001, 0x02, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                Store (DAT0, TYPE)
                If (LAnd (LEqual (TBLD, Zero), LNotEqual (NPSS, Zero)))
                {
                    If (LOr (LEqual (And (TYPE, 0x1B), 0x1B), LEqual (DCOR, 
                        Zero)))
                    {
                        Store (One, TBLD)
                        Load (SSDT, HNDL)
                    }
                }
            }
        }

        Processor (P002, 0x03, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                Store (DAT0, TYPE)
                If (LAnd (LEqual (TBLD, Zero), LNotEqual (NPSS, Zero)))
                {
                    If (LOr (LEqual (And (TYPE, 0x1B), 0x1B), LEqual (DCOR, 
                        Zero)))
                    {
                        Store (One, TBLD)
                        Load (SSDT, HNDL)
                    }
                }
            }
        }

        Processor (P003, 0x04, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                Store (DAT0, TYPE)
                If (LAnd (LEqual (TBLD, Zero), LNotEqual (NPSS, Zero)))
                {
                    If (LOr (LEqual (And (TYPE, 0x1B), 0x1B), LEqual (DCOR, 
                        Zero)))
                    {
                        Store (One, TBLD)
                        Load (SSDT, HNDL)
                    }
                }
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Store (Arg0, DBG8)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x03, \_SB.PCI0.SBRG.EC.AUTO)
            Sleep (0x0190)
        }

        If (LAnd (LEqual (Arg0, 0x04), LEqual (OSFL (), 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        Store (Zero, Index (WAKP, Zero))
        Store (Zero, Index (WAKP, One))
        Store (ASSB, WSSB)
        Store (AOTB, WOTB)
        Store (AAXB, WAXB)
        Store (Arg0, ASSB)
        Store (OSFL (), AOTB)
        Store (Zero, AAXB)
        Store (One, \_SB.SLPS)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        ShiftLeft (Arg0, 0x04, DBG8)
        WAK (Arg0)
        If (ASSB)
        {
            Store (WSSB, ASSB)
            Store (WOTB, AOTB)
            Store (WAXB, AAXB)
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }

        Return (WAKP)
    }

    Device (OMSC)
    {
        Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
        Name (_UID, 0x0E11)  // _UID: Unique ID
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x04, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            SPTS (Arg0)
            \_SB.PCI0.NPTS (Arg0)
            \_SB.PCI0.SBRG.EC.MPTS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        SWAK (Arg0)
        \_SB.PCI0.NWAK (Arg0)
        \_SB.PCI0.SBRG.EC.MWAK (Arg0)
    }

    Method (_SB._OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
    {
        Return (Arg3)
    }
}

