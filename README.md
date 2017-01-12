# acpi-fixes
Fixes ACPI errors for MSI GX70 3CC Destroyer laptop.

Wrong VGA size fix source: http://lists.x.org/archives/xorg-driver-ati/2013-December/025521.html

------
Extraction steps:

```bash
$ acpidump > acpi.dat
$ acpixtract -a acpi.dat
$ iasl -e *.dat -d dsdt.dat
$ iasl -e *.dat -d ssdt1.dat
$ iasl -e *.dat -d ssdt2.dat
```

-------
DSDT compilation status

[![Build Status](https://travis-ci.org/hoefling/msi-gx70-3cc-acpi-fixes.svg?branch=master)](https://travis-ci.org/hoefling/msi-gx70-3cc-acpi-fixes)
