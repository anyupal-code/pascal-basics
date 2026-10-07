program Palindrome;

{ Проверка: читается ли строка одинаково в обе стороны. }

function IsPalindrome(s: String): Boolean;
var
  i: Integer;
begin
  IsPalindrome := True;
  for i := 1 to Length(s) div 2 do
    if s[i] <> s[Length(s) - i + 1] then
    begin
      IsPalindrome := False;
      Exit;
    end;
end;

var
  s: String;

begin
  Write('Строка: '); ReadLn(s);
  if IsPalindrome(s) then
    WriteLn('Палиндром')
  else
    WriteLn('Не палиндром');
end.