{
 * -----------------------------------------------------------------------------
 * Delphi DUnit test cases for the PJFractions unit.
 *
 * These test cases were created with Delphi 2010 and haven't been checked with
 * any other compiler.
 *
 * $Rev$
 * $Date$
 * -----------------------------------------------------------------------------
}

unit TestPJFractions;

interface

uses
  TestFramework, PJFractions;

type
  // Test case for TFraction
  TestTFraction = class(TTestCase)
  published
    // Order of tests is important since some later tests assume some of methods
    // tested earlier work correctly.
    procedure TestConstructors;
    procedure TestImplicit;
    procedure TestIsProper;
    procedure TestIsWholeNumber;
    procedure TestLCD;
    procedure TestCompare;
    procedure TestCompareTo;
    procedure TestSimplify;
    procedure TestReciprocal;
    procedure TestSign;
    procedure TestIsCommonFactor;
    procedure TestComparisonOps;
    procedure TestTruncOp;
    procedure TestRoundOp;
    procedure TestUnaryPlusOp;
    procedure TestUnaryMinusOp;
    procedure TestAddOp;
    procedure TestSubtractOp;
    procedure TestMultiplyOp;
    procedure TestDivideOp;
    procedure TestIntDivideOp;
    procedure TestModulusOp;
    procedure TestMax;
    procedure TestMin;
    procedure TestConvert;
    procedure TestRoundToMulitiple;
    procedure TestTruncateToMultiple;
  end;

implementation

uses
  Types, Math;

{ TestTFraction }

procedure TestTFraction.TestAddOp;
var
  FRes, F1, F2: TFraction;
begin
  // 1/3 + 1/3 = 2/3
  F1 := TFraction.Create(1, 3);
  F2 := TFraction.Create(1, 3);
  FRes := F1 + F2;
  CheckEquals(2, FRes.Numerator, 'Test 1 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 1 Denominator');
  // 2/3 + 5/6 = 4/6 + 5/6 = 9/6 = 3/2
  F1 := TFraction.Create(2, 3);
  F2 := TFraction.Create(5, 6);
  FRes := F1 + F2;
  CheckEquals(3, FRes.Numerator, 'Test 2 Numerator');
  CheckEquals(2, FRes.Denominator, 'Test 2 Denominator');
  // 2/9 + 7/15 = 10/45 + 21/45 = 31/45
  F1 := TFraction.Create(2, 9);
  F2 := TFraction.Create(7, 15);
  FRes := F1 + F2;
  CheckEquals(31, FRes.Numerator, 'Test 3 Numerator');
  CheckEquals(45, FRes.Denominator, 'Test 3 Denominator');
  // 2/5 + 6/7 = 14/35 + 30/35 = 44/35
  F1 := TFraction.Create(2, 5);
  F2 := TFraction.Create(6, 7);
  FRes := F1 + F2;
  CheckEquals(44, FRes.Numerator, 'Test 4 Numerator');
  CheckEquals(35, FRes.Denominator, 'Test 4 Denominator');
  // -1/3 + 1/3 = 0
  F1 := TFraction.Create(-1, 3);
  F2 := TFraction.Create(1, 3);
  FRes := F1 + F2;
  CheckEquals(0, FRes.Numerator, 'Test 5 Numerator');
  CheckEquals(1, FRes.Denominator, 'Test 5 Denominator');
  // -1/3 + 2/3 = 1/3
  F1 := TFraction.Create(-1, 3);
  F2 := TFraction.Create(2, 3);
  FRes := F1 + F2;
  CheckEquals(1, FRes.Numerator, 'Test 6 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 6 Denominator');
  // 1/3 + -2/3 = -1/3
  F1 := TFraction.Create(1, 3);
  F2 := TFraction.Create(-2, 3);
  FRes := F1 + F2;
  CheckEquals(-1, FRes.Numerator, 'Test 7 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 7 Denominator');
  // -5/6 + -5/8 = -20/24 + -15/24 = -35/24
  F1 := TFraction.Create(-5, 6);
  F2 := TFraction.Create(-5, 8);
  FRes := F1 + F2;
  CheckEquals(-35, FRes.Numerator, 'Test 8 Numerator');
  CheckEquals(24, FRes.Denominator, 'Test 8 Denominator');
  // 1 + -5/6 = 6/6 + -5/6 = 1/6
  F1 := TFraction.Create(1);
  F2 := TFraction.Create(-5, 6);
  FRes := F1 + F2;
  CheckEquals(1, FRes.Numerator, 'Test 9 Numerator');
  CheckEquals(6, FRes.Denominator, 'Test 9 Denominator');
  // 2 + 5/6 = 12/6 + 5/6 = 17/6
  F2 := TFraction.Create(5, 6);
  FRes := 2 + F2;
  CheckEquals(17, FRes.Numerator, 'Test 10 Numerator');
  CheckEquals(6, FRes.Denominator, 'Test 10 Denominator');
  // 5/13 + -3 = 5/13 + -39/13 = -34/13
  F1 := TFraction.Create(5, 13);
  FRes := F1 + -3;
  CheckEquals(-34, FRes.Numerator, 'Test 11 Numerator');
  CheckEquals(13, FRes.Denominator, 'Test 11 Denominator');
end;

procedure TestTFraction.TestCompare;
var
  F1, F2, F3, F4, F5, F6, F7, F8: TFraction;
begin
  F1 := TFraction.Create(3, 4);
  F2 := TFraction.Create(F1);
  F3 := TFraction.Create(-2, 4);
  F4 := TFraction.Create(7, 9);
  F5 := TFraction.Create(12, 16);
  F6 := TFraction.Create(16, 12);
  F7 := TFraction.Create(4);
  F8 := TFraction.Create(0);
  CheckEquals(EqualsValue, TFraction.Compare(F1, F2), 'Test 1');
  CheckEquals(LessThanValue, TFraction.Compare(F1, F4), 'Test 2');
  CheckEquals(GreaterThanValue, TFraction.Compare(F1, F3), 'Test 3');
  CheckEquals(EqualsValue, TFraction.Compare(F1, F5), 'Test 4');
  CheckEquals(LessThanValue, TFraction.Compare(F5, F6), 'Test 5');
  CheckEquals(GreaterThanValue, TFraction.Compare(F7, F8), 'Test 6');
  CheckEquals(LessThanValue, TFraction.Compare(F3, F8), 'Test 7');
  CheckEquals(GreaterThanValue, TFraction.Compare(F8, F3), 'Test 8');
end;

procedure TestTFraction.TestCompareTo;
var
  F1, F2, F3, F4, F5, F6, F7, F8: TFraction;
