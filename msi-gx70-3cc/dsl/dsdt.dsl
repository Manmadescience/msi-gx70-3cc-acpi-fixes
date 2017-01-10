/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161222-64
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat, Tue Jan 10 23:51:00 2017
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000089FE (35326)
 *     Revision         0x02
 *     Checksum         0x97
 *     OEM ID           "MSI_NB"
 *     OEM Table ID     "MEGABOOK"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161222 (538317346)
 */
DefinitionBlock ("", "DSDT", 2, "MSI_NB", "MEGABOOK", 0x00000000)
{
    External (_SB_.ALIB, MethodObj)    // 2 Arguments
    External (_SB_.APTS, MethodObj)    // 1 Arguments
    External (_SB_.AWAK, MethodObj)    // 1 Arguments
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
            DBG8 = 0xAA
        }
        Else
        {
            DBG8 = 0xAC
        }

        PICM = Arg0
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If ((OSVR != Ones))
        {
            Return (OSVR) /* \OSVR */
        }

        If ((PICM == Zero))
        {
            DBG8 = 0xAC
        }

        OSVR = 0x03
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Windows 2001"))
            {
                OSVR = 0x04
            }

            If (_OSI ("Windows 2001.1"))
            {
                OSVR = 0x05
            }

            If (_OSI ("FreeBSD"))
            {
                OSVR = 0x06
            }

            If (_OSI ("HP-UX"))
            {
                OSVR = 0x07
            }

            If (_OSI ("OpenVMS"))
            {
                OSVR = 0x08
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                OSVR = 0x09
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                OSVR = 0x0A
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                OSVR = 0x0B
            }

            If (_OSI ("Windows 2006"))
            {
                OSVR = 0x0C
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                OSVR = 0x0D
            }

            If (_OSI ("Windows 2009"))
            {
                OSVR = 0x0E
            }

            If (_OSI ("Windows 2012"))
            {
                OSVR = 0x0F
            }

            If (_OSI ("Windows 2013"))
            {
                OSVR = 0x10
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                OSVR = Zero
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                OSVR = One
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                OSVR = 0x02
            }

            If (MCTH (_OS, "Linux"))
            {
                OSVR = 0x03
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                OSVR = 0x06
            }

            If (MCTH (_OS, "HP-UX"))
            {
                OSVR = 0x07
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                OSVR = 0x08
            }
        }

        Return (OSVR) /* \OSVR */
    }

    Method (MCTH, 2, NotSerialized)
    {
        If ((SizeOf (Arg0) < SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = (SizeOf (Arg0) + One)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        BUF0 = Arg0
        BUF1 = Arg1
        While (Local0)
        {
            Local0--
            If ((DerefOf (BUF0 [Local0]) != DerefOf (BUF1 [Local0]
                )))
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
        PRWP [Zero] = Arg0
        Local0 = (SS1 << One)
        Local0 |= (SS2 << 0x02)
        Local0 |= (SS3 << 0x03)
        Local0 |= (SS4 << 0x04)
        If (((One << Arg1) & Local0))
        {
            PRWP [One] = Arg1
        }
        Else
        {
            Local0 >>= One
            If (((OSFL () == One) || (OSFL () == 0x02)))
            {
                FindSetLeftBit (Local0, PRWP [One])
            }
            Else
            {
                FindSetRightBit (Local0, PRWP [One])
            }
        }

        Return (PRWP) /* \PRWP */
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
    Name (TOPM, Zero)
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
        INAB = Arg0
        Return (DAAB) /* \DAAB */
    }

    Method (WTAB, 2, NotSerialized)
    {
        INAB = Arg0
        DAAB = Arg1
    }

    Method (RWAB, 3, NotSerialized)
    {
        Local0 = (RDAB (Arg0) & Arg1)
        Local1 = (Local0 | Arg2)
        WTAB (Arg0, Local1)
    }

    Method (CABR, 3, NotSerialized)
    {
        Local0 = (Arg0 << 0x05)
        Local1 = (Local0 + Arg1)
        Local2 = (Local1 << 0x18)
        Local3 = (Local2 + Arg2)
        Return (Local3)
    }

    Method (GHPS, 2, NotSerialized)
    {
        If ((Arg0 == Zero))
        {
            RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFBFFF, Zero)
            RWAB (CABR (One, Zero, 0x65), 0xFFFFFBFB, Zero)
            Stall (0xC8)
        }

        If ((Arg0 == One))
        {
            RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFBFFF, 0x4000)
            RWAB (CABR (One, Zero, 0x65), 0xFFFFFBFB, 0x0404)
            Stall (0xC8)
        }

        If (GGN2)
        {
            If ((Arg0 == Zero))
            {
                GEN2 ()
                Local0 = RDAB (CABR (0x03, 0x02, 0xA5))
                Local0 &= 0xFF
                Local1 = 0x01F4
                While (((Local1 > Zero) && (Local0 != 0x10)))
                {
                    Local0 = RDAB (CABR (0x03, 0x02, 0xA5))
                    Local0 &= 0xFF
                    Local1--
                    Stall (0xC8)
                    Stall (0xC8)
                }

                If ((Local0 != 0x10))
                {
                    GEN1 ()
                }
            }
        }
    }

    Method (GEN2, 0, NotSerialized)
    {
        TLS2 = 0x02
        RWAB (CABR (0x03, 0x02, 0xA4), 0xFFFFFFFE, One)
        RWAB (CABR (0x03, 0x02, 0xA2), 0xFFFFDFFF, 0x2000)
        RWAB (CABR (0x03, 0x02, 0xC0), 0xFFFF7FFF, 0x8000)
        RWAB (CABR (0x03, 0x02, 0xA4), 0xDFFFFFFF, 0x20000000)
        Stall (0xC8)
        Stall (0xC8)
    }

    Method (GEN1, 0, NotSerialized)
    {
        TLS2 = One
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
        PCMD = One
        P80 = Arg0
        If (IMCS)
        {
            IBSE ()
        }

        CPMS ()
        CPMS ()
        PEWS = One
    }

    Method (SWAK, 1, NotSerialized)
    {
        If (PICM)
        {
            \_SB.IRQC ()
        }

        CPMS ()
        CPMS ()
        PEWS = One
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
        If ((EPNM == Zero))
        {
            PMSA = One
            PMSB = One
            PMSC = One
            PMS0 = One
            PMS1 = One
            PMS2 = One
            PMS3 = One
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
        Local0 = Zero
        While ((Local0 != 0xFA))
        {
            Local0 = MRG0 /* \MRG0 */
            Sleep (0x0A)
        }
    }

    Method (IBSE, 0, NotSerialized)
    {
        MRG0 = Zero
        MRG1 = 0xB5
        MRG2 = Zero
        MSTI = 0x96
        WACK ()
        MRG0 = Zero
        MRG1 = Zero
        MRG2 = Zero
        MSTI = 0x80
        WACK ()
        Local0 = MRG2 /* \MRG2 */
        Local0 &= 0xFE
        MRG0 = Zero
        MRG1 = Zero
        MRG2 = Local0
        MSTI = 0x81
        WACK ()
        MRG0 = Zero
        MRG1 = One
        MRG2 = Zero
        MSTI = 0x98
        WACK ()
        MRG0 = Zero
        MRG1 = 0xB4
        MRG2 = Zero
        MSTI = 0x96
        WACK ()
    }

    Method (IBWE, 0, NotSerialized)
    {
        MRG0 = Zero
        MRG1 = 0xB5
        MRG2 = Zero
        MSTI = 0x96
        WACK ()
        MRG0 = Zero
        MRG1 = Zero
        MRG2 = Zero
        MSTI = 0x80
        WACK ()
        Local0 = MRG2 /* \MRG2 */
        Local0 |= One
        MRG0 = Zero
        MRG1 = Zero
        MRG2 = Local0
        MSTI = 0x81
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
            Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
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
                    Return (AR00) /* \_SB_.AR00 */
                }

                Return (PR00) /* \_SB_.PR00 */
            }

            Name (CPRB, One)
            Name (LVGA, One)
            Name (STAV, 0x0F)
            Name (BRB, Zero)
            Name (BRL, 0x0100)
            Name (IOB, 0x1000)
            Name (IOL, 0xF000)
            Name (MBB, 0xC0000000)
            Name (MBL, 0x40000000)
            Name (MABL, Zero)
            Name (MABH, Zero)
            Name (MALL, Zero)
            Name (MALH, Zero)
            Name (MAML, Zero)
            Name (MAMH, Zero)
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
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x03E0,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0918,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y02, TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y01, TypeStatic, DenseTranslation)
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
                    0xFDE00000,         // Length
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
                    ,, _Y08, TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y07, TypeStatic, DenseTranslation)
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
                Return (STAV) /* \_SB_.PCI0.STAV */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MIN, MIN0)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MAX, MAX0)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._LEN, LEN0)  // _LEN: Length
                    MIN0 = BRB /* \_SB_.PCI0.BRB_ */
                    LEN0 = BRL /* \_SB_.PCI0.BRL_ */
                    Local0 = LEN0 /* \_SB_.PCI0._CRS.LEN0 */
                    MAX0 = (MIN0 + Local0--)
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MIN, MIN1)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MAX, MAX1)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._LEN, LEN1)  // _LEN: Length
                    If ((IOB == 0x1000))
                    {
                        Local0 = IOL /* \_SB_.PCI0.IOL_ */
                        MAX1 = (IOB + Local0--)
                        Local0 = (MAX1 - MIN1) /* \_SB_.PCI0._CRS.MIN1 */
                        LEN1 = (Local0 + One)
                    }
                    Else
                    {
                        MIN1 = IOB /* \_SB_.PCI0.IOB_ */
                        LEN1 = IOL /* \_SB_.PCI0.IOL_ */
                        Local0 = LEN1 /* \_SB_.PCI0._CRS.LEN1 */
                        MAX1 = (MIN1 + Local0--)
                    }

                    If (((LVGA == One) || (LVGA == 0x55)))
                    {
                        If (VGAF)
                        {
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MIN, IMN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MAX, IMX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._LEN, ILN1)  // _LEN: Length
                            IMN1 = 0x03B0
                            IMX1 = 0x03DF
                            ILN1 = 0x30
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MIN, VMN1)  // _MIN: Minimum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MAX, VMX1)  // _MAX: Maximum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._LEN, VLN1)  // _LEN: Length
                            VMN1 = 0x000A0000
                            VMX1 = 0x000BFFFF
                            VLN1 = 0x00020000
                            VGAF = Zero
                        }
                    }

                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MIN, MIN3)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MAX, MAX3)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._LEN, LEN3)  // _LEN: Length
                    MIN3 = MBB /* \_SB_.PCI0.MBB_ */
                    LEN3 = MBL /* \_SB_.PCI0.MBL_ */
                    Local0 = LEN3 /* \_SB_.PCI0._CRS.LEN3 */
                    MAX3 = (MIN3 + Local0--)
                    If ((MALH || MALL))
                    {
                        CreateQWordField (CRS1, \_SB.PCI0._Y05._MIN, MN8L)  // _MIN: Minimum Base Address
                        Local0 = 0xB8
                        CreateDWordField (CRS1, Local0, MN8H)
                        MN8L = MABL /* \_SB_.PCI0.MABL */
                        MN8H = MABH /* \_SB_.PCI0.MABH */
                        CreateQWordField (CRS1, \_SB.PCI0._Y05._MAX, MX8L)  // _MAX: Maximum Base Address
                        Local1 = 0xC0
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateQWordField (CRS1, \_SB.PCI0._Y05._LEN, LN8L)  // _LEN: Length
                        Local2 = 0xD0
                        CreateDWordField (CRS1, Local2, LN8H)
                        MN8L = MABL /* \_SB_.PCI0.MABL */
                        MN8H = MABH /* \_SB_.PCI0.MABH */
                        LN8L = MALL /* \_SB_.PCI0.MALL */
                        LN8H = MALH /* \_SB_.PCI0.MALH */
                        MX8L = MAML /* \_SB_.PCI0.MAML */
                        MX8H = MAMH /* \_SB_.PCI0.MAMH */
                    }

                    Return (CRS1) /* \_SB_.PCI0.CRS1 */
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MIN, MIN2)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MAX, MAX2)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._LEN, LEN2)  // _LEN: Length
                    MIN2 = BRB /* \_SB_.PCI0.BRB_ */
                    LEN2 = BRL /* \_SB_.PCI0.BRL_ */
                    Local1 = LEN2 /* \_SB_.PCI0._CRS.LEN2 */
                    MAX2 = (MIN2 + Local1--)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MIN, MIN4)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MAX, MAX4)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._LEN, LEN4)  // _LEN: Length
                    MIN4 = IOB /* \_SB_.PCI0.IOB_ */
                    LEN4 = IOL /* \_SB_.PCI0.IOL_ */
                    Local1 = LEN4 /* \_SB_.PCI0._CRS.LEN4 */
                    MAX4 = (MIN4 + Local1--)
                    If (LVGA)
                    {
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MIN, IMN2)  // _MIN: Minimum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MAX, IMX2)  // _MAX: Maximum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._LEN, ILN2)  // _LEN: Length
                        IMN2 = 0x03B0
                        IMX2 = 0x03DF
                        ILN2 = 0x30
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MIN, VMN2)  // _MIN: Minimum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MAX, VMX2)  // _MAX: Maximum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._LEN, VLN2)  // _LEN: Length
                        VMN2 = 0x000A0000
                        VMX2 = 0x000BFFFF
                        VLN2 = 0x00020000
                    }

                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MIN, MIN5)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MAX, MAX5)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._LEN, LEN5)  // _LEN: Length
                    MIN5 = MBB /* \_SB_.PCI0.MBB_ */
                    LEN5 = MBL /* \_SB_.PCI0.MBL_ */
                    Local1 = LEN5 /* \_SB_.PCI0._CRS.LEN5 */
                    MAX5 = (MIN5 + Local1--)
                    If ((MALH || MALL))
                    {
                        CreateQWordField (CRS2, \_SB.PCI0._Y0B._MIN, MN9L)  // _MIN: Minimum Base Address
                        Local0 = 0x76
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateQWordField (CRS2, \_SB.PCI0._Y0B._MAX, MX9L)  // _MAX: Maximum Base Address
                        Local1 = 0x7E
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateQWordField (CRS2, \_SB.PCI0._Y0B._LEN, LN9L)  // _LEN: Length
                        Local2 = 0x8E
                        CreateDWordField (CRS2, Local2, LN9H)
                        MN9L = MABL /* \_SB_.PCI0.MABL */
                        MN9H = MABH /* \_SB_.PCI0.MABH */
                        LN9L = MALL /* \_SB_.PCI0.MALL */
                        LN9H = MALH /* \_SB_.PCI0.MALH */
                        MX9L = MAML /* \_SB_.PCI0.MAML */
                        MX9H = MAMH /* \_SB_.PCI0.MAMH */
                    }

                    Return (CRS2) /* \_SB_.PCI0.CRS2 */
                }
            }

            Scope (\_SB)
            {
                Scope (PCI0)
                {
                    Device (AMDN)
                    {
                        Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
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
                            PB = PEBS /* \PEBS */
                            PL = PEBL /* \PEBL */
                            Return (NPTR) /* \_SB_.PCI0.AMDN.NPTR */
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
                    Local0 = (Arg0 & 0x0F)
                    Local1 = (Arg0 >> 0x04)
                    Return ((0x1E * ((Local0 + One) + (Local1 + One)
                        )))
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
                        /* 0000 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  /* ........ */
                        /* 0008 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  /* ........ */
                        /* 0010 */  0x00, 0x00, 0x00, 0x00                           /* .... */
                    })
                    CreateDWordField (BUF, Zero, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If ((PICX & One))
                    {
                        Return (BUF) /* \_SB_.PCI0.IDEC.GTM_.BUF_ */
                    }

                    PIO0 = GETT (PIT0)
                    PIO1 = GETT (PIT1)
                    If ((UDCX & One))
                    {
                        FLAG |= One
                        DMA0 = DerefOf (UDMT [(UDMX & 0x0F)])
                    }
                    Else
                    {
                        DMA0 = GETT (MDT0)
                    }

                    If ((UDCX & 0x02))
                    {
                        FLAG |= 0x04
                        DMA1 = DerefOf (UDMT [(UDMX >> 0x04)])
                    }
                    Else
                    {
                        DMA1 = GETT (MDT1)
                    }

                    FLAG |= 0x1A
                    Return (BUF) /* \_SB_.PCI0.IDEC.GTM_.BUF_ */
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
                         0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00         /* ....... */
                    })
                    CreateByteField (BUF, Zero, PIT1)
                    CreateByteField (BUF, One, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Local0 = Match (PIOT, MLE, PIO0, MTR, Zero, Zero)
                    Local0 %= 0x05
                    Local1 = Match (PIOT, MLE, PIO1, MTR, Zero, Zero)
                    Local1 %= 0x05
                    PIMX = ((Local1 << 0x04) | Local0)
                    PIT0 = DerefOf (PITR [Local0])
                    PIT1 = DerefOf (PITR [Local1])
                    If ((FLAG & One))
                    {
                        Local0 = Match (UDMT, MLE, DMA0, MTR, Zero, Zero)
                        Local0 %= 0x07
                        UDMX |= Local0
                        UDCX |= One
                    }
                    ElseIf ((DMA0 != 0xFFFFFFFF))
                    {
                        Local0 = Match (MDMT, MLE, DMA0, MTR, Zero, Zero)
                        MDT0 = DerefOf (MDTR [Local0])
                    }

                    If ((FLAG & 0x04))
                    {
                        Local0 = Match (UDMT, MLE, DMA1, MTR, Zero, Zero)
                        Local0 %= 0x07
                        UDMX |= (Local0 << 0x04)
                        UDCX |= 0x02
                    }
                    ElseIf ((DMA1 != 0xFFFFFFFF))
                    {
                        Local0 = Match (MDMT, MLE, DMA1, MTR, Zero, Zero)
                        MDT1 = DerefOf (MDTR [Local0])
                    }

                    Return (BUF) /* \_SB_.PCI0.IDEC.STM_.BUF_ */
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, Zero, MDT1)
                    CreateByteField (Arg1, One, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If ((Arg0 == 0xA0))
                    {
                        Local0 = (PIMX & 0x0F)
                        Local1 = MDT0 /* \_SB_.PCI0.IDEC.GTF_.MDT0 */
                        Local2 = (UDCX & One)
                        Local3 = (UDMX & 0x0F)
                    }
                    Else
                    {
                        Local0 = (PIMX >> 0x04)
                        Local1 = MDT1 /* \_SB_.PCI0.IDEC.GTF_.MDT1 */
                        Local2 = (UDCX & 0x02)
                        Local3 = (UDMX >> 0x04)
                    }

                    Name (BUF, Buffer (0x15)
                    {
                        /* 0000 */  0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03,  /* ........ */
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x00, 0x00,  /* ........ */
                        /* 0010 */  0x00, 0x00, 0x00, 0x00, 0xF5                     /* ..... */
                    })
                    CreateByteField (BUF, One, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    CreateByteField (BUF, 0x13, CMDC)
                    CMDA = Arg0
                    CMDB = Arg0
                    CMDC = Arg0
                    PMOD = (Local0 | 0x08)
                    If (Local2)
                    {
                        DMOD = (Local3 | 0x40)
                    }
                    Else
                    {
                        Local4 = Match (MDMT, MLE, GETT (Local1), MTR, Zero, Zero)
                        If ((Local4 < 0x03))
                        {
                            DMOD = (0x20 | Local4)
                        }
                    }

                    Return (BUF) /* \_SB_.PCI0.IDEC.GTF_.BUF_ */
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00         /* ....... */
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        VPIT = PPIT /* \_SB_.PCI0.IDEC.PPIT */
                        VMDT = PMDT /* \_SB_.PCI0.IDEC.PMDT */
                        VPIC = PPIC /* \_SB_.PCI0.IDEC.PPIC */
                        VUDC = PUDC /* \_SB_.PCI0.IDEC.PUDC */
                        VUDM = PUDM /* \_SB_.PCI0.IDEC.PUDM */
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00         /* ....... */
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        BUF = STM (Arg0, Arg1, Arg2)
                        PPIT = VPIT /* \_SB_.PCI0.IDEC.PRID._STM.VPIT */
                        PMDT = VMDT /* \_SB_.PCI0.IDEC.PRID._STM.VMDT */
                        PPIM = VPIM /* \_SB_.PCI0.IDEC.PRID._STM.VPIM */
                        PUDC = VUDC /* \_SB_.PCI0.IDEC.PRID._STM.VUDC */
                        PUDM = VUDM /* \_SB_.PCI0.IDEC.PRID._STM.VUDM */
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00                     /* ..... */
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            VMDT = PMDT /* \_SB_.PCI0.IDEC.PMDT */
                            VPIM = PPIM /* \_SB_.PCI0.IDEC.PPIM */
                            VUDC = PUDC /* \_SB_.PCI0.IDEC.PUDC */
                            VUDM = PUDM /* \_SB_.PCI0.IDEC.PUDM */
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
                                 0x00, 0x00, 0x00, 0x00, 0x00                     /* ..... */
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            VMDT = PMDT /* \_SB_.PCI0.IDEC.PMDT */
                            VPIM = PPIM /* \_SB_.PCI0.IDEC.PPIM */
                            VUDC = PUDC /* \_SB_.PCI0.IDEC.PUDC */
                            VUDM = PUDM /* \_SB_.PCI0.IDEC.PUDM */
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
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00         /* ....... */
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        VPIT = SPIT /* \_SB_.PCI0.IDEC.SPIT */
                        VMDT = SMDT /* \_SB_.PCI0.IDEC.SMDT */
                        VPIC = SPIC /* \_SB_.PCI0.IDEC.SPIC */
                        VUDC = SUDC /* \_SB_.PCI0.IDEC.SUDC */
                        VUDM = SUDM /* \_SB_.PCI0.IDEC.SUDM */
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00         /* ....... */
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        BUF = STM (Arg0, Arg1, Arg2)
                        SPIT = VPIT /* \_SB_.PCI0.IDEC.SECD._STM.VPIT */
                        SMDT = VMDT /* \_SB_.PCI0.IDEC.SECD._STM.VMDT */
                        SPIM = VPIM /* \_SB_.PCI0.IDEC.SECD._STM.VPIM */
                        SUDC = VUDC /* \_SB_.PCI0.IDEC.SECD._STM.VUDC */
                        SUDM = VUDM /* \_SB_.PCI0.IDEC.SECD._STM.VUDM */
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00                     /* ..... */
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            VMDT = SMDT /* \_SB_.PCI0.IDEC.SMDT */
                            VPIM = SPIM /* \_SB_.PCI0.IDEC.SPIM */
                            VUDC = SUDC /* \_SB_.PCI0.IDEC.SUDC */
                            VUDM = SUDM /* \_SB_.PCI0.IDEC.SUDM */
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
                                 0x00, 0x00, 0x00, 0x00, 0x00                     /* ..... */
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            VMDT = SMDT /* \_SB_.PCI0.IDEC.SMDT */
                            VPIM = SPIM /* \_SB_.PCI0.IDEC.SPIM */
                            VUDC = SUDC /* \_SB_.PCI0.IDEC.SUDC */
                            VUDM = SUDM /* \_SB_.PCI0.IDEC.SUDM */
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
                            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
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
                                PBB = PMBS /* \PMBS */
                                PBH = PMBS /* \PMBS */
                                PML = PMLN /* \PMLN */
                                If (SMBB)
                                {
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y0E._MIN, SMB1)  // _MIN: Minimum Base Address
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y0E._MAX, SMH1)  // _MAX: Maximum Base Address
                                    CreateByteField (CRS, \_SB.PCI0.S900._Y0E._LEN, SML1)  // _LEN: Length
                                    SMB1 = SMBB /* \SMBB */
                                    SMH1 = SMBB /* \SMBB */
                                    SML1 = SMBL /* \SMBL */
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y0F._MIN, SMB0)  // _MIN: Minimum Base Address
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y0F._MAX, SMH0)  // _MAX: Maximum Base Address
                                    CreateByteField (CRS, \_SB.PCI0.S900._Y0F._LEN, SML0)  // _LEN: Length
                                    Local1 = SMB0 /* \_SB_.PCI0.S900._CRS.SMB0 */
                                    SMB0 = Local1
                                    SMH0 = SMB0 /* \_SB_.PCI0.S900._CRS.SMB0 */
                                    SML0 = SMBM /* \SMBM */
                                }

                                If (GPBS)
                                {
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y10._MIN, IGB)  // _MIN: Minimum Base Address
                                    CreateWordField (CRS, \_SB.PCI0.S900._Y10._MAX, IGH)  // _MAX: Maximum Base Address
                                    CreateByteField (CRS, \_SB.PCI0.S900._Y10._LEN, IGL)  // _LEN: Length
                                    IGB = GPBS /* \GPBS */
                                    IGH = GPBS /* \GPBS */
                                    IGL = GPLN /* \GPLN */
                                }

                                If (APCB)
                                {
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y11._BAS, APB)  // _BAS: Base Address
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y11._LEN, APL)  // _LEN: Length
                                    APB = APCB /* \APCB */
                                    APL = APCL /* \APCL */
                                }

                                If (SPIB)
                                {
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y12._BAS, SPIB)  // _BAS: Base Address
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y12._LEN, SPIL)  // _LEN: Length
                                    SPIB = \SPIB
                                    SPIL = \SPIL
                                }

                                If (HPTB)
                                {
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y13._BAS, HXTB)  // _BAS: Base Address
                                    CreateDWordField (CRS, \_SB.PCI0.S900._Y13._LEN, HXTL)  // _LEN: Length
                                    HXTB = HPTB /* \HPTB */
                                    HXTL = HPTL /* \HPTL */
                                }

                                CreateDWordField (CRS, \_SB.PCI0.S900._Y14._BAS, ROMB)  // _BAS: Base Address
                                CreateDWordField (CRS, \_SB.PCI0.S900._Y14._LEN, ROML)  // _LEN: Length
                                If (^^SBRG.LR2S)
                                {
                                    ROMB = (^^SBRG.LR2S << 0x10)
                                    ROML = (((^^SBRG.LR2E - ^^SBRG.LR2S) + One) << 0x10)
                                }
                                Else
                                {
                                    ROMB = ROMS /* \ROMS */
                                    ROML = (Zero - ROMS) /* \ROMS */
                                }

                                Return (CRS) /* \_SB_.PCI0.S900.CRS_ */
                            }
                        }
                    }
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
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
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
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
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
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
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
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
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
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
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x99)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (CRS) /* \_SB_.PCI0.SBRG.NBRM.CRS_ */
                    }
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
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
                        If ((MBEC & 0xFFFF))
                        {
                            Return (CRS1) /* \_SB_.PCI0.SBRG.RMSC.CRS1 */
                        }
                        Else
                        {
                            Return (CRS2) /* \_SB_.PCI0.SBRG.RMSC.CRS2 */
                        }
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
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
                        Return (HIDK) /* \HIDK */
                    }

                    Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
                    {
                        Return (CIDK) /* \CIDK */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((IOST & 0x0400))
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
                        KBFG = Arg0
                    }
                }

                Scope (\)
                {
                    Name (KBFG, One)
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("ETD0300"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((IOST & 0x4000))
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
                        If ((IOST & 0x0400))
                        {
                            Return (CRS1) /* \_SB_.PCI0.SBRG.PS2M.CRS1 */
                        }
                        Else
                        {
                            Return (CRS2) /* \_SB_.PCI0.SBRG.PS2M.CRS2 */
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
                        MSFG = Arg0
                    }
                }

                Scope (\)
                {
                    Name (MSFG, One)
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
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
                            OSTP = 0x05
                            Return (Zero)
                        }

                        If (_OSI ("Windows 2012"))
                        {
                            OSTP = 0x04
                        }
                        ElseIf (_OSI ("Windows 2009"))
                        {
                            OSTP = 0x03
                        }
                        ElseIf (_OSI ("Windows 2006"))
                        {
                            OSTP = 0x02
                        }
                        ElseIf (_OSI ("Windows 2001"))
                        {
                            OSTP = One
                        }

                        Return (Zero)
                    }

                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If ((F1RD == Zero))
                        {
                            EOSV ()
                            F1RD = One
                        }

                        If ((Arg0 == 0x03))
                        {
                            MYEC = Arg1
                        }

                        CTSD = Zero
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
                            If ((OSFL () >= 0x0F))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (_HID, "KB9X0001")  // _HID: Hardware ID
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
                        Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
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
                        Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
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
                                DBG8 = 0x99
                                Sleep (0x03E8)
                            }

                            Return (BIF0) /* \_SB_.PCI0.SBRG.EC__.BIF0 */
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

                            Return (STAT) /* \_SB_.PCI0.SBRG.EC__.STAT */
                        }

                        Method (IVBI, 0, NotSerialized)
                        {
                            BIF0 [One] = 0xFFFFFFFF
                            BIF0 [0x02] = 0xFFFFFFFF
                            BIF0 [0x04] = 0xFFFFFFFF
                            BIF0 [0x09] = "Wrong"
                            BIF0 [0x0A] = " "
                            BIF0 [0x0B] = "Wrong"
                            BIF0 [0x0C] = "Wrong"
                        }

                        Method (IVBS, 0, NotSerialized)
                        {
                            STAT [Zero] = Zero
                            STAT [One] = 0xFFFFFFFF
                            STAT [0x02] = 0xFFFFFFFF
                            STAT [0x03] = 0x2710
                        }

                        Method (UPBI, 0, NotSerialized)
                        {
                            Local0 = Zero
                            Local1 = Zero
                            Local2 = Zero
                            Local3 = Zero
                            Local3 &= Ones
                            Local0 = MDCH /* \_SB_.PCI0.SBRG.EC__.MDCH */
                            Local1 = MDCL /* \_SB_.PCI0.SBRG.EC__.MDCL */
                            Local0 <<= 0x08
                            Local0 |= Local1
                            BIF0 [One] = Local0
                            Local0 = MFCH /* \_SB_.PCI0.SBRG.EC__.MFCH */
                            Local1 = MFCL /* \_SB_.PCI0.SBRG.EC__.MFCL */
                            Local0 <<= 0x08
                            Local1 |= Local0
                            BIF0 [0x02] = Local1
                            Local0 = MDVH /* \_SB_.PCI0.SBRG.EC__.MDVH */
                            Local2 = MDVL /* \_SB_.PCI0.SBRG.EC__.MDVL */
                            Local0 <<= 0x08
                            Local2 |= Local0
                            BIF0 [0x04] = Local2
                            BIF0 [0x0A] = "\n"
                            BIF0 [0x0B] = "LION\n"
                            Local0 = CTID /* \_SB_.PCI0.SBRG.EC__.CTID */
                            If ((Local0 == Zero))
                            {
                                BIF0 [0x09] = "MS-145B\n"
                                BIF0 [0x0C] = "MSI Corp.\n"
                            }
                            Else
                            {
                                BIF0 [0x09] = "?MODEL\n"
                                BIF0 [0x0C] = "?CUSTOMER\n"
                            }
                        }

                        Method (UPBS, 0, NotSerialized)
                        {
                            Local0 = Zero
                            Local1 = Zero
                            Local2 = Zero
                            Local3 = Zero
                            Local4 = Zero
                            Local7 = Zero
                            Local7 &= Ones
                            Local0 = MBTS /* \_SB_.PCI0.SBRG.EC__.MBTS */
                            If ((Local0 == One))
                            {
                                Local0 = POWS /* \_SB_.PCI0.SBRG.EC__.POWS */
                                If ((Local0 == One))
                                {
                                    Local1 = MBCS /* \_SB_.PCI0.SBRG.EC__.MBCS */
                                    If ((Local1 == One))
                                    {
                                        Local4 |= 0x02
                                    }
                                }
                                Else
                                {
                                    Local4 |= One
                                    Local0 = MBLS /* \_SB_.PCI0.SBRG.EC__.MBLS */
                                    If ((Local0 == One))
                                    {
                                        Local4 |= 0x04
                                    }
                                }

                                Local0 = POWS /* \_SB_.PCI0.SBRG.EC__.POWS */
                                If ((Local0 == One))
                                {
                                    Local0 = MBCS /* \_SB_.PCI0.SBRG.EC__.MBCS */
                                    If ((Local0 == One))
                                    {
                                        Local0 = MCUH /* \_SB_.PCI0.SBRG.EC__.MCUH */
                                        Local1 = MCUL /* \_SB_.PCI0.SBRG.EC__.MCUL */
                                        Local0 <<= 0x08
                                        Local1 |= Local0
                                        If ((Local1 == 0xFFFF))
                                        {
                                            Local1 = 0xFFFFFFFF
                                        }

                                        STAT [One] = Local1
                                    }
                                    Else
                                    {
                                        STAT [One] = Zero
                                    }
                                }
                                Else
                                {
                                    Local0 = MCUH /* \_SB_.PCI0.SBRG.EC__.MCUH */
                                    Local1 = MCUL /* \_SB_.PCI0.SBRG.EC__.MCUL */
                                    Local0 <<= 0x08
                                    Local1 |= Local0
                                    Local1 ^= 0xFFFF
                                    If ((Local1 == Zero))
                                    {
                                        Local1 = 0xFFFFFFFF
                                    }

                                    STAT [One] = Local1
                                }

                                Local0 = MRCH /* \_SB_.PCI0.SBRG.EC__.MRCH */
                                Local2 = MRCL /* \_SB_.PCI0.SBRG.EC__.MRCL */
                                Local0 <<= 0x08
                                Local2 |= Local0
                                STAT [0x02] = Local2
                                Local0 = MVOH /* \_SB_.PCI0.SBRG.EC__.MVOH */
                                Local3 = MVOL /* \_SB_.PCI0.SBRG.EC__.MVOL */
                                Local0 <<= 0x08
                                Local3 |= Local0
                                STAT [0x03] = Local3
                                STAT [Zero] = Local4
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
                        Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
                        Method (_LID, 0, NotSerialized)  // _LID: Lid Status
                        {
                            If (MYEC)
                            {
                                Local0 = LIDS /* \_SB_.PCI0.SBRG.EC__.LIDS */
                            }
                            Else
                            {
                                Local0 = One
                            }

                            Return (Local0)
                        }
                    }

                    Method (MPPC, 0, NotSerialized)
                    {
                        Local0 = THRF /* \_SB_.PCI0.SBRG.EC__.THRF */
                        If ((Local0 == One))
                        {
                            Return ((PCOU - One))
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_Q75, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x75
                        QID = 0x75
                    }

                    Method (_Q76, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x76
                        QID = 0x76
                    }

                    Method (_Q77, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x77
                        QID = 0x77
                    }

                    Method (_Q80, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x80
                        QID = 0x80
                    }

                    Method (_Q81, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x81
                        QID = 0x81
                        THRF = One
                        Notify (\_PR.P001, 0x80) // Performance Capability Change
                        Notify (\_PR.P002, 0x80) // Performance Capability Change
                    }

                    Method (_Q82, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x82
                        QID = 0x82
                        THRF = Zero
                        Notify (\_PR.P001, 0x80) // Performance Capability Change
                        Notify (\_PR.P002, 0x80) // Performance Capability Change
                    }

                    Method (_Q83, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x83
                        QID = 0x83
                        Notify (ADP1, 0x80) // Status Change
                    }

                    Method (_Q84, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x84
                        QID = 0x84
                        Notify (LID0, 0x80) // Status Change
                    }

                    Method (_Q85, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x85
                        QID = 0x85
                        CTSD = One
                        Notify (\_TZ.THRM, 0x80) // Thermal Status Change
                    }

                    Method (_Q86, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x86
                        QID = 0x86
                    }

                    Method (_Q87, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x87
                        QID = 0x87
                        Local0 = Zero
                        Local0 = MBTS /* \_SB_.PCI0.SBRG.EC__.MBTS */
                        If ((Local0 == One))
                        {
                            Notify (BAT1, 0x81) // Information Change
                        }
                        Else
                        {
                            Notify (BAT1, 0x81) // Information Change
                        }

                        Notify (ADP1, 0x80) // Status Change
                    }

                    Method (_Q88, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x88
                        QID = 0x88
                    }

                    Method (_Q89, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x89
                        QID = 0x89
                    }

                    Method (_Q8A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x8A
                        QID = 0x8A
                        CTSD = One
                        Notify (\_TZ.THRM, 0x80) // Thermal Status Change
                    }

                    Method (_Q8B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x8B
                        QID = 0x8B
                    }

                    Method (_Q8C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x8C
                        QID = 0x8C
                    }

                    Method (_Q90, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x90
                        QID = 0x90
                    }

                    Method (_Q92, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0x92
                        QID = 0x92
                    }

                    Method (_QB4, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0xB4
                        QID = 0xB4
                        ^^^VGA.AFN0 ()
                    }

                    Method (_QB5, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0xB5
                        QID = 0xB5
                    }

                    Method (_QB6, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0xB6
                        QID = 0xB6
                    }

                    Method (_QB7, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0xB7
                        QID = 0xB7
                        Notify (^^^VGA.LCD, 0x87) // Device-Specific
                    }

                    Method (_QB8, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0xB8
                        QID = 0xB8
                        Notify (^^^VGA.LCD, 0x86) // Device-Specific
                    }

                    Method (_QB9, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        DBG8 = 0xB9
                        QID = 0xB9
                    }

                    Method (_QC0, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        ^SCM0.TDED = 0xC0
                        DBG8 = 0xC0
                        Notify (SCM0, 0xC0) // Hardware-Specific
                    }

                    Device (SCM0)
                    {
                        Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
                        Name (_UID, Zero)  // _UID: Unique ID
                        Name (TDVR, 0x14)
                        Name (_WDG, Buffer (0xC8)
                        {
                            /* 0000 */  0x6A, 0x8D, 0x41, 0x24, 0x79, 0x0A, 0x4C, 0x52,  /* j.A$y.LR */
                            /* 0008 */  0x9A, 0xB1, 0x18, 0xB7, 0x8C, 0xA6, 0x8C, 0xE7,  /* ........ */
                            /* 0010 */  0x41, 0x41, 0x22, 0x01, 0x6B, 0xD5, 0xFB, 0x4A,  /* AA".k..J */
                            /* 0018 */  0x91, 0x9F, 0x49, 0x8F, 0x81, 0xF5, 0x99, 0x5B,  /* ..I....[ */
                            /* 0020 */  0xA7, 0x38, 0x22, 0xAF, 0x41, 0x42, 0x04, 0x01,  /* .8".AB.. */
                            /* 0028 */  0x6C, 0xBA, 0x3C, 0x2D, 0x9C, 0x1C, 0x41, 0x7F,  /* l.<-..A. */
                            /* 0030 */  0xB5, 0x4C, 0xF5, 0xD5, 0xD5, 0x80, 0xD4, 0x82,  /* .L...... */
                            /* 0038 */  0x41, 0x43, 0x03, 0x01, 0x6D, 0x02, 0xBA, 0x40,  /* AC..m..@ */
                            /* 0040 */  0x5D, 0x07, 0x4A, 0xCD, 0x97, 0x10, 0xF7, 0xC5,  /* ].J..... */
                            /* 0048 */  0x73, 0x47, 0xCA, 0xC9, 0x41, 0x44, 0x10, 0x01,  /* sG..AD.. */
                            /* 0050 */  0x6E, 0xCF, 0xBC, 0x8D, 0xB4, 0x9D, 0x46, 0x0E,  /* n.....F. */
                            /* 0058 */  0xA3, 0xF2, 0x99, 0xAF, 0xAA, 0xA7, 0x7A, 0x7A,  /* ......zz */
                            /* 0060 */  0x41, 0x45, 0x0E, 0x01, 0x6F, 0x21, 0x2A, 0xBD,  /* AE..o!*. */
                            /* 0068 */  0xB9, 0x2F, 0x40, 0xA6, 0xB8, 0x07, 0xDD, 0xDB,  /* ./@..... */
                            /* 0070 */  0xAD, 0x65, 0x68, 0x91, 0x41, 0x46, 0x13, 0x01,  /* .eh.AF.. */
                            /* 0078 */  0x7A, 0xEC, 0xC3, 0x1E, 0x9B, 0x1E, 0x4A, 0xE7,  /* z.....J. */
                            /* 0080 */  0x90, 0x26, 0xCF, 0x12, 0x2B, 0x0B, 0xBD, 0x21,  /* .&..+..! */
                            /* 0088 */  0x41, 0x47, 0x12, 0x01, 0x7B, 0x3D, 0x75, 0xA1,  /* AG..{=u. */
                            /* 0090 */  0x21, 0xB6, 0x4A, 0xDE, 0xB4, 0x1A, 0x55, 0x71,  /* !.J...Uq */
                            /* 0098 */  0x6A, 0x0E, 0xCE, 0x7A, 0x41, 0x48, 0x15, 0x01,  /* j..zAH.. */
                            /* 00A0 */  0x7C, 0x3D, 0x75, 0xA1, 0x21, 0xB6, 0x4A, 0xDE,  /* |=u.!.J. */
                            /* 00A8 */  0xB4, 0x1A, 0x55, 0x71, 0x6A, 0x0E, 0xCE, 0x7A,  /* ..Uqj..z */
                            /* 00B0 */  0x41, 0x49, 0x08, 0x01, 0x8A, 0xC3, 0x3C, 0x5B,  /* AI....<[ */
                            /* 00B8 */  0xD9, 0x40, 0x45, 0x72, 0x8A, 0xE6, 0x11, 0x45,  /* .@Er...E */
                            /* 00C0 */  0xB7, 0x51, 0xBE, 0x3F, 0xC0, 0x00, 0x01, 0x09   /* .Q.?.... */
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
                            If ((Arg0 == Zero))
                            {
                                Local0 = T2D0 /* \_SB_.PCI0.SBRG.EC__.SCM0.T2D0 */
                                Return (Local0)
                            }

                            If ((Arg0 == One))
                            {
                                Local0 = T2D1 /* \_SB_.PCI0.SBRG.EC__.SCM0.T2D1 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local0 = TDEE /* \_SB_.PCI0.SBRG.EC__.SCM0.TDEE */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x03))
                            {
                                Local0 = T2D5 /* \_SB_.PCI0.SBRG.EC__.SCM0.T2D5 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x04))
                            {
                                Local0 = TDE5 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE5 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x05))
                            {
                                Local0 = TDE6 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE6 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x06))
                            {
                                Local0 = TDA0 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA0 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x07))
                            {
                                Local0 = TDA1 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA1 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x08))
                            {
                                Local0 = TDA2 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA2 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x09))
                            {
                                Local0 = TDA3 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA3 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0A))
                            {
                                Local0 = TDA4 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA4 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0B))
                            {
                                Local0 = TDA5 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA5 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0C))
                            {
                                Local0 = TDA6 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA6 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0D))
                            {
                                Local0 = TDA7 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA7 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0E))
                            {
                                Local0 = TDA8 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA8 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0F))
                            {
                                Local0 = TDA9 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA9 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x10))
                            {
                                Local0 = TDAA /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAA */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x11))
                            {
                                Local0 = TDAB /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAB */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x12))
                            {
                                Local0 = TDAC /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAC */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x13))
                            {
                                Local0 = TDAD /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAD */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x14))
                            {
                                Local0 = TDAE /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAE */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x15))
                            {
                                Local0 = TDAF /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAF */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x16))
                            {
                                Local0 = TDB0 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB0 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x17))
                            {
                                Local0 = TDB1 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB1 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x18))
                            {
                                Local0 = TDB2 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB2 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x19))
                            {
                                Local0 = TDB3 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB3 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x1A))
                            {
                                Local0 = TDB4 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB4 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x1B))
                            {
                                Local0 = TDB5 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB5 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x1C))
                            {
                                Local0 = TDB6 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB6 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x1D))
                            {
                                Local0 = TDB7 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB7 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x1E))
                            {
                                Local0 = TDB8 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB8 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x1F))
                            {
                                Local0 = TDB9 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB9 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x20))
                            {
                                Local0 = TDBA /* \_SB_.PCI0.SBRG.EC__.SCM0.TDBA */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x21))
                            {
                                Local0 = TDBB /* \_SB_.PCI0.SBRG.EC__.SCM0.TDBB */
                                Return (Local0)
                            }

                            Return (Zero)
                        }

                        Method (WQAB, 1, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                Local1 = TD2E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2E */
                                Return (Local1)
                            }

                            If ((Arg0 == One))
                            {
                                Local1 = TD2F /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2F */
                                Return (Local1)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local1 = TD2B /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2B */
                                Return (Local1)
                            }

                            If ((Arg0 == 0x03))
                            {
                                Local1 = TD2C /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2C */
                                Return (Local1)
                            }

                            Return (Zero)
                        }

                        Method (WQAC, 1, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                Local2 = TD30 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD30 */
                                Return (Local2)
                            }

                            If ((Arg0 == One))
                            {
                                Local2 = TDBE /* \_SB_.PCI0.SBRG.EC__.SCM0.TDBE */
                                Return (Local2)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local2 = TDBF /* \_SB_.PCI0.SBRG.EC__.SCM0.TDBF */
                                Return (Local2)
                            }

                            Return (Zero)
                        }

                        Method (WQAD, 1, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                Local0 = TD31 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD31 */
                                Return (Local0)
                            }

                            If ((Arg0 == One))
                            {
                                Local0 = TD38 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD38 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local0 = TD3A /* \_SB_.PCI0.SBRG.EC__.SCM0.TD3A */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x03))
                            {
                                Local0 = TD3C /* \_SB_.PCI0.SBRG.EC__.SCM0.TD3C */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x04))
                            {
                                Local0 = TD3E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD3E */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x05))
                            {
                                Local0 = TD40 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD40 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x06))
                            {
                                Local0 = TD42 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD42 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x07))
                            {
                                Local0 = TD44 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD44 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x08))
                            {
                                Local0 = TD46 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD46 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x09))
                            {
                                Local0 = TD48 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD48 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0A))
                            {
                                Local0 = TD4A /* \_SB_.PCI0.SBRG.EC__.SCM0.TD4A */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0B))
                            {
                                Local0 = TD4C /* \_SB_.PCI0.SBRG.EC__.SCM0.TD4C */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0C))
                            {
                                Local0 = TDE8 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE8 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0D))
                            {
                                Local0 = TD35 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD35 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0E))
                            {
                                Local0 = TD36 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD36 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0F))
                            {
                                Local0 = TD4E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD4E */
                                Return (Local0)
                            }

                            Return (Zero)
                        }

                        Method (WQAE, 1, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                Local0 = TD32 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD32 */
                                Return (Local0)
                            }

                            If ((Arg0 == One))
                            {
                                Local0 = TD50 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD50 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local0 = TD52 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD52 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x03))
                            {
                                Local0 = TD54 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD54 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x04))
                            {
                                Local0 = TD56 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD56 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x05))
                            {
                                Local0 = TD58 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD58 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x06))
                            {
                                Local0 = TD5A /* \_SB_.PCI0.SBRG.EC__.SCM0.TD5A */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x07))
                            {
                                Local0 = TD5C /* \_SB_.PCI0.SBRG.EC__.SCM0.TD5C */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x08))
                            {
                                Local0 = TD5E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD5E */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x09))
                            {
                                Local0 = TD60 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD60 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0A))
                            {
                                Local0 = TD62 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD62 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0B))
                            {
                                Local0 = TD64 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD64 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0C))
                            {
                                Local0 = TDE9 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE9 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0D))
                            {
                                Local0 = TD66 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD66 */
                                Return (Local0)
                            }

                            Return (Zero)
                        }

                        Method (WQAF, 1, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                Local0 = TD33 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD33 */
                                Return (Local0)
                            }

                            If ((Arg0 == One))
                            {
                                Local0 = TD68 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD68 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local0 = TD71 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD71 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x03))
                            {
                                Local0 = TD70 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD70 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x04))
                            {
                                Local0 = TD69 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD69 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x05))
                            {
                                Local0 = TD6A /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6A */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x06))
                            {
                                Local0 = TD6B /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6B */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x07))
                            {
                                Local0 = TD6C /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6C */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x08))
                            {
                                Local0 = TD6D /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6D */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x09))
                            {
                                Local0 = TD6E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6E */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0A))
                            {
                                Local0 = TD6F /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6F */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0B))
                            {
                                Local0 = TD72 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD72 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0C))
                            {
                                Local0 = TD73 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD73 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0D))
                            {
                                Local0 = TD74 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD74 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0E))
                            {
                                Local0 = TD75 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD75 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0F))
                            {
                                Local0 = TD76 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD76 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x10))
                            {
                                Local0 = TD77 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD77 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x11))
                            {
                                Local0 = TD78 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD78 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x12))
                            {
                                Local0 = TD79 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD79 */
                                Return (Local0)
                            }

                            Return (Zero)
                        }

                        Method (WQAG, 1, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                Local0 = TD33 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD33 */
                                Return (Local0)
                            }

                            If ((Arg0 == One))
                            {
                                Local0 = TD80 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD80 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local0 = TD89 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD89 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x03))
                            {
                                Local0 = TD88 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD88 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x04))
                            {
                                Local0 = TD81 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD81 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x05))
                            {
                                Local0 = TD82 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD82 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x06))
                            {
                                Local0 = TD83 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD83 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x07))
                            {
                                Local0 = TD84 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD84 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x08))
                            {
                                Local0 = TD85 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD85 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x09))
                            {
                                Local0 = TD86 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD86 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0A))
                            {
                                Local0 = TD87 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD87 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0B))
                            {
                                Local0 = TD8A /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8A */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0C))
                            {
                                Local0 = TD8B /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8B */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0D))
                            {
                                Local0 = TD8C /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8C */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0E))
                            {
                                Local0 = TD8D /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8D */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0F))
                            {
                                Local0 = TD8E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8E */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x10))
                            {
                                Local0 = TD8F /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8F */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x11))
                            {
                                Local0 = TD90 /* \_SB_.PCI0.SBRG.EC__.SCM0.TD90 */
                                Return (Local0)
                            }

                            Return (Zero)
                        }

                        Method (WQAH, 1, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                Local0 = TE40 /* \_SB_.PCI0.SBRG.EC__.SCM0.TE40 */
                                Return (Local0)
                            }

                            If ((Arg0 == One))
                            {
                                Local0 = TE43 /* \_SB_.PCI0.SBRG.EC__.SCM0.TE43 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local0 = TDE7 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE7 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x03))
                            {
                                Local0 = TDF0 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF0 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x04))
                            {
                                Local0 = TDF1 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF1 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x05))
                            {
                                Local0 = TDFE /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFE */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x06))
                            {
                                Local0 = TDFF /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFF */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x07))
                            {
                                Local0 = TDF2 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF2 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x08))
                            {
                                Local0 = TDF3 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF3 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x09))
                            {
                                Local0 = TDF4 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF4 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0A))
                            {
                                Local0 = TDF5 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF5 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0B))
                            {
                                Local0 = TDF6 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF6 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0C))
                            {
                                Local0 = TDF7 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF7 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0D))
                            {
                                Local0 = TDF8 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF8 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0E))
                            {
                                Local0 = TDF9 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF9 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x0F))
                            {
                                Local0 = TDFA /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFA */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x10))
                            {
                                Local0 = TDFB /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFB */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x11))
                            {
                                Local0 = TDFC /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFC */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x12))
                            {
                                Local0 = TDFD /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFD */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x13))
                            {
                                Local0 = TDE0 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE0 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x14))
                            {
                                Local0 = TDE3 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE3 */
                                Return (Local0)
                            }

                            Return (Zero)
                        }

                        Method (WQAI, 1, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                Local0 = TDCF /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCF */
                                Return (Local0)
                            }

                            If ((Arg0 == One))
                            {
                                TDCE = TDVR /* \_SB_.PCI0.SBRG.EC__.SCM0.TDVR */
                                Local0 = TDCE /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCE */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x02))
                            {
                                Local0 = TDCD /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCD */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x03))
                            {
                                Local0 = TDCC /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCC */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x04))
                            {
                                Local0 = TDCB /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCB */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x05))
                            {
                                Local0 = TDCA /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCA */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x06))
                            {
                                Local0 = TDC9 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDC9 */
                                Return (Local0)
                            }

                            If ((Arg0 == 0x07))
                            {
                                Local0 = TDC8 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDC8 */
                                Return (Local0)
                            }

                            Return (Zero)
                        }

                        Method (WSAA, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                T2D0 = Arg1
                                Return (T2D0) /* \_SB_.PCI0.SBRG.EC__.SCM0.T2D0 */
                            }

                            If ((Arg0 == One))
                            {
                                T2D1 = Arg1
                                Return (T2D1) /* \_SB_.PCI0.SBRG.EC__.SCM0.T2D1 */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TDEE = Arg1
                                Return (TDEE) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDEE */
                            }

                            If ((Arg0 == 0x03))
                            {
                                T2D5 = Arg1
                                Return (T2D5) /* \_SB_.PCI0.SBRG.EC__.SCM0.T2D5 */
                            }

                            If ((Arg0 == 0x04))
                            {
                                TDE5 = Arg1
                                Return (TDE5) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE5 */
                            }

                            If ((Arg0 == 0x05))
                            {
                                TDE6 = Arg1
                                Return (TDE6) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE6 */
                            }

                            If ((Arg0 == 0x06))
                            {
                                TDA0 = Arg1
                                Return (TDA0) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA0 */
                            }

                            If ((Arg0 == 0x07))
                            {
                                TDA1 = Arg1
                                Return (TDA1) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA1 */
                            }

                            If ((Arg0 == 0x08))
                            {
                                TDA2 = Arg1
                                Return (TDA2) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA2 */
                            }

                            If ((Arg0 == 0x09))
                            {
                                TDA3 = Arg1
                                Return (TDA3) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA3 */
                            }

                            If ((Arg0 == 0x0A))
                            {
                                TDA4 = Arg1
                                Return (TDA4) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA4 */
                            }

                            If ((Arg0 == 0x0B))
                            {
                                TDA5 = Arg1
                                Return (TDA5) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA5 */
                            }

                            If ((Arg0 == 0x0C))
                            {
                                TDA6 = Arg1
                                Return (TDA6) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA6 */
                            }

                            If ((Arg0 == 0x0D))
                            {
                                TDA7 = Arg1
                                Return (TDA7) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA7 */
                            }

                            If ((Arg0 == 0x0E))
                            {
                                TDA8 = Arg1
                                Return (TDA8) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA8 */
                            }

                            If ((Arg0 == 0x0F))
                            {
                                TDA9 = Arg1
                                Return (TDA9) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDA9 */
                            }

                            If ((Arg0 == 0x10))
                            {
                                TDAA = Arg1
                                Return (TDAA) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAA */
                            }

                            If ((Arg0 == 0x11))
                            {
                                TDAB = Arg1
                                Return (TDAB) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAB */
                            }

                            If ((Arg0 == 0x12))
                            {
                                TDAC = Arg1
                                Return (TDAC) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAC */
                            }

                            If ((Arg0 == 0x13))
                            {
                                TDAD = Arg1
                                Return (TDAD) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAD */
                            }

                            If ((Arg0 == 0x14))
                            {
                                TDAE = Arg1
                                Return (TDAE) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAE */
                            }

                            If ((Arg0 == 0x15))
                            {
                                TDAF = Arg1
                                Return (TDAF) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDAF */
                            }

                            If ((Arg0 == 0x16))
                            {
                                TDB0 = Arg1
                                Return (TDB0) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB0 */
                            }

                            If ((Arg0 == 0x17))
                            {
                                TDB1 = Arg1
                                Return (TDB1) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB1 */
                            }

                            If ((Arg0 == 0x18))
                            {
                                TDB2 = Arg1
                                Return (TDB2) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB2 */
                            }

                            If ((Arg0 == 0x19))
                            {
                                TDB3 = Arg1
                                Return (TDB3) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB3 */
                            }

                            If ((Arg0 == 0x1A))
                            {
                                TDB4 = Arg1
                                Return (TDB4) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB4 */
                            }

                            If ((Arg0 == 0x1B))
                            {
                                TDB5 = Arg1
                                Return (TDB5) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB5 */
                            }

                            If ((Arg0 == 0x1C))
                            {
                                TDB6 = Arg1
                                Return (TDB6) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB6 */
                            }

                            If ((Arg0 == 0x1D))
                            {
                                TDB7 = Arg1
                                Return (TDB7) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB7 */
                            }

                            If ((Arg0 == 0x1E))
                            {
                                TDB8 = Arg1
                                Return (TDB8) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB8 */
                            }

                            If ((Arg0 == 0x1F))
                            {
                                TDB9 = Arg1
                                Return (TDB9) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDB9 */
                            }

                            If ((Arg0 == 0x20))
                            {
                                TDBA = Arg1
                                Return (TDBA) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDBA */
                            }

                            If ((Arg0 == 0x21))
                            {
                                TDBB = Arg1
                                Return (TDBB) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDBB */
                            }

                            Return (Zero)
                        }

                        Method (WSAB, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                TD2E = Arg1
                                Return (TD2E) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2E */
                            }

                            If ((Arg0 == One))
                            {
                                TD2F = Arg1
                                Return (TD2F) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2F */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TD2B = Arg1
                                Return (TD2B) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2B */
                            }

                            If ((Arg0 == 0x03))
                            {
                                TD2C = Arg1
                                Return (TD2C) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2C */
                            }

                            Return (Zero)
                        }

                        Method (WSAC, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                TD30 = Arg1
                                Return (TD30) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD30 */
                            }

                            If ((Arg0 == One))
                            {
                                TDBE = Arg1
                                Return (TDBE) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDBE */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TDBF = Arg1
                                Return (TDBF) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDBF */
                            }

                            Return (Zero)
                        }

                        Method (WSAD, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                TD31 = Arg1
                                Return (TD31) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD31 */
                            }

                            If ((Arg0 == One))
                            {
                                TD38 = Arg1
                                Return (TD38) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD38 */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TD3A = Arg1
                                Return (TD3A) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD3A */
                            }

                            If ((Arg0 == 0x03))
                            {
                                TD3C = Arg1
                                Return (TD3C) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD3C */
                            }

                            If ((Arg0 == 0x04))
                            {
                                TD3E = Arg1
                                Return (TD3E) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD3E */
                            }

                            If ((Arg0 == 0x05))
                            {
                                TD40 = Arg1
                                Return (TD40) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD40 */
                            }

                            If ((Arg0 == 0x06))
                            {
                                TD42 = Arg1
                                Return (TD42) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD42 */
                            }

                            If ((Arg0 == 0x07))
                            {
                                TD44 = Arg1
                                Return (TD44) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD44 */
                            }

                            If ((Arg0 == 0x08))
                            {
                                TD46 = Arg1
                                Return (TD46) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD46 */
                            }

                            If ((Arg0 == 0x09))
                            {
                                TD48 = Arg1
                                Return (TD48) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD48 */
                            }

                            If ((Arg0 == 0x0A))
                            {
                                TD4A = Arg1
                                Return (TD4A) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD4A */
                            }

                            If ((Arg0 == 0x0B))
                            {
                                TD4C = Arg1
                                Return (TD4C) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD4C */
                            }

                            If ((Arg0 == 0x0C))
                            {
                                TDE8 = Arg1
                                Return (TDE8) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE8 */
                            }

                            If ((Arg0 == 0x0D))
                            {
                                TD35 = Arg1
                                Return (TD35) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD35 */
                            }

                            If ((Arg0 == 0x0E))
                            {
                                TD36 = Arg1
                                Return (TD36) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD36 */
                            }

                            If ((Arg0 == 0x0F))
                            {
                                TD4E = Arg1
                                Return (TD4E) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD4E */
                            }

                            Return (Zero)
                        }

                        Method (WSAE, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                TD32 = Arg1
                                Return (TD32) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD32 */
                            }

                            If ((Arg0 == One))
                            {
                                TD50 = Arg1
                                Return (TD50) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD50 */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TD52 = Arg1
                                Return (TD52) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD52 */
                            }

                            If ((Arg0 == 0x03))
                            {
                                TD54 = Arg1
                                Return (TD54) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD54 */
                            }

                            If ((Arg0 == 0x04))
                            {
                                TD56 = Arg1
                                Return (TD56) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD56 */
                            }

                            If ((Arg0 == 0x05))
                            {
                                TD58 = Arg1
                                Return (TD58) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD58 */
                            }

                            If ((Arg0 == 0x06))
                            {
                                TD5A = Arg1
                                Return (TD5A) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD5A */
                            }

                            If ((Arg0 == 0x07))
                            {
                                TD5C = Arg1
                                Return (TD5C) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD5C */
                            }

                            If ((Arg0 == 0x08))
                            {
                                TD5E = Arg1
                                Return (TD5E) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD5E */
                            }

                            If ((Arg0 == 0x09))
                            {
                                TD60 = Arg1
                                Return (TD60) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD60 */
                            }

                            If ((Arg0 == 0x0A))
                            {
                                TD62 = Arg1
                                Return (TD62) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD62 */
                            }

                            If ((Arg0 == 0x0B))
                            {
                                TD64 = Arg1
                                Return (TD64) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD64 */
                            }

                            If ((Arg0 == 0x0C))
                            {
                                TDE9 = Arg1
                                Return (TDE9) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE9 */
                            }

                            If ((Arg0 == 0x0D))
                            {
                                TD66 = Arg1
                                Return (TD66) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD66 */
                            }

                            Return (Zero)
                        }

                        Method (WSAF, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                TD33 = Arg1
                                Return (TD33) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD33 */
                            }

                            If ((Arg0 == One))
                            {
                                TD68 = Arg1
                                Return (TD68) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD68 */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TD71 = Arg1
                                Return (TD71) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD71 */
                            }

                            If ((Arg0 == 0x03))
                            {
                                TD70 = Arg1
                                Return (TD70) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD70 */
                            }

                            If ((Arg0 == 0x04))
                            {
                                TD69 = Arg1
                                Return (TD69) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD69 */
                            }

                            If ((Arg0 == 0x05))
                            {
                                TD6A = Arg1
                                Return (TD6A) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6A */
                            }

                            If ((Arg0 == 0x06))
                            {
                                TD6B = Arg1
                                Return (TD6B) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6B */
                            }

                            If ((Arg0 == 0x07))
                            {
                                TD6C = Arg1
                                Return (TD6C) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6C */
                            }

                            If ((Arg0 == 0x08))
                            {
                                TD6D = Arg1
                                Return (TD6D) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6D */
                            }

                            If ((Arg0 == 0x09))
                            {
                                TD6E = Arg1
                                Return (TD6E) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6E */
                            }

                            If ((Arg0 == 0x0A))
                            {
                                TD6F = Arg1
                                Return (TD6F) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD6F */
                            }

                            If ((Arg0 == 0x0B))
                            {
                                TD72 = Arg1
                                Return (TD72) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD72 */
                            }

                            If ((Arg0 == 0x0C))
                            {
                                TD73 = Arg1
                                Return (TD73) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD73 */
                            }

                            If ((Arg0 == 0x0D))
                            {
                                TD74 = Arg1
                                Return (TD74) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD74 */
                            }

                            If ((Arg0 == 0x0E))
                            {
                                TD75 = Arg1
                                Return (TD75) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD75 */
                            }

                            If ((Arg0 == 0x0F))
                            {
                                TD76 = Arg1
                                Return (TD76) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD76 */
                            }

                            If ((Arg0 == 0x10))
                            {
                                TD77 = Arg1
                                Return (TD77) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD77 */
                            }

                            If ((Arg0 == 0x11))
                            {
                                TD78 = Arg1
                                Return (TD78) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD78 */
                            }

                            If ((Arg0 == 0x12))
                            {
                                TD79 = Arg1
                                Return (TD79) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD79 */
                            }

                            Return (Zero)
                        }

                        Method (WSAG, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                TD33 = Arg1
                                Return (TD33) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD33 */
                            }

                            If ((Arg0 == One))
                            {
                                TD80 = Arg1
                                Return (TD80) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD80 */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TD89 = Arg1
                                Return (TD89) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD89 */
                            }

                            If ((Arg0 == 0x03))
                            {
                                TD88 = Arg1
                                Return (TD88) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD88 */
                            }

                            If ((Arg0 == 0x04))
                            {
                                TD81 = Arg1
                                Return (TD81) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD81 */
                            }

                            If ((Arg0 == 0x05))
                            {
                                TD82 = Arg1
                                Return (TD82) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD82 */
                            }

                            If ((Arg0 == 0x06))
                            {
                                TD83 = Arg1
                                Return (TD83) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD83 */
                            }

                            If ((Arg0 == 0x07))
                            {
                                TD84 = Arg1
                                Return (TD84) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD84 */
                            }

                            If ((Arg0 == 0x08))
                            {
                                TD85 = Arg1
                                Return (TD85) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD85 */
                            }

                            If ((Arg0 == 0x09))
                            {
                                TD86 = Arg1
                                Return (TD86) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD86 */
                            }

                            If ((Arg0 == 0x0A))
                            {
                                TD87 = Arg1
                                Return (TD87) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD87 */
                            }

                            If ((Arg0 == 0x0B))
                            {
                                TD8A = Arg1
                                Return (TD8A) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8A */
                            }

                            If ((Arg0 == 0x0C))
                            {
                                TD8B = Arg1
                                Return (TD8B) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8B */
                            }

                            If ((Arg0 == 0x0D))
                            {
                                TD8C = Arg1
                                Return (TD8C) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8C */
                            }

                            If ((Arg0 == 0x0E))
                            {
                                TD8D = Arg1
                                Return (TD8D) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8D */
                            }

                            If ((Arg0 == 0x0F))
                            {
                                TD8E = Arg1
                                Return (TD8E) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8E */
                            }

                            If ((Arg0 == 0x10))
                            {
                                TD8F = Arg1
                                Return (TD8F) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD8F */
                            }

                            If ((Arg0 == 0x11))
                            {
                                TD90 = Arg1
                                Return (TD90) /* \_SB_.PCI0.SBRG.EC__.SCM0.TD90 */
                            }

                            Return (Zero)
                        }

                        Method (WSAH, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                TE40 = Arg1
                                Return (TE40) /* \_SB_.PCI0.SBRG.EC__.SCM0.TE40 */
                            }

                            If ((Arg0 == One))
                            {
                                TE43 = Arg1
                                Return (TE43) /* \_SB_.PCI0.SBRG.EC__.SCM0.TE43 */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TDE7 = Arg1
                                Return (TDE7) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE7 */
                            }

                            If ((Arg0 == 0x03))
                            {
                                TDF0 = Arg1
                                Return (TDF0) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF0 */
                            }

                            If ((Arg0 == 0x04))
                            {
                                TDF1 = Arg1
                                Return (TDF1) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF1 */
                            }

                            If ((Arg0 == 0x05))
                            {
                                TDFE = Arg1
                                Return (TDFE) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFE */
                            }

                            If ((Arg0 == 0x06))
                            {
                                TDFF = Arg1
                                Return (TDFF) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFF */
                            }

                            If ((Arg0 == 0x07))
                            {
                                TDF2 = Arg1
                                Return (TDF2) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF2 */
                            }

                            If ((Arg0 == 0x08))
                            {
                                TDF3 = Arg1
                                Return (TDF3) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF3 */
                            }

                            If ((Arg0 == 0x09))
                            {
                                TDF4 = Arg1
                                Return (TDF4) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF4 */
                            }

                            If ((Arg0 == 0x0A))
                            {
                                TDF5 = Arg1
                                Return (TDF5) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF5 */
                            }

                            If ((Arg0 == 0x0B))
                            {
                                TDF6 = Arg1
                                Return (TDF6) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF6 */
                            }

                            If ((Arg0 == 0x0C))
                            {
                                TDF7 = Arg1
                                Return (TDF7) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF7 */
                            }

                            If ((Arg0 == 0x0D))
                            {
                                TDF8 = Arg1
                                Return (TDF8) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF8 */
                            }

                            If ((Arg0 == 0x0E))
                            {
                                TDF9 = Arg1
                                Return (TDF9) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF9 */
                            }

                            If ((Arg0 == 0x0F))
                            {
                                TDFA = Arg1
                                Return (TDFA) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFA */
                            }

                            If ((Arg0 == 0x10))
                            {
                                TDFB = Arg1
                                Return (TDFB) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFB */
                            }

                            If ((Arg0 == 0x11))
                            {
                                TDFC = Arg1
                                Return (TDFC) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFC */
                            }

                            If ((Arg0 == 0x12))
                            {
                                TDFD = Arg1
                                Return (TDFD) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDFD */
                            }

                            If ((Arg0 == 0x13))
                            {
                                TDE0 = Arg1
                                Return (TDE0) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE0 */
                            }

                            If ((Arg0 == 0x14))
                            {
                                TDE3 = Arg1
                                Return (TDE3) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDE3 */
                            }

                            Return (Zero)
                        }

                        Method (WSAI, 2, NotSerialized)
                        {
                            If ((Arg0 == Zero))
                            {
                                TDCF = Arg1
                                Return (TDCF) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCF */
                            }

                            If ((Arg0 == One))
                            {
                                TDCE = Arg1
                                Return (TDCE) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCE */
                            }

                            If ((Arg0 == 0x02))
                            {
                                TDCD = Arg1
                                Return (TDCD) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCD */
                            }

                            If ((Arg0 == 0x03))
                            {
                                TDCC = Arg1
                                Return (TDCC) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCC */
                            }

                            If ((Arg0 == 0x04))
                            {
                                TDCB = Arg1
                                Return (TDCB) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCB */
                            }

                            If ((Arg0 == 0x05))
                            {
                                TDCA = Arg1
                                Return (TDCA) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDCA */
                            }

                            If ((Arg0 == 0x06))
                            {
                                TDC9 = Arg1
                                Return (TDC9) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDC9 */
                            }

                            If ((Arg0 == 0x07))
                            {
                                TDC8 = Arg1
                                Return (TDC8) /* \_SB_.PCI0.SBRG.EC__.SCM0.TDC8 */
                            }

                            Return (Zero)
                        }

                        Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event
                        {
                            If ((Arg0 == 0xC0))
                            {
                                Name (EVRT, Buffer (0x02)
                                {
                                     0x00, 0x00                                       /* .. */
                                })
                                Name (TMPB, Zero)
                                TMPB = TDEE /* \_SB_.PCI0.SBRG.EC__.SCM0.TDEE */
                                EVRT [Zero] = TMPB /* \_SB_.PCI0.SBRG.EC__.SCM0._WED.TMPB */
                                If ((TMPB == 0x08))
                                {
                                    EVRT [One] = TE43 /* \_SB_.PCI0.SBRG.EC__.SCM0.TE43 */
                                }

                                If ((TMPB == 0x56))
                                {
                                    EVRT [One] = TD2E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2E */
                                }

                                If ((TMPB == 0x57))
                                {
                                    EVRT [One] = TD2E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2E */
                                }

                                If ((TMPB == 0x5F))
                                {
                                    EVRT [One] = TD2E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2E */
                                }

                                If ((TMPB == 0x60))
                                {
                                    EVRT [One] = TE40 /* \_SB_.PCI0.SBRG.EC__.SCM0.TE40 */
                                }

                                If ((TMPB == 0x62))
                                {
                                    EVRT [One] = TDF1 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF1 */
                                }

                                If ((TMPB == 0x63))
                                {
                                    EVRT [One] = TDF1 /* \_SB_.PCI0.SBRG.EC__.SCM0.TDF1 */
                                }

                                If ((TMPB == 0x73))
                                {
                                    EVRT [One] = TE43 /* \_SB_.PCI0.SBRG.EC__.SCM0.TE43 */
                                }

                                If ((TMPB == 0x79))
                                {
                                    EVRT [One] = TE43 /* \_SB_.PCI0.SBRG.EC__.SCM0.TE43 */
                                }

                                If ((TMPB == 0x7B))
                                {
                                    EVRT [One] = TD2E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2E */
                                }

                                If ((TMPB == 0x84))
                                {
                                    EVRT [One] = TD2E /* \_SB_.PCI0.SBRG.EC__.SCM0.TD2E */
                                }

                                If ((TMPB == 0x02))
                                {
                                    EVRT [One] = TE43 /* \_SB_.PCI0.SBRG.EC__.SCM0.TE43 */
                                }

                                TDEE = Zero
                                Return (EVRT) /* \_SB_.PCI0.SBRG.EC__.SCM0._WED.EVRT */
                            }

                            Return (Zero)
                        }
                    }

                    Method (MWAK, 1, NotSerialized)
                    {
                        EOSV ()
                        Notify (LID0, 0x80) // Status Change
                    }

                    Method (MPTS, 1, NotSerialized)
                    {
                        If ((Arg0 == 0x04))
                        {
                            SUSP = One
                        }
                    }
                }

                Scope (\_TZ)
                {
                    Method (KELV, 1, NotSerialized)
                    {
                        Local0 = (Arg0 & 0xFF)
                        Local0 *= 0x0A
                        Local0 += 0x0AAC
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
                                    \_SB.PCI0.SBRG.EC.CTSD = Zero
                                    Return (KELV (0x82))
                                }
                                Else
                                {
                                    Local0 = \_SB.PCI0.SBRG.EC.CPUT
                                    Local0 += 0x02
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
                    /* 0000 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  /* x....... */
                    /* 0008 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  /* x....... */
                    /* 0010 */  0x1F, 0x00, 0x00, 0x00                           /* .... */
                })
                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM) /* \_SB_.PCI0.SATA.SPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((STCL == 0x0101))
                        {
                            Local1 = 0x0F
                        }
                        Else
                        {
                            Local1 = Zero
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

                        If (((OSVR == 0x06) || (OSVR == 0x04)))
                        {
                            If (PMS1)
                            {
                                Local0 = 0x32
                                While (((PMBY == One) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }

                            If (PSS1)
                            {
                                Local0 = 0x32
                                While (((PSBY == One) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }

                        PRIS = Zero
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        PRIS = 0x03
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (PRIS) /* \_SB_.PCI0.SATA.PRID.PRIS */
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

                            If (~(PMS1 == Zero))
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

                            Local0 = 0x32
                            While (((PMBY == One) && Local0))
                            {
                                Sleep (0xFA)
                                Local0--
                            }

                            S12P = Zero
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            S12P = 0x03
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P) /* \_SB_.PCI0.SATA.PRID.P_D0.S12P */
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

                            If (~(PSS1 == Zero))
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

                            Local0 = 0x32
                            While (((PSBY == One) && Local0))
                            {
                                Sleep (0xFA)
                                Local0--
                            }

                            S12P = Zero
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            S12P = 0x03
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P) /* \_SB_.PCI0.SATA.PRID.P_D1.S12P */
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM) /* \_SB_.PCI0.SATA.SPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                    }

                    Name (SECS, Zero)
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((STCL == 0x0101))
                        {
                            Local1 = 0x0F
                        }
                        Else
                        {
                            Local1 = Zero
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

                        If (((OSVR == 0x06) || (OSVR == 0x04)))
                        {
                            If (SMS1)
                            {
                                Local0 = 0x32
                                While (((SMBY == One) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }

                            If (SSS1)
                            {
                                Local0 = 0x32
                                While (((SSBY == One) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }

                        SECS = Zero
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        SECS = 0x03
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (SECS) /* \_SB_.PCI0.SATA.SECD.SECS */
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

                            If (~(SMS1 == Zero))
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

                            Local0 = 0x32
                            While (((SMBY == One) && Local0))
                            {
                                Sleep (0xFA)
                                Local0--
                            }

                            S12P = Zero
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            S12P = 0x03
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P) /* \_SB_.PCI0.SATA.SECD.S_D0.S12P */
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

                            If (~(SSS1 == Zero))
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

                            Local0 = 0x32
                            While (((SSBY == One) && Local0))
                            {
                                Sleep (0xFA)
                                Local0--
                            }

                            S12P = Zero
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            S12P = 0x03
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P) /* \_SB_.PCI0.SATA.SECD.S_D1.S12P */
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
                        Return (AR21) /* \_SB_.AR21 */
                    }

                    Return (PR21) /* \_SB_.PR21 */
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
                        Return (AR22) /* \_SB_.AR22 */
                    }

                    Return (PR22) /* \_SB_.PR22 */
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
                        Return (AR23) /* \_SB_.AR23 */
                    }

                    Return (PR23) /* \_SB_.PR23 */
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
                    Local0 = (Arg0 & 0x7F)
                    MIDX = Local0
                    Local0 = MIDR /* \_SB_.PCI0.GNBD.MIDR */
                    MIDX = 0x7F
                    Release (NBMM)
                    Return (Local0)
                }

                Method (NBMW, 2, NotSerialized)
                {
                    Acquire (NBMM, 0xFFFF)
                    Local0 = (Arg0 & 0x7F)
                    Local0 |= 0x80
                    MIDX = Local0
                    MIDR = Arg1
                    MIDX = Local0 &= 0x7F
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
                    NBXI = Arg0
                    Local0 = NBXD /* \_SB_.PCI0.GNBD.NBXD */
                    NBXI = Zero
                    Release (NBXM)
                    Return (Local0)
                }

                Method (NBXW, 2, NotSerialized)
                {
                    Acquire (NBXM, 0xFFFF)
                    NBXI = Arg0
                    NBXD = Arg1
                    NBXI = Zero
                    Release (NBXM)
                }

                Method (GFXM, 0, NotSerialized)
                {
                    Local0 = NBMR (0x08)
                    Local0 &= 0x0F
                    Return (Local0)
                }

                Method (GPPM, 0, NotSerialized)
                {
                    Local0 = NBMR (0x67)
                    Local0 &= 0xF0
                    Return (Local0)
                }

                Method (GPPX, 0, NotSerialized)
                {
                    Local0 = NBMR (0x2D)
                    Local0 >>= 0x07
                    Local0 &= 0x0F
                    Return (Local0)
                }

                Method (XPTR, 2, NotSerialized)
                {
                    If (((Arg0 < 0x02) && (Arg0 > 0x07)))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Local0 = GPPM ()
                        Local1 = GPPX ()
                        Local0 = One
                        If ((Arg0 < 0x04))
                        {
                            Local1 = (Arg0 + 0x02)
                        }
                        Else
                        {
                            Local1 = (Arg0 + 0x11)
                        }

                        Local0 <<= Local1
                        Local2 = NBMR (0x08)
                        If (Arg1)
                        {
                            Local2 &= ~Local0
                        }
                        Else
                        {
                            Local2 |= Local0
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
                    Local0 = PARB /* \_SB_.PCI0.GNBD.PARB */
                    Local0 >>= 0x10
                    Local0 &= 0x07
                    If (Local0)
                    {
                        Local1 = (One << Local0)
                        Local1 = (0x1000 - Local1)
                        Local1 <<= 0x14
                        PX3K = Local1
                        Local0 = (0x00100000 >> Local0)
                        PX3S = Local0
                    }

                    Acquire (BR3X, 0xFFFF)
                    Local0 = NBMR (Zero)
                    Local0 &= 0xFFFFFFF7
                    NBMW (Zero, Local0)
                    Local0 = BR3L /* \_SB_.PCI0.GNBD.BR3L */
                    Local0 &= PX3K /* \_SB_.PCI0.GNBD.PX3K */
                    PX3L = Local0
                    Local0 = BR3H /* \_SB_.PCI0.GNBD.BR3H */
                    Local0 &= 0xFF
                    PX3H = Local0
                    Local0 = NBMR (Zero)
                    Local0 |= 0x08
                    NBMW (Zero, Local0)
                    Release (BR3X)
                    Return (PX3L) /* \_SB_.PCI0.GNBD.PX3L */
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
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
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
                        LEN1 = UMAS /* \_SB_.PCI0.GNBD.BROD.UMAS */
                        BAS1 = (TOM - LEN1) /* \_SB_.PCI0.GNBD.BROD._CRS.LEN1 */
                        Return (CRS) /* \_SB_.PCI0.GNBD.BROD.CRS_ */
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
                        Return (AR14) /* \_SB_.AR14 */
                    }

                    Return (PR14) /* \_SB_.PR14 */
                }
            }

            Device (BR15)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR15) /* \_SB_.AR15 */
                    }

                    Return (PR15) /* \_SB_.PR15 */
                }
            }

            Device (BR16)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR16) /* \_SB_.AR16 */
                    }

                    Return (PR16) /* \_SB_.PR16 */
                }
            }

            Device (BR17)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR17) /* \_SB_.AR17 */
                    }

                    Return (PR17) /* \_SB_.PR17 */
                }
            }

            Device (BR12)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR12) /* \_SB_.AR12 */
                    }

                    Return (PR12) /* \_SB_.PR12 */
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
                    Local0 = Zero
                    If ((VC0S & 0x00020000))
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    XPIR = Arg0
                    Local0 = XPID /* \_SB_.PCI0.PCED.XPID */
                    XPIR = Zero
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    XPIR = Arg0
                    XPID = Arg1
                    XPIR = Zero
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Local0 = XPRD (0xA2)
                    Local0 &= 0xFFFFFFF8
                    Local1 = (Local0 >> 0x04)
                    Local1 &= 0x07
                    Local0 |= Local1
                    Local0 |= 0x0100
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Local0 = _ADR /* \_SB_.PCI0.PCED._ADR */
                    Local1 = (Local0 >> 0x10)
                    Local1 = (Local1 << 0x03)
                    Local2 = (Local0 & 0x0F)
                    Local3 = (Local1 | Local2)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Local1 = Zero
                    Local0 = XPPB ()
                    If ((0x04 > Local0))
                    {
                        Local1 = Zero
                    }

                    If ((0x08 > Local0))
                    {
                        Local1 = 0x00010000
                    }

                    If ((0x0B > Local0))
                    {
                        Local1 = 0x00020000
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Local0 = XPPB ()
                    Local2 = ^^GNBD.GPPX ()
                    Local3 = ^^GNBD.GFXM ()
                    Local1 = Zero
                    If ((0x10 == Local0))
                    {
                        Local1 = 0xFFFF
                        If (Local3)
                        {
                            Local1 = 0x0F0F
                        }
                    }

                    If ((0x18 == Local0))
                    {
                        Local1 = 0xF0F0
                    }

                    If ((0x20 == Local0))
                    {
                        Local1 = 0x1010
                    }

                    If ((0x28 == Local0))
                    {
                        Local1 = 0x2020
                    }

                    If ((0x30 == Local0))
                    {
                        Local1 = 0x4040
                    }

                    If ((0x38 == Local0))
                    {
                        Local1 = 0x8080
                    }

                    If ((0x48 == Local0))
                    {
                        Local1 = Zero
                        If ((0x02 == Local2))
                        {
                            Local1 = 0x0303
                        }

                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0101
                        }
                    }

                    If ((0x50 == Local0))
                    {
                        Local1 = Zero
                        If ((0x03 == Local2))
                        {
                            Local1 = 0x0202
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Local1 = XPPD ()
                    If ((Zero != Local1))
                    {
                        Local2 = ^^GNBD.NBXR ((0x65 + XPCN ()))
                        If (Arg0)
                        {
                            Local2 &= ~Local1
                        }
                        Else
                        {
                            Local2 |= Local1
                        }

                        ^^GNBD.NBXW ((0x65 + XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Local0 = LKCN /* \_SB_.PCI0.PCED.LKCN */
                    Local0 &= 0xFFFFFFDF
                    LKCN = Local0
                    Local0 |= 0x20
                    LKCN = Local0
                    Local1 = 0x64
                    Local2 = One
                    While ((Local1 && Local2))
                    {
                        Sleep (One)
                        Local3 = LKST /* \_SB_.PCI0.PCED.LKST */
                        If ((Local3 & 0x0800))
                        {
                            Local1--
                        }
                        Else
                        {
                            Local2 = Zero
                        }
                    }

                    Local0 &= 0xFFFFFFDF
                    LKCN = Local0
                    If (!Local2)
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
                    Local0 = ^^GNBD.GFXM ()
                    Local1 = XPPB ()
                    Local2 = Zero
                    If ((0x10 == Local1))
                    {
                        Local2 = One
                        Local3 = 0x00770070
                        If (Local0)
                        {
                            Local3 = 0x00330030
                        }
                    }

                    If (((0x18 == Local1) && Local0))
                    {
                        Local2 = One
                        Local3 = 0x00440040
                    }

                    Local0 = ^^GNBD.NBMR (0x07)
                    Local1 = ^^GNBD.NBXR (0x65)
                    If ((Local0 && 0x0201F000))
                    {
                        Local4 = 0x00440040
                        Local5 = Local4
                        If ((~Local1 && 0xF0F0))
                        {
                            Local5 = Zero
                        }
                    }
                    Else
                    {
                        Local4 = 0x00110010
                        Local5 = Local4
                        If ((~Local1 && 0x0F0F))
                        {
                            Local5 = Zero
                        }
                    }

                    If (Local2)
                    {
                        Local6 = (Local3 | Local4)
                        Local0 = (Local5 & Local4)
                        Local7 = (Local3 | Local0)
                        Local0 = ^^GNBD.NBMR (0x2E)
                        If (Arg0)
                        {
                            Local0 &= ~Local6
                        }
                        Else
                        {
                            Local0 |= Local7
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
                        ^^GNBD.XPTR ((XPPB () << 0x03), One)
                        Sleep (0x14)
                    }
                    Else
                    {
                        ^^GNBD.XPTR ((XPPB () << 0x03), Zero)
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
                        Return (^^^VGA._DOD) /* \_SB_.PCI0.VGA_._DOD */
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
                        Local0 = Zero
                        Local2 = Zero
                        While ((Local2 < 0x0F))
                        {
                            PDC2 = One
                            Local4 = One
                            Local5 = 0xC8
                            While ((Local4 && Local5))
                            {
                                Local6 = XPRD (0xA5)
                                Local6 &= 0x7F
                                If (((Local6 >= 0x10) && (Local6 != 0x7F)))
                                {
                                    Local4 = Zero
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Local5--
                                }
                            }

                            If (!Local4)
                            {
                                Local5 = XPDL ()
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Local2++
                                }
                                Else
                                {
                                    INFO = (XPPB () << 0x03)
                                    BCMD = 0x87
                                    ^^SBRG.SMIC = Zero
                                    If ((XPR2 () == Ones))
                                    {
                                        Local0 = One
                                        Local2 = 0x10
                                    }
                                    Else
                                    {
                                        Local0 = Zero
                                        Local2 = 0x10
                                    }
                                }
                            }
                            Else
                            {
                                Local2 = 0x10
                            }
                        }

                        If (!Local0)
                        {
                            XPDT (Zero)
                            XPPR (Zero)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        PDC2 = One
                        Local7 = ^VGA.DVID /* \_SB_.PCI0.PCED.VGA_.DVID */
                        Sleep (0x0A)
                        Local4 = One
                        Local5 = 0x05
                        While ((Local4 && Local5))
                        {
                            Local6 = XPRD (0xA5)
                            Local6 &= 0x7F
                            If ((Local6 <= 0x04))
                            {
                                Local4 = Zero
                            }
                            Else
                            {
                                Local7 = ^VGA.DVID /* \_SB_.PCI0.PCED.VGA_.DVID */
                                Local7 &= Ones
                                Sleep (0x05)
                                Local5--
                            }
                        }

                        Return (Ones)
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR13) /* \_SB_.AR13 */
                    }

                    Return (PR13) /* \_SB_.PR13 */
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
                        Return (AR20) /* \_SB_.AR20 */
                    }

                    Return (PR20) /* \_SB_.PR20 */
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
                                Return (^^_ADR) /* \_SB_.PCI0.OHC1.RHUB.PRT5._ADR */
                            }

                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision           = 0x2,
                                    PLD_IgnoreColor        = 0x1,
                                    PLD_Red                = 0x0,
                                    PLD_Green              = 0x0,
                                    PLD_Blue               = 0x0,
                                    PLD_Width              = 0x0,
                                    PLD_Height             = 0x0,
                                    PLD_UserVisible        = 0x1,
                                    PLD_Dock               = 0x0,
                                    PLD_Lid                = 0x1,
                                    PLD_Panel              = "FRONT",
                                    PLD_VerticalPosition   = "UPPER",
                                    PLD_HorizontalPosition = "CENTER",
                                    PLD_Shape              = "UNKNOWN",
                                    PLD_GroupOrientation   = 0x0,
                                    PLD_GroupToken         = 0x0,
                                    PLD_GroupPosition      = 0x0,
                                    PLD_Bay                = 0x0,
                                    PLD_Ejectable          = 0x0,
                                    PLD_EjectRequired      = 0x0,
                                    PLD_CabinetNumber      = 0x0,
                                    PLD_CardCageNumber     = 0x0,
                                    PLD_Reference          = 0x0,
                                    PLD_Rotation           = 0x0,
                                    PLD_Order              = 0x0,
                                    PLD_VerticalOffset     = 0x8C,
                                    PLD_HorizontalOffset   = 0x12C)

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
                                Return (^^_ADR) /* \_SB_.PCI0.EHC1.RHUB.PRT5._ADR */
                            }

                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision           = 0x2,
                                    PLD_IgnoreColor        = 0x1,
                                    PLD_Red                = 0x0,
                                    PLD_Green              = 0x0,
                                    PLD_Blue               = 0x0,
                                    PLD_Width              = 0x0,
                                    PLD_Height             = 0x0,
                                    PLD_UserVisible        = 0x1,
                                    PLD_Dock               = 0x0,
                                    PLD_Lid                = 0x1,
                                    PLD_Panel              = "FRONT",
                                    PLD_VerticalPosition   = "UPPER",
                                    PLD_HorizontalPosition = "CENTER",
                                    PLD_Shape              = "UNKNOWN",
                                    PLD_GroupOrientation   = 0x0,
                                    PLD_GroupToken         = 0x0,
                                    PLD_GroupPosition      = 0x0,
                                    PLD_Bay                = 0x0,
                                    PLD_Ejectable          = 0x0,
                                    PLD_EjectRequired      = 0x0,
                                    PLD_CabinetNumber      = 0x0,
                                    PLD_CardCageNumber     = 0x0,
                                    PLD_Reference          = 0x0,
                                    PLD_Rotation           = 0x0,
                                    PLD_Order              = 0x0,
                                    PLD_VerticalOffset     = 0x8C,
                                    PLD_HorizontalOffset   = 0x12C)

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
                    SWIT = Arg0
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
                        If ((OSFL () >= 0x0F))
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
                        If ((AF7E == 0x80000001))
                        {
                            Divide ((Arg0 * 0xFF), 0x64, Local1, Local0)
                            Local1 &= Ones
                            AFN7 (Local0)
                            BRTS = Arg0
                        }
                    }

                    Method (BQCA, 0, NotSerialized)
                    {
                        Return (BRTS) /* \_SB_.PCI0.VGA_.LCD_.BRTS */
                    }

                    Method (BCME, 1, NotSerialized)
                    {
                        If ((OSFL () >= 0x0F))
                        {
                            Local0 = Match (WBCL, MEQ, Arg0, MTR, Zero, 0x02)
                            If ((Local0 < SizeOf (PWMP)))
                            {
                                Local0 = ToInteger (DerefOf (PWMP [Local0]))
                                ^^^SBRG.EC.BRTP = Local0
                            }

                            Return (Zero)
                        }

                        If ((Arg0 == 0x14))
                        {
                            Local0 = Zero
                        }

                        If ((Arg0 == 0x1E))
                        {
                            Local0 = One
                        }

                        If ((Arg0 == 0x28))
                        {
                            Local0 = 0x02
                        }

                        If ((Arg0 == 0x32))
                        {
                            Local0 = 0x03
                        }

                        If ((Arg0 == 0x3C))
                        {
                            Local0 = 0x04
                        }

                        If ((Arg0 == 0x46))
                        {
                            Local0 = 0x05
                        }

                        If ((Arg0 == 0x50))
                        {
                            Local0 = 0x06
                        }

                        If ((Arg0 == 0x5A))
                        {
                            Local0 = 0x07
                        }

                        If ((Arg0 == 0x64))
                        {
                            Local0 = 0x08
                        }

                        ^^^SBRG.EC.BRLV = Local0
                        Return (Zero)
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
                        If ((OSFL () >= 0x0F))
                        {
                            Return (WBCL) /* \_SB_.PCI0.VGA_.LCD_.WBCL */
                        }

                        Return (PBCL) /* \_SB_.PCI0.VGA_.LCD_.PBCL */
                    }

                    Method (BQCE, 0, NotSerialized)
                    {
                        If ((OSFL () >= 0x0F))
                        {
                            Local0 = 0x64
                            Local1 = ^^^SBRG.EC.BRTP /* \_SB_.PCI0.SBRG.EC__.BRTP */
                            Local1 = Match (PWMP, MEQ, Local1, MTR, Zero, 0x02)
                            If ((Local1 < SizeOf (WBCL)))
                            {
                                Local0 = ToInteger (DerefOf (WBCL [Local1]))
                            }

                            Return (Local0)
                        }

                        Local0 = ^^^SBRG.EC.BRLV /* \_SB_.PCI0.SBRG.EC__.BRLV */
                        Local0 += 0x02
                        Local1 = DerefOf (PBCL [Local0])
                        Return (Local1)
                    }

                    Mutex (MUTE, 0x00)
                    Method (RBPE, 1, NotSerialized)
                    {
                        Acquire (MUTE, 0xFFFF)
                        Local0 = (Arg0 + PEBS) /* \PEBS */
                        OperationRegion (PCFG, SystemMemory, Local0, One)
                        Field (PCFG, ByteAcc, NoLock, Preserve)
                        {
                            XCFG,   8
                        }

                        Release (MUTE)
                        Return (XCFG) /* \_SB_.PCI0.VGA_.LCD_.RBPE.XCFG */
                    }

                    Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                    {
                        If ((RBPE (0x000A0008) >= 0x15))
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
                        If ((RBPE (0x000A0008) >= 0x15))
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
                        If ((RBPE (0x000A0008) >= 0x15))
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
                Notify (\_SB.PCI0.PE21, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L11, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE22, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L12, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE23, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE20, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0PC, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.OHC1, 0x02) // Device Wake
                Notify (\_SB.PCI0.EHC1, 0x02) // Device Wake
                Notify (\_SB.PCI0.OHC2, 0x02) // Device Wake
                Notify (\_SB.PCI0.EHC2, 0x02) // Device Wake
                Notify (\_SB.PCI0.OHC3, 0x02) // Device Wake
                Notify (\_SB.PCI0.EHC3, 0x02) // Device Wake
                Notify (\_SB.PCI0.OHC4, 0x02) // Device Wake
                Notify (\_SB.PCI0.XHC0, 0x02) // Device Wake
                Notify (\_SB.PCI0.XHC1, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
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
            Local1 = PD64 /* \_SB_.PD64 */
            Local1 &= Ones
            PIRE = 0x1F
            PIRF = 0x1F
            PIRG = 0x1F
            PIRH = 0x1F
        }

        Method (INTA, 1, NotSerialized)
        {
            PIRA = Arg0
            HDAD = Arg0
            GEC = Arg0
            GPP0 = Arg0
            GPP0 = Arg0
        }

        Method (INTB, 1, NotSerialized)
        {
            PIRB = Arg0
            USB2 = Arg0
            USB4 = Arg0
            USB6 = Arg0
            GPP1 = Arg0
            IDE = Arg0
        }

        Method (INTC, 1, NotSerialized)
        {
            PIRC = Arg0
            USB1 = Arg0
            USB3 = Arg0
            USB5 = Arg0
            USB7 = Arg0
            GPP2 = Arg0
        }

        Method (INTD, 1, NotSerialized)
        {
            PIRD = Arg0
            SATA = Arg0
            GPP3 = Arg0
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
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
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
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRA) /* \_SB_.PIRA */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                INTA (Local0)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
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
                Return (PRSB) /* \_SB_.PRSB */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRB) /* \_SB_.PIRB */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                INTB (Local0)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
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
                Return (PRSC) /* \_SB_.PRSC */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRC) /* \_SB_.PIRC */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                INTC (Local0)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
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
                Return (PRSD) /* \_SB_.PRSD */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRD) /* \_SB_.PIRD */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                INTD (Local0)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
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
                Return (PRSE) /* \_SB_.PRSE */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRE = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRE) /* \_SB_.PIRE */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (PIRE, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
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
                Return (PRSF) /* \_SB_.PRSF */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRF = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRF) /* \_SB_.PIRF */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
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
                Return (PRSG) /* \_SB_.PRSG */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRG = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRG) /* \_SB_.PIRG */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
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
                Return (PRSH) /* \_SB_.PRSH */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRH = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRH) /* \_SB_.PIRH */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            OSFL ()
            If ((RVID <= 0x13)) {}
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
                    Debug = "RRIO"
                }

                Method (RDMA, 3, NotSerialized)
                {
                    Debug = "rDMA"
                }
            }
        }
    }

    Device (HPET)
    {
        Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
        Name (CRS, ResourceTemplate ()
        {
            Memory32Fixed (ReadOnly,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                _Y16)
        })
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (((HPAD & One) == One))
            {
                If ((OSVR >= 0x0C))
                {
                    Return (0x0F)
                }

                HPAD = (HPAD & 0xFFFFFFE0)
                Return (One)
            }

            Return (One)
        }

        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            CreateDWordField (CRS, \HPET._Y16._BAS, HPT)  // _BAS: Base Address
            HPT = 0xFED00000
            Return (CRS) /* \HPET.CRS_ */
        }
    }

    Scope (_SB.PCI0)
    {
        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                If (((SUPP & 0x16) != 0x16))
                {
                    CTRL &= 0x1E
                }

                If (!PEHP)
                {
                    CTRL &= 0x1E
                }

                If (!SHPC)
                {
                    CTRL &= 0x1D
                }

                If (!PEPM)
                {
                    CTRL &= 0x1B
                }

                If (!PEER)
                {
                    CTRL &= 0x15
                }

                If (!PECS)
                {
                    CTRL &= 0x0F
                }

                If (OSCF)
                {
                    If (~(CDW1 & One))
                    {
                        If ((CTRL & One)) {}
                        If ((CTRL & 0x04))
                        {
                            EPNM = One
                        }
                        Else
                        {
                            EPNM = Zero
                        }

                        If ((CTRL & 0x10)) {}
                    }
                }

                If ((Arg1 != One))
                {
                    CDW1 |= 0x08
                }

                If ((CDW3 != CTRL))
                {
                    CDW1 |= 0x10
                }

                CDW3 = CTRL /* \_SB_.PCI0._OSC.CTRL */
                Return (Arg3)
            }
            Else
            {
                CDW1 |= 0x04
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
                If ((Arg0 == Zero))
                {
                    Return (AF00 ())
                }

                If ((Arg0 == One))
                {
                    Return (AF01 ())
                }

                If ((Arg0 == 0x02))
                {
                    Return (AF02 ())
                }

                If ((Arg0 == 0x03))
                {
                    Return (AF03 (DerefOf (Arg1 [0x02]), DerefOf (Arg1 [0x04])))
                }
                Else
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateWordField (ATIB, 0x02, VERN)
                    CreateDWordField (ATIB, 0x04, NMSK)
                    CreateDWordField (ATIB, 0x08, SFUN)
                    SSZE = Zero
                    VERN = Zero
                    NMSK = Zero
                    SFUN = Zero
                    Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
                }
            }

            Method (AF00, 0, NotSerialized)
            {
                P80H = 0xF0
                CreateWordField (ATIB, Zero, SSZE)
                CreateWordField (ATIB, 0x02, VERN)
                CreateDWordField (ATIB, 0x04, NMSK)
                CreateDWordField (ATIB, 0x08, SFUN)
                SSZE = 0x0C
                VERN = One
                If ((PXEN == 0x80000000))
                {
                    NMSK = 0x11
                }
                Else
                {
                    NMSK = 0x51
                }

                If ((AF7E == 0x80000001))
                {
                    NMSK |= 0x80
                }

                MSKN = NMSK /* \_SB_.PCI0.VGA_.AF00.NMSK */
                SFUN = 0x07
                Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
            }

            Name (NCOD, 0x81)
            Method (AF01, 0, NotSerialized)
            {
                P80H = 0xF1
                CreateWordField (ATIB, Zero, SSZE)
                CreateDWordField (ATIB, 0x02, VMSK)
                CreateDWordField (ATIB, 0x06, FLGS)
                SSZE = 0x0A
                VMSK = 0x03
                SSZE = 0x0A
                FLGS = One
                Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
            }

            Name (PSBR, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00                           /* .... */
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
                /* 0000 */  0x01, 0x02, 0x80, 0x08, 0x03, 0x81, 0x09, 0x82,  /* ........ */
                /* 0008 */  0x0A, 0x88, 0x0B, 0x89, 0x8A                     /* ..... */
            })
            Method (AF02, 0, NotSerialized)
            {
                P80H = 0xF2
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
                SSZE = 0x0D
                PSBI = PSBR /* \_SB_.PCI0.VGA_.PSBR */
                If (PDSW)
                {
                    P80H = 0x82
                    PDSW = Zero
                }

                If (PEXM)
                {
                    EXPM = SEXM /* \_SB_.PCI0.VGA_.SEXM */
                    SEXM = Zero
                    PEXM = Zero
                }

                If (PTHR)
                {
                    THRM = STHG /* \_SB_.PCI0.VGA_.STHG */
                    THID = STHI /* \_SB_.PCI0.VGA_.STHI */
                    STHG = Zero
                    STHI = Zero
                    PTHR = Zero
                }

                If (PFPS)
                {
                    FPWR = SFPG /* \_SB_.PCI0.VGA_.SFPG */
                    FPWR = SFPI /* \_SB_.PCI0.VGA_.SFPI */
                    SFPG = Zero
                    SFPI = Zero
                    PFPS = Zero
                }

                If (PSPS)
                {
                    SPWR = SSPS /* \_SB_.PCI0.VGA_.SSPS */
                    PSPS = Zero
                }

                If (PXPS)
                {
                    P80H = 0xA2
                    PXPS = Zero
                }

                If (PBRT)
                {
                    P80H = 0xF7
                    PBRT = Zero
                }

                Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
            }

            Method (AF03, 2, NotSerialized)
            {
                P80H = 0xF3
                CreateWordField (ATIB, Zero, SSZE)
                CreateWordField (ATIB, 0x02, SSDP)
                CreateWordField (ATIB, 0x04, SCDP)
                SSDP = Arg0
                SCDP = Arg1
                Name (NXTD, 0x06)
                Name (CIDX, 0x06)
                Local1 = SSDP /* \_SB_.PCI0.VGA_.AF03.SSDP */
                Local1 &= 0x8B
                Local2 = SCDP /* \_SB_.PCI0.VGA_.AF03.SCDP */
                P80H = Local2
                Local0 = Zero
                While ((Local0 < SizeOf (SACT)))
                {
                    Local3 = DerefOf (SACT [Local0])
                    If ((Local3 == Local1))
                    {
                        CIDX = Local0
                        Local0 = SizeOf (SACT)
                    }
                    Else
                    {
                        Local0++
                    }
                }

                Local0 = CIDX /* \_SB_.PCI0.VGA_.AF03.CIDX */
                While ((Local0 < SizeOf (SACT)))
                {
                    Local0++
                    If ((Local0 == SizeOf (SACT)))
                    {
                        Local0 = Zero
                    }

                    Local3 = DerefOf (SACT [Local0])
                    If (((Local3 & Local2) == Local3))
                    {
                        NXTD = Local0
                        Local0 = SizeOf (SACT)
                    }
                }

                If ((NXTD == SizeOf (SACT)))
                {
                    SSDP = Zero
                }
                Else
                {
                    Local0 = NXTD /* \_SB_.PCI0.VGA_.AF03.NXTD */
                    Local3 = DerefOf (SACT [Local0])
                    SSDP &= 0xFFFFFFFFFFFFFF74
                    SSDP |= Local3
                }

                SSZE = 0x04
                P80H = SSDP /* \_SB_.PCI0.VGA_.AF03.SSDP */
                Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
            }

            Method (AFN0, 0, Serialized)
            {
                If ((MSKN & One))
                {
                    CreateBitField (PSBR, Zero, PDSW)
                    PDSW = One
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN3, 2, Serialized)
            {
                If ((MSKN & 0x08))
                {
                    Local0 = Arg0
                    SFPI = Local0
                    Local0 = Arg1
                    SFPG = Local0 &= 0x03
                    CreateBitField (PSBR, 0x03, PFPS)
                    PFPS = One
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN4, 1, Serialized)
            {
                If ((MSKN & 0x10))
                {
                    Local0 = Arg0
                    Local1 = SSPS /* \_SB_.PCI0.VGA_.SSPS */
                    SSPS = Local0
                    If ((Local0 == Local1)) {}
                    Else
                    {
                        CreateBitField (PSBR, 0x04, PSPS)
                        PSPS = One
                        Notify (VGA, NCOD)
                    }
                }
            }

            Method (AFN5, 0, Serialized)
            {
                If ((MSKN & 0x20))
                {
                    CreateBitField (PSBR, 0x05, PDCC)
                    PDCC = One
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN6, 0, Serialized)
            {
                If ((MSKN & 0x40))
                {
                    CreateBitField (PSBR, 0x06, PXPS)
                    PXPS = One
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN7, 1, Serialized)
            {
                If ((MSKN & 0x80))
                {
                    CreateBitField (PSBR, 0x07, PBRT)
                    PBRT = One
                    CreateByteField (ATIB, 0x0C, BRTL)
                    BRTL = Arg0
                    Notify (VGA, NCOD)
                }
            }

            Name (AT00, Buffer (0xFF) {})
            Name (AT01, Buffer (0x03) {})
            Method (ATCS, 2, Serialized)
            {
                If ((Arg0 == Zero))
                {
                    ATC0 ()
                }

                If ((Arg0 == One))
                {
                    ATC1 ()
                }

                If ((Arg0 == 0x02))
                {
                    ATC2 (Arg1)
                }

                If ((Arg0 == 0x03))
                {
                    ATC3 ()
                }

                If ((Arg0 == 0x04))
                {
                    ATC4 (Arg1)
                }

                Return (AT00) /* \_SB_.PCI0.VGA_.AT00 */
            }

            Method (ATC0, 0, NotSerialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateWordField (AT00, 0x02, INTF)
                CreateDWordField (AT00, 0x04, SUPP)
                SZZE = 0x08
                INTF = One
                SUPP = 0x0F
            }

            Method (ATC1, 0, Serialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateDWordField (AT00, 0x02, VFMK)
                CreateDWordField (AT00, 0x06, FLAG)
                CreateField (AT00, 0x30, One, DOCK)
                SZZE = 0x0A
                VFMK = One
                FLAG = Zero
                DOCK = One
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
                SZZE = 0x03
                RETV = One
                AT00 = ALIB (0x02, Arg0)
            }

            Method (ATC3, 0, Serialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateByteField (AT00, 0x02, RETV)
                CreateWordField (AT01, Zero, SZZB)
                CreateByteField (AT01, 0x02, PSPP)
                SZZE = 0x03
                RETV = One
                SZZB = 0x03
                PSPP = One
                AT00 = ALIB (0x03, AT01)
            }

            Method (ATC4, 1, Serialized)
            {
                CreateField (Arg0, 0x10, 0x03, FUCC)
                CreateField (Arg0, 0x13, 0x06, DEVV)
                CreateByteField (Arg0, 0x03, BUSS)
                CreateByteField (Arg0, 0x04, NULN)
                CreateWordField (AT00, Zero, SZZE)
                CreateByteField (AT00, 0x02, NULM)
                SZZE = 0x03
                NULM = One
                AT00 = ALIB (0x04, Arg0)
            }
        }

        Name (ATPB, Buffer (0x0100) {})
        Name (DSID, 0xFFFFFFFF)
        Name (CNT0, Buffer (0x05)
        {
             0x05, 0x00, 0x00, 0x10, 0x01                     /* ..... */
        })
        Name (CNT1, Buffer (0x05)
        {
             0x05, 0x01, 0x00, 0x00, 0x01                     /* ..... */
        })
        Name (CNT2, Buffer (0x05)
        {
             0x07, 0x03, 0x00, 0x10, 0x02                     /* ..... */
        })
        Name (CNT3, Buffer (0x05)
        {
             0x07, 0x07, 0x00, 0x20, 0x02                     /* ... . */
        })
        Name (CNT4, Buffer (0x05)
        {
             0x00, 0x09, 0x00, 0x30, 0x02                     /* ...0. */
        })
        Name (CNT5, Buffer (0x05)
        {
             0x01, 0x00, 0x01, 0x10, 0x01                     /* ..... */
        })
        Name (CNT6, Buffer (0x05)
        {
             0x01, 0x01, 0x01, 0x00, 0x01                     /* ..... */
        })
        Name (CNT7, Buffer (0x05)
        {
             0x03, 0x03, 0x01, 0x10, 0x02                     /* ..... */
        })
        Name (CNT8, Buffer (0x05)
        {
             0x03, 0x07, 0x01, 0x20, 0x02                     /* ... . */
        })
        Name (CNT9, Buffer (0x05)
        {
             0x00, 0x09, 0x01, 0x30, 0x02                     /* ...0. */
        })
        OperationRegion (REVD, SystemMemory, 0x8D79111D, 0x00010004)
        Field (REVD, AnyAcc, NoLock, Preserve)
        {
            SROM,   32, 
            VROM,   524288
        }

        Name (TVGA, Buffer (0x00010000)
        {
             0x00                                             /* . */
        })
        Method (ATRM, 2, Serialized)
        {
            Local0 = (Arg0 + Arg1)
            If ((Local0 <= SROM))
            {
                Local1 = (Arg1 * 0x08)
                Local2 = (Arg0 * 0x08)
                TVGA = VROM /* \_SB_.PCI0.VGA_.VROM */
                CreateField (TVGA, Local2, Local1, TEMP)
                Name (RETB, Buffer (Arg1) {})
                RETB = TEMP /* \_SB_.PCI0.VGA_.ATRM.TEMP */
                Return (RETB) /* \_SB_.PCI0.VGA_.ATRM.RETB */
            }
            ElseIf ((Arg0 < SROM))
            {
                Local3 = (SROM - Arg0)
                Local1 = (Local3 * 0x08)
                Local2 = (Arg0 * 0x08)
                TVGA = VROM /* \_SB_.PCI0.VGA_.VROM */
                CreateField (TVGA, Local2, Local1, TEM)
                Name (RETC, Buffer (Local3) {})
                RETC = TEM /* \_SB_.PCI0.VGA_.ATRM.TEM_ */
                Return (RETC) /* \_SB_.PCI0.VGA_.ATRM.RETC */
            }
            Else
            {
                Name (RETD, Buffer (One) {})
                Return (RETD) /* \_SB_.PCI0.VGA_.ATRM.RETD */
            }
        }

        Method (ATPX, 2, Serialized)
        {
            If ((Arg0 == Zero))
            {
                Return (PX00 ())
            }

            If ((Arg0 == One))
            {
                Return (PX01 ())
            }

            If ((Arg0 == 0x02))
            {
                PX02 (DerefOf (Arg1 [0x02]))
                Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
            }

            If ((Arg0 == 0x03))
            {
                PX03 (DerefOf (Arg1 [0x02]))
                Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
            }

            If ((Arg0 == 0x04))
            {
                PX04 (DerefOf (Arg1 [0x02]))
                Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
            }

            If ((Arg0 == 0x08))
            {
                Return (PX08 ())
            }

            If ((Arg0 == 0x09))
            {
                Return (PX09 ())
            }

            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, VERN)
            CreateDWordField (ATPB, 0x04, SFUN)
            SSZE = Zero
            VERN = Zero
            SFUN = Zero
            Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
        }

        Method (PX00, 0, NotSerialized)
        {
            P80H = 0xE0
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, VERN)
            CreateDWordField (ATPB, 0x04, SFUN)
            SSZE = 0x08
            VERN = One
            If ((PXEN == 0x80000000))
            {
                SFUN = Zero
                Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
            }

            If ((PXMX == 0x80000000))
            {
                SFUN = 0x018F
            }
            Else
            {
                SFUN = 0x03
            }

            Local0 = ^^PCED.VGA.SVID /* \_SB_.PCI0.PCED.VGA_.SVID */
            If ((Local0 != 0xFFFFFFFF))
            {
                DSID = Local0
            }

            Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
        }

        Method (PX01, 0, NotSerialized)
        {
            P80H = 0xE1
            CreateWordField (ATPB, Zero, SSZE)
            CreateDWordField (ATPB, 0x02, VMSK)
            CreateDWordField (ATPB, 0x06, FLGS)
            SSZE = 0x0A
            VMSK = 0x07FF
            If ((PXMX == 0x80000000))
            {
                FLGS = 0x4B
            }
            Else
            {
                FLGS = Zero
                If ((PXDY == 0x80000001))
                {
                    FLGS |= 0x0680
                }

                If ((PXDY == 0x80000002))
                {
                    FLGS |= 0x0280
                }
            }

            Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
        }

        Method (PX02, 1, NotSerialized)
        {
            CreateWordField (ATPB, Zero, SSZE)
            CreateByteField (ATPB, 0x02, PWST)
            SSZE = 0x03
            Local7 = Buffer (0x05) {}
            CreateWordField (Local7, Zero, SZZE)
            CreateField (Local7, 0x10, 0x03, FUCC)
            CreateField (Local7, 0x13, 0x05, DEVV)
            CreateByteField (Local7, 0x03, BUSS)
            CreateByteField (Local7, 0x04, HPST)
            SZZE = 0x05
            BUSS = Zero
            FUCC = Zero
            Local6 = Buffer (0x04) {}
            CreateByteField (Local6, 0x02, HPOX)
            PWST = (Arg0 & One)
            Name (HPOK, Zero)
            If (PWST)
            {
                P80H = 0x11E2
                ^^PCED.PDC8 = Zero
                ^^PCED.PDS8 = Zero
                ^^PCED.HPC8 = Zero
                DPON ()
                HPOK = Zero
                Sleep (0x64)
                Sleep (0x64)
                DEVV = PXNO /* \PXNO */
                HPST = One
                Local6 = ALIB (0x06, Local7)
                Sleep (0x14)
                Local2 = Zero
                While ((Local2 < 0x0F))
                {
                    ^^PCED.PDC2 = One
                    Local4 = One
                    Local5 = 0xC8
                    While ((Local4 && Local5))
                    {
                        Local0 = ^^PCED.XPRD (0xA5)
                        Local0 &= 0x7F
                        If (((Local0 >= 0x10) && (Local0 != 0x7F)))
                        {
                            Local4 = Zero
                        }
                        Else
                        {
                            Sleep (0x05)
                            Local5--
                        }
                    }

                    If (!Local4)
                    {
                        Local5 = ^^PCED.XPDL ()
                        If (Local5)
                        {
                            ^^PCED.XPRT ()
                            Sleep (0x05)
                            Local2++
                        }
                        Else
                        {
                            Local0 = Zero
                            If ((^^PCED.XPR2 () == Ones))
                            {
                                Local0 = One
                            }

                            If (Local0)
                            {
                                HPOK = One
                                Local2 = 0x10
                            }
                            Else
                            {
                                HPOK = Zero
                                Local2 = 0x10
                            }
                        }
                    }
                    Else
                    {
                        Local2 = 0x10
                    }
                }

                If (!HPOK)
                {
                    P80H = 0x13E2
                    Local1 = ^^PCED.VGA.DVID /* \_SB_.PCI0.PCED.VGA_.DVID */
                    Sleep (0x0A)
                    Local4 = One
                    Local5 = 0x05
                    While ((Local4 && Local5))
                    {
                        Local0 = ^^PCED.XPRD (0xA5)
                        Local0 &= 0x7F
                        If ((Local0 <= 0x04))
                        {
                            Local4 = Zero
                        }
                        Else
                        {
                            Local1 = ^^PCED.VGA.DVID /* \_SB_.PCI0.PCED.VGA_.DVID */
                            Sleep (0x05)
                            Local5--
                        }
                    }

                    DEVV = PXNO /* \PXNO */
                    HPST = Zero
                    ALIB (0x06, Local7)
                }

                P80H = 0x14E2
            }
            Else
            {
                P80H = 0x02E2
                DPOF ()
                ^^PCED.PDC2 = One
                Local1 = ^^PCED.VGA.DVID /* \_SB_.PCI0.PCED.VGA_.DVID */
                Sleep (0x0A)
                Local4 = One
                Local5 = 0x05
                While ((Local4 && Local5))
                {
                    Local0 = ^^PCED.XPRD (0xA5)
                    Local0 &= 0x7F
                    If ((Local0 <= 0x04))
                    {
                        Local4 = Zero
                    }
                    Else
                    {
                        Local1 = ^^PCED.VGA.DVID /* \_SB_.PCI0.PCED.VGA_.DVID */
                        Sleep (0x05)
                        Local5--
                    }
                }

                DEVV = PXNO /* \PXNO */
                HPST = Zero
                ALIB (0x06, Local7)
                HPOK = 0x02
                P80H = 0x04E2
            }

            If (HPOK)
            {
                If (((HPOK == One) && (DSID != 0xFFFFFFFF)))
                {
                    Local1 = DSID /* \_SB_.PCI0.VGA_.DSID */
                    ^^PCED.VGA.SMID = Local1
                    Sleep (0x0A)
                    Sleep (0x0A)
                }
            }
        }

        Method (PX03, 1, NotSerialized)
        {
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, DPSW)
            SSZE = 0x04
            DPSW = (Arg0 & One)
        }

        Method (PX04, 1, NotSerialized)
        {
            P80H = 0xE4
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, ICSW)
            SSZE = 0x04
            ICSW = (Arg0 & One)
        }

        Method (PX08, 0, NotSerialized)
        {
            P80H = 0xE8
            CreateWordField (ATPB, Zero, CNUM)
            CreateWordField (ATPB, 0x02, CSSZ)
            CNUM = 0x0A
            CSSZ = 0x05
            CreateField (ATPB, 0x20, 0x28, CTI0)
            CTI0 = CNT0 /* \_SB_.PCI0.VGA_.CNT0 */
            CreateField (ATPB, 0x48, 0x28, CTI1)
            CTI1 = CNT1 /* \_SB_.PCI0.VGA_.CNT1 */
            CreateField (ATPB, 0x70, 0x28, CTI2)
            CreateByteField (CNT2, Zero, FLG2)
            If ((LCDT == 0x80000001))
            {
                If ((DSCT == 0x80000001))
                {
                    FLG2 = Zero
                }

                If ((DSCT == 0x80000002))
                {
                    FLG2 = 0x07
                }
            }

            CTI2 = CNT2 /* \_SB_.PCI0.VGA_.CNT2 */
            CreateField (ATPB, 0x98, 0x28, CTI3)
            CreateByteField (CNT3, Zero, FLG3)
            If ((LCDT == 0x80000000))
            {
                FLG3 = 0x07
            }

            If ((LCDT == 0x80000001))
            {
                FLG3 = Zero
                If ((DSCT == 0x80000002))
                {
                    FLG3 = Zero
                }
            }

            If ((LCDT == 0x80000002))
            {
                FLG3 = Zero
                If ((DSCT == 0x80000002))
                {
                    FLG3 = 0x07
                }
            }

            CTI3 = CNT3 /* \_SB_.PCI0.VGA_.CNT3 */
            CreateField (ATPB, 0xC0, 0x28, CTI4)
            CTI4 = CNT4 /* \_SB_.PCI0.VGA_.CNT4 */
            CreateField (ATPB, 0xE8, 0x28, CTI5)
            CTI5 = CNT5 /* \_SB_.PCI0.VGA_.CNT5 */
            CreateField (ATPB, 0x0110, 0x28, CTI6)
            CTI6 = CNT6 /* \_SB_.PCI0.VGA_.CNT6 */
            CreateField (ATPB, 0x0138, 0x28, CTI7)
            CreateByteField (CNT7, Zero, FLG7)
            If ((LCDT == 0x80000001))
            {
                If ((DSCT == 0x80000001))
                {
                    FLG7 = Zero
                }

                If ((DSCT == 0x80000002))
                {
                    FLG7 = Zero
                }
            }

            CTI7 = CNT7 /* \_SB_.PCI0.VGA_.CNT7 */
            CreateField (ATPB, 0x0160, 0x28, CTI8)
            CreateByteField (CNT8, Zero, FLG8)
            If ((LCDT == 0x80000000))
            {
                FLG8 = 0x07
            }

            If ((LCDT == 0x80000001))
            {
                FLG8 = Zero
            }

            If ((LCDT == 0x80000002))
            {
                FLG8 = Zero
            }

            If ((DSCT == 0x80000002))
            {
                FLG8 = 0x07
            }

            CTI8 = CNT8 /* \_SB_.PCI0.VGA_.CNT8 */
            CreateField (ATPB, 0x0188, 0x28, CTI9)
            CreateByteField (CNT9, Zero, FLG9)
            If ((DSCT == 0x80000002))
            {
                FLG9 = 0x07
            }

            CTI9 = CNT9 /* \_SB_.PCI0.VGA_.CNT9 */
            Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
        }

        Method (PX09, 0, NotSerialized)
        {
            P80H = 0xE9
            CreateWordField (ATPB, Zero, CNUM)
            CreateWordField (ATPB, 0x02, CSSZ)
            CNUM = Zero
            CSSZ = Zero
            CreateByteField (ATPB, 0x04, ATI0)
            CreateByteField (ATPB, 0x05, HPD0)
            CreateByteField (ATPB, 0x06, DDC0)
            ATI0 = Zero
            HPD0 = Zero
            DDC0 = Zero
            CreateByteField (ATPB, 0x07, ATI1)
            CreateByteField (ATPB, 0x08, HPD1)
            CreateByteField (ATPB, 0x09, DDC1)
            ATI1 = Zero
            HPD1 = Zero
            DDC1 = Zero
            Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
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
        GBFO = Zero
        GBFE = Zero
        GC0O = Zero
        GC0E = Zero
        Sleep (0x0A)
        GC0O = One
        GC0E = Zero
        Sleep (0x0A)
        G37O = One
        G37E = Zero
        Sleep (0x0A)
        G33M = 0x02
        While ((G33I == Zero)) {}
        \_SB.PCI0.SBRG.EC.DGEN = One
        Sleep (0x64)
        GBFO = One
        GBFE = Zero
        P80H = 0x12E2
    }

    Method (DPOF, 0, NotSerialized)
    {
        \_SB.PCI0.SBRG.EC.DGEN = Zero
        GBFO = Zero
        GBFE = Zero
        G37O = Zero
        G37E = Zero
        Sleep (0x0A)
        GC0O = Zero
        GC0E = Zero
        P80H = 0x03E2
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
                TYPE = DAT0 /* \_PR_.P000._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
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
                TYPE = DAT0 /* \_PR_.P001._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
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
                TYPE = DAT0 /* \_PR_.P002._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
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
                TYPE = DAT0 /* \_PR_.P003._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
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
        DBG8 = Arg0
        If ((Arg0 == 0x03))
        {
            \_SB.PCI0.SBRG.EC.AUTO = 0x03
            Sleep (0x0190)
        }

        If (((Arg0 == 0x04) && (OSFL () == 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        WAKP [Zero] = Zero
        WAKP [One] = Zero
        WSSB = ASSB /* \ASSB */
        WOTB = AOTB /* \AOTB */
        WAXB = AAXB /* \AAXB */
        ASSB = Arg0
        AOTB = OSFL ()
        AAXB = Zero
        \_SB.SLPS = One
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        DBG8 = (Arg0 << 0x04)
        WAK (Arg0)
        If (ASSB)
        {
            ASSB = WSSB /* \WSSB */
            AOTB = WOTB /* \WOTB */
            AAXB = WAXB /* \WAXB */
        }

        If (DerefOf (WAKP [Zero]))
        {
            WAKP [One] = Zero
        }
        Else
        {
            WAKP [One] = Arg0
        }

        Return (WAKP) /* \WAKP */
    }

    Device (OMSC)
    {
        Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
        Name (_UID, 0x0E11)  // _UID: Unique ID
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
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

