program Structure;

{ Минимальная рабочая структура для Pascal ABC:
  const -> var -> begin...end. }

const
  N = 10;
  Greeting = 'Pascal';

var
  x: Integer;

begin
  x := N * 2;
  WriteLn('Язык: ', Greeting);
  WriteLn('x = ', x);
end.