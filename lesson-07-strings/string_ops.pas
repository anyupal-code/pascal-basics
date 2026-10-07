program StringOps;

{ Copy, Delete, Insert, Pos. }

var
  s, t: String;
  p: Integer;

begin
  s := 'Pascal';
  WriteLn('Исходная: ', s);

  Delete(s, 1, 1);
  WriteLn('Delete(s,1,1): ', s);

  Insert('Pro', s, 1);
  WriteLn('Insert("Pro",s,1): ', s);

  t := Copy(s, 1, 3);
  WriteLn('Copy(s,1,3): ', t);

  p := Pos('cal', s);
  WriteLn('Pos("cal",s): ', p);

  if p > 0 then
    WriteLn('Подстрока найдена')
  else
    WriteLn('Не найдена');
end.