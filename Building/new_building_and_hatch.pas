program art;{$D+,L+}

uses graph, wincrt, crt;

const
  c = 5;
  push = 112;
  unpush = 15;
  backcol = 7;
  root = 4.62919;
  xarr = 30;
  yarr = 150;
  cham = 3;
  npx = 2;
  npy = 36;
	mashpix = 45;

type
  armen = array[1..c] of string[90];
  masx = array[0..xarr] of integer;
  masy = array[0..yarr] of longint;

var
  mx: masx;// вспомогательный массив для масшатбов
  my: masy;
  menu: armen;
  sym: char;
  poz, x, y, ox, oy, i, ix, iy, xamo: longint;
	gd,gm:integer;
  a, b, step, n, w, t, s, snl, d, absd, plos, zn: real;
  cg: char;

function fun(funx: real): real;
begin
  fun := 4 * funx * funx * funx - 25 * funx * funx + 491 * funx - 2134;
end;

function perv(fx: real): real;
begin
  perv := fx * fx * fx * fx - (25 / 3) * fx * fx * fx + 245.5 * fx * fx - 2134 * fx;
end;

procedure enterborders;

var
  entflag,res,anf,apf,bnf,bpf: boolean;

begin
  repeat
    clrscr;
		anf:=true;
		apf:=true;
		bnf:=true;
		bpf:=true;
		writeln(low(longint),'..',high(longint));
    writeln('Please, enter boarders of integration(condition low<>high:');
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
    if a = b then 
      entflag := false
    else
      entflag := true;
		if a<low(longint) then
			anf:=false
		else if a>high(longint) then
			apf:=false;
		
		if b<low(longint) then
			bnf:=false
		else if b>high(longint) then
			bpf:=false;

		res:=anf and apf and bnf and bpf and entflag;
		writeln(low(longint),'..',high(longint));
		//writeln(low(real):1:1,high(real):1:1);
		
    
  until res;
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
  i: longint;
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

