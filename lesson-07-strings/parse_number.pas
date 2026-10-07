program ParseNumber;

{ Число <-> строка: IntToStr, StrToInt, Val. }

var
  n, code: Integer;
  s: String;

begin
  n := 42;
  s := IntToStr(n);
  WriteLn('IntToStr(42) = "', s, '"');

  s := '123';
  n := StrToInt(s);
  WriteLn('StrToInt("123") = ', n);

  s := 'abc';
  Val(s, n, code);
  if code = 0 then
    WriteLn('Val: ', n)
  else
    WriteLn('Val: не число, ошибка в позиции ', code);

  s := '7';
  n := StrToInt(s) + 3;
  WriteLn('"7" + 3 = ', n);
end.