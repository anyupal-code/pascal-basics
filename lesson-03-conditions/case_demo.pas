program CaseDemo;

{ case: отдельные значения, группы, диапазоны, else. }

var
  x: Integer;

begin
  Write('x = '); ReadLn(x);

  case x of
    1: WriteLn('один');
    2: WriteLn('два');
    3, 4: WriteLn('три или четыре');
    5..10: WriteLn('от 5 до 10');
  else
    WriteLn('другое');
  end;
end.