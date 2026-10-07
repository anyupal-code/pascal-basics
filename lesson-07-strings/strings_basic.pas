program StringsBasic;

{ Объявление, длина, индексация, конкатенация. }

var
  s: String;
  c: Char;

begin
  s := 'Hello';
  c := s[1];
  WriteLn('s = ', s);
  WriteLn('Длина: ', Length(s));
  WriteLn('Первый символ: ', c);

  s := s + ', World!';
  WriteLn('После конкатенации: ', s);

  s[1] := 'h';
  WriteLn('После замены s[1]: ', s);
end.