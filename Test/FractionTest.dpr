{
 * Delphi DUnit Test Project for DelphiDabbler.Lib.Fractions.pas
 * -------------------------------------------------------------
 *
 * This project provides a DUnit test framework for the
 * DelphiDabbler.Lib.Fractions.pas unit. It can be compiled as either a GUI or a
 * Console application.
 *
 * Console Application
 * ~~~~~~~~~~~~~~~~~~~
 *
 * To compile a console application from the command line you must ensure the
 * CONSOLE_TESTRUNNER symbol is defined, either by creating an environment
 * variable with the name or by passing the symbol to DCC32 using the -D
 * switch.
 *
 * You also need to pass the path to the DUnit binaries using DCC32's -R switch
 * so that the compiler can find DUnit.
 *
 * Here is an example command line (entered all on one line):
 *
 *   DCC32 -DCONSOLE_TESTRUNNER -B
 *     -R"C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\lib"
 *     PJFractionTest
 *
 * Change the -R path to suit your compile and DUnit installation path.
 *
 * GUI Application
 * ~~~~~~~~~~~~~~~
 *
 * The CONSOLE_TESTRUNNER symbol must not be defined to compile a GUI
 * application. From the IDE make sure the symbol is removed from the
 * conditional defines entry in project options if necessary.
 *
 * The compiler must also be able find the DUnit binaries. Ensure that the path
 * to the binaries is included in the search path specified in project options.
 *
 * -----------------------------------------------------------------------------
 *
 * Any copyright in this file is dedicated to the Public Domain.
 * http://creativecommons.org/publicdomain/zero/1.0/
 *
 * -----------------------------------------------------------------------------
}

program FractionTest;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  {$IFDEF CONSOLE_TESTRUNNER}
  TextTestRunner,
  {$ELSE}
  GUITestRunner,
  {$ENDIF}
  TestFramework,
  TestFractions in 'TestFractions.pas',
  DelphiDabbler.Lib.Fractions in '..\DelphiDabbler.Lib.Fractions.pas';

{$R *.RES}

begin
  {$IFDEF CONSOLE_TESTRUNNER}
  with TextTestRunner.RunRegisteredTests do
    Free;
  {$ELSE}
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
  {$ENDIF}
end.

