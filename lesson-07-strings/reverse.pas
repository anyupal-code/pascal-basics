program ReverseString;

{ Переворот строки. }

function Reverse(s: String): String;
var
  i: Integer;
  r: String;
begin
  r := '';
  for i := Length(s) downto 1 do
    r := r + s[i];
  Reverse := r;
end;

var
  s: String;

begin
  Write('Строка: '); ReadLn(s);
  WriteLn('Реверс: ', Reverse(s));
end.