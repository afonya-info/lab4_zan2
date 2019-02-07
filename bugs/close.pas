program BynaryTree;
uses Crt,winGraph,wincrt;
Var
    Gd, Gm, i: integer;
    
Begin
WriteLn('Do Grafiki');
Gd := Detect;
InitGraph(Gd, Gm, 'X:\BP');
if GraphResult <> grOk then
    Halt(1);
OutTextXY(1, 1, 'UDALOS!!!!!!');
wincrt.Readkey;
restorecrtmode;
Clrscr;
WriteLn('Vernulic v Crt');
for i:=0 to 7 do
Writeln(i, 'Ewe nemnogo texta');
Readkey;
end.