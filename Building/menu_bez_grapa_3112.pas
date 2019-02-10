program art; {$D+,L+}

uses crt;

const
  c = 4;
  push = 112;
  unpush = 15;
  backcol = 7;
  root = 4.62919;

type
  armen = array[1..c] of string[90];

var
  menu: armen;
  sym: char; poz, x, y: integer;
  a, b, step, n, w, f, l, r, t, s, snl, d, absd, plos, zn: real;

function fun(funx: real): real;
begin
  fun := 4 * funx * funx * funx - 25 * funx * funx + 491 * funx - 2134;
end;

function perv(fx: real): real;
begin
  perv := fx * fx * fx * fx - (25 / 3) * fx * fx * fx + 245.5 * fx * fx - 2134 * fx;
end;

procedure enterborders;
begin
  clrscr;
  writeln('Please, enter boarders of integration:');
  write('low boarder = ');
  readln(a);
  write('high boarder = ');
  readln(b);
  write('amount of splits = ');
  readln(step);
  while step < 1 do
  begin
    writeln('amount of splits must be natural number, try again');
    write('amount of splits = ');
    readln(step);
  end;
  if a > b then begin
    t := a;
    a := b;
    b := t;
  end;
  writeln('press any key');
  readln;
end;

function integ(var w: real): real;
var
  sum: real;
begin
  w := w + n;
  sum := 0;
  while (fun(w) > 0) and (w <= b) do
  begin
    sum := sum + fun(w) * n;
    w := w + n;
  end;
  integ := sum;
end;

procedure inaccuracy;
begin
  if (poz = 3) then clrscr;
  d := abs(snl - s);
  if snl <> 0 then
    absd := d / snl * 100
  else
    absd := 0;
	if (poz = 3) then begin 
		writeln('relati2ve inaccuracy = ', d:5:5);
		writeln('absolute inaccuracy = ', absd:5:5, '%');
		readln;
	end;
end;

procedure outmenu;
var
  i: integer;
begin
  clrscr;
  for i := 1 to c do
  begin
    gotoxy(x, y + i - 1);
    write(menu[i]);
  end;
  textattr := push;
  gotoxy(x, y + poz - 1);
  write(menu[poz]);
  textattr := unpush;
end;

procedure outsquare;
begin
  writeln('square calculated by software:', s:5:5, ' square units');
  writeln('square, calculated by analytic method:', snl:5:5, ' square units');
  writeln('press any key');
  readln;
end;

procedure calsquare;
var dd,absdd:real;
begin
	if (poz = 2) then
		clrscr;
	
  s := 0;
  n := abs(b - a) / step;
  w := a + n / 2;
  while w < b do
  begin
    if fun(w) > 0 then
    begin
      zn := fun(w) * n;
      plos := integ(w);
      s := s + plos + zn;
    end;
    w := w + n;
  end;
  if a < root then
    if b < root then
      snl := 0
    else
      snl := perv(b) - perv(root)
  else
    snl := perv(b) - perv(a);
  if poz = 2 then outsquare;
end;


begin
  //textbackground(7);
  clrscr;
  menu[1] := 'Enter the borders of integreation';
  menu[2] := 'The area value calculated by software and analytical method by';
  menu[3] := 'The inaccuracy of calculation: single and absolute';
  menu[4] := 'Exit';
  poz := 1;
  x := 3; y := 3;
  textattr := unpush;
  outmenu;
  repeat
    sym := readkey;
    if sym = #0 then
    begin
      sym := readkey;
      case sym of
        #80:
          if poz < c then
          begin
            gotoxy(x, y + poz - 1);
            write(menu[poz]);
            inc(poz);
            textattr := push;
            gotoxy(x, y + poz - 1);
            write(menu[poz]);
            textattr := unpush;
          end;
        #72:
          if poz > 1 then
          begin
            gotoxy(x, y + poz - 1);
            write(menu[poz]);
            textattr := push;
            dec(poz);
            gotoxy(x, y + poz - 1);
            write(menu[poz]);
            textattr := unpush;
          end;
      end;
    end
    else
    if sym = #13 then
    begin
      case poz of
        1:	begin
							enterborders;
							calsquare;
							inaccuracy;
						end;
        2: calsquare;
        3: inaccuracy;
        4: sym := #27;
      end;
      outmenu;
    end;
  until sym = #27;

end.
