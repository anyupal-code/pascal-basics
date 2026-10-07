program TypesDemo;

{ Объявление переменных всех основных типов. }

var
  i: Integer;
  b: Byte;
  w: Word;
  li: LongInt;
  i64: Int64;
  r: Real;
  sg: Single;
  flag: Boolean;
  c: Char;
  s: String;

begin
  i := -100;
  b := 200;
  w := 60000;
  li := 1000000;
  i64 := 9000000000;
  r := 3.14;
  sg := 2.5;
  flag := True;
  c := 'A';
  s := 'Pascal';

  WriteLn('Integer: ', i);
  WriteLn('Byte:    ', b);
  WriteLn('Word:    ', w);
  WriteLn('LongInt: ', li);
  WriteLn('Int64:   ', i64);
  WriteLn('Real:    ', r:0:2);
  WriteLn('Single:  ', sg:0:1);
  WriteLn('Boolean: ', flag);
  WriteLn('Char:    ', c);
  WriteLn('String:  ', s);
end.