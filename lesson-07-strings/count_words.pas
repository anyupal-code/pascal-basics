program CountWords;

{ Подсчёт слов, разделённых пробелами. }

function CountWords(s: String): Integer;
var
  i, count: Integer;
  inWord: Boolean;
begin
  count := 0;
  inWord := False;
  for i := 1 to Length(s) do
    if s[i] <> ' ' then
    begin
      if not inWord then
      begin
        Inc(count);
        inWord := True;
      end;
    end
    else
      inWord := False;
  CountWords := count;
end;

var
  s: String;

begin
  Write('Строка: '); ReadLn(s);
  WriteLn('Слов: ', CountWords(s));
end.