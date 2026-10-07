program SetBasic;

{ Операции над множествами. }

var
  s, t: set of Char;
  c: Char;

begin
  s := ['a', 'b', 'c'];
  t := ['b', 'c', 'd'];

  WriteLn('a in s: ', 'a' in s);
  WriteLn('z in s: ', 'z' in s);

  Write('s + t: ');
  for c := #0 to #255 do
    if c in (s + t) then Write(c, ' ');
  WriteLn;

  Write('s * t: ');
  for c := #0 to #255 do
    if c in (s * t) then Write(c, ' ');
  WriteLn;

  Write('s - t: ');
  for c := #0 to #255 do
    if c in (s - t) then Write(c, ' ');
  WriteLn;
end.