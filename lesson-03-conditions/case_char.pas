program CaseChar;

{ case по символу: гласная, цифра, буква. }

var
  c: Char;

begin
  Write('Символ: '); ReadLn(c);

  case c of
    'a', 'e', 'i', 'o', 'u',
    'A', 'E', 'I', 'O', 'U': WriteLn('Гласная');
    '0'..'9': WriteLn('Цифра');
    'a'..'z', 'A'..'Z': WriteLn('Буква');
  else
    WriteLn('Другой символ');
  end;
end.