program CaseConvert;

{ Смена регистра через UpCase. }

function ToUpper(s: String): String;
var
  i: Integer;
begin
  for i := 1 to Length(s) do
    s[i] := UpCase(s[i]);
  ToUpper := s;
end;

var
  s: String;

begin
  Write('Строка: '); ReadLn(s);
  WriteLn('Верхний регистр: ', ToUpper(s));

  Write('Символ: '); ReadLn(s);
  if (Length(s) >= 1) then
    WriteLn('UpCase: ', UpCase(s[1]));
end.