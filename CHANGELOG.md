# Change Log for Fractions unit

## v0.2.0 rc1 of 06 April 2025

_This is a v1.0 release candidate._

+ Added new _Power_ and _Abs_ overloaded methods to _TFraction_. These are instance method overloads of the existing class methods [issue #4].
+ Added new _TFraction.Hash_ instance method [issue #11].
+ Added new _Initialize_ operator overload, conditionally compiled for Delphi 10.4 and later, that initialises _TFraction_ variables to a valid zero value with numerator = 0 and denominator = 1 [issue #3].
+ Fixed bug in an exception error message format string that could causes a crash [issue #10].
+ Added unit tests for all the new methods and a conditionally compiled test for the _Initialize_ operater overload for Delphi 10.4 and later.
+ Overhauled `Release.bat` release script [issue #9]:
  + Fixed bug that was preventing the `README.md` and `CHANGELOG.md` files from being packaged following their renaming.
  + Added ability to take release version number as a command line parameter and to include the version number in the zip file name.
  + General refactoring.
+ Revised details of compiler support in `README.md`.

## v0.1.2 beta of 13 December 2023

+ Revised _LCM_ routine to reduce chance of integer overflow [issue #8].
+ Added `.gitignore` file.
+ Documentation changes:
  + Moved `Docs/ChangeLog.txt`into repo root, converted from plain text to Markdown format and renamed as `CHANGELOG.md`.
  + Moved `Docs/ReadMe.htm` file into repo root, converted from HTML to Markdown format, revised and renamed as `README.md`.
  + Removed broken links from header comments in Pascal unit.

## v0.1.1 beta of 11 January 2014

+ Fixed problem with compiler directives in Fractions unit that was causing compilation to fail on Delphi XE5.
+ Minor documentation tweaks and corrections.

## v0.1.0 beta of 13 January 2013

+ Initial beta release for Delphi 2009 and later.
