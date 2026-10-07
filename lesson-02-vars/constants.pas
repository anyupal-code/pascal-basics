program ConstantsDemo;

{ Константы: значение задаётся при объявлении и не меняется. }

const
  Pi = 3.14159;
  N = 10;
  Greeting = 'Pascal';
  Debug = True;

var
  radius, area: Real;

begin
  radius := 5.0;
  area := Pi * radius * radius;

  WriteLn('Привет, ', Greeting);
  WriteLn('N = ', N);
  WriteLn('Площадь круга: ', area:0:2);
  WriteLn('Debug = ', Debug);
end.