begin
  F1 := TFraction.Create(3, 4);
  F2 := TFraction.Create(F1);
  F3 := TFraction.Create(-2, 4);
  F4 := TFraction.Create(7, 9);
  F5 := TFraction.Create(12, 16);
  F6 := TFraction.Create(16, 12);
  F7 := TFraction.Create(4);
  F8 := TFraction.Create(0);
  CheckEquals(EqualsValue, F1.CompareTo(F2), 'Test 1');
  CheckEquals(LessThanValue, F1.CompareTo(F4), 'Test 2');
  CheckEquals(GreaterThanValue, F1.CompareTo(F3), 'Test 3');
  CheckEquals(EqualsValue, F1.CompareTo(F5), 'Test 4');
  CheckEquals(LessThanValue, F5.CompareTo(F6), 'Test 5');
  CheckEquals(GreaterThanValue, F7.CompareTo(F8), 'Test 6');
  CheckEquals(LessThanValue, F3.CompareTo(F8), 'Test 7');
  CheckEquals(GreaterThanValue, F8.CompareTo(F3), 'Test 8');
end;

procedure TestTFraction.TestComparisonOps;
var
  F1, F2: TFraction;
begin
  // F1 = F2 
  F1 := TFraction.Create(1, 2);
  F2 := TFraction.Create(1, 2);
  CheckTrue(F1 = F2, 'Test 1a (=)');
  CheckFalse(F1 <> F2, 'Test 1a (<>)');
  CheckFalse(F1 < F2, 'Test 1a (<)');
  CheckTrue(F1 <= F2, 'Test 1a (<=)');
  CheckFalse(F1 > F2, 'Test 1a (>)');
  CheckTrue(F1 >= F2, 'Test 1a (>=)');

  // F1 = F2 
  F1 := TFraction.Create(6, 5);
  F2 := TFraction.Create(30, 25);
  CheckTrue(F1 = F2, 'Test 1b (=)');
  CheckFalse(F1 <> F2, 'Test 1b (<>)');
  CheckFalse(F1 < F2, 'Test 1b (<)');
  CheckTrue(F1 <= F2, 'Test 1b (<=)');
  CheckFalse(F1 > F2, 'Test 1b (>)');
  CheckTrue(F1 >= F2, 'Test 1b (>=)');

  // F1 = F2 
  F1 := TFraction.Create(-6, 5);
  F2 := TFraction.Create(30, -25);
  CheckTrue(F1 = F2, 'Test 1c (=)');
  CheckFalse(F1 <> F2, 'Test 1c (<>)');
  CheckFalse(F1 < F2, 'Test 1c (<)');
  CheckTrue(F1 <= F2, 'Test 1c (<=)');
  CheckFalse(F1 > F2, 'Test 1c (>)');
  CheckTrue(F1 >= F2, 'Test 1c (>=)');

  // F1 = F2 
  F1 := TFraction.Create(6, 5);
  F2 := TFraction.Create(-30, -25);
  CheckTrue(F1 = F2, 'Test 1d (=)');
  CheckFalse(F1 <> F2, 'Test 1d (<>)');
  CheckFalse(F1 < F2, 'Test 1d (<)');
  CheckTrue(F1 <= F2, 'Test 1d (<=)');
  CheckFalse(F1 > F2, 'Test 1d (>)');
  CheckTrue(F1 >= F2, 'Test 1d (>=)');

  // F1 > F2 
  F1 := TFraction.Create(4, 5);
  F2 := TFraction.Create(3, 5);
  CheckFalse(F1 = F2, 'Test 2a (=)');
  CheckTrue(F1 <> F2, 'Test 2a (<>)');
  CheckFalse(F1 < F2, 'Test 2a (<)');
  CheckFalse(F1 <= F2, 'Test 2a (<=)');
  CheckTrue(F1 > F2, 'Test 2a (>)');
  CheckTrue(F1 >= F2, 'Test 2a (>=)');

  // F1 > F2 
  F1 := TFraction.Create(1, 2);
  F2 := TFraction.Create(3, 8);
  CheckFalse(F1 = F2, 'Test 2b (=)');
  CheckTrue(F1 <> F2, 'Test 2b (<>)');
  CheckFalse(F1 < F2, 'Test 2b (<)');
  CheckFalse(F1 <= F2, 'Test 2b (<=)');
  CheckTrue(F1 > F2, 'Test 2b (>)');
  CheckTrue(F1 >= F2, 'Test 2b (>=)');

  // F1 > F2 
  F1 := TFraction.Create(-3, 8);
  F2 := TFraction.Create(-1, 2);
  CheckFalse(F1 = F2, 'Test 2c (=)');
  CheckTrue(F1 <> F2, 'Test 2c (<>)');
  CheckFalse(F1 < F2, 'Test 2c (<)');
  CheckFalse(F1 <= F2, 'Test 2c (<=)');
  CheckTrue(F1 > F2, 'Test 2c (>)');
  CheckTrue(F1 >= F2, 'Test 2c (>=)');

  // F1 > F2 
  F1 := TFraction.Create(-1, -2);
  F2 := TFraction.Create(3, 8);
  CheckFalse(F1 = F2, 'Test 2d (=)');
  CheckTrue(F1 <> F2, 'Test 2d (<>)');
  CheckFalse(F1 < F2, 'Test 2d (<)');
  CheckFalse(F1 <= F2, 'Test 2d (<=)');
  CheckTrue(F1 > F2, 'Test 2d (>)');
  CheckTrue(F1 >= F2, 'Test 2d (>=)');

  // F1 < F2 
  F1 := TFraction.Create(-1, 5);
  F2 := TFraction.Create(-1, 9);
  CheckFalse(F1 = F2, 'Test 3a (=)');
  CheckTrue(F1 <> F2, 'Test 3a (<>)');
  CheckTrue(F1 < F2, 'Test 3a (<)');
  CheckTrue(F1 <= F2, 'Test 3a (<=)');
  CheckFalse(F1 > F2, 'Test 3a (>)');
  CheckFalse(F1 >= F2, 'Test 3a (>=)');

  // F1 < F2 
  F1 := TFraction.Create(3, 5);
  F2 := TFraction.Create(8, 11);
  CheckFalse(F1 = F2, 'Test 3b (=)');
  CheckTrue(F1 <> F2, 'Test 3b (<>)');
  CheckTrue(F1 < F2, 'Test 3b (<)');
  CheckTrue(F1 <= F2, 'Test 3b (<=)');
  CheckFalse(F1 > F2, 'Test 3b (>)');
  CheckFalse(F1 >= F2, 'Test 3b (>=)');

  // F1 < F2 
  F1 := TFraction.Create(-11, 9);
  F2 := TFraction.Create(3, -8);
  CheckFalse(F1 = F2, 'Test 3c (=)');
  CheckTrue(F1 <> F2, 'Test 3c (<>)');
  CheckTrue(F1 < F2, 'Test 3c (<)');
  CheckTrue(F1 <= F2, 'Test 3c (<=)');
  CheckFalse(F1 > F2, 'Test 3c (>)');
  CheckFalse(F1 >= F2, 'Test 3c (>=)');

  // F1 < F2 
  F1 := TFraction.Create(3, 4);
  F2 := TFraction.Create(-7, -8);
  CheckFalse(F1 = F2, 'Test 3c (=)');
  CheckTrue(F1 <> F2, 'Test 3c (<>)');
  CheckTrue(F1 < F2, 'Test 3c (<)');
  CheckTrue(F1 <= F2, 'Test 3c (<=)');
  CheckFalse(F1 > F2, 'Test 3c (>)');
  CheckFalse(F1 >= F2, 'Test 3c (>=)');
