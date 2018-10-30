program AI;

const Igen          = 'yes';
      Nem           = 'no';
      Hehe          = 'hehe';
      Comp          = 'DeeJayy';
      Whois         = 'who is ';
      First: Array[1..9] of string =
      ('hello', 'helo', 'hi', 'hy', 're', 'good morning', 'good afternoon',
       'good day', 'good night');

var S, Name, LastMsg: String;

function LowerCase(S: String): String;
var e: integer;
begin
  for e := 1 to length(s) do
    if s[e] in ['A'..'Z'] then s[e] := chr(ord(s[e]) + 32);
  LowerCase := S;
end;

function ProcMsg(S: String): String;
var k, t, t2, lfirst: string;
    i, _first: integer;
    c: char;
begin
  randomize;

  { --- space from first --- }

  repeat
    if s <> '' then
    begin
     if s[1] = ' ' then delete(s, 1, 1)
     else break
    end
    else break
  until false;

  { --- default reaction ---}

  k := 'i don''t understand';

  { --- Hehe, Smiley --- }

  If Pos(Hehe, S) <> 0 Then k := ':)';

  { --- Computer name --- }

  If S = LowerCase(Comp) Then k := 'it''s my name';

  { --- Who is? --- }

  If Pos(whois, S) = 1 Then
  begin
   k := 'i don''t know';
   t := '';
   i := Length(whois);
   repeat
     inc(i);
     t2 := copy(s, i, 1);
     if (t2 <> '') and (t2[1] in ['a'..'z']) then
     t := t + copy(s, i, 1)
     else break;
   until false;

   if t = LowerCase(comp) then k := 'it''s me!' else
   if t = LowerCase(name) then k := 'it''s you! do you know your name?' else
   k := 'i don''t know ' + t;
  end;

  { --- helo, hello, hy, re, hi /and so on/ --- }

  _first := -1;
  for i := 1 to 9 do
  if (pos(first[i], s) = 1) and
     ((s[length(first[i]) + 1] = ' ') or (S=first[i])) then _first := i;
  if _first <> -1 then
    begin
      repeat
        k := first[random(5) + 1];
        if k <> lfirst then break;
      until false;
      lfirst := k;
    end;

  { --- return --- }

  ProcMsg := comp + '> ' + k;
  LastMsg := S;
end;

BEGIN
  Write('Your Name?: ');
  ReadLn(Name);
  Repeat
    Write(Name, '> ');
    ReadLn(S);
    S := LowerCase(S);
    If S = 'bye' then Exit;
    WriteLn(ProcMsg(S));
  Until False;
END.