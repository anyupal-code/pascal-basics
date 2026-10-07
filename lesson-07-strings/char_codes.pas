program CharCodes;

{ Ord, Chr, классификация символов. }

var
  c: Char;
  code, i: Integer;

begin
  c := 'A';
  code := Ord(c);
  WriteLn('Ord("A") = ', code);

  c := Chr(66);
  WriteLn('Chr(66) = ', c);

  Write('Символ: '); ReadLn(c);
  if (c >= 'a') and (c <= 'z') then
    WriteLn('Строчная буква')
  else if (c >= 'A') and (c <= 'Z') then
    WriteLn('Заглавная буква')
  else if (c >= '0') and (c <= '9') then
    WriteLn('Цифра')
  else
    WriteLn('Другой символ');

  Write('Все заглавные: ');
  for i := Ord('A') to Ord('Z') do
    Write(Chr(i));
  WriteLn;
end.