end;

procedure TestTFraction.TestConstructors;
var
  F, Temp: TFraction;
begin
  // test TFraction.Create(const Numerator, Denominator: Int64)
  F := TFraction.Create(3, 5);
  CheckEquals(3, F.Numerator, 'Test 1a: Numerator');
  CheckEquals(5, F.Denominator, 'Test 1a: Denominator');
  F := TFraction.Create(-3, 5);
  CheckEquals(-3, F.Numerator, 'Test 1b: Numerator');
  CheckEquals(5, F.Denominator, 'Test 1b: Denominator');
  F := TFraction.Create(3, -5);
  CheckEquals(-3, F.Numerator, 'Test 1c: Numerator');
  CheckEquals(5, F.Denominator, 'Test 1c: Denominator');
  F := TFraction.Create(-3, -5);
  CheckEquals(3, F.Numerator, 'Test 1d: Numerator');
  CheckEquals(5, F.Denominator, 'Test 1d: Denominator');

  // test TFraction.Create(const WholeNumber: Integer) 
  F := TFraction.Create(12);
  CheckEquals(12, F.Numerator, 'Test 2a: Numerator');
  CheckEquals(1, F.Denominator, 'Test 2a: Denominator');
  F := TFraction.Create(-12);
  CheckEquals(-12, F.Numerator, 'Test 2b: Numerator');
  CheckEquals(1, F.Denominator, 'Test 2b: Denominator');

  // test TFraction.Create(const Fraction: TFraction) 
  Temp := TFraction.Create(7, 4);
  F := TFraction.Create(Temp);
  CheckEquals(7, F.Numerator, 'Test 3a: Numerator');
  CheckEquals(4, F.Denominator, 'Test 3a: Denominator');
  Temp := TFraction.Create(-7, 4);
  F := TFraction.Create(Temp);
  CheckEquals(-7, F.Numerator, 'Test 3b: Numerator');
  CheckEquals(4, F.Denominator, 'Test 3b: Denominator');
  Temp := TFraction.Create(7, -4);
  F := TFraction.Create(Temp);
  CheckEquals(-7, F.Numerator, 'Test 3c: Numerator');
  CheckEquals(4, F.Denominator, 'Test 3c: Denominator');
  Temp := TFraction.Create(-7, -4);
  F := TFraction.Create(Temp);
  CheckEquals(7, F.Numerator, 'Test 3d: Numerator');
  CheckEquals(4, F.Denominator, 'Test 3d: Denominator');
end;

procedure TestTFraction.TestConvert;
var
  F, FC: TFraction;
begin
  F := TFraction.Create(1, 2);
  FC := F.Convert(6);
  CheckEquals(6, FC.Numerator, 'Test 1 Numerator');
  CheckEquals(12, FC.Denominator, 'Test 1 Denominator');
  F := TFraction.Create(-5, 13);
  FC := F.Convert(3);
  CheckEquals(-15, FC.Numerator, 'Test 2 Numerator');
  CheckEquals(39, FC.Denominator, 'Test 2 Denominator');
  F := TFraction.Create(0);
  FC := F.Convert(7);
  CheckEquals(0, FC.Numerator, 'Test 3 Numerator');
  CheckEquals(7, FC.Denominator, 'Test 3 Denominator');
  F := TFraction.Create(3);
  FC := F.Convert(3);
  CheckEquals(9, FC.Numerator, 'Test 4 Numerator');
  CheckEquals(3, FC.Denominator, 'Test 4 Denominator');
end;

procedure TestTFraction.TestDivideOp;
var
  F1, F2, FRes: TFraction;
begin
  // 2/3 / 5/6 = 2/3 * 6/5 = 12/15 = 4/5
  F1 := TFraction.Create(2, 3);
  F2 := TFraction.Create(5, 6);
  FRes := F1 / F2;
  CheckEquals(4, FRes.Numerator, 'Test 1 Numerator');
  CheckEquals(5, FRes.Denominator, 'Test 1 Denominator');
  // 5/6 / -2/3 = 5/6 * -3/2 = -15/12 = -5/4
  F1 := TFraction.Create(5, 6);
  F2 := TFraction.Create(-2, 3);
  FRes := F1 / F2;
  CheckEquals(-5, FRes.Numerator, 'Test 2 Numerator');
  CheckEquals(4, FRes.Denominator, 'Test 2 Denominator');
  // -3/7 / -3/5 = -3/7 * -5/3 = 15/21 = 5/7
  F1 := TFraction.Create(-3, 7);
  F2 := TFraction.Create(-3, 5);
  FRes := F1 / F2;
  CheckEquals(5, FRes.Numerator, 'Test 3 Numerator');
  CheckEquals(7, FRes.Denominator, 'Test 3 Denominator');
  // 1/2 / 1/2 = 1/2 * 2/1 = 2/2 = 1/1
  F1 := TFraction.Create(1, 2);
  F2 := TFraction.Create(1, 2);
  FRes := F1 / F2;
  CheckEquals(1, FRes.Numerator, 'Test 4 Numerator');
  CheckEquals(1, FRes.Denominator, 'Test 4 Denominator');
  // 5/8 / 3 = 5/8 * 1/3 = 5/24
  F1 := TFraction.Create(5, 8);
  FRes := F1 / 3;
  CheckEquals(5, FRes.Numerator, 'Test 5 Numerator');
  CheckEquals(24, FRes.Denominator, 'Test 5 Denominator');
  // 5 / 12/5 = 5 * 5/12 = 25/12
  F2 := TFraction.Create(12, 5);
  FRes := 5 / F2;
  CheckEquals(25, FRes.Numerator, 'Test 6 Numerator');
  CheckEquals(12, FRes.Denominator, 'Test 6 Denominator');
  // 1 / -2/3 = 1 * -3/2 = -3/2
  F2 := TFraction.Create(-2, 3);
  FRes := 1 / F2;
  CheckEquals(-3, FRes.Numerator, 'Test 7 Numerator');
  CheckEquals(2, FRes.Denominator, 'Test 7 Denominator');
  // 3/4 / 1 = 3/4 * 1/1 = 3/4
  F1 := TFraction.Create(3, 4);
  FRes := F1 / 1;
  CheckEquals(3, FRes.Numerator, 'Test 8 Numerator');
  CheckEquals(4, FRes.Denominator, 'Test 8 Denominator');

