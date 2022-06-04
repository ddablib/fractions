# Fractions Unit

## Description

The `DelphiDabbler.Lib.Fractions.pas` unit provides a single "Advanced" record, _TFraction_ that encapsulates a fraction and a number of operations on it.

A whole bunch of operator overloads make it straightforward to perform all the usual arithmetic operations on a fraction and to cast a _TFraction_ to and from an integer or floating point value.

For full details of methods and operator overloads see the comprehensive [online documentation](https://delphidabbler.com/url/fractions-docs). There is no help file.

_DUnit_ tests for _TFraction_ are included in the download.

## Compatibility

This unit requires Delphi 2009 as a minimum and has been tested on all 32 bit Windows compilers from Delphi 2009 to Delphi XE4 and 64 bit Windows compilers from Delphi XE2 to XE4.

## Installation

The _Fractions_ Unit, documentation and test suite are supplied in a zip file. Before installing you need to extract all the files from the zip file, preserving the directory structure. The following files will be extracted:

* **`DelphiDabbler.Lib.Fractions.pas`** – Main source code.
* `README.md` – The unit's read-me file.
* `MPL-2.txt` – Mozilla Public License v2.0.
* `CHANGELOG.md` – The project's change log.
* `Documentation.URL` – Short-cut to the online documentation.

In addition to the above files you will find the _DUnit_ tests in the `Test` sub-directory.

There are four possible ways to use the unit.

1. The simplest way is to add `DelphiDabbler.Lib.Fractions.pas` to your projects as you need it.
2. To make the unit easier to re-use you can either copy it to a folder on your Delphi search path, or add the folder containing the unit to the Delphi Search path. You then simply use the unit as required without needing to add it to your project.
3. For maximum portability you can add the unit to a Delphi package. If you need help doing this [see here](https://delphidabbler.com/url/install-comp).
4. If you use Git you can add the [`ddablib/fractions`](https://github.com/ddablib/fractions) GitHub repository as a Git submodule and add it to your project. Obviously, it's safer if you fork the repo and use your copy, just in case `ddablib/fractions` ever goes away.

## Update History

A complete change log is provided in [`CHANGELOG.md`](https://github.com/ddablib/fractions/blob/main/CHANGELOG.md) that is included in the download.

## License

The _Fractions Unit_ (`DelphiDabbler.Lib.Fractions.pas`) is released under the terms of the [Mozilla Public License v2.0](https://www.mozilla.org/MPL/2.0/).

All relevant trademarks are acknowledged.

## Acknowledgements

* The information on fractions in the Mathematics Help Facility at [https://mathleague.com/](https://mathleague.com/) was useful in writing this code.
* The GCD and LCM routines were taken from a UseNet post by Hans van Kruijssen that I found on the now defunct EFG site.
* The DecimalToFraction routine was adapted from the Turbo Pascal code presented in "Algorithm To Convert A Decimal To A Fraction" by John Kennedy, Mathematics Department, Santa Monica College, USA.

## Bugs and Feature Requests

Bugs can be reported or new features requested via the project's [Issue Tracker](https://github.com/ddablib/fractions/issues). A GitHub account is required.

Please check if an issue has already been created for a similar report or request. If so then please add a comment containing as much information as you can to the existing issue, or if you've nothing to add, just add a :+1: (`:+1:`) comment. If there is no suitable existing issue then please add a new issue and give as much information as possible.

## About the Author

I'm Peter Johnson – a hobbyist programmer living in Ceredigion in West Wales, UK, writing mainly in Delphi. My programs and other library code are available from: [https://delphidabbler.com/](https://delphidabbler.com/).

This document is copyright © 2013-2022, [P D Johnson](https://gravatar.com/delphidabbler).