procedure infa;
begin
	settextjustify(0, 2);
	settextstyle(1, 0, 2);
	setcolor(5);
	outtextxy(100, 20, 'Y:= 4*x^3-25*x^2+491*x-2134');
	settextstyle(1, 0, 2);
	setcolor(2);
	setlinestyle(0,0,3);
	rectangle(5,70,560,250);
	setcolor(15);
	settextjustify(1, 2);
	outtextxy(trunc(555/2), 80, 'INSTRUCTION');
	settextjustify(0, 2);
	outtextxy(10, 120, 'H or h - hatching');
	outtextxy(10, 140, '+/- - change scale');
	outtextxy(10, 160, #24+'/'+#25+' - independent Y axis` scaling');
	outtextxy(10, 180, #26+'/'+#27+' - independent X axis` scaling');
	outtextxy(10, 200, 'Del - reset to start position');
	outtextxy(10, 220, 'Esc - close graph mode');
end;

procedure osi(omx, omy: longint);// послыать занчение масштаба
var
  ios, xr, xoi: longint;
  tx,txa,txb: string;

begin
  cleardevice;
  infa;
  setlinestyle(0, 0, 3);
  setcolor(15);
  line(0, oy, getmaxx, oy);
  line(ox, 0, ox, getmaxy);
  
  line(ox - 5, 20, ox, 0);
  line(ox + 5, 20, ox, 0);
  line(getmaxx - 20, oy - 5, getmaxx, oy);
  line(getmaxx - 20, oy + 5, getmaxx, oy);
  
  settextjustify(0, 0);
  settextstyle(1, 0, 2);
  outtextxy(ox + 15, 20, 'Y');
  
  settextjustify(0, 2);
  settextstyle(1, 0, 2);
  outtextxy(getmaxx - 20, oy + 15, 'X');
  
  settextjustify(2, 2);
  settextstyle(1, 0, 1);
  outtextxy(ox - 5, oy + 5, '0');
  
  str(getmaxx, tx);
  settextjustify(0, 2);
  settextstyle(1, 0, 2);
  //outtextxy(10, 10, tx);
  
  str(getmaxy, tx);
  settextjustify(0, 2);
  settextstyle(1, 0, 2);
  //outtextxy(10, 50, tx);
  
  xr := 0;
  xoi := omx;
  xamo := 1;
  for ios := ox to getmaxx do 
  begin
    if ((xr mod mashpix) = 0) and (xr <> 0) then begin
      line(ox + xr, oy + 7, ox + xr, oy);
      
      str(xoi, tx);
      settextjustify(1, 2);
      settextstyle(1, 1, 1);
      outtextxy(ox + xr, oy + 10, tx);
      
      line(ox - xr, oy + 7, ox - xr, oy);
      
      str(xoi, tx);
      settextjustify(1, 2);
      settextstyle(1, 1, 1);
      outtextxy(ox - xr, oy + 10, '-' + tx);
      
      xoi := xoi + omx;
      inc(xamo);//количество штрихов по иксу для выч функции крайнего левого пложенеия
      
    end;
    inc(xr);
  end;
  
  xr := 0;
  xoi := omy;
  for ios := oy downto 0 do 
  begin
    if ((xr mod mashpix) = 0) and (xr <> 0) then begin
      line(ox - 7, oy - xr, ox, oy - xr);
      
      str(xoi, tx);
      settextjustify(2, 0);
      settextstyle(1, 0, 1);
      outtextxy(ox - 9, oy - xr + 4, tx);
      
      line(ox - 7, oy + xr, ox, oy + xr);
      
      str(xoi, tx);
      settextjustify(2, 0);
      settextstyle(1, 0, 1);
      outtextxy(ox - 9, oy + xr + 4, '-' + tx);
      
      xoi := xoi + omy;
      
    end;
    inc(xr);
  end;
	settextjustify(0, 2);
	setcolor(9);
	settextstyle(1, 0, 2);
	str(a:1:1,txa);
	str(b:1:1,txb);
	outtextxy(ox+100, oy+100, 'a = '+txa+', b = '+txb);

  
end;

procedure hatching(hsx, hsy: longint);
  
	var
		axp, ayp, apx, ay, bpx, byp, bgx, rxp,by, cx, cy,xgmx,hxp,hy,hyp,corhxp,corx,cory,coryp: real;
		aposx, aposy, bposx,bposy,rposx,mbposy,pgmx,hposx,hposy,corypos: longint;
		fah:boolean;
		txby,txa,txb:string;
begin
	cx := hsx / mashpix;//шаг mashpix пикселей в одном делении
  cy := hsy / mashpix;//шаг
	
	rxp:=root/cx;
	rposx:=ox+trunc(rxp);
	
	setlinestyle(0,0,1);
	setcolor(2);
	settextjustify(2, 2);
	settextstyle(1, 0, 2);
	setfillstyle(11,9);
	pgmx:=getmaxx-ox;
	xgmx:=cx*pgmx;
	if a <=root then
		if b<=root then
			fah:=true// привыводе текста проврека на флаг
		else begin
			fah:=false;
			if b<=xgmx then begin
				hxp:=b/cx; //<----  +
				bposx:=ox + trunc(hxp);//<---- +
				hy:=fun(b);//<---- +
			end
			else begin
				bposx:=getmaxx;//<----minus
				hy:=fun(xgmx);//<---- minus
				hxp:=pgmx;//<---- minus
			end;
				hyp:=hy/cy;
				bposy:=trunc(-hyp) + oy;
				
				if bposy<0 then
					bposy:=0;
				
				hposx:=bposx-10;
				hposy:=oy-12;
				corhxp:=hxp-10;// дляпроверки штриховки
				corx:=cx*corhxp;// пошлю в функцию
				cory:=fun(corx);
				coryp:=cory/cy;// штриховать если |oy-2-coryp|>3
				corypos:=oy + trunc(-coryp);// позиция функции над позицией штризовки
				
				if (hposy>corypos)and(getpixel(hposx,hposy)<>2) then begin //штриховать
					line(bposx,oy-2,bposx,bposy);
					line(rposx,oy-2,bposx,oy-2);
					floodfill(hposx,hposy,2);
				end
				else
					fah:=true;
		end
	else begin
		
		apx:=a/cx;
		aposx:= ox + trunc(apx);
		ay:=fun(a);
		ayp:=ay/cy;
		aposy:=trunc(-ayp) + oy;
		
		bpx:=b/cx;
		bposx:=ox + trunc(bpx);
		by:=fun(b);
		byp:=by/cy;
		bposy:=trunc(-byp) + oy;
		
		if abs(aposx-bposx)>10 then begin
			if aposx<getmaxx then begin
				fah:=false;
				//// -----для б----- 
				//outtextxy(ox-100, oy+100,'a<getmaxx');
				if bposx<=getmaxx then begin
					//outtextxy(ox-100, oy+120,'bposx<getmaxx');
					bpx:=b/cx; //<----  +
					bposx:=ox + trunc(bpx);//<---- +
					by:=fun(b);//<---- +
				end
				else begin
					//outtextxy(ox-100, oy+120,'bposx>getmaxx');
					bpx:=pgmx;
					bposx:=getmaxx;
					by:=fun(xgmx);
				end;
				byp:=by/cy;
				bposy:=trunc(-byp)+oy;
				
				if bposy<0 then begin
				//outtextxy(ox-100, oy+140,'bposy<0');
					bposy:=0;
				end;
				hposx:=bposx-10;
				hposy:=oy-12;
				corhxp:=bpx-10;
				corx:=cx*corhxp;
				cory:=fun(corx);
				coryp:=cory/cy;
				corypos:=oy + trunc(-coryp);
				
				// -------для а--------
				
				
				
				if (hposy>corypos)and(getpixel(hposx,hposy)<>2)and((oy-2)>aposy) then begin
					line(bposx,oy-2,bposx,bposy);
					line(aposx,oy-2,aposx,aposy);
					line(aposx,oy-2,bposx,oy-2);
					floodfill(hposx,hposy,2);
				end
				else begin
					//setcolor(4);
					//outtextxy(ox-100, oy+160,'3 conditions');
					fah:=true;
				end;
			end
			else begin
				fah:=true;
				//setcolor(4);
				//outtextxy(ox-100, oy+160,'aposx>=getmaxx');
			end;
		end
		else begin
			fah:=true;
			//setcolor(4);
			//outtextxy(ox-100, oy+160,'abs(aposx-bposx)<=10');
		end;
	end;
	if fah then begin
		settextjustify(0, 2);
		settextstyle(1, 0, 2);
		outtextxy(150, 260, 'hatch is not available');
		outtextxy(150, 280, ' at the current scale');
		outtextxy(150, 300, 'or borders are too close');
		outtextxy(150, 320, ' to each other');
		outtextxy(150, 340, 'or the square is absent');
	end;
				
	
end;


procedure gra(scx, scy: longint);

var
  xp, yp, gx, gy, cx, cy: real;
  igra, posx, posy, runxm, runxp: longint;
begin
  cx := scx / mashpix;//шаг mashpix пикселей в одном делении
  cy := scy / mashpix;//шаг
  
  setlinestyle(0, 0, 3);
  setcolor(2);
  
  xp := -1;
  posy := oy;
  while posy <= getmaxy do
  begin
    gx := cx * xp;
    gy := fun(gx);
    yp := gy / cy;
    posy := trunc(-yp) + oy;
    posx := ox + trunc(xp);
    runxm := trunc(xp);
    xp := xp - 1;
  end;
  
  moveto(posx, posy - 1);
  
  xp := 1;
  posy := oy;
  while posy >= 0 do
  begin
    gx := cx * xp;
    gy := fun(gx);
    yp := gy / cy;
    posy := trunc(-yp) + oy;
    runxp := trunc(xp);
    xp := xp + 1;
  end;
  if runxm < trunc(-getmaxx / 2) then
    runxm := trunc(-(getmaxx / 2));
  if runxp > trunc(getmaxx / 2) then
    runxp := trunc((getmaxx / 2));
  
  
  for igra := runxm to runxp do 
  begin
    xp := igra;
    gx := cx * xp;
    posx := ox + trunc(xp);
    
    gy := fun(gx);
    yp := gy / cy;
    posy := trunc(-yp) + oy;
    
    lineto(posx, posy);
    
  end;
  
  {hx := scx;
  hy := scy;
  hatching(hx, hy);}
  
end;

procedure plot;
begin
  detectgraph(gd, gm);
  initgraph(gd, gm, '');
  ox := trunc(getmaxx / 2);
  oy := trunc(getmaxy / 2);
  
  mx[0] := 1;
  my[0] := 100;
  
  ix := 2;
  for i := 1 to xarr do 
  begin
    mx[i] := ix;
    ix := ix + 2;
  end;
  
  iy := 200;
  for i := 1 to yarr do 
  begin
    my[i] := iy;
    iy := iy + 200;
  end;
  
  ix := npx;
  iy := npy;
  osi(mx[ix], my[iy]);
  gra(mx[ix], my[iy]);
  
  repeat
    cg := wincrt.readkey;
    if cg = #0 then
    begin
      cg := wincrt.readkey;
      case cg of
        #75:	
          begin// стр влево растяжение
            if (ix - 1) >= 0 then begin
              dec(ix);
              osi(mx[ix], my[iy]);
              gra(mx[ix], my[iy]);
            end;									
          end;
        #77:	
          begin// вправо
            if (ix + 1) <=  xarr then begin
              inc(ix);
              osi(mx[ix], my[iy]);
              gra(mx[ix], my[iy]);
            end;
          end;
        #72:	
          begin//вверх
            if (iy - 1) >= 0 then begin
              dec(iy);
              osi(mx[ix], my[iy]);
              gra(mx[ix], my[iy]);
            end;
            
          end;
        #80:	
          begin//вниз
            if (iy + 1) <= yarr then begin
              inc(iy);
              osi(mx[ix], my[iy]);
              gra(mx[ix], my[iy]);						
            end;
            
          end;
        #83:	
          begin// del нормальный масштаб
            ix := npx;
            iy := npy;
            
            osi(mx[ix], my[iy]);
            gra(mx[ix], my[iy]);
          end;
      end;
    end
  		else
    begin
      case cg of
        '+':	
          begin
            if ((ix - 1) >= 0) and ((iy - 1) >= 0) then begin
              dec(ix);
              dec(iy);
              osi(mx[ix], my[iy]);
              gra(mx[ix], my[iy]);
            end;
          end;
        '-':	
          begin
            if ((ix + 1) <=  xarr) and ((iy + 1) <= yarr) then begin
              inc(ix);
              inc(iy);
              osi(mx[ix], my[iy]);
              gra(mx[ix], my[iy]);							
            end;
          end;
				'h': hatching(mx[ix], my[iy]);
				'H': hatching(mx[ix], my[iy]);
				'0':begin// сброс на минимум
						ix := 0;
            iy := 0;
            osi(mx[ix], my[iy]);
            gra(mx[ix], my[iy]);
						end;
				'9':begin// сброс на минимум
						ix := xarr;
            iy := yarr;
            osi(mx[ix], my[iy]);
            gra(mx[ix], my[iy]);
						end;
				//'Р': hatching(mx[ix], my[iy]);
				//'р': hatching(mx[ix], my[iy]);
      end;
    end;
  until cg = #27;
  
  closegraph;
end;


begin
  //textbackground(7);
  clrscr;
  menu[1] := 'Enter the borders of integreation';
  menu[2] := 'The area value calculated by software and analytical method by';
  menu[3] := 'The inaccuracy of calculation: single and absolute';
  menu[4] := 'Plotting the graph of function y:= 4*x^3-25*x^2+491*x-2134';
  menu[5] := 'Exit';
	a:=0;
	b:=0;
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
        1:	
          begin
            enterborders;
            calsquare;
            inaccuracy;
          end;
        2: calsquare;
        3: inaccuracy;
        4: plot;
        5: sym := #27;
      end;
      outmenu;
    end;
  until sym = #27;
  
end.
