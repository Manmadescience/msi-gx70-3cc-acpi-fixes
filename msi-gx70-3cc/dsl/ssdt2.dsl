/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161222-64
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt2.dat, Tue Jan 10 23:51:06 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000A9C (2716)
 *     Revision         0x01
 *     Checksum         0xD1
 *     OEM ID           "AMD   "
 *     OEM Table ID     "PUMORI  "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "AMD "
 *     Compiler Version 0x00000001 (1)
 */
DefinitionBlock ("", "SSDT", 1, "AMD   ", "PUMORI  ", 0x00000001)
{
    External (_PR_.P000, ProcessorObj)
    External (_PR_.P001, ProcessorObj)
    External (_PR_.P002, ProcessorObj)
    External (_PR_.P003, ProcessorObj)
    External (_SB_.PCI0.SBRG.EC__.MPPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.SBRG.EC__.PCOU, IntObj)

    Scope (\_PR.P000)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x04)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x000009C4, 
                0x00001950, 
                0x00000004, 
                0x00000004, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000834, 
                0x0000142F, 
                0x00000004, 
                0x00000004, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x00000708, 
                0x00000EC4, 
                0x00000004, 
                0x00000004, 
                0x00000002, 
                0x00000002
            }, 

            Package (0x06)
            {
                0x00000578, 
                0x00000B9F, 
                0x00000004, 
                0x00000004, 
                0x00000003, 
                0x00000003
            }
        })
        Name (XPSS, Package (0x04)
        {
            Package (0x08)
            {
                0x000009C4, 
                0x00001950, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000834, 
                0x0000142F, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000708, 
                0x00000EC4, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000578, 
                0x00000B9F, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000004
            }
        })
        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilities
        {
            \_SB.PCI0.SBRG.EC.PCOU = SizeOf (_PSS)
            Return (\_SB.PCI0.SBRG.EC.MPPC ())
        }

        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000001771, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
        Name (_CSD, Package (0x01)  // _CSD: C-State Dependencies
        {
            Package (0x06)
            {
                0x06, 
                0x00, 
                0x00000000, 
                0x000000FE, 
                0x00000002, 
                0x00000000
            }
        })
    }

    Scope (\_PR.P001)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x04)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x000009C4, 
                0x00001950, 
                0x00000004, 
                0x00000004, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000834, 
                0x0000142F, 
                0x00000004, 
                0x00000004, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x00000708, 
                0x00000EC4, 
                0x00000004, 
                0x00000004, 
                0x00000002, 
                0x00000002
            }, 

            Package (0x06)
            {
                0x00000578, 
                0x00000B9F, 
                0x00000004, 
                0x00000004, 
                0x00000003, 
                0x00000003
            }
        })
        Name (XPSS, Package (0x04)
        {
            Package (0x08)
            {
                0x000009C4, 
                0x00001950, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000834, 
                0x0000142F, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000708, 
                0x00000EC4, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000578, 
                0x00000B9F, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000004
            }
        })
        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilities
        {
            \_SB.PCI0.SBRG.EC.PCOU = SizeOf (_PSS)
            Return (\_SB.PCI0.SBRG.EC.MPPC ())
        }

        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000001771, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
        Name (_CSD, Package (0x01)  // _CSD: C-State Dependencies
        {
            Package (0x06)
            {
                0x06, 
                0x00, 
                0x00000000, 
                0x000000FE, 
                0x00000002, 
                0x00000000
            }
        })
    }

    Scope (\_PR.P002)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x04)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x000009C4, 
                0x00001950, 
                0x00000004, 
                0x00000004, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000834, 
                0x0000142F, 
                0x00000004, 
                0x00000004, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x00000708, 
                0x00000EC4, 
                0x00000004, 
                0x00000004, 
                0x00000002, 
                0x00000002
            }, 

            Package (0x06)
            {
                0x00000578, 
                0x00000B9F, 
                0x00000004, 
                0x00000004, 
                0x00000003, 
                0x00000003
            }
        })
        Name (XPSS, Package (0x04)
        {
            Package (0x08)
            {
                0x000009C4, 
                0x00001950, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000834, 
                0x0000142F, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000708, 
                0x00000EC4, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000578, 
                0x00000B9F, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000004
            }
        })
        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilities
        {
            \_SB.PCI0.SBRG.EC.PCOU = SizeOf (_PSS)
            Return (\_SB.PCI0.SBRG.EC.MPPC ())
        }

        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000001771, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
        Name (_CSD, Package (0x01)  // _CSD: C-State Dependencies
        {
            Package (0x06)
            {
                0x06, 
                0x00, 
                0x00000001, 
                0x000000FE, 
                0x00000002, 
                0x00000000
            }
        })
    }

    Scope (\_PR.P003)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x04)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x000009C4, 
                0x00001950, 
                0x00000004, 
                0x00000004, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000834, 
                0x0000142F, 
                0x00000004, 
                0x00000004, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x00000708, 
                0x00000EC4, 
                0x00000004, 
                0x00000004, 
                0x00000002, 
                0x00000002
            }, 

            Package (0x06)
            {
                0x00000578, 
                0x00000B9F, 
                0x00000004, 
                0x00000004, 
                0x00000003, 
                0x00000003
            }
        })
        Name (XPSS, Package (0x04)
        {
            Package (0x08)
            {
                0x000009C4, 
                0x00001950, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000834, 
                0x0000142F, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000708, 
                0x00000EC4, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }, 

            Package (0x08)
            {
                0x00000578, 
                0x00000B9F, 
                0x00000004, 
                0x00000004, 
                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   /* ........ */
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000004
            }
        })
        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilities
        {
            \_SB.PCI0.SBRG.EC.PCOU = SizeOf (_PSS)
            Return (\_SB.PCI0.SBRG.EC.MPPC ())
        }

        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000001771, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
        Name (_CSD, Package (0x01)  // _CSD: C-State Dependencies
        {
            Package (0x06)
            {
                0x06, 
                0x00, 
                0x00000001, 
                0x000000FE, 
                0x00000002, 
                0x00000000
            }
        })
    }
}

