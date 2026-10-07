program SetChars;

{ Уникальные символы строки через множество. }

function UniqueChars(s: String): String;
var
  seen: set of Char;
  i: Integer;
  r: String;
begin
  seen := [];
  r := '';
  for i := 1 to Length(s) do
    if not (s[i] in seen) then
    begin
      seen := seen + [s[i]];
      r := r + s[i];
    end;
  UniqueChars := r;
end;

function AllDigits(s: String): Boolean;
var
  i: Integer;
begin
  AllDigits := True;
  for i := 1 to Length(s) do
    if not (s[i] in ['0'..'9']) then
    begin
      AllDigits := False;
      Exit;
    end;
end;

var
  s: String;

begin
  Write('Строка: '); ReadLn(s);
  WriteLn('Уникальные символы: ', UniqueChars(s));
  if AllDigits(s) then
    WriteLn('Состоит только из цифр')
  else
    WriteLn('Есть нецифровые символы');
end.