end;

procedure TestTFraction.TestImplicit;
var
  F: TFraction;
  E1, E2: Extended;
  D1, D2: Double;
begin
  // implicit cast of integer to fraction
  F := 12;
  CheckEquals(12, F.Numerator, 'Test 1 Numerator');
  CheckEquals(1, F.Denominator, 'Test 1 Denominator');
  F := -42;
  CheckEquals(-42, F.Numerator, 'Test 2 Numerator');
  CheckEquals(1, F.Denominator, 'Test 2 Denominator');
  F := 0;
  CheckEquals(0, F.Numerator, 'Test 3 Numerator');
  CheckEquals(1, F.Denominator, 'Test 3 Denominator');
  // implicit cast fraction to extended
  F := TFraction.Create(5, 27);
  E1 := 5 / 27;
  E2 := F;
  D1 := 5 / 27;
  D2 := F;
  CheckEquals(EqualsValue, CompareValue(D1, D2), 'Test 4 (Double)');
  CheckEquals(EqualsValue, CompareValue(E1, E2), 'Test 4 (Extended)');
  // implicit case extended to fraction
  F := 1 / 3;
  CheckEquals(1, F.Numerator, 'Test 5 Numerator');
  CheckEquals(3, F.Denominator, 'Test 5 Denominator');
  F := 4 / 6;
  CheckEquals(2, F.Numerator, 'Test 6 Numerator');
  CheckEquals(3, F.Denominator, 'Test 6 Denominator');
  E1 := -200/350;
  F := E1;
  E2 := F;
  CheckEquals(-4, F.Numerator, 'Test 7 Numerator');
  CheckEquals(7, F.Denominator, 'Test 7 Denominator');
  CheckEquals(E1, E2, 'Test 7 decimal');
  F := 1.07407407;
  CheckEquals(29, F.Numerator, 'Test 6 Numerator');
  CheckEquals(27, F.Denominator, 'Test 6 Denominator');
  // Check that explicit works by implication
  F := TFraction(6);
  CheckEquals(6, F.Numerator, 'Test External 1 Numerator');
  CheckEquals(1, F.Denominator, 'Test External 1 Denominator');
end;

procedure TestTFraction.TestIntDivideOp;
var
  F1, F2: TFraction;
begin
  // 7/8 div 1/3 = Trunc(7/8 * 3/1) = Trunc(21/8) = 2
  F1 := TFraction.Create(7, 8);
  F2 := TFraction.Create(1, 3);
  CheckEquals(2, F1 div F2, 'Test 1');
  // 11/3 div -2/3 = Trunc(11/3 * -3/2) = Trunc(-33/6) = -5
  F1 := TFraction.Create(11, 3);
  F2 := TFraction.Create(-2, 3);
  CheckEquals(-5, F1 div F2, 'Test 2');
  // 2/3 div 2/3 = Trunc(2/3 * 3/2) = Trunc(6/6) = 1
  F1 := TFraction.Create(2, 3);
  F2 := TFraction.Create(2, 3);
  CheckEquals(1, F1 div F2, 'Test 3');
  // 2/3 div 3/4 = Trunc(2/3 * 4/3) = Trunc(6/9) = 0
  F1 := TFraction.Create(2, 3);
  F2 := TFraction.Create(3, 4);
  CheckEquals(0, F1 div F2, 'Test 4');
  // 32/5 div 3 = Trunc(32/5 * 1/3) = Trunc(32/15) = 2
  F1 := TFraction.Create(32, 5);
  CheckEquals(2, F1 div 3, 'Test 5');
  // 5 div 2/3 = Trunc(5/1 * 3/2) = Trunc(15/2) = 7
  F2 := TFraction.Create(2, 3);
  CheckEquals(7, 5 div F2, 'Test 6');
  // 4/3 div 2/3 = Trunc(4/3 * 3/2) = Trunc(12/6) = 2
  F1 := TFraction.Create(4, 3);
  F2 := TFraction.Create(2, 3);
  CheckEquals(2, F1 div F2, 'Test 7');
  // 10/3 div 1 = Trunc(10/3 * 1/1) = Trunc(10/3) = 3
  F1 := TFraction.Create(10, 3);
  CheckEquals(3, F1 div 1, 'Test 8');
end;

procedure TestTFraction.TestIsCommonFactor;
var
  F: TFraction;
begin
  F := TFraction.Create(32, 48);
  CheckTrue(F.IsCommonFactor(8), 'Test 1');
  CheckTrue(F.IsCommonFactor(16), 'Test 2');
  CheckTrue(F.IsCommonFactor(-2), 'Test 3');
  CheckFalse(F.IsCommonFactor(5), 'Test 4');
end;

procedure TestTFraction.TestIsProper;
var
  F: TFraction;
begin
  F := TFraction.Create(3, 4);
  CheckTrue(F.IsProper, 'Test 1');
  F := TFraction.Create(4, 3);
  CheckFalse(F.IsProper, 'Test 2');
  F := TFraction.Create(5);
  CheckFalse(F.IsProper, 'Test 3');
  F := TFraction.Create(0);
  CheckTrue(F.IsProper, 'Test 4');
end;

procedure TestTFraction.TestIsWholeNumber;
var
  F: TFraction;
