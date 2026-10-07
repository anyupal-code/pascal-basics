program StringArray;

{ Строка как массив символов. }

var
  s: String;
  i, count: Integer;

begin
  Write('Строка: '); ReadLn(s);

  WriteLn('Длина: ', Length(s));

  Write('Символы через точку: ');
  for i := 1 to Length(s) do
    Write(s[i], '.');
  WriteLn;

  count := 0;
  for i := 1 to Length(s) do
    if s[i] = 'a' then Inc(count);
  WriteLn('Букв "a": ', count);
end.