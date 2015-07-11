/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130117-64 [Jul 11 2015]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of ssdt2.dat, Sat Jul 11 16:21:23 2015
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

DefinitionBlock ("ssdt2.aml", "SSDT", 2, "AMD   ", "PUMORI  ", 0x00000001)
{
    External (_SB_.ALIC, MethodObj)    // 6 Arguments

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
            Store (DerefOf (Index (Arg0, 0x02)), Local1)
            Store (A003 (), Local0)
            Store (Local1, A034)
            Or (ShiftLeft (0x01, 0x05), ShiftLeft (0x01, 0x06), Local2)
            Or (ShiftLeft (A034, 0x05), ShiftLeft (A035, 0x06), Local3)
            A004 (0x00, 0x60, 0xF4, Not (Local2), And (Local2, Local3
                ))
            If (LEqual (Local1, Local0))
            {
                Return (0x00)
            }

            A011 (A034)
            If (LEqual (A027, 0x04))
            {
                A002 (0x01)
            }

            If (LOr (LLessEqual (A027, 0x01), LGreaterEqual (A027, 0x04)))
            {
                Return (0x00)
            }

            If (LEqual (A033, 0x00))
            {
                Return (0x00)
            }

            A044 ()
            Return (0x00)
        }

        Method (A045, 1, NotSerialized)
        {
            Store (A046 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x02)), Local0)
            If (LNotEqual (Local0, 0x02))
            {
                Return (Local7)
            }

            A044 ()
            Return (Local7)
        }

        Method (A046, 1, NotSerialized)
        {
            Name (A047, 0x00)
            Store (0x00, A014)
            Store (Buffer (0x0A) {}, Local7)
            CreateWordField (Local7, 0x00, A048)
            Store (0x03, A048)
            CreateByteField (Local7, 0x02, A049)
            Store (0x01, A049)
            If (LOr (LLessEqual (A027, 0x01), LGreaterEqual (A027, 0x04)))
            {
                Return (Local7)
            }

            If (LEqual (A033, 0x00))
            {
                Return (Local7)
            }

            CreateWordField (Arg0, 0x02, A050)
            CreateWordField (Arg0, 0x04, A051)
            CreateWordField (Arg0, 0x06, A052)
            CreateByteField (Arg0, 0x08, A053)
            CreateByteField (Arg0, 0x09, A054)
            And (ShiftRight (A050, 0x08), 0xFF, A047)
            While (LLessEqual (A014, A001))
            {
                If (LEqual (A015 (A014), 0x01))
                {
                    Store (A012 (ShiftLeft (Add (A014, 0x02), 0x03), 0x18), 
                        Local1)
                    And (ShiftRight (Local1, 0x10), 0xFF, Local2)
                    And (ShiftRight (Local1, 0x08), 0xFF, Local1)
                    If (LAnd (LGreaterEqual (A047, Local1), LLessEqual (A047, Local2)))
                    {
                        Break
                    }
                }

                Increment (A014)
            }

            If (LGreater (A014, A001))
            {
                Return (Local7)
            }

            If (LEqual (DerefOf (Index (A036, A014)), 0x00))
            {
                Store (A050, Index (A036, A014))
            }
            Else
            {
                If (LNotEqual (DerefOf (Index (A036, A014)), A050))
                {
                    Return (Local7)
                }
            }

            Store (0x00, Index (A040, A014))
            If (LEqual (A054, 0x00))
            {
                Store (0x00, Index (A036, A014))
            }

            If (LEqual (A054, 0x01))
            {
                Store (0x01, Index (A040, A014))
            }

            If (LEqual (A054, 0x02))
            {
                Store (0x01, Index (A038, A014))
            }

            If (LEqual (A054, 0x03))
            {
                Store (0x02, Index (A038, A014))
            }

            If (LEqual (And (A051, A052), 0x01))
            {
                Store (DerefOf (Index (A031, A014)), Index (A038, A014))
            }

            Store (0x02, A049)
            Return (Local7)
        }

        Method (A015, 1, Serialized)
        {
            If (LEqual (DerefOf (Index (A031, Arg0)), 0x00))
            {
                Return (0x00)
            }

            Return (0x01)
        }

        Method (A055, 1, Serialized)
        {
            Store (Buffer (0x0100) {}, Local7)
            Store (0x03, Index (Local7, 0x00))
            Store (0x00, Index (Local7, 0x01))
            Store (0x00, Index (Local7, 0x02))
            Store (DerefOf (Index (Arg0, 0x02)), A033)
            Store (A007 (0x00, 0x60, 0xF4), Local0)
            If (LEqual (A033, 0x01))
            {
                If (LEqual (And (Local0, 0x01), 0x01))
                {
                    Return (Local7)
                }

                Or (Local0, 0x01, Local0)
            }

            If (LEqual (A033, 0x00))
            {
                If (LEqual (And (Local0, 0x01), 0x00))
                {
                    Return (Local7)
                }

                And (Local0, Not (0x01), Local0)
            }

            Or (Local0, ShiftLeft (A027, 0x01), Local0)
            A006 (0x00, 0x60, 0xF4, Local0)
            A056 (RefOf (A037), RefOf (A036))
            A011 (A034)
            If (LEqual (A027, 0x04))
            {
                A002 (0x01)
            }

            If (LAnd (LGreater (A027, 0x01), LLess (A027, 0x04)))
            {
                If (LEqual (A027, 0x02))
                {
                    A056 (RefOf (A031), RefOf (A016))
                    Store (0x00, A014)
                    While (LLessEqual (A014, A001))
                    {
                        If (LNotEqual (DerefOf (Index (A032, A014)), 0x00))
                        {
                            Store (DerefOf (Index (A032, A014)), Index (A016, A014))
                        }

                        Increment (A014)
                    }
                }
                Else
                {
                    A056 (RefOf (A039), RefOf (A016))
                    Store (DerefOf (Index (A031, 0x06)), Index (A016, 0x06))
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
            Store (0x00, A014)
            A056 (RefOf (A039), RefOf (A057))
            While (LLessEqual (A014, A001))
            {
                If (LEqual (A015 (A014), 0x01))
                {
                    Store (A058 (A014), Index (A057, A014))
                }

                Increment (A014)
            }

            If (LNotEqual (Match (A040, MEQ, 0x01, MTR, 0x00, 0x00), 
                Ones))
            {
                A056 (RefOf (A039), RefOf (A057))
            }

            If (LNotEqual (Match (A057, MEQ, 0x02, MTR, 0x00, 0x00), 
                Ones))
            {
                A059 (0x02, 0x01)
                A002 (0x02)
            }

            Store (0x00, A014)
            While (LLessEqual (A014, A001))
            {
                If (LEqual (A015 (A014), 0x00))
                {
                    Increment (A014)
                }
                Else
                {
                    Store (DerefOf (Index (A016, A014)), Local0)
                    Store (DerefOf (Index (A057, A014)), Local2)
                    If (LEqual (Local0, Local2))
                    {
                        Increment (A014)
                    }
                    Else
                    {
                        Store (Local2, Index (A016, A014))
                        A060 (A014, Local2)
                        Increment (A014)
                    }
                }
            }

            If (LEqual (Match (A057, MEQ, 0x02, MTR, 0x00, 0x00), Ones))
            {
                A002 (0x01)
                A059 (0x01, 0x00)
            }

            A013 ()
        }

        Method (A058, 1, NotSerialized)
        {
            Store (0x02, Local0)
            Store (A003 (), Local1)
            If (LEqual (DerefOf (Index (A036, Arg0)), 0x00))
            {
                If (LOr (LEqual (Local1, 0x01), LEqual (A027, 0x03)))
                {
                    Store (0x01, Local0)
                }

                If (LAnd (LEqual (Local1, 0x00), LEqual (A027, 0x03)))
                {
                    If (LEqual (Arg0, 0x06))
                    {
                        Store (0x02, Local0)
                    }
                }

                If (LNotEqual (DerefOf (Index (A032, Arg0)), 0x00))
                {
                    Store (DerefOf (Index (A032, Arg0)), Local0)
                }
            }
            Else
            {
                Store (DerefOf (Index (A038, Arg0)), Local0)
            }

            Store (DerefOf (Index (A031, A014)), Local2)
            If (LLess (Local2, Local0))
            {
                Store (Local2, Local0)
            }

            Return (Local0)
        }

        Method (A060, 2, NotSerialized)
        {
            If (LEqual (Arg0, 0x06))
            {
                A004 (0x00, 0x60, 0x80, Not (0x40), 0x40)
            }

            A061 (Arg0, Arg1)
            If (LNotEqual (DerefOf (Index (A036, Arg0)), 0x00))
            {
                A062 (Arg0, 0xA1, Not (0x1000), 0x00)
            }
            Else
            {
                A062 (Arg0, 0xA1, Not (0x1000), 0x1000)
            }

            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            And (A063 (Arg0, 0xA5), 0x3F, Local3)
            A064 (Arg0, 0x01, Local3)
            If (LGreaterEqual (Local3, 0x10))
            {
                A065 (Arg0)
                Store (0x01, Local2)
                While (Local2)
                {
                    A066 (Local1, 0x68, Not (0x00), 0x20)
                    Sleep (0x1E)
                    While (And (A012 (Local1, 0x68), 0x08000000))
                    {
                        Sleep (0x0A)
                    }

                    Store (0x00, Local2)
                    If (LEqual (Arg1, 0x01))
                    {
                        If (LNotEqual (A067 (Arg0), 0x01))
                        {
                            Store (0x01, Local2)
                        }
                    }
                }

                A068 (Arg0)
            }
            Else
            {
            }

            If (LEqual (Arg0, 0x06))
            {
                A004 (0x00, 0x60, 0x80, Not (0x40), 0x00)
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
            Store (0x00, A070)
            Store (0x00, A071)
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            If (LEqual (Arg0, 0x06))
            {
                Store (A073 (0x00, 0x00), Index (A069, 0x00))
                A073 (0x00, 0x01)
                Return (0x00)
            }

            Store (A012 (Local1, 0x18), Local3)
            Store (And (ShiftRight (Local3, 0x08), 0xFF), Local3)
            Store (ShiftLeft (Local3, 0x08), Local2)
            Store (A012 (Local2, 0x0C), Local3)
            Store (And (ShiftRight (Local3, 0x10), 0xFF), Local3)
            If (LNotEqual (And (Local3, 0x80), 0x00))
            {
                Store (0x07, Local0)
            }
            Else
            {
                Store (0x00, Local0)
            }

            Store (0x00, Local4)
            While (LLessEqual (Local4, Local0))
            {
                Store (A074 (Add (Local2, Local4), 0x10), A070)
                If (LEqual (A070, 0x00))
                {
                    Increment (Local4)
                }
                Else
                {
                    Add (A070, 0x10, A070)
                    Store (A012 (Add (Local2, Local4), A070), A071)
                    Store (And (A071, 0x0FCB), Index (A069, Local4))
                    A066 (Add (Local2, Local4), A070, Not (0x03), 0x00)
                    Increment (Local4)
                }
            }

            Store (A012 (Local1, 0x68), A072)
            A066 (Local1, 0x68, Not (0x03), 0x00)
        }

        Method (A068, 1, Serialized)
        {
            Store (0x00, A070)
            Store (0x00, A071)
            If (LEqual (Arg0, 0x06))
            {
                A073 (DerefOf (Index (A069, 0x00)), 0x01)
                Return (0x00)
            }

            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            Store (A012 (Local1, 0x18), Local3)
            Store (And (ShiftRight (Local3, 0x08), 0xFF), Local3)
            A066 (Local1, 0x68, Not (0x03), And (A072, 0x03))
            Store (ShiftLeft (Local3, 0x08), Local2)
            Store (A012 (Local2, 0x0C), Local3)
            Store (And (ShiftRight (Local3, 0x10), 0xFF), Local3)
            If (LNotEqual (And (Local3, 0x80), 0x00))
            {
                Store (0x07, Local0)
            }
            Else
            {
                Store (0x00, Local0)
            }

            Store (0x00, Local4)
            While (LLessEqual (Local4, Local0))
            {
                Store (A074 (Add (Local2, Local4), 0x10), A070)
                If (LEqual (A070, 0x00))
                {
                    Increment (Local4)
                }
                Else
                {
                    Add (A070, 0x10, A070)
                    A026 (Add (Local2, Local4), A070, DerefOf (Index (A069, Local4
                        )))
                    Increment (Local4)
                }
            }
        }

        Method (A061, 2, NotSerialized)
        {
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            If (LEqual (Arg1, 0x01))
            {
                A066 (Local0, 0x88, Not (0x2F), 0x21)
                A062 (Arg0, 0xA4, Not (0x20000001), 0x00)
            }
            Else
            {
                A062 (Arg0, 0xA4, Not (0x20000001), 0x20000001)
                A066 (Local0, 0x88, Not (0x2F), 0x02)
            }
        }

        Method (A056, 2, NotSerialized)
        {
            Store (SizeOf (Arg0), Local1)
            Store (0x00, Local0)
            While (LLess (Local0, Local1))
            {
                Store (DerefOf (Index (DerefOf (Arg0), Local0)), Index (DerefOf (Arg1), 
                    Local0))
                Increment (Local0)
            }
        }

        Method (A003, 0, NotSerialized)
        {
            Return (And (A034, A035))
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
            /* 0000 */   0x01, 0x02, 0x04, 0x04, 0x08, 0x08, 0x08, 0x08,
            /* 0008 */   0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10
        })
        Method (A078, 1, NotSerialized)
        {
            Name (A047, 0x00)
            Name (A079, 0x00)
            Store (0x00, A014)
            Store (Buffer (0x0A) {}, Local7)
            Store (DerefOf (Index (Arg0, 0x03)), A047)
            Store (DerefOf (Index (Arg0, 0x04)), A079)
            Store (0x03, Index (Local7, 0x00))
            Store (0x00, Index (Local7, 0x01))
            Store (A079, Index (Local7, 0x02))
            Return (Local7)
            While (LLessEqual (A014, A001))
            {
                If (LEqual (A015 (A014), 0x01))
                {
                    Store (A012 (ShiftLeft (Add (A014, 0x02), 0x03), 0x18), 
                        Local1)
                    And (ShiftRight (Local1, 0x10), 0xFF, Local2)
                    And (ShiftRight (Local1, 0x08), 0xFF, Local1)
                    If (LAnd (LGreaterEqual (A047, Local1), LLessEqual (A047, Local2)))
                    {
                        Break
                    }
                }

                Increment (A014)
            }

            If (LGreater (A014, A001))
            {
                Return (Local7)
            }

            If (LLessEqual (A080 (A014, 0x01), A079))
            {
                Return (Local7)
            }

            Store (DerefOf (Index (A077, A079)), Local1)
            A081 (A014, 0x01, 0x00)
            A081 (A014, 0x02, Local1)
            A013 ()
            Store (Local1, Index (Local7, 0x02))
            Return (Local7)
        }

        Method (A082, 1, Serialized)
        {
            Store (DerefOf (Index (Arg0, 0x04)), Local0)
            Store (DerefOf (Index (Arg0, 0x02)), Local1)
            Subtract (ShiftRight (Local1, 0x03), 0x02, Local4)
            If (LEqual (Local0, 0x01))
            {
                Store (0x06, Local2)
            }
            Else
            {
                Store (0x04, Local2)
            }

            Store (A012 (Local1, 0x68), Local3)
            A066 (Local1, 0x68, Not (0x03), 0x00)
            Store (A083 (Local4, Local2), Local0)
            A066 (Local1, 0x68, Not (0x03), And (Local3, 0x03))
            A013 ()
            Store (Buffer (0x0A) {}, Local7)
            CreateWordField (Local7, 0x00, A048)
            CreateByteField (Local7, 0x02, A049)
            CreateByteField (Local7, 0x03, A084)
            Store (0x04, A048)
            Store (0x00, A049)
            Store (Local0, A084)
            Return (Local7)
        }

        Name (A085, Buffer (0x0A)
        {
            /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0008 */   0x00, 0x00
        })
        Method (A083, 2, Serialized)
        {
            Store (0x00, Local4)
            Store (A018 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x07)), Local1)
            If (LNotEqual (Local1, 0x01))
            {
                Return (Local4)
            }

            Store (Arg1, Local2)
            While (LNotEqual (Local2, 0x08))
            {
                Store (0x01, Local5)
                If (LEqual (Local2, 0x06))
                {
                    Store (0x00, Index (A032, Arg0))
                    A062 (Arg0, 0xA2, Not (0x2000), 0x00)
                    If (LAnd (LGreater (A027, 0x01), LLess (A027, 0x04)))
                    {
                        Store (0x00, A035)
                        A044 ()
                    }
                    Else
                    {
                        A061 (Arg0, DerefOf (Index (A031, Arg0)))
                    }

                    A081 (Arg0, 0x01, 0x00)
                    A086 (Arg0, 0x00)
                    Store (0x01, Local2)
                    Store (0x00, Local3)
                }

                If (LEqual (Local2, 0x01))
                {
                    And (A063 (Arg0, 0xA5), 0x3F, Local1)
                    If (LGreater (Local1, 0x04))
                    {
                        Store (0x02, Local2)
                        Store (0x00, Local3)
                        Store (0x00, Local5)
                    }
                    Else
                    {
                        If (LLess (Local3, 0x50))
                        {
                            Sleep (0x01)
                            Increment (Local3)
                        }
                        Else
                        {
                            Store (0x04, Local2)
                        }
                    }
                }

                If (LAnd (LEqual (Local5, 0x01), LEqual (Local2, 0x02)))
                {
                    Store (A063 (Arg0, 0xA5), Local1)
                    And (Local1, 0x3F, Local1)
                    If (LAnd (LGreaterEqual (Local1, 0x10), LLessEqual (Local1, 0x13)))
                    {
                        Store (0x05, Local2)
                        Store (0x00, Local5)
                    }
                    Else
                    {
                        If (LLess (Local3, 0x50))
                        {
                            Sleep (0x01)
                            Increment (Local3)
                            Store (0x00, Local5)
                        }
                        Else
                        {
                            Store (0x04, Local2)
                            If (LEqual (DerefOf (Index (A032, Arg0)), 0x01))
                            {
                                Store (0x00, Local5)
                            }
                            Else
                            {
                                If (LEqual (A087 (Arg0), 0x01))
                                {
                                    A062 (Arg0, 0xA2, Not (0x2000), 0x2000)
                                    Store (0x01, Index (A032, Arg0))
                                    A061 (Arg0, 0x01)
                                    Store (0x07, Local2)
                                }
                            }
                        }
                    }
                }

                If (LAnd (LEqual (Local5, 0x01), LEqual (Local2, 0x04)))
                {
                    A086 (Arg0, 0x01)
                    A081 (Arg0, 0x00, 0x00)
                    A088 (Arg0)
                    Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
                    Store (A012 (Local0, 0x18), Local1)
                    And (ShiftRight (Local1, 0x08), 0xFF, Local1)
                    ShiftLeft (Local1, 0x08, Local0)
                    Store (A012 (Local0, 0x00), Local0)
                    If (LEqual (Local0, 0xFFFFFFFF)) {}
                    Store (0x01, Index (A032, Arg0))
                    Store (0x00, Local2)
                }

                If (LAnd (LEqual (Local5, 0x01), LEqual (Local2, 0x07)))
                {
                    If (CondRefOf (\_SB.ALIC, Local6))
                    {
                        Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
                        \_SB.ALIC (Local1, 0x00, Sleep (0x02), \_SB.ALIC (Local1, 0x01, Store (0x00, 
                            Local3), Store (0x01, Local2), Store (0x00, Local5), Else
                                {
                                    Store (0x04, Local2)
                                }), If (LAnd (LEqual (Local5, 0x01), LEqual (Local2, 
                                        0x05)))
                            {
                                Store (0x01, Local4)
                                Store (0x00, Local2)
                                A089 (Arg0)
                                A090 (Arg0)
                            }, If (LAnd (LEqual (Local5, 0x01), LEqual (Local2, 0x00)))
                            {
                                If (LAnd (LGreater (A027, 0x01), LLess (A027, 0x04)))
                                {
                                    Store (0x01, A035)
                                    A044 ()
                                }

                                Store (0x08, Local2)
                            })
                    }
                }
            }

            Return (Local4)
        }

        Method (A081, 3, Serialized)
        {
            Store (A018 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x00)), A019)
            Store (DerefOf (Index (Local7, 0x01)), A020)
            Store (DerefOf (Index (Local7, 0x02)), A021)
            Store (DerefOf (Index (Local7, 0x03)), A022)
            Store (A080 (Arg0, 0x01), A076)
            If (LEqual (Arg1, 0x00))
            {
                A091 (Arg0, A021, Add (A021, Subtract (A076, 0x01)), 
                    0x01)
                A008 (A019, A020, 0x01)
            }

            If (LEqual (Arg1, 0x01))
            {
                A008 (A019, A020, 0x00)
                A091 (Arg0, A021, Add (A021, Subtract (A076, 0x01)), 
                    0x00)
            }

            If (LNotEqual (Arg1, 0x02))
            {
                Return (0x00)
            }

            If (LEqual (Arg2, 0x00))
            {
                Store (A080 (Arg0, 0x00), Local2)
            }
            Else
            {
                Store (Arg2, Local2)
            }

            If (LLessEqual (A076, Local2))
            {
                Return (0x00)
            }

            Store (A092 (Arg0), Local1)
            If (LEqual (Local1, 0x00))
            {
                Add (A021, Local2, Local3)
                Store (A022, Local4)
            }
            Else
            {
                Subtract (A022, Local2, Local4)
                Store (A021, Local3)
            }

            A091 (Arg0, Local3, Local4, 0x01)
            If (LGreater (A019, A020))
            {
                Store (A020, Local3)
                Store (A019, Local4)
            }
            Else
            {
                Store (A020, Local4)
                Store (A019, Local3)
            }

            If (LEqual (Local1, 0x00))
            {
                Add (Local3, Local2, Local3)
            }
            Else
            {
                Subtract (Local4, Local2, Local4)
            }

            A008 (Local3, Local4, 0x01)
            Return (0x00)
        }

        Method (A087, 1, NotSerialized)
        {
            Store (Buffer (0x10) {}, Local1)
            Store (0x00, Local0)
            While (LLessEqual (Local0, 0x03))
            {
                Store (A063 (Arg0, Add (Local0, 0xA5)), Local2)
                Store (Local2, Index (Local1, Multiply (Local0, 0x04)))
                Store (ShiftRight (Local2, 0x08), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x01)))
                Store (ShiftRight (Local2, 0x10), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x02)))
                Store (ShiftRight (Local2, 0x18), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x03)))
                Increment (Local0)
            }

            Store (0x00, Local0)
            While (LLess (Local0, 0x0F))
            {
                If (LAnd (LEqual (DerefOf (Index (Local1, Local0)), 0x2A), LEqual (
                    DerefOf (Index (Local1, Add (Local0, 0x01))), 0x09)))
                {
                    Return (0x01)
                }

                Increment (Local0)
            }

            Return (0x00)
        }

        Method (A092, 1, Serialized)
        {
            Store (A018 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x00)), A019)
            Store (DerefOf (Index (Local7, 0x01)), A020)
            Store (0x00, Local0)
            If (LGreater (A019, A020))
            {
                Store (0x01, Local0)
            }

            And (A063 (Arg0, 0x50), 0x01, Local1)
            Return (And (XOr (Local0, Local1), 0x01))
        }

        Method (A086, 2, NotSerialized)
        {
            Store (A018 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x04)), A075)
            Store (Or (ShiftLeft (DerefOf (Index (Local7, Add (0x05, 0x01)
                )), 0x08), DerefOf (Index (Local7, 0x05))), A023)
            A004 (0x00, 0xE0, Or (ShiftLeft (A023, 0x10), Add (0x0800, 
                Multiply (0x0100, A075))), Not (0x01), Arg1)
        }

        Name (A093, Buffer (0x07)
        {
             0x00, 0x01, 0x02, 0x04, 0x08, 0x0C, 0x10
        })
        Method (A080, 2, NotSerialized)
        {
            If (LEqual (Arg1, 0x00))
            {
                And (ShiftRight (A063 (Arg0, 0xA2), 0x04), 0x07, Local0)
                Store (DerefOf (Index (A093, Local0)), Local1)
            }
            Else
            {
                Store (A018 (Arg0), Local7)
                Store (DerefOf (Index (Local7, 0x00)), A019)
                Store (DerefOf (Index (Local7, 0x01)), A020)
                If (LGreater (A019, A020))
                {
                    Subtract (A019, A020, Local1)
                }
                Else
                {
                    Subtract (A020, A019, Local1)
                }

                Increment (Local1)
            }

            Return (Local1)
        }

        Method (A091, 4, Serialized)
        {
            Store (A018 (Arg0), Local7)
            Store (Arg1, A021)
            Store (Arg2, A022)
            Store (Or (ShiftLeft (DerefOf (Index (Local7, Add (0x05, 0x01)
                )), 0x08), DerefOf (Index (Local7, 0x05))), A023)
            If (LGreater (A021, A022))
            {
                Subtract (A021, A022, Local1)
                Store (A022, Local2)
            }
            Else
            {
                Subtract (A022, A021, Local1)
                Store (A021, Local2)
            }

            ShiftLeft (Subtract (ShiftLeft (0x01, Add (Local1, 0x01)), 0x01
                ), Local2, Local3)
            Store (Not (Local3), Local4)
            If (LEqual (Arg3, 0x01))
            {
                Store (0x00, Local3)
            }

            A004 (0x00, 0xE0, Or (ShiftLeft (A023, 0x10), 0x8023), 
                Local4, Local3)
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
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local6)
            Store (A074 (Local6, 0x10), Local2)
            If (LNotEqual (Local2, 0x00))
            {
                Store (A012 (Local6, 0x18), Local0)
                And (ShiftRight (Local0, 0x08), 0xFF, Local0)
                ShiftLeft (Local0, 0x08, Local1)
                Store (A012 (Local1, 0x0C), Local0)
                Store (And (ShiftRight (Local0, 0x10), 0xFF), Local0)
                If (LNotEqual (And (Local0, 0x80), 0x00))
                {
                    Store (0x07, Local4)
                }
                Else
                {
                    Store (0x00, Local4)
                }

                Store (0x08, Local3)
                Store (0x00, Local5)
                While (LLessEqual (Local5, Local4))
                {
                    Store (A074 (Add (Local1, Local5), 0x10), Local2)
                    If (LNotEqual (Local2, 0x00))
                    {
                        And (A012 (Add (Local1, Local5), Add (Local2, 0x04)), 
                            0x07, Local0)
                        Store (A012 (Add (Local1, Local5), 0x00), Local6)
                        Store (0x00, Local7)
                        While (LLess (Local7, SizeOf (A094)))
                        {
                            If (LEqual (DerefOf (Index (DerefOf (Index (A094, Local7)), 0x00
                                )), Local6))
                            {
                                Store (DerefOf (Index (DerefOf (Index (A094, Local7)), 0x01)), 
                                    Local0)
                            }

                            Increment (Local7)
                        }

                        If (LLess (Local0, Local3))
                        {
                            Store (Local0, Local3)
                        }
                    }

                    Increment (Local5)
                }

                If (LNotEqual (Local3, 0x08))
                {
                    Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local6)
                    Store (A074 (Local6, 0x10), Local2)
                    And (A012 (Local6, Add (Local2, 0x04)), 0x07, Local0)
                    If (LLess (Local0, Local3))
                    {
                        Store (Local0, Local3)
                    }

                    ShiftLeft (Local3, 0x05, Local3)
                    A066 (Local6, Add (Local2, 0x08), Not (0xE0), Local3)
                    Store (0x00, Local5)
                    While (LLessEqual (Local5, Local4))
                    {
                        Store (A074 (Add (Local1, Local5), 0x10), Local2)
                        If (LNotEqual (Local2, 0x00))
                        {
                            A066 (Local1, Add (Local2, 0x08), Not (0xE0), Local3)
                        }

                        Increment (Local5)
                    }
                }
            }
        }

        Method (A088, 1, Serialized)
        {
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            Store (A074 (Local0, 0x10), Local1)
            If (LNotEqual (Local1, 0x00))
            {
                A066 (Local0, Add (Local1, 0x08), Not (0xE0), 0x00)
            }
        }

        Method (A090, 1, Serialized)
        {
            Store (A018 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x09)), Local0)
            If (LEqual (Local0, 0x00))
            {
                Return (0x00)
            }

            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            Store (A012 (Local1, 0x18), Local0)
            And (Local0, 0xFF00, Local2)
            Store (A012 (Local2, 0x0C), Local0)
            Store (And (ShiftRight (Local0, 0x10), 0xFF), Local0)
            If (LNotEqual (And (Local0, 0x80), 0x00))
            {
                Store (0x07, Local3)
            }
            Else
            {
                Store (0x00, Local3)
            }

            Store (0x00, Local4)
            Store (0x00, Local5)
            While (LLessEqual (Local4, Local3))
            {
                Store (A074 (Or (Local2, Local4), 0x10), Local6)
                If (LEqual (Local6, 0x00))
                {
                    Increment (Local4)
                }
                Else
                {
                    If (LNotEqual (And (A012 (Or (Local2, Local4), Add (
                        Local6, 0x0C)), ShiftLeft (0x01, 0x12)), 0x00))
                    {
                        Store (0x01, Local5)
                    }
                    Else
                    {
                        Store (0x00, Local5)
                        Break
                    }

                    Increment (Local4)
                }
            }

            If (LEqual (Local5, 0x00))
            {
                Return (0x00)
            }

            Store (0x00, Local4)
            While (LLessEqual (Local4, Local3))
            {
                Store (A074 (Or (Local2, Local4), 0x10), Local6)
                If (LEqual (Local6, 0x00))
                {
                    Increment (Local4)
                }
                Else
                {
                    A066 (Or (Local2, Local4), Add (Local6, 0x10), 0xFFFFFFFF, 
                        ShiftLeft (0x01, 0x08))
                    Increment (Local4)
                }
            }
        }

        Name (AD01, 0xE0000000)
        Alias (AD01, A095)
        Name (AD07, Package (0x08)
        {
            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x00, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x17, 0x10, 0x00, 0x0F, 0x00, 0x31, 0x01, 0x03,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x04, 0x04, 0x04, 0x04, 0x01, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x05, 0x05, 0x05, 0x05, 0x02, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x06, 0x06, 0x06, 0x06, 0x03, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x07, 0x07, 0x07, 0x07, 0x04, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x03, 0x00, 0x03, 0x00, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x00, 0x00
            }
        })
        Alias (AD07, A096)
        Method (A018, 1, NotSerialized)
        {
            Return (DerefOf (Index (A096, Arg0)))
        }

        Method (A012, 2, Serialized)
        {
            Add (A095, ShiftLeft (Arg0, 0x0C), Local0)
            Add (Arg1, Local0, Local0)
            OperationRegion (A097, SystemMemory, Local0, 0x04)
            Field (A097, DWordAcc, NoLock, Preserve)
            {
                A098,   32
            }

            Return (A098)
        }

        Method (A026, 3, Serialized)
        {
            Add (A095, ShiftLeft (Arg0, 0x0C), Local0)
            Add (Arg1, Local0, Local0)
            OperationRegion (A097, SystemMemory, Local0, 0x04)
            Field (A097, DWordAcc, NoLock, Preserve)
            {
                A098,   32
            }

            Store (Arg2, A098)
        }

        Method (A066, 4, Serialized)
        {
            Store (A012 (Arg0, Arg1), Local0)
            Or (And (Local0, Arg2), Arg3, Local0)
            A026 (Arg0, Arg1, Local0)
        }

        Mutex (A099, 0x00)
        Method (A063, 2, NotSerialized)
        {
            Acquire (A099, 0xFFFF)
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            A026 (Local0, 0xE0, Arg1)
            Store (A012 (Local0, 0xE4), Local0)
            Release (A099)
            Return (Local0)
        }

        Method (A064, 3, NotSerialized)
        {
            Acquire (A099, 0xFFFF)
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            A026 (Local0, 0xE0, Arg1)
            A026 (Local0, 0xE4, Arg2)
            Release (A099)
        }

        Method (A062, 4, NotSerialized)
        {
            Store (A063 (Arg0, Arg1), Local0)
            Or (And (Local0, Arg2), Arg3, Local0)
            A064 (Arg0, Arg1, Local0)
        }

        Mutex (A100, 0x00)
        Method (A007, 3, NotSerialized)
        {
            Acquire (A100, 0xFFFF)
            A026 (Arg0, Arg1, Arg2)
            Store (A012 (Arg0, Add (Arg1, 0x04)), Local0)
            Release (A100)
            Return (Local0)
        }

        Method (A006, 4, NotSerialized)
        {
            Acquire (A100, 0xFFFF)
            A026 (Arg0, Arg1, Arg2)
            A026 (Arg0, Add (Arg1, 0x04), Arg3)
            Release (A100)
        }

        Method (A004, 5, NotSerialized)
        {
            Store (A007 (Arg0, Arg1, Arg2), Local0)
            Or (And (Local0, Arg3), Arg4, Local0)
            A006 (Arg0, Arg1, Arg2, Local0)
        }

        Method (A074, 2, NotSerialized)
        {
            Store (0x34, Local1)
            If (LEqual (A012 (Arg0, 0x00), 0xFFFFFFFF))
            {
                Return (0x00)
            }

            Store (0x01, Local0)
            While (LEqual (Local0, 0x01))
            {
                Store (And (A012 (Arg0, Local1), 0xFF), Local1)
                If (LEqual (Local1, 0x00))
                {
                    Break
                }

                If (LEqual (And (A012 (Arg0, Local1), 0xFF), Arg1))
                {
                    Store (0x00, Local0)
                }
                Else
                {
                    Increment (Local1)
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

            Store (0x00, Local0)
            If (LEqual (Arg1, 0x00))
            {
                Store (0x80000068, ABIX)
                Store (ABDA, Local0)
                Return (Local0)
            }
            Else
            {
                Store (0x80000068, ABIX)
                Store (ABDA, Local0)
                Or (And (Local0, 0xFFFFFFFC), Arg0, Local0)
                Store (Local0, ABDA)
            }
        }

        Name (A101, Buffer (0x0100) {})
        Method (ALIB, 2, NotSerialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Return (A043 (Arg1))
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (A045 (Arg1))
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (A055 (Arg1))
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (A078 (Arg1))
            }

            If (LEqual (Arg0, 0x05))
            {
                Return (A102 ())
            }

            If (LEqual (Arg0, 0x06))
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
            While (LNotEqual (And (A007 (0x00, 0xB8, 0xE0003004), 0x02), 
                0x02)) {}
            Store (A007 (0x00, 0xB8, 0xE0003000), Local0)
            Or (And (Local0, 0xFFFE0000), And (Not (And (Local0, 0x01
                )), 0x01), Local0)
            Or (Local0, ShiftLeft (Arg0, 0x01), Local0)
            A006 (0x00, 0xB8, 0xE0003000, Local0)
            While (LNotEqual (And (A007 (0x00, 0xB8, 0xE0003004), 0x01), 
                0x01)) {}
            While (LNotEqual (And (A007 (0x00, 0xB8, 0xE0003004), 0x02), 
                0x02)) {}
        }

        Method (A067, 1, NotSerialized)
        {
            Store (A063 (Arg0, 0xA4), Local1)
            ShiftRight (Local1, 0x0D, Local2)
            And (Local2, 0x03, Local2)
            Increment (Local2)
            Return (Local2)
        }

        Method (A059, 2, Serialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Store (DerefOf (Index (A042, A029)), Local3)
            }
            Else
            {
                Store (DerefOf (Index (A042, A028)), Local3)
            }

            Store (A007 (0x00, 0xB8, 0x0001F428), Local5)
            If (LNotEqual (And (Local5, ShiftLeft (0x01, 0x05)), 
                0x00))
            {
                A006 (0x00, 0xB8, 0x0001F428, And (Local5, Not (ShiftLeft (0x01, 0x05
                    ))))
                A005 (0x16)
            }

            Store (A012 (0xC5, 0x0170), Local4)
            If (LEqual (And (Local4, ShiftLeft (0x01, 0x0E)), 0x00))
            {
                A026 (0xC5, 0x0170, Or (Local4, ShiftLeft (0x01, 0x0E)))
            }

            And (A007 (0x00, 0xB8, 0xE000203C), 0x04, Local2)
            And (A007 (0x00, 0xB8, 0xE0002040), 0x01, Local1)
            While (LNotEqual (ShiftLeft (Local1, 0x02), Local2))
            {
                And (A007 (0x00, 0xB8, 0xE0002040), 0x01, Local1)
            }

            Store (A007 (0x00, 0xB8, 0xE000203C), Local1)
            If (LEqual (Arg0, 0x01))
            {
                And (Local1, 0xFFFFFFFD, Local1)
            }
            Else
            {
                Or (Local1, 0x02, Local1)
            }

            A006 (0x00, 0xB8, 0xE000203C, Local1)
            And (Local1, Not (ShiftLeft (0xFF, 0x08)), Local1)
            Or (Local1, ShiftLeft (Local3, 0x08), Local1)
            And (Not (Local1), 0x04, Local2)
            Or (And (Local1, Not (0x04)), Local2, Local1)
            A006 (0x00, 0xB8, 0xE000203C, Local1)
            If (LNotEqual (Arg1, 0x00))
            {
                While (LNotEqual (ShiftLeft (Local1, 0x02), Local2))
                {
                    And (A007 (0x00, 0xB8, 0xE0002040), 0x01, Local1)
                }
            }

            If (LEqual (And (Local4, ShiftLeft (0x01, 0x0E)), 0x00))
            {
                A026 (0xC5, 0x0170, Local4)
            }

            If (LNotEqual (And (Local5, ShiftLeft (0x01, 0x05)), 
                0x00))
            {
                A006 (0x00, 0xB8, 0x0001F428, Local5)
                A005 (0x16)
            }
        }

        Method (A002, 1, NotSerialized)
        {
            Store (A003 (), Local1)
            Store (0x00, Local5)
            A004 (0x00, 0xB8, 0x0001F300, 0xFFFFFFFE, 0x00)
            A005 (0x09)
            If (LEqual (Local1, 0x00))
            {
                A006 (0x00, 0xB8, 0x0001F954, 0x00)
                A004 (0x00, 0xB8, 0x0001F200, 0xFFFFFFFE, 0x00)
                A004 (0x00, 0xB8, 0x0001F2A0, 0xFFFFFFFE, 0x01)
                A004 (0x00, 0xB8, 0x0001F2C0, 0xFFFFFFFE, 0x01)
                Store (0x00050001, Local6)
            }
            Else
            {
                If (LEqual (Arg0, 0x01))
                {
                    Store (A007 (0x00, 0xB8, 0x0001FE00), Local5)
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

                Store (0x01, Local6)
            }

            A004 (0x00, 0xB8, 0x0001F300, 0xFF00FFFE, Local6)
            A005 (0x09)
        }

        Method (A008, 3, NotSerialized)
        {
            If (LGreater (Arg0, Arg1))
            {
                Store (Arg1, Local3)
                Store (Arg0, Local4)
            }
            Else
            {
                Store (Arg0, Local3)
                Store (Arg1, Local4)
            }

            Store (A007 (0x00, 0xB8, 0x0001F39C), Local0)
            And (Local0, 0x18, Local0)
            If (LEqual (Arg2, 0x00))
            {
                Or (Or (ShiftLeft (Local4, 0x18), ShiftLeft (Local3, 0x10)
                    ), Or (Local0, 0x03), Local0)
            }

            If (LEqual (Arg2, 0x01))
            {
                Or (Or (ShiftLeft (Local4, 0x18), ShiftLeft (Local3, 0x10)
                    ), Or (Local0, 0x03), Local0)
            }

            A006 (0x00, 0xB8, 0x0001F39C, Local0)
            A005 (Subtract (0x03, Arg2))
        }

        Method (A009, 1, NotSerialized)
        {
        }

        Name (A010, 0x00)
        Method (A011, 1, NotSerialized)
        {
            If (LEqual (A010, 0x00))
            {
                If (LEqual (A012 (0x08, 0x00), 0xFFFFFFFF))
                {
                    And (A007 (0x00, 0xB8, 0x0001F428), 0x02, Local1)
                    If (LEqual (Local1, 0x02))
                    {
                        Store (0x01, A010)
                    }
                }
            }

            If (LEqual (A010, 0x01))
            {
                If (LEqual (Arg0, 0x00))
                {
                    Store (0x20, Local0)
                }
                Else
                {
                    Store (0x21, Local0)
                }

                A005 (Local0)
            }
        }

        Method (A013, 0, NotSerialized)
        {
            Store (0x00, A014)
            Store (0x00, Local1)
            While (LLessEqual (A014, A001))
            {
                If (LEqual (A015 (A014), 0x00))
                {
                    Increment (A014)
                }
                Else
                {
                    If (LEqual (DerefOf (Index (A016, A014)), 0x02))
                    {
                        Or (A017 (A014), Local1, Local1)
                    }

                    Increment (A014)
                }
            }

            Store (ShiftLeft (Local1, 0x18), Local2)
            Or (And (ShiftRight (Local1, 0x08), 0xFF00), Local2, Local2)
            Or (And (ShiftLeft (Local1, 0x08), 0x00FF0000), Local2, Local2)
            A006 (0x00, 0xB8, 0x0001F610, Local2)
            A005 (0x08)
        }

        Method (A017, 1, NotSerialized)
        {
            Store (A018 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x00)), A019)
            Store (DerefOf (Index (Local7, 0x01)), A020)
            Store (DerefOf (Index (Local7, 0x02)), A021)
            Store (DerefOf (Index (Local7, 0x03)), A022)
            Store (Or (ShiftLeft (DerefOf (Index (Local7, Add (0x05, 0x01)
                )), 0x08), DerefOf (Index (Local7, 0x05))), A023)
            Store (A007 (0x00, 0xE0, Or (ShiftLeft (A023, 0x10), 0x8023
                )), Local5)
            ShiftRight (Local5, A021, Local5)
            ShiftLeft (0x01, Add (Subtract (A022, A021), 0x01), Local2)
            Subtract (Local2, 0x01, Local2)
            And (Local5, Local2, Local5)
            If (LGreater (A019, A020))
            {
                Store (A020, Local3)
                Store (A019, Local4)
                Subtract (Subtract (A022, A021), Subtract (Local4, Local3), Local1)
            }
            Else
            {
                Store (A020, Local4)
                Store (A019, Local3)
                Store (0x00, Local1)
            }

            ShiftLeft (0x01, Add (Subtract (Local4, Local3), 0x01), Local2)
            ShiftLeft (Subtract (Local2, 0x01), Local1, Local2)
            And (Local2, Not (Local5), Local2)
            ShiftLeft (Subtract (Local2, 0x01), Subtract (Local3, Local1), Local2)
            Return (Local2)
        }

        Name (A024, 0x00)
        Name (A025, 0x00)
        Method (AWAK, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x03))
            {
                If (LEqual (A024, 0x01))
                {
                    Store (A012 (0xC5, 0x0170), Local0)
                    A026 (0xC5, 0x0170, And (Local0, Not (ShiftLeft (0x01, 0x0E)
                        )))
                    Store (0x00, A024)
                }

                If (LEqual (A025, 0x01))
                {
                    Store (A007 (0x00, 0xB8, 0x0001F428), Local0)
                    A006 (0x00, 0xB8, 0x0001F428, Or (Local0, ShiftLeft (0x01, 0x05)
                        ))
                    A005 (0x16)
                    Store (0x00, A025)
                }
            }

            Store (A003 (), Local1)
            A011 (Local1)
        }

        Method (APTS, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x03))
            {
                A011 (0x01)
                Store (A007 (0x00, 0xB8, 0x0001F428), Local0)
                If (LNotEqual (And (Local0, ShiftLeft (0x01, 0x05)), 
                    0x00))
                {
                    A006 (0x00, 0xB8, 0x0001F428, And (Local0, Not (ShiftLeft (0x01, 0x05
                        ))))
                    A005 (0x16)
                    Store (0x01, A025)
                }

                Store (A012 (0xC5, 0x0170), Local0)
                If (LEqual (And (Local0, ShiftLeft (0x01, 0x0E)), 0x00))
                {
                    A026 (0xC5, 0x0170, Or (Local0, ShiftLeft (0x01, 0x0E)))
                    Store (0x01, A024)
                }

                Store (A007 (0x00, 0x60, 0xF4), Local2)
                And (Local0, Not (0x01), Local2)
                A006 (0x00, 0x60, 0xF4, Local2)
            }
        }
    }
}