begin
  F := TFraction.Create(12);
  CheckTrue(F.IsWholeNumber, 'Test 1');
  F := TFraction.Create(12, 13);
  CheckFalse(F.IsWholeNumber, 'Test 2');
  F := TFraction.Create(-5, 1);
  CheckTrue(F.IsWholeNumber, 'Test 3');
  F := TFraction.Create(1, -5);
  CheckFalse(F.IsWholeNumber, 'Test 4');
  F := TFraction.Create(0);
  CheckTrue(F.IsWholeNumber, 'Test 5');
  F := TFraction.Create(0, 5);
  CheckTrue(F.IsWholeNumber, 'Test 6');
  F := TFraction.Create(4, 4);
  CheckTrue(F.IsWholeNumber, 'Test 7');
  F := TFraction.Create(-4, 4);
  CheckTrue(F.IsWholeNumber, 'Test 8');
  F := TFraction.Create(4, -4);
  CheckTrue(F.IsWholeNumber, 'Test 9');
  F := TFraction.Create(-4, -4);
  CheckTrue(F.IsWholeNumber, 'Test 10');
  F := TFraction.Create(4, -1);
  CheckTrue(F.IsWholeNumber, 'Test 12');
end;

procedure TestTFraction.TestLCD;
var
  F1, F2: TFraction;
begin
  F1 := TFraction.Create(1, 3);
  F2 := TFraction.Create(5, 6);
  CheckEquals(6, TFraction.LCD(F1, F2), 'Test 1');
  F1 := TFraction.Create(1, 6);
  F2 := TFraction.Create(7, 15);
  CheckEquals(30, TFraction.LCD(F1, F2), 'Test 2');
  F1 := TFraction.Create(3, 8);
  F2 := TFraction.Create(5, 12);
  CheckEquals(24, TFraction.LCD(F1, F2), 'Test 3');
  F1 := TFraction.Create(3, 8);
  F2 := TFraction.Create(-5, 12);
  CheckEquals(24, TFraction.LCD(F1, F2), 'Test 4');
  F1 := TFraction.Create(-3, 8);
  F2 := TFraction.Create(-5, 12);
  CheckEquals(24, TFraction.LCD(F1, F2), 'Test 5');
end;

procedure TestTFraction.TestMax;
var
  A: TArray<TFraction>;
begin
  A := TArray<TFraction>.Create(
    TFraction.Create(3,4),
    TFraction.Create(5,12),
    TFraction.Create(-4,3),
    TFraction.Create(1),
    TFraction.Create(23, 5)
  );
  CheckEquals(A[0], TFraction.Max(A[0], A[1]), 'Test 1');
  CheckEquals(A[1], TFraction.Max(A[2], A[1]), 'Test 2');
  CheckEquals(A[4], TFraction.Max(A[3], A[4]), 'Test 3');
  CheckEquals(A[3], TFraction.Max(A[3], A[1]), 'Test 4');
  CheckEquals(A[4], TFraction.Max(A), 'Test 5');
end;

procedure TestTFraction.TestMin;
var
  A: TArray<TFraction>;
begin
  A := TArray<TFraction>.Create(
    TFraction.Create(3,4),
    TFraction.Create(5,12),
    TFraction.Create(-4,3),
    TFraction.Create(1),
    TFraction.Create(23, 5)
  );
  CheckEquals(A[1], Min(A[0], A[1]), 'Test 1');
  CheckEquals(A[2], Min(A[2], A[1]), 'Test 2');
  CheckEquals(A[3], Min(A[3], A[4]), 'Test 3');
  CheckEquals(A[1], Min(A[3], A[1]), 'Test 4');
  CheckEquals(A[2], TFraction.Min(A), 'Test 5');
end;

procedure TestTFraction.TestModulusOp;
var
  F1, F2, FRes: TFraction;
begin
  // 7/8 div 1/3 = Trunc(7/8 * 3/1) = Trunc(21/8) = 2
  // 7/8 mod 1/3 = 7/8 - 2 * 1/3 = 7/8 - 2/3 = 21/24-16/24 = 5/24
  F1 := TFraction.Create(7, 8);
  F2 := TFraction.Create(1, 3);
  FRes := F1 mod F2;
  CheckEquals(5, FRes.Numerator, 'Test 1 Numerator');
  CheckEquals(24, FRes.Denominator, 'Test 1 Denominator');
  // 11/3 div -2/3 = Trunc(11/3 * -3/2) = Trunc(-33/6) = -5
  // 11/3 mod -2/3 = 11/3 - -5 * -2/3 = 11/3 - 10/3 = 1/3
  F1 := TFraction.Create(11, 3);
  F2 := TFraction.Create(-2, 3);
  FRes := F1 mod F2;
  CheckEquals(1, FRes.Numerator, 'Test 2 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 2 Denominator');
  // 2/3 mod 2/3 = 0
  F1 := TFraction.Create(2, 3);
  F2 := TFraction.Create(2, 3);
  FRes := F1 mod F2;
  CheckEquals(0, FRes.Numerator, 'Test 3 Numerator');
  CheckEquals(1, FRes.Denominator, 'Test 3 Denominator');
  // 2/3 div 3/4 = Trunc(2/3 * 4/3) = Trunc(6/9) = 0
  // 2/3 mod 3/4 = 2/3 - 0 * 3/4 = 2/3
  F1 := TFraction.Create(2, 3);
  F2 := TFraction.Create(3, 4);
  FRes := F1 mod F2;
  CheckEquals(2, FRes.Numerator, 'Test 4 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 4 Denominator');
  // 32/5 div 3 = Trunc(32/5 * 1/3) = Trunc(32/15) = 2
  // 32/5 mod 3 = 32/5 - 2 * 3 = 32/5 - 6/1 = 32/5 - 30/5 = 2/5
  F1 := TFraction.Create(32, 5);
  FRes := F1 mod 3;
  CheckEquals(2, FRes.Numerator, 'Test 5 Numerator');
  CheckEquals(5, FRes.Denominator, 'Test 5 Denominator');
  // 5 div 2/3 = Trunc(5/1 * 3/2) = Trunc(15/2) = 7
  // 5 mod 2/3 = 5 - 7 * 2/3 = 5/1 - 14/3 = 15/3 - 14/3 = 1/3
  F2 := TFraction.Create(2, 3);
  FRes := 5 mod F2;
  CheckEquals(1, FRes.Numerator, 'Test 6 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 6 Denominator');
  // 4/3 div 2/3 = Trunc(4/3 * 3/2) = Trunc(12/6) = 2
  // 4/3 mod 2/3 = 4/3 - 2 * 2/3 = 4/3 - 4/3 = 0
  F1 := TFraction.Create(4, 3);
  F2 := TFraction.Create(2, 3);
  FRes := F1 mod F2;
  CheckEquals(0, FRes.Numerator, 'Test 7 Numerator');
  CheckEquals(1, FRes.Denominator, 'Test 7 Denominator');
  // 10/3 mod 1 = 1/3
  F1 := TFraction.Create(10, 3);
  FRes := F1 mod 1;
  CheckEquals(1, FRes.Numerator, 'Test 8 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 8 Denominator');
