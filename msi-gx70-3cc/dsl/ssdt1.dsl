/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161222-64
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt1.dat, Tue Jan 10 23:51:03 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001F6E (8046)
 *     Revision         0x02
 *     Checksum         0xF1
 *     OEM ID           "AMD   "
 *     OEM Table ID     "PUMORI  "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x04000000 (67108864)
 */
DefinitionBlock ("", "SSDT", 2, "AMD   ", "PUMORI  ", 0x00000001)
{
    /*
     * iASL Warning: There was 1 external control method found during
     * disassembly, but only 0 were resolved (1 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods. Note: SSDTs can be dynamically loaded at
     * runtime and may or may not be available via the host OS.
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
    External (_SB_.ALIC, MethodObj)    // Warning: Unknown method, guessing 2 arguments

    Scope (\_SB)
    {
        Name (A001, 0x06)
        Name (AD02, 0x03)
        Alias (AD02, A027)
        Name (AD03, 0x01)
        Alias (AD03, A028)
        Name (AD04, 0x00)
        Alias (AD04, A029)
        Name (AD05, 0x03)
        Alias (AD05, A030)
        Name (AD06, Package (0x08)
        {
            0x00, 
            0x02, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x02, 
            0x00
        })
        Alias (AD06, A031)
        Name (AD08, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Alias (AD08, A032)
        Name (A033, 0x00)
        Name (A034, 0x00)
        Name (A035, 0x01)
        Name (A036, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A037, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A038, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (AD09, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Alias (AD09, A016)
        Name (A039, Package (0x08)
        {
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01
        })
        Name (A040, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A014, 0x00)
        Name (AD10, Package (0x04)
        {
            0x6C, 
            0x48, 
            0x42, 
            0x3C
        })
        Alias (AD10, A042)
        Method (A043, 1, Serialized)
        {
            Local1 = DerefOf (Arg0 [0x02])
            Local0 = A003 ()
            A034 = Local1
            Local2 = ((0x01 << 0x05) | (0x01 << 0x06))
            Local3 = ((A034 << 0x05) | (A035 << 0x06))
            A004 (0x00, 0x60, 0xF4, ~Local2, (Local2 & Local3))
            If ((Local1 == Local0))
            {
                Return (0x00)
            }

            A011 (A034)
            If ((A027 == 0x04))
            {
                A002 (0x01)
            }

            If (((A027 <= 0x01) || (A027 >= 0x04)))
            {
                Return (0x00)
            }

            If ((A033 == 0x00))
            {
                Return (0x00)
            }

            A044 ()
            Return (0x00)
        }

        Method (A045, 1, NotSerialized)
        {
            Local7 = A046 (Arg0)
            Local0 = DerefOf (Local7 [0x02])
            If ((Local0 != 0x02))
            {
                Return (Local7)
            }

            A044 ()
            Return (Local7)
        }

        Method (A046, 1, NotSerialized)
        {
            Name (A047, 0x00)
            A014 = 0x00
            Local7 = Buffer (0x0A) {}
            CreateWordField (Local7, 0x00, A048)
            A048 = 0x03
            CreateByteField (Local7, 0x02, A049)
            A049 = 0x01
            If (((A027 <= 0x01) || (A027 >= 0x04)))
            {
                Return (Local7)
            }

            If ((A033 == 0x00))
            {
                Return (Local7)
            }

            CreateWordField (Arg0, 0x02, A050)
            CreateWordField (Arg0, 0x04, A051)
            CreateWordField (Arg0, 0x06, A052)
            CreateByteField (Arg0, 0x08, A053)
            CreateByteField (Arg0, 0x09, A054)
            A047 = ((A050 >> 0x08) & 0xFF)
            While ((A014 <= A001))
            {
                If ((A015 (A014) == 0x01))
                {
                    Local1 = A012 (((A014 + 0x02) << 0x03), 0x18)
                    Local2 = ((Local1 >> 0x10) & 0xFF)
                    Local1 = ((Local1 >> 0x08) & 0xFF)
                    If (((A047 >= Local1) && (A047 <= Local2)))
                    {
                        Break
                    }
                }

                A014++
            }

            If ((A014 > A001))
            {
                Return (Local7)
            }

            If ((DerefOf (A036 [A014]) == 0x00))
            {
                A036 [A014] = A050 /* \_SB_.A046.A050 */
            }
            ElseIf ((DerefOf (A036 [A014]) != A050))
            {
                Return (Local7)
            }

            A040 [A014] = 0x00
            If ((A054 == 0x00))
            {
                A036 [A014] = 0x00
            }

            If ((A054 == 0x01))
            {
                A040 [A014] = 0x01
            }

            If ((A054 == 0x02))
            {
                A038 [A014] = 0x01
            }

            If ((A054 == 0x03))
            {
                A038 [A014] = 0x02
            }

            If (((A051 & A052) == 0x01))
            {
                A038 [A014] = DerefOf (A031 [A014])
            }

            A049 = 0x02
            Return (Local7)
        }

        Method (A015, 1, Serialized)
        {
            If ((DerefOf (A031 [Arg0]) == 0x00))
            {
                Return (0x00)
            }

            Return (0x01)
        }

        Method (A055, 1, Serialized)
        {
            Local7 = Buffer (0x0100) {}
            Local7 [0x00] = 0x03
            Local7 [0x01] = 0x00
            Local7 [0x02] = 0x00
            A033 = DerefOf (Arg0 [0x02])
            Local0 = A007 (0x00, 0x60, 0xF4)
            If ((A033 == 0x01))
            {
                If (((Local0 & 0x01) == 0x01))
                {
                    Return (Local7)
                }

                Local0 |= 0x01
            }

            If ((A033 == 0x00))
            {
                If (((Local0 & 0x01) == 0x00))
                {
                    Return (Local7)
                }

                Local0 &= ~0x01
            }

            Local0 |= (A027 << 0x01)
            A006 (0x00, 0x60, 0xF4, Local0)
            A056 (RefOf (A037), RefOf (A036))
            A011 (A034)
            If ((A027 == 0x04))
            {
                A002 (0x01)
            }

            If (((A027 > 0x01) && (A027 < 0x04)))
            {
                If ((A027 == 0x02))
                {
                    A056 (RefOf (A031), RefOf (A016))
                    A014 = 0x00
                    While ((A014 <= A001))
                    {
                        If ((DerefOf (A032 [A014]) != 0x00))
                        {
                            A016 [A014] = DerefOf (A032 [A014])
                        }

                        A014++
                    }
                }
                Else
                {
                    A056 (RefOf (A039), RefOf (A016))
                    A016 [0x06] = DerefOf (A031 [0x06])
                }

                A044 ()
            }

            Return (Local7)
        }

        Name (A057, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Method (A044, 0, Serialized)
        {
            A014 = 0x00
            A056 (RefOf (A039), RefOf (A057))
            While ((A014 <= A001))
            {
                If ((A015 (A014) == 0x01))
                {
                    A057 [A014] = A058 (A014)
                }

                A014++
            }

            If ((Match (A040, MEQ, 0x01, MTR, 0x00, 0x00) != Ones))
            {
                A056 (RefOf (A039), RefOf (A057))
            }

            If ((Match (A057, MEQ, 0x02, MTR, 0x00, 0x00) != Ones))
            {
                A059 (0x02, 0x01)
                A002 (0x02)
            }

            A014 = 0x00
            While ((A014 <= A001))
            {
                If ((A015 (A014) == 0x00))
                {
                    A014++
                }
                Else
                {
                    Local0 = DerefOf (A016 [A014])
                    Local2 = DerefOf (A057 [A014])
                    If ((Local0 == Local2))
                    {
                        A014++
                    }
                    Else
                    {
                        A016 [A014] = Local2
                        A060 (A014, Local2)
                        A014++
                    }
                }
            }

            If ((Match (A057, MEQ, 0x02, MTR, 0x00, 0x00) == Ones))
            {
                A002 (0x01)
                A059 (0x01, 0x00)
            }

            A013 ()
        }

        Method (A058, 1, NotSerialized)
        {
            Local0 = 0x02
            Local1 = A003 ()
            If ((DerefOf (A036 [Arg0]) == 0x00))
            {
                If (((Local1 == 0x01) || (A027 == 0x03)))
                {
                    Local0 = 0x01
                }

                If (((Local1 == 0x00) && (A027 == 0x03)))
                {
                    If ((Arg0 == 0x06))
                    {
                        Local0 = 0x02
                    }
                }

                If ((DerefOf (A032 [Arg0]) != 0x00))
                {
                    Local0 = DerefOf (A032 [Arg0])
                }
            }
            Else
            {
                Local0 = DerefOf (A038 [Arg0])
            }

            Local2 = DerefOf (A031 [A014])
            If ((Local2 < Local0))
            {
                Local0 = Local2
            }

            Return (Local0)
        }

        Method (A060, 2, NotSerialized)
        {
            If ((Arg0 == 0x06))
            {
                A004 (0x00, 0x60, 0x80, ~0x40, 0x40)
            }

            A061 (Arg0, Arg1)
            If ((DerefOf (A036 [Arg0]) != 0x00))
            {
                A062 (Arg0, 0xA1, ~0x1000, 0x00)
            }
            Else
            {
                A062 (Arg0, 0xA1, ~0x1000, 0x1000)
            }

            Local1 = ((Arg0 + 0x02) << 0x03)
            Local3 = (A063 (Arg0, 0xA5) & 0x3F)
            A064 (Arg0, 0x01, Local3)
            If ((Local3 >= 0x10))
            {
                A065 (Arg0)
                Local2 = 0x01
                While (Local2)
                {
                    A066 (Local1, 0x68, ~0x00, 0x20)
                    Sleep (0x1E)
                    While ((A012 (Local1, 0x68) & 0x08000000))
                    {
                        Sleep (0x0A)
                    }

                    Local2 = 0x00
                    If ((Arg1 == 0x01))
                    {
                        If ((A067 (Arg0) != 0x01))
                        {
                            Local2 = 0x01
                        }
                    }
                }

                A068 (Arg0)
            }
            Else
            {
            }

            If ((Arg0 == 0x06))
            {
                A004 (0x00, 0x60, 0x80, ~0x40, 0x00)
            }
        }

        Name (A069, Package (0x09)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A070, 0x00)
        Name (A071, 0x00)
        Name (A072, 0x00)
        Method (A065, 1, Serialized)
        {
            A070 = 0x00
            A071 = 0x00
            Local1 = ((Arg0 + 0x02) << 0x03)
            If ((Arg0 == 0x06))
            {
                A069 [0x00] = A073 (0x00, 0x00)
                A073 (0x00, 0x01)
                Return (0x00)
            }

            Local3 = A012 (Local1, 0x18)
            Local3 = ((Local3 >> 0x08) & 0xFF)
            Local2 = (Local3 << 0x08)
            Local3 = A012 (Local2, 0x0C)
            Local3 = ((Local3 >> 0x10) & 0xFF)
            If (((Local3 & 0x80) != 0x00))
            {
                Local0 = 0x07
            }
            Else
            {
                Local0 = 0x00
            }

            Local4 = 0x00
            While ((Local4 <= Local0))
            {
                A070 = A074 ((Local2 + Local4), 0x10)
                If ((A070 == 0x00))
                {
                    Local4++
                }
                Else
                {
                    A070 += 0x10
                    A071 = A012 ((Local2 + Local4), A070)
                    A069 [Local4] = (A071 & 0x0FCB)
                    A066 ((Local2 + Local4), A070, ~0x03, 0x00)
                    Local4++
                }
            }

            A072 = A012 (Local1, 0x68)
            A066 (Local1, 0x68, ~0x03, 0x00)
        }

        Method (A068, 1, Serialized)
        {
            A070 = 0x00
            A071 = 0x00
            If ((Arg0 == 0x06))
            {
                A073 (DerefOf (A069 [0x00]), 0x01)
                Return (0x00)
            }

            Local1 = ((Arg0 + 0x02) << 0x03)
            Local3 = A012 (Local1, 0x18)
            Local3 = ((Local3 >> 0x08) & 0xFF)
            A066 (Local1, 0x68, ~0x03, (A072 & 0x03))
            Local2 = (Local3 << 0x08)
            Local3 = A012 (Local2, 0x0C)
            Local3 = ((Local3 >> 0x10) & 0xFF)
            If (((Local3 & 0x80) != 0x00))
            {
                Local0 = 0x07
            }
            Else
            {
                Local0 = 0x00
            }

            Local4 = 0x00
            While ((Local4 <= Local0))
            {
                A070 = A074 ((Local2 + Local4), 0x10)
                If ((A070 == 0x00))
                {
                    Local4++
                }
                Else
                {
                    A070 += 0x10
                    A026 ((Local2 + Local4), A070, DerefOf (A069 [Local4]))
                    Local4++
                }
            }
        }

        Method (A061, 2, NotSerialized)
        {
            Local0 = ((Arg0 + 0x02) << 0x03)
            If ((Arg1 == 0x01))
            {
                A066 (Local0, 0x88, ~0x2F, 0x21)
                A062 (Arg0, 0xA4, ~0x20000001, 0x00)
            }
            Else
            {
                A062 (Arg0, 0xA4, ~0x20000001, 0x20000001)
                A066 (Local0, 0x88, ~0x2F, 0x02)
            }
        }

        Method (A056, 2, NotSerialized)
        {
            Local1 = SizeOf (Arg0)
            Local0 = 0x00
            While ((Local0 < Local1))
            {
                DerefOf (Arg1) [Local0] = DerefOf (DerefOf (Arg0) [Local0])
                Local0++
            }
        }

        Method (A003, 0, NotSerialized)
        {
            Return ((A034 & A035))
        }

        Name (A019, 0x00)
        Name (A020, 0x00)
        Name (A021, 0x00)
        Name (A022, 0x00)
        Name (A023, 0x00)
        Name (A075, 0x00)
        Name (A076, 0x00)
        Name (A077, Buffer (0x10)
        {
            /* 0000 */  0x01, 0x02, 0x04, 0x04, 0x08, 0x08, 0x08, 0x08,  /* ........ */
            /* 0008 */  0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10   /* ........ */
        })
        Method (A078, 1, NotSerialized)
        {
            Name (A047, 0x00)
            Name (A079, 0x00)
            A014 = 0x00
            Local7 = Buffer (0x0A) {}
            A047 = DerefOf (Arg0 [0x03])
            A079 = DerefOf (Arg0 [0x04])
            Local7 [0x00] = 0x03
            Local7 [0x01] = 0x00
            Local7 [0x02] = A079 /* \_SB_.A078.A079 */
            Return (Local7)
            While ((A014 <= A001))
            {
                If ((A015 (A014) == 0x01))
                {
                    Local1 = A012 (((A014 + 0x02) << 0x03), 0x18)
                    Local2 = ((Local1 >> 0x10) & 0xFF)
                    Local1 = ((Local1 >> 0x08) & 0xFF)
                    If (((A047 >= Local1) && (A047 <= Local2)))
                    {
                        Break
                    }
                }

                A014++
            }

            If ((A014 > A001))
            {
                Return (Local7)
            }

            If ((A080 (A014, 0x01) <= A079))
            {
                Return (Local7)
            }

            Local1 = DerefOf (A077 [A079])
            A081 (A014, 0x01, 0x00)
            A081 (A014, 0x02, Local1)
            A013 ()
            Local7 [0x02] = Local1
            Return (Local7)
        }

        Method (A082, 1, Serialized)
        {
            Local0 = DerefOf (Arg0 [0x04])
            Local1 = DerefOf (Arg0 [0x02])
            Local4 = ((Local1 >> 0x03) - 0x02)
            If ((Local0 == 0x01))
            {
                Local2 = 0x06
            }
            Else
            {
                Local2 = 0x04
            }

            Local3 = A012 (Local1, 0x68)
            A066 (Local1, 0x68, ~0x03, 0x00)
            Local0 = A083 (Local4, Local2)
            A066 (Local1, 0x68, ~0x03, (Local3 & 0x03))
            A013 ()
            Local7 = Buffer (0x0A) {}
            CreateWordField (Local7, 0x00, A048)
            CreateByteField (Local7, 0x02, A049)
            CreateByteField (Local7, 0x03, A084)
            A048 = 0x04
            A049 = 0x00
            A084 = Local0
            Return (Local7)
        }

        Name (A085, Buffer (0x0A)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
            /* 0008 */  0x00, 0x00                                       /* .. */
        })
        Method (A083, 2, Serialized)
        {
            Local4 = 0x00
            Local7 = A018 (Arg0)
            Local1 = DerefOf (Local7 [0x07])
            If ((Local1 != 0x01))
            {
                Return (Local4)
            }

            Local2 = Arg1
            While ((Local2 != 0x08))
            {
                Local5 = 0x01
                If ((Local2 == 0x06))
                {
                    A032 [Arg0] = 0x00
                    A062 (Arg0, 0xA2, ~0x2000, 0x00)
                    If (((A027 > 0x01) && (A027 < 0x04)))
                    {
                        A035 = 0x00
                        A044 ()
                    }
                    Else
                    {
                        A061 (Arg0, DerefOf (A031 [Arg0]))
                    }

                    A081 (Arg0, 0x01, 0x00)
                    A086 (Arg0, 0x00)
                    Local2 = 0x01
                    Local3 = 0x00
                }

                If ((Local2 == 0x01))
                {
                    Local1 = (A063 (Arg0, 0xA5) & 0x3F)
                    If ((Local1 > 0x04))
                    {
                        Local2 = 0x02
                        Local3 = 0x00
                        Local5 = 0x00
                    }
                    ElseIf ((Local3 < 0x50))
                    {
                        Sleep (0x01)
                        Local3++
                    }
                    Else
                    {
                        Local2 = 0x04
                    }
                }

                If (((Local5 == 0x01) && (Local2 == 0x02)))
                {
                    Local1 = A063 (Arg0, 0xA5)
                    Local1 &= 0x3F
                    If (((Local1 >= 0x10) && (Local1 <= 0x13)))
                    {
                        Local2 = 0x05
                        Local5 = 0x00
                    }
                    ElseIf ((Local3 < 0x50))
                    {
                        Sleep (0x01)
                        Local3++
                        Local5 = 0x00
                    }
                    Else
                    {
                        Local2 = 0x04
                        If ((DerefOf (A032 [Arg0]) == 0x01))
                        {
                            Local5 = 0x00
                        }
                        ElseIf ((A087 (Arg0) == 0x01))
                        {
                            A062 (Arg0, 0xA2, ~0x2000, 0x2000)
                            A032 [Arg0] = 0x01
                            A061 (Arg0, 0x01)
                            Local2 = 0x07
                        }
                    }
                }

                If (((Local5 == 0x01) && (Local2 == 0x04)))
                {
                    A086 (Arg0, 0x01)
                    A081 (Arg0, 0x00, 0x00)
                    A088 (Arg0)
                    Local0 = ((Arg0 + 0x02) << 0x03)
                    Local1 = A012 (Local0, 0x18)
                    Local1 = ((Local1 >> 0x08) & 0xFF)
                    Local0 = (Local1 << 0x08)
                    Local0 = A012 (Local0, 0x00)
                    If ((Local0 == 0xFFFFFFFF)) {}
                    A032 [Arg0] = 0x01
                    Local2 = 0x00
                }

                If (((Local5 == 0x01) && (Local2 == 0x07)))
                {
                    If (CondRefOf (\_SB.ALIC, Local6))
                    {
                        Local1 = ((Arg0 + 0x02) << 0x03)
                        \_SB.ALIC (Local1, 0x00)
                        Sleep (0x02)
                        \_SB.ALIC (Local1, 0x01)
                        Local3 = 0x00
                        Local2 = 0x01
                        Local5 = 0x00
                    }
                    Else
                    {
                        Local2 = 0x04
                    }
                }

                If (((Local5 == 0x01) && (Local2 == 0x05)))
                {
                    Local4 = 0x01
                    Local2 = 0x00
                    A089 (Arg0)
                    A090 (Arg0)
                }

                If (((Local5 == 0x01) && (Local2 == 0x00)))
                {
                    If (((A027 > 0x01) && (A027 < 0x04)))
                    {
                        A035 = 0x01
                        A044 ()
                    }

                    Local2 = 0x08
                }
            }

            Return (Local4)
        }

        Method (A081, 3, Serialized)
        {
            Local7 = A018 (Arg0)
            A019 = DerefOf (Local7 [0x00])
            A020 = DerefOf (Local7 [0x01])
            A021 = DerefOf (Local7 [0x02])
            A022 = DerefOf (Local7 [0x03])
            A076 = A080 (Arg0, 0x01)
            If ((Arg1 == 0x00))
            {
                A091 (Arg0, A021, (A021 + (A076 - 0x01)), 0x01)
                A008 (A019, A020, 0x01)
            }

            If ((Arg1 == 0x01))
            {
                A008 (A019, A020, 0x00)
                A091 (Arg0, A021, (A021 + (A076 - 0x01)), 0x00)
            }

            If ((Arg1 != 0x02))
            {
                Return (0x00)
            }

            If ((Arg2 == 0x00))
            {
                Local2 = A080 (Arg0, 0x00)
            }
            Else
            {
                Local2 = Arg2
            }

            If ((A076 <= Local2))
            {
                Return (0x00)
            }

            Local1 = A092 (Arg0)
            If ((Local1 == 0x00))
            {
                Local3 = (A021 + Local2)
                Local4 = A022 /* \_SB_.A022 */
            }
            Else
            {
                Local4 = (A022 - Local2)
                Local3 = A021 /* \_SB_.A021 */
            }

            A091 (Arg0, Local3, Local4, 0x01)
            If ((A019 > A020))
            {
                Local3 = A020 /* \_SB_.A020 */
                Local4 = A019 /* \_SB_.A019 */
            }
            Else
            {
                Local4 = A020 /* \_SB_.A020 */
                Local3 = A019 /* \_SB_.A019 */
            }

            If ((Local1 == 0x00))
            {
                Local3 += Local2
            }
            Else
            {
                Local4 -= Local2
            }

            A008 (Local3, Local4, 0x01)
            Return (0x00)
        }

        Method (A087, 1, NotSerialized)
        {
            Local1 = Buffer (0x10) {}
            Local0 = 0x00
            While ((Local0 <= 0x03))
            {
                Local2 = A063 (Arg0, (Local0 + 0xA5))
                Local1 [(Local0 * 0x04)] = Local2
                Local1 [((Local0 * 0x04) + 0x01)] = (
                    Local2 >> 0x08)
                Local1 [((Local0 * 0x04) + 0x02)] = (
                    Local2 >> 0x10)
                Local1 [((Local0 * 0x04) + 0x03)] = (
                    Local2 >> 0x18)
                Local0++
            }

            Local0 = 0x00
            While ((Local0 < 0x0F))
            {
                If (((DerefOf (Local1 [Local0]) == 0x2A) && (DerefOf (
                    Local1 [(Local0 + 0x01)]) == 0x09)))
                {
                    Return (0x01)
                }

                Local0++
            }

            Return (0x00)
        }

        Method (A092, 1, Serialized)
        {
            Local7 = A018 (Arg0)
            A019 = DerefOf (Local7 [0x00])
            A020 = DerefOf (Local7 [0x01])
            Local0 = 0x00
            If ((A019 > A020))
            {
                Local0 = 0x01
            }

            Local1 = (A063 (Arg0, 0x50) & 0x01)
            Return (((Local0 ^ Local1) & 0x01))
        }

        Method (A086, 2, NotSerialized)
        {
            Local7 = A018 (Arg0)
            A075 = DerefOf (Local7 [0x04])
            A023 = ((DerefOf (Local7 [(0x05 + 0x01)]) << 
                0x08) | DerefOf (Local7 [0x05]))
            A004 (0x00, 0xE0, ((A023 << 0x10) | (0x0800 + (0x0100 * 
                A075))), ~0x01, Arg1)
        }

        Name (A093, Buffer (0x07)
        {
             0x00, 0x01, 0x02, 0x04, 0x08, 0x0C, 0x10         /* ....... */
        })
        Method (A080, 2, NotSerialized)
        {
            If ((Arg1 == 0x00))
            {
                Local0 = ((A063 (Arg0, 0xA2) >> 0x04) & 0x07)
                Local1 = DerefOf (A093 [Local0])
            }
            Else
            {
                Local7 = A018 (Arg0)
                A019 = DerefOf (Local7 [0x00])
                A020 = DerefOf (Local7 [0x01])
                If ((A019 > A020))
                {
                    Local1 = (A019 - A020) /* \_SB_.A020 */
                }
                Else
                {
                    Local1 = (A020 - A019) /* \_SB_.A019 */
                }

                Local1++
            }

            Return (Local1)
        }

        Method (A091, 4, Serialized)
        {
            Local7 = A018 (Arg0)
            A021 = Arg1
            A022 = Arg2
            A023 = ((DerefOf (Local7 [(0x05 + 0x01)]) << 
                0x08) | DerefOf (Local7 [0x05]))
            If ((A021 > A022))
            {
                Local1 = (A021 - A022) /* \_SB_.A022 */
                Local2 = A022 /* \_SB_.A022 */
            }
            Else
            {
                Local1 = (A022 - A021) /* \_SB_.A021 */
                Local2 = A021 /* \_SB_.A021 */
            }

            Local3 = (((0x01 << (Local1 + 0x01)) - 0x01) << 
                Local2)
            Local4 = ~Local3
            If ((Arg3 == 0x01))
            {
                Local3 = 0x00
            }

            A004 (0x00, 0xE0, ((A023 << 0x10) | 0x8023), Local4, Local3)
            Stall (0x0A)
        }

        Name (A094, Package (0x01)
        {
            Package (0x02)
            {
                0x10831969, 
                0x00
            }
        })
        Method (A089, 1, Serialized)
        {
            Local6 = ((Arg0 + 0x02) << 0x03)
            Local2 = A074 (Local6, 0x10)
            If ((Local2 != 0x00))
            {
                Local0 = A012 (Local6, 0x18)
                Local0 = ((Local0 >> 0x08) & 0xFF)
                Local1 = (Local0 << 0x08)
                Local0 = A012 (Local1, 0x0C)
                Local0 = ((Local0 >> 0x10) & 0xFF)
                If (((Local0 & 0x80) != 0x00))
                {
                    Local4 = 0x07
                }
                Else
                {
                    Local4 = 0x00
                }

                Local3 = 0x08
                Local5 = 0x00
                While ((Local5 <= Local4))
                {
                    Local2 = A074 ((Local1 + Local5), 0x10)
                    If ((Local2 != 0x00))
                    {
                        Local0 = (A012 ((Local1 + Local5), (Local2 + 0x04)) & 0x07)
                        Local6 = A012 ((Local1 + Local5), 0x00)
                        Local7 = 0x00
                        While ((Local7 < SizeOf (A094)))
                        {
                            If ((DerefOf (DerefOf (A094 [Local7]) [0x00]) == Local6))
                            {
                                Local0 = DerefOf (DerefOf (A094 [Local7]) [0x01])
                            }

                            Local7++
                        }

                        If ((Local0 < Local3))
                        {
                            Local3 = Local0
                        }
                    }

                    Local5++
                }

                If ((Local3 != 0x08))
                {
                    Local6 = ((Arg0 + 0x02) << 0x03)
                    Local2 = A074 (Local6, 0x10)
                    Local0 = (A012 (Local6, (Local2 + 0x04)) & 0x07)
                    If ((Local0 < Local3))
                    {
                        Local3 = Local0
                    }

                    Local3 <<= 0x05
                    A066 (Local6, (Local2 + 0x08), ~0xE0, Local3)
                    Local5 = 0x00
                    While ((Local5 <= Local4))
                    {
                        Local2 = A074 ((Local1 + Local5), 0x10)
                        If ((Local2 != 0x00))
                        {
                            A066 (Local1, (Local2 + 0x08), ~0xE0, Local3)
                        }

                        Local5++
                    }
                }
            }
        }

        Method (A088, 1, Serialized)
        {
            Local0 = ((Arg0 + 0x02) << 0x03)
            Local1 = A074 (Local0, 0x10)
            If ((Local1 != 0x00))
            {
                A066 (Local0, (Local1 + 0x08), ~0xE0, 0x00)
            }
        }

        Method (A090, 1, Serialized)
        {
            Local7 = A018 (Arg0)
            Local0 = DerefOf (Local7 [0x09])
            If ((Local0 == 0x00))
            {
                Return (0x00)
            }

            Local1 = ((Arg0 + 0x02) << 0x03)
            Local0 = A012 (Local1, 0x18)
            Local2 = (Local0 & 0xFF00)
            Local0 = A012 (Local2, 0x0C)
            Local0 = ((Local0 >> 0x10) & 0xFF)
            If (((Local0 & 0x80) != 0x00))
            {
                Local3 = 0x07
            }
            Else
            {
                Local3 = 0x00
            }

            Local4 = 0x00
            Local5 = 0x00
            While ((Local4 <= Local3))
            {
                Local6 = A074 ((Local2 | Local4), 0x10)
                If ((Local6 == 0x00))
                {
                    Local4++
                }
                Else
                {
                    If (((A012 ((Local2 | Local4), (Local6 + 0x0C
                        )) & (0x01 << 0x12)) != 0x00))
                    {
                        Local5 = 0x01
                    }
                    Else
                    {
                        Local5 = 0x00
                        Break
                    }

                    Local4++
                }
            }

            If ((Local5 == 0x00))
            {
                Return (0x00)
            }

            Local4 = 0x00
            While ((Local4 <= Local3))
            {
                Local6 = A074 ((Local2 | Local4), 0x10)
                If ((Local6 == 0x00))
                {
                    Local4++
                }
                Else
                {
                    A066 ((Local2 | Local4), (Local6 + 0x10), 0xFFFFFFFF, (0x01 << 
                        0x08))
                    Local4++
                }
            }
        }

        Name (AD01, 0xE0000000)
        Alias (AD01, A095)
        Name (AD07, Package (0x08)
        {
            Buffer (0x0A)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
                /* 0008 */  0x00, 0x00                                       /* .. */
            }, 

            Buffer (0x0A)
            {
                /* 0000 */  0x17, 0x10, 0x00, 0x0F, 0x00, 0x31, 0x01, 0x03,  /* .....1.. */
                /* 0008 */  0x02, 0x00                                       /* .. */
            }, 

            Buffer (0x0A)
            {
                /* 0000 */  0x04, 0x04, 0x04, 0x04, 0x01, 0x30, 0x01, 0x00,  /* .....0.. */
                /* 0008 */  0x02, 0x00                                       /* .. */
            }, 

            Buffer (0x0A)
            {
                /* 0000 */  0x05, 0x05, 0x05, 0x05, 0x02, 0x30, 0x01, 0x00,  /* .....0.. */
                /* 0008 */  0x02, 0x00                                       /* .. */
            }, 

            Buffer (0x0A)
            {
                /* 0000 */  0x06, 0x06, 0x06, 0x06, 0x03, 0x30, 0x01, 0x00,  /* .....0.. */
                /* 0008 */  0x02, 0x00                                       /* .. */
            }, 

            Buffer (0x0A)
            {
                /* 0000 */  0x07, 0x07, 0x07, 0x07, 0x04, 0x30, 0x01, 0x00,  /* .....0.. */
                /* 0008 */  0x02, 0x00                                       /* .. */
            }, 

            Buffer (0x0A)
            {
                /* 0000 */  0x00, 0x03, 0x00, 0x03, 0x00, 0x30, 0x01, 0x00,  /* .....0.. */
                /* 0008 */  0x02, 0x00                                       /* .. */
            }, 

            Buffer (0x0A)
            {
                /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
                /* 0008 */  0x00, 0x00                                       /* .. */
            }
        })
        Alias (AD07, A096)
        Method (A018, 1, NotSerialized)
        {
            Return (DerefOf (A096 [Arg0]))
        }

        Method (A012, 2, Serialized)
        {
            Local0 = (A095 + (Arg0 << 0x0C))
            Local0 += Arg1
            OperationRegion (A097, SystemMemory, Local0, 0x04)
            Field (A097, DWordAcc, NoLock, Preserve)
            {
                A098,   32
            }

            Return (A098) /* \_SB_.A012.A098 */
        }

        Method (A026, 3, Serialized)
        {
            Local0 = (A095 + (Arg0 << 0x0C))
            Local0 += Arg1
            OperationRegion (A097, SystemMemory, Local0, 0x04)
            Field (A097, DWordAcc, NoLock, Preserve)
            {
                A098,   32
            }

            A098 = Arg2
        }

        Method (A066, 4, Serialized)
        {
            Local0 = A012 (Arg0, Arg1)
            Local0 = ((Local0 & Arg2) | Arg3)
            A026 (Arg0, Arg1, Local0)
        }

        Mutex (A099, 0x00)
        Method (A063, 2, NotSerialized)
        {
            Acquire (A099, 0xFFFF)
            Local0 = ((Arg0 + 0x02) << 0x03)
            A026 (Local0, 0xE0, Arg1)
            Local0 = A012 (Local0, 0xE4)
            Release (A099)
            Return (Local0)
        }

        Method (A064, 3, NotSerialized)
        {
            Acquire (A099, 0xFFFF)
            Local0 = ((Arg0 + 0x02) << 0x03)
            A026 (Local0, 0xE0, Arg1)
            A026 (Local0, 0xE4, Arg2)
            Release (A099)
        }

        Method (A062, 4, NotSerialized)
        {
            Local0 = A063 (Arg0, Arg1)
            Local0 = ((Local0 & Arg2) | Arg3)
            A064 (Arg0, Arg1, Local0)
        }

        Mutex (A100, 0x00)
        Method (A007, 3, NotSerialized)
        {
            Acquire (A100, 0xFFFF)
            A026 (Arg0, Arg1, Arg2)
            Local0 = A012 (Arg0, (Arg1 + 0x04))
            Release (A100)
            Return (Local0)
        }

        Method (A006, 4, NotSerialized)
        {
            Acquire (A100, 0xFFFF)
            A026 (Arg0, Arg1, Arg2)
            A026 (Arg0, (Arg1 + 0x04), Arg3)
            Release (A100)
        }

        Method (A004, 5, NotSerialized)
        {
            Local0 = A007 (Arg0, Arg1, Arg2)
            Local0 = ((Local0 & Arg3) | Arg4)
            A006 (Arg0, Arg1, Arg2, Local0)
        }

        Method (A074, 2, NotSerialized)
        {
            Local1 = 0x34
            If ((A012 (Arg0, 0x00) == 0xFFFFFFFF))
            {
                Return (0x00)
            }

            Local0 = 0x01
            While ((Local0 == 0x01))
            {
                Local1 = (A012 (Arg0, Local1) & 0xFF)
                If ((Local1 == 0x00))
                {
                    Break
                }

                If (((A012 (Arg0, Local1) & 0xFF) == Arg1))
                {
                    Local0 = 0x00
                }
                Else
                {
                    Local1++
                }
            }

            Return (Local1)
        }

        Method (A073, 2, Serialized)
        {
            OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
            Field (PMIO, ByteAcc, NoLock, Preserve)
            {
                PMRI,   8, 
                PMRD,   8
            }

            IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
            {
                Offset (0xE0), 
                ABAR,   32
            }

            OperationRegion (ACFG, SystemIO, ABAR, 0x08)
            Field (ACFG, DWordAcc, NoLock, Preserve)
            {
                ABIX,   32, 
                ABDA,   32
            }

            Local0 = 0x00
            If ((Arg1 == 0x00))
            {
                ABIX = 0x80000068
                Local0 = ABDA /* \_SB_.A073.ABDA */
                Return (Local0)
            }
            Else
            {
                ABIX = 0x80000068
                Local0 = ABDA /* \_SB_.A073.ABDA */
                Local0 = ((Local0 & 0xFFFFFFFC) | Arg0)
                ABDA = Local0
            }
        }

        Name (A101, Buffer (0x0100) {})
        Method (ALIB, 2, NotSerialized)
        {
            If ((Arg0 == 0x01))
            {
                Return (A043 (Arg1))
            }

            If ((Arg0 == 0x02))
            {
                Return (A045 (Arg1))
            }

            If ((Arg0 == 0x03))
            {
                Return (A055 (Arg1))
            }

            If ((Arg0 == 0x04))
            {
                Return (A078 (Arg1))
            }

            If ((Arg0 == 0x05))
            {
                Return (A102 ())
            }

            If ((Arg0 == 0x06))
            {
                Return (A082 (Arg1))
            }

            Return (0x00)
        }

        Method (A102, 0, Serialized)
        {
            Return (0x00)
        }

        Method (A005, 1, NotSerialized)
        {
            While (((A007 (0x00, 0xB8, 0xE0003004) & 0x02) != 0x02)) {}
            Local0 = A007 (0x00, 0xB8, 0xE0003000)
            Local0 = ((Local0 & 0xFFFE0000) | (~(Local0 & 0x01)
                 & 0x01))
            Local0 |= (Arg0 << 0x01)
            A006 (0x00, 0xB8, 0xE0003000, Local0)
            While (((A007 (0x00, 0xB8, 0xE0003004) & 0x01) != 0x01)) {}
            While (((A007 (0x00, 0xB8, 0xE0003004) & 0x02) != 0x02)) {}
        }

        Method (A067, 1, NotSerialized)
        {
            Local1 = A063 (Arg0, 0xA4)
            Local2 = (Local1 >> 0x0D)
            Local2 &= 0x03
            Local2++
            Return (Local2)
        }

        Method (A059, 2, Serialized)
        {
            If ((Arg0 == 0x01))
            {
                Local3 = DerefOf (A042 [A029])
            }
            Else
            {
                Local3 = DerefOf (A042 [A028])
            }

            Local5 = A007 (0x00, 0xB8, 0x0001F428)
            If (((Local5 & (0x01 << 0x05)) != 0x00))
            {
                A006 (0x00, 0xB8, 0x0001F428, (Local5 & ~(0x01 << 0x05)
                    ))
                A005 (0x16)
            }

            Local4 = A012 (0xC5, 0x0170)
            If (((Local4 & (0x01 << 0x0E)) == 0x00))
            {
                A026 (0xC5, 0x0170, (Local4 | (0x01 << 0x0E)))
            }

            Local2 = (A007 (0x00, 0xB8, 0xE000203C) & 0x04)
            Local1 = (A007 (0x00, 0xB8, 0xE0002040) & 0x01)
            While (((Local1 << 0x02) != Local2))
            {
                Local1 = (A007 (0x00, 0xB8, 0xE0002040) & 0x01)
            }

            Local1 = A007 (0x00, 0xB8, 0xE000203C)
            If ((Arg0 == 0x01))
            {
                Local1 &= 0xFFFFFFFD
            }
            Else
            {
                Local1 |= 0x02
            }

            A006 (0x00, 0xB8, 0xE000203C, Local1)
            Local1 &= ~(0xFF << 0x08)
            Local1 |= (Local3 << 0x08)
            Local2 = (~Local1 & 0x04)
            Local1 = ((Local1 & ~0x04) | Local2)
            A006 (0x00, 0xB8, 0xE000203C, Local1)
            If ((Arg1 != 0x00))
            {
                While (((Local1 << 0x02) != Local2))
                {
                    Local1 = (A007 (0x00, 0xB8, 0xE0002040) & 0x01)
                }
            }

            If (((Local4 & (0x01 << 0x0E)) == 0x00))
            {
                A026 (0xC5, 0x0170, Local4)
            }

            If (((Local5 & (0x01 << 0x05)) != 0x00))
            {
                A006 (0x00, 0xB8, 0x0001F428, Local5)
                A005 (0x16)
            }
        }

        Method (A002, 1, NotSerialized)
        {
            Local1 = A003 ()
            Local5 = 0x00
            A004 (0x00, 0xB8, 0x0001F300, 0xFFFFFFFE, 0x00)
            A005 (0x09)
            If ((Local1 == 0x00))
            {
                A006 (0x00, 0xB8, 0x0001F954, 0x00)
                A004 (0x00, 0xB8, 0x0001F200, 0xFFFFFFFE, 0x00)
                A004 (0x00, 0xB8, 0x0001F2A0, 0xFFFFFFFE, 0x01)
                A004 (0x00, 0xB8, 0x0001F2C0, 0xFFFFFFFE, 0x01)
                Local6 = 0x00050001
            }
            Else
            {
                If ((Arg0 == 0x01))
                {
                    Local5 = A007 (0x00, 0xB8, 0x0001FE00)
                    A006 (0x00, 0xB8, 0x0001F954, Local5)
                    A004 (0x00, 0xB8, 0x0001F200, 0xFFFFFFFE, 0x01)
                    A004 (0x00, 0xB8, 0x0001F2A0, 0xFFFFFFFE, 0x01)
                    A004 (0x00, 0xB8, 0x0001F2C0, 0xFFFFFFFE, 0x00)
                }
                Else
                {
                    A004 (0x00, 0xB8, 0x0001F200, 0xFFFFFFFE, 0x01)
                    A004 (0x00, 0xB8, 0x0001F2A0, 0xFFFFFFFE, 0x00)
                    A004 (0x00, 0xB8, 0x0001F2C0, 0xFFFFFFFE, 0x01)
                }

                Local6 = 0x01
            }

            A004 (0x00, 0xB8, 0x0001F300, 0xFF00FFFE, Local6)
            A005 (0x09)
        }

        Method (A008, 3, NotSerialized)
        {
            If ((Arg0 > Arg1))
            {
                Local3 = Arg1
                Local4 = Arg0
            }
            Else
            {
                Local3 = Arg0
                Local4 = Arg1
            }

            Local0 = A007 (0x00, 0xB8, 0x0001F39C)
            Local0 &= 0x18
            If ((Arg2 == 0x00))
            {
                Local0 = (((Local4 << 0x18) | (Local3 << 0x10)) | 
                    (Local0 | 0x03))
            }

            If ((Arg2 == 0x01))
            {
                Local0 = (((Local4 << 0x18) | (Local3 << 0x10)) | 
                    (Local0 | 0x03))
            }

            A006 (0x00, 0xB8, 0x0001F39C, Local0)
            A005 ((0x03 - Arg2))
        }

        Method (A009, 1, NotSerialized)
        {
        }

        Name (A010, 0x00)
        Method (A011, 1, NotSerialized)
        {
            If ((A010 == 0x00))
            {
                If ((A012 (0x08, 0x00) == 0xFFFFFFFF))
                {
                    Local1 = (A007 (0x00, 0xB8, 0x0001F428) & 0x02)
                    If ((Local1 == 0x02))
                    {
                        A010 = 0x01
                    }
                }
            }

            If ((A010 == 0x01))
            {
                If ((Arg0 == 0x00))
                {
                    Local0 = 0x20
                }
                Else
                {
                    Local0 = 0x21
                }

                A005 (Local0)
            }
        }

        Method (A013, 0, NotSerialized)
        {
            A014 = 0x00
            Local1 = 0x00
            While ((A014 <= A001))
            {
                If ((A015 (A014) == 0x00))
                {
                    A014++
                }
                Else
                {
                    If ((DerefOf (A016 [A014]) == 0x02))
                    {
                        Local1 |= A017 (A014)
                    }

                    A014++
                }
            }

            Local2 = (Local1 << 0x18)
            Local2 |= ((Local1 >> 0x08) & 0xFF00)
            Local2 |= ((Local1 << 0x08) & 0x00FF0000)
            A006 (0x00, 0xB8, 0x0001F610, Local2)
            A005 (0x08)
        }

        Method (A017, 1, NotSerialized)
        {
            Local7 = A018 (Arg0)
            A019 = DerefOf (Local7 [0x00])
            A020 = DerefOf (Local7 [0x01])
            A021 = DerefOf (Local7 [0x02])
            A022 = DerefOf (Local7 [0x03])
            A023 = ((DerefOf (Local7 [(0x05 + 0x01)]) << 
                0x08) | DerefOf (Local7 [0x05]))
            Local5 = A007 (0x00, 0xE0, ((A023 << 0x10) | 0x8023))
            Local5 >>= A021 /* \_SB_.A021 */
            Local2 = (0x01 << ((A022 - A021) + 0x01))
            Local2 -= 0x01
            Local5 &= Local2
            If ((A019 > A020))
            {
                Local3 = A020 /* \_SB_.A020 */
                Local4 = A019 /* \_SB_.A019 */
                Local1 = ((A022 - A021) - (Local4 - Local3))
            }
            Else
            {
                Local4 = A020 /* \_SB_.A020 */
                Local3 = A019 /* \_SB_.A019 */
                Local1 = 0x00
            }

            Local2 = (0x01 << ((Local4 - Local3) + 0x01))
            Local2 = ((Local2 - 0x01) << Local1)
            Local2 &= ~Local5
            Local2 = ((Local2 - 0x01) << (Local3 - Local1))
            Return (Local2)
        }

        Name (A024, 0x00)
        Name (A025, 0x00)
        Method (AWAK, 1, NotSerialized)
        {
            If ((Arg0 == 0x03))
            {
                If ((A024 == 0x01))
                {
                    Local0 = A012 (0xC5, 0x0170)
                    A026 (0xC5, 0x0170, (Local0 & ~(0x01 << 0x0E)))
                    A024 = 0x00
                }

                If ((A025 == 0x01))
                {
                    Local0 = A007 (0x00, 0xB8, 0x0001F428)
                    A006 (0x00, 0xB8, 0x0001F428, (Local0 | (0x01 << 0x05)))
                    A005 (0x16)
                    A025 = 0x00
                }
            }

            Local1 = A003 ()
            A011 (Local1)
        }

        Method (APTS, 1, NotSerialized)
        {
            If ((Arg0 == 0x03))
            {
                A011 (0x01)
                Local0 = A007 (0x00, 0xB8, 0x0001F428)
                If (((Local0 & (0x01 << 0x05)) != 0x00))
                {
                    A006 (0x00, 0xB8, 0x0001F428, (Local0 & ~(0x01 << 0x05)
                        ))
                    A005 (0x16)
                    A025 = 0x01
                }

                Local0 = A012 (0xC5, 0x0170)
                If (((Local0 & (0x01 << 0x0E)) == 0x00))
                {
                    A026 (0xC5, 0x0170, (Local0 | (0x01 << 0x0E)))
                    A024 = 0x01
                }

                Local2 = A007 (0x00, 0x60, 0xF4)
                Local2 = (Local0 & ~0x01)
                A006 (0x00, 0x60, 0xF4, Local2)
            }
        }
    }
}