end;

procedure TestTFraction.TestMultiplyOp;
var
  F1, F2, FRes: TFraction;
begin
  // 3/4 * 2/3 = 6/12 = 1/2
  F1 := TFraction.Create(3, 4);
  F2 := TFraction.Create(2, 3);
  FRes := F1 * F2;
  CheckEquals(1, FRes.Numerator, 'Test 1a Numerator');
  CheckEquals(2, FRes.Denominator, 'Test 1a Denominator');
  // check for commutativity
  FRes := F2 * F1;
  CheckEquals(1, FRes.Numerator, 'Test 1b Numerator');
  CheckEquals(2, FRes.Denominator, 'Test 1b Denominator');
  // -8/7 * 9/10 = -72/70 = -36/35
  F1 := TFraction.Create(-8, 7);
  F2 := TFraction.Create(9, 10);
  FRes := F1 * F2;
  CheckEquals(-36, FRes.Numerator, 'Test 2 Numerator');
  CheckEquals(35, FRes.Denominator, 'Test 2 Denominator');
  // 2 * 5/6 = 2/1 * 5/6 = 10/6 = 5/3
  F2 := TFraction.Create(5, 6);
  FRes := 2 * F2;
  CheckEquals(5, FRes.Numerator, 'Test 3 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 3 Denominator');
  // 7/9 * -3 = 7/9 * -3/1 = -21/9 = -7/3
  F1 := TFraction.Create(7, 9);
  FRes := F1 * -3;
  CheckEquals(-7, FRes.Numerator, 'Test 4 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 4 Denominator');
end;

procedure TestTFraction.TestReciprocal;
var
  F, FR: TFraction;
begin
  F := TFraction.Create(2, 3);
  FR := F.Reciprocal;
  CheckEquals(3, FR.Numerator, 'Test 1 Numerator');
  CheckEquals(2, FR.Denominator, 'Test 1 Denominator');
  F := TFraction.Create(-6, 9);
  FR := F.Reciprocal;
  CheckEquals(-9, FR.Numerator, 'Test 2 Numerator');
  CheckEquals(6, FR.Denominator, 'Test 2 Denominator');
  F := 42;
  FR := F.Reciprocal;
  CheckEquals(1, FR.Numerator, 'Test 3 Numerator');
  CheckEquals(42, FR.Denominator, 'Test 3 Denominator');
end;

procedure TestTFraction.TestRoundOp;
var
  F: TFraction;
begin
  F := TFraction.Create(0);
  CheckEquals(0, Round(F), 'Test 1');
  F := TFraction.Create(3);
  CheckEquals(3, Round(F), 'Test 2');
  F := TFraction.Create(-3);
  CheckEquals(-3, Round(F), 'Test 3');

  F := TFraction.Create(4, -4);
  CheckEquals(-1, Round(F), 'Test 4');
  F := TFraction.Create(-4, 4);
  CheckEquals(-1, Round(F), 'Test 5');
  F := TFraction.Create(4, 4);
  CheckEquals(1, Round(F), 'Test 6');
  F := TFraction.Create(-4, -4);
  CheckEquals(1, Round(F), 'Test 7');

  F := TFraction.Create(2, 3);
  CheckEquals(1, Round(F), 'Test 8');
  F := TFraction.Create(-2, 3);
  CheckEquals(-1, Round(F), 'Test 9');
  F := TFraction.Create(2, -3);
  CheckEquals(-1, Round(F), 'Test 10');
  F := TFraction.Create(-2, -3);
  CheckEquals(1, Round(F), 'Test 11');

  F := TFraction.Create(21, 6);
  CheckEquals(4, Round(F), 'Test 12');
  F := TFraction.Create(-21, 6);
  CheckEquals(-4, Round(F), 'Test 13');
  F := TFraction.Create(21, -6);
  CheckEquals(-4, Round(F), 'Test 14');
  F := TFraction.Create(-21, -6);
  CheckEquals(4, Round(F), 'Test 15');

  F := TFraction.Create(1, 3);
  CheckEquals(0, Round(F), 'Test 16');
  F := TFraction.Create(3, 2);
  CheckEquals(2, Round(F), 'Test 17');
  F := TFraction.Create(-3, 2);
  CheckEquals(-2, Round(F), 'Test 18');
  F := TFraction.Create(4, 3);
  CheckEquals(1, Round(F), 'Test 19');
  F := TFraction.Create(-4, 3);
  CheckEquals(-1, Round(F), 'Test 20');
  F := TFraction.Create(5, 3);
  CheckEquals(2, Round(F), 'Test 21');
  F := TFraction.Create(5, -3);
  CheckEquals(-2, Round(F), 'Test 22');

end;

procedure TestTFraction.TestRoundToMulitiple;
var
  F1, F2, FR: TFraction;
begin
  F1 := TFraction.Create(11, 16);
  F2 := TFraction.Create(1, 8);
  FR := F1.RoundToMulitiple(F2);
  CheckEquals(6, FR.Numerator, 'Test 1 Numerator');
  CheckEquals(8, FR.Denominator, 'Test 1 Denominator');
  F1 := TFraction.Create(11, 16);
  F2 := TFraction.Create(1, 4);
  FR := F1.RoundToMulitiple(F2);
  CheckEquals(3, FR.Numerator, 'Test 2 Numerator');
  CheckEquals(4, FR.Denominator, 'Test 2 Denominator');
  F1 := TFraction.Create(13, 7);
  F2 := TFraction.Create(3, 5);
  FR := F1.RoundToMulitiple(F2);
  CheckEquals(9, FR.Numerator, 'Test 3 Numerator');
  CheckEquals(5, FR.Denominator, 'Test 3 Denominator');
  F1 := TFraction.Create(13, 7);
  F2 := TFraction.Create(7, 10);
  FR := F1.RoundToMulitiple(F2);
  CheckEquals(21, FR.Numerator, 'Test 4 Numerator');
  CheckEquals(10, FR.Denominator, 'Test 4 Denominator');
  F1 := TFraction.Create(5);
  F2 := TFraction.Create(12, 8);
  FR := F1.RoundToMulitiple(F2);
  CheckEquals(36, FR.Numerator, 'Test 5 Numerator');
  CheckEquals(8, FR.Denominator, 'Test 5 Denominator');
  F1 := TFraction.Create(18, 4);
  F2 := TFraction.Create(2);
  FR := F1.RoundToMulitiple(F2);
  CheckEquals(4, FR.Numerator, 'Test 6 Numerator');
  CheckEquals(1, FR.Denominator, 'Test 6 Denominator');
  F1 := TFraction.Create(36, 8);
  F2 := TFraction.Create(12, 8);
  FR := F1.RoundToMulitiple(F2);
  CheckEquals(36, FR.Numerator, 'Test 7 Numerator');
  CheckEquals(8, FR.Denominator, 'Test 7 Denominator');
  F1 := TFraction.Create(9, 8);
  F2 := TFraction.Create(3, 4);
  FR := F1.RoundToMulitiple(F2);
  CheckEquals(6, FR.Numerator, 'Test 8 Numerator');
  CheckEquals(4, FR.Denominator, 'Test 8 Denominator');
end;

procedure TestTFraction.TestSign;
var
  F: TFraction;
begin
  F := TFraction.Create(0);
  CheckEquals(ZeroValue, F.Sign, 'Test 1');
  F := TFraction.Create(2, -3);
  CheckEquals(NegativeValue, F.Sign, 'Test 2');
  F := TFraction.Create(5, 6);
  CheckEquals(PositiveValue, F.Sign, 'Test 3');
end;

procedure TestTFraction.TestSimplify;
var
  F, G: TFraction;
begin
  // testing Simplify(CommonFactor)
  F := TFraction.Create(24, 32);
  G := F.Simplify(2);
  CheckEquals(12, G.Numerator, 'Test A1 Numerator');
  CheckEquals(16, G.Denominator, 'Test A1 Denominator');
  F := TFraction.Create(-24, 32);
  G := F.Simplify(-2);
  CheckEquals(-12, G.Numerator, 'Test A2 Numerator');
  CheckEquals(16, G.Denominator, 'Test A2 Denominator');
  F := TFraction.Create(24, 36);
  G := F.Simplify(6);
  CheckEquals(4, G.Numerator, 'Test A3 Numerator');
  CheckEquals(6, G.Denominator, 'Test A3 Denominator');
  F := TFraction.Create(24, 36);
  G := F.Simplify(1);
  CheckEquals(24, G.Numerator, 'Test A4 Numerator');
  CheckEquals(36, G.Denominator, 'Test A4 Denominator');
  F := TFraction.Create(24, 36);
  G := F.Simplify(-12);
  CheckEquals(2, G.Numerator, 'Test A5 Numerator');
  CheckEquals(3, G.Denominator, 'Test A5 Denominator');

  // testing Simplify()
  F := TFraction.Create(2, 4);
  G := F.Simplify;
  CheckEquals(1, G.Numerator, 'Test B1 Numerator');
  CheckEquals(2, G.Denominator, 'Test B1 Denominator');
  F := TFraction.Create(2, -4);
  G := F.Simplify;
  CheckEquals(-1, G.Numerator, 'Test B2 Numerator');
  CheckEquals(2, G.Denominator, 'Test B2 Denominator');
  F := TFraction.Create(12, 15);
  G := F.Simplify;
  CheckEquals(4, G.Numerator, 'Test B3 Numerator');
  CheckEquals(5, G.Denominator, 'Test B3 Denominator');
  F := TFraction.Create(11, 12);
  G := F.Simplify;
  CheckEquals(11, G.Numerator, 'Test B4 Numerator');
  CheckEquals(12, G.Denominator, 'Test B4 Denominator');
end;

procedure TestTFraction.TestSubtractOp;
var
  FRes, F1, F2: TFraction;
begin
  // 4/3 - 1/3 = 3/3 = 1
  F1 := TFraction.Create(4, 3);
  F2 := TFraction.Create(1, 3);
  FRes := F1 - F2;
  CheckEquals(1, FRes.Numerator, 'Test 1 Numerator');
  CheckEquals(1, FRes.Denominator, 'Test 1 Denominator');
  // 2/3 - 5/6 = 4/6 - 5/6 = -1/6
  F1 := TFraction.Create(2, 3);
  F2 := TFraction.Create(5, 6);
  FRes := F1 - F2;
  CheckEquals(-1, FRes.Numerator, 'Test 2 Numerator');
  CheckEquals(6, FRes.Denominator, 'Test 2 Denominator');
  // 7/15 - 2/9 = 21/45 - 10/45= 11/45
  F1 := TFraction.Create(7, 15);
  F2 := TFraction.Create(2, 9);
  FRes := F1 - F2;
  CheckEquals(11, FRes.Numerator, 'Test 3 Numerator');
  CheckEquals(45, FRes.Denominator, 'Test 3 Denominator');
  // 2/5 - 6/7 = 14/35 - 30/35 = -16/35
  F1 := TFraction.Create(2, 5);
  F2 := TFraction.Create(6, 7);
  FRes := F1 - F2;
  CheckEquals(-16, FRes.Numerator, 'Test 4 Numerator');
  CheckEquals(35, FRes.Denominator, 'Test 4 Denominator');
  // -1/3 - 1/3 = -2/3
  F1 := TFraction.Create(-1, 3);
  F2 := TFraction.Create(1, 3);
  FRes := F1 - F2;
  CheckEquals(-2, FRes.Numerator, 'Test 5 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 5 Denominator');
  // -1/3 + 2/3 = 1/3
  F1 := TFraction.Create(-1, 3);
  F2 := TFraction.Create(2, 3);
  FRes := F1 + F2;
  CheckEquals(1, FRes.Numerator, 'Test 6 Numerator');
  CheckEquals(3, FRes.Denominator, 'Test 6 Denominator');
  // 2/3 - 2/3 = 0
  F1 := TFraction.Create(2, 3);
  F2 := TFraction.Create(2, 3);
  FRes := F1 - F2;
  CheckEquals(0, FRes.Numerator, 'Test 7 Numerator');
  CheckEquals(1, FRes.Denominator, 'Test 7 Denominator');
  // -5/6 - -5/8 = -20/24 - -15/24 = -5/24
  F1 := TFraction.Create(-5, 6);
  F2 := TFraction.Create(-5, 8);
  FRes := F1 - F2;
  CheckEquals(-5, FRes.Numerator, 'Test 8 Numerator');
  CheckEquals(24, FRes.Denominator, 'Test 8 Denominator');
  // 1 - -5/6 = 6/6 - -5/6 = 11/6
  F1 := TFraction.Create(1);
  F2 := TFraction.Create(-5, 6);
  FRes := F1 - F2;
  CheckEquals(11, FRes.Numerator, 'Test 9 Numerator');
  CheckEquals(6, FRes.Denominator, 'Test 9 Denominator');
  // 2 - 5/6 = 12/6 - 5/6 = 7/6
  F2 := TFraction.Create(5, 6);
  FRes := 2 - F2;
  CheckEquals(7, FRes.Numerator, 'Test 10 Numerator');
  CheckEquals(6, FRes.Denominator, 'Test 10 Denominator');
  // 5/13 - -3 = 5/13 - -39/13 = 44/13
  F1 := TFraction.Create(5, 13);
  FRes := F1 - -3;
  CheckEquals(44, FRes.Numerator, 'Test 11 Numerator');
  CheckEquals(13, FRes.Denominator, 'Test 11 Denominator');
end;

procedure TestTFraction.TestTruncateToMultiple;
var
  F1, F2, FT: TFraction;
begin
  F1 := TFraction.Create(11, 16);
  F2 := TFraction.Create(1, 8);
  FT := F1.TruncateToMultiple(F2);
  CheckEquals(5, FT.Numerator, 'Test 1 Numerator');
  CheckEquals(8, FT.Denominator, 'Test 1 Denominator');
  F1 := TFraction.Create(11, 16);
  F2 := TFraction.Create(1, 4);
  FT := F1.TruncateToMultiple(F2);
  CheckEquals(2, FT.Numerator, 'Test 2 Numerator');
  CheckEquals(4, FT.Denominator, 'Test 2 Denominator');
  F1 := TFraction.Create(13, 7);
  F2 := TFraction.Create(3, 5);
  FT := F1.TruncateToMultiple(F2);
  CheckEquals(9, FT.Numerator, 'Test 3 Numerator');
  CheckEquals(5, FT.Denominator, 'Test 3 Denominator');
  F1 := TFraction.Create(13, 7);
  F2 := TFraction.Create(7, 10);
  FT := F1.TruncateToMultiple(F2);
  CheckEquals(14, FT.Numerator, 'Test 4 Numerator');
  CheckEquals(10, FT.Denominator, 'Test 4 Denominator');
  F1 := TFraction.Create(5);
  F2 := TFraction.Create(12, 8);
  FT := F1.TruncateToMultiple(F2);
  CheckEquals(36, FT.Numerator, 'Test 5 Numerator');
  CheckEquals(8, FT.Denominator, 'Test 5 Denominator');
  F1 := TFraction.Create(18, 4);
  F2 := TFraction.Create(2);
  FT := F1.TruncateToMultiple(F2);
  CheckEquals(4, FT.Numerator, 'Test 6 Numerator');
  CheckEquals(1, FT.Denominator, 'Test 6 Denominator');
  F1 := TFraction.Create(36, 8);
  F2 := TFraction.Create(12, 8);
  FT := F1.TruncateToMultiple(F2);
  CheckEquals(36, FT.Numerator, 'Test 7 Numerator');
  CheckEquals(8, FT.Denominator, 'Test 7 Denominator');
  F1 := TFraction.Create(9, 8);
  F2 := TFraction.Create(3, 4);
  FT := F1.TruncateToMultiple(F2);
  CheckEquals(3, FT.Numerator, 'Test 8 Numerator');
  CheckEquals(4, FT.Denominator, 'Test 8 Denominator');
end;

procedure TestTFraction.TestTruncOp;
var
  F: TFraction;
begin
  F := TFraction.Create(0);
  CheckEquals(0, Trunc(F), 'Test 1');
  F := TFraction.Create(3);
  CheckEquals(3, Trunc(F), 'Test 2');
  F := TFraction.Create(-3);
  CheckEquals(-3, Trunc(F), 'Test 3');

  F := TFraction.Create(4, -4);
  CheckEquals(-1, Trunc(F), 'Test 4');
  F := TFraction.Create(-4, 4);
  CheckEquals(-1, Trunc(F), 'Test 5');
  F := TFraction.Create(4, 4);
  CheckEquals(1, Trunc(F), 'Test 6');
  F := TFraction.Create(-4, -4);
  CheckEquals(1, Trunc(F), 'Test 7');

  F := TFraction.Create(2, 3);
  CheckEquals(0, Trunc(F), 'Test 8');
  F := TFraction.Create(-2, 3);
  CheckEquals(0, Trunc(F), 'Test 9');
  F := TFraction.Create(2, -3);
  CheckEquals(0, Trunc(F), 'Test 10');
  F := TFraction.Create(-2, -3);
  CheckEquals(0, Trunc(F), 'Test 11');

  F := TFraction.Create(21, 6);
  CheckEquals(3, Trunc(F), 'Test 12');
  F := TFraction.Create(-21, 6);
  CheckEquals(-3, Trunc(F), 'Test 13');
  F := TFraction.Create(21, -6);
  CheckEquals(-3, Trunc(F), 'Test 14');
  F := TFraction.Create(-21, -6);
  CheckEquals(3, Trunc(F), 'Test 15');
end;

procedure TestTFraction.TestUnaryMinusOp;
var
  F, G: TFraction;
begin
  F := TFraction.Create(4, 5);
  G := -F;
  CheckEquals(-4, G.Numerator, 'Test 1: Numerator');
  CheckEquals(5, G.Denominator, 'Test 1: Denominator');
  F := TFraction.Create(-8, 5);
  G := -F;
  CheckEquals(8, G.Numerator, 'Test 2: Numerator');
  CheckEquals(5, G.Denominator, 'Test 2: Denominator');
  F := TFraction.Create(42);
  G := -F;
  CheckEquals(-42, G.Numerator, 'Test 3: Numerator');
  CheckEquals(1, G.Denominator, 'Test 3: Denominator');
  F := TFraction.Create(-56);
  G := -F;
  CheckEquals(56, G.Numerator, 'Test 4: Numerator');
  CheckEquals(1, G.Denominator, 'Test 4: Denominator');
end;

procedure TestTFraction.TestUnaryPlusOp;
var
  F, G: TFraction;
begin
  F := TFraction.Create(4, 5);
  G := +F;
  CheckEquals(4, G.Numerator, 'Test 1: Numerator');
  CheckEquals(5, G.Denominator, 'Test 1: Denominator');
  F := TFraction.Create(-8, 5);
  G := +F;
  CheckEquals(-8, G.Numerator, 'Test 2: Numerator');
  CheckEquals(5, G.Denominator, 'Test 2: Denominator');
  F := TFraction.Create(42);
  G := +F;
  CheckEquals(42, G.Numerator, 'Test 3: Numerator');
  CheckEquals(1, G.Denominator, 'Test 3: Denominator');
  F := TFraction.Create(-56);
  G := +F;
  CheckEquals(-56, G.Numerator, 'Test 4: Numerator');
  CheckEquals(1, G.Denominator, 'Test 4: Denominator');
end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTFraction.Suite);

end.