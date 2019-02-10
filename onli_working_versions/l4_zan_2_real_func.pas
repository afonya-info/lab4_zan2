program art;{$D+,L+}//ghоблыемы : ограничение по единице

uses crt,graph,wincrt;

const
	xarr = 30;
	yarr = 60;
	cham = 3;

type
	masx = array[0..xarr] of integer;
	masy = array[0..yarr] of longint;
	check = record
		x:array [1..cham] of real;
		y:array [1..cham] of real;
		xn:array [1..cham] of string;
		yn:array [1..cham] of string;
	end;

	  

var
	mx:masx;// вспомогательный массив для масшатбов
	my:masy;
	ch:array [-1000..1000] of check;
	gd,gm:integer;
  ox,oy,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im,xamo:integer;
	m,j,stex,stey: real;
	c: char;
	fkos,vylrx,vylox,vyly,vylyz,nnew:boolean;
  maxm:string;
	tx1,tx2,tx3,tx4,tx5,tx6:string[9];
	zag:string;
	f1:text;
	
procedure osi(omx:integer;omy:longint);// послыать занчение масштаба
	var
		ios,xr,xoi:longint;
		tx:string;
		
begin
	cleardevice;

	setlinestyle(0,0,3);
	setcolor(15);
	line(0,oy,getmaxx,oy);
	line(ox,0,ox,getmaxy);
	
	line(ox-5,20,ox,0);
	line(ox+5,20,ox,0);
	line(getmaxx-20,oy-5,getmaxx,oy);
	line(getmaxx-20,oy+5,getmaxx,oy);

	settextjustify(0,0);
	settextstyle(1,0,2);
	outtextxy(ox+15,20,'Y');
	
	settextjustify(0,2);
	settextstyle(1,0,2);
	outtextxy(getmaxx-20,oy +15,'X');

	settextjustify(2,2);
	settextstyle(1,0,1);
	outtextxy(ox - 5,oy + 5,'0');
	
	str(getmaxx,tx);
	settextjustify(0,2);
	settextstyle(1,0,2);
	outtextxy(10,10,tx);
	
	str(getmaxy,tx);
	settextjustify(0,2);
	settextstyle(1,0,2);
	outtextxy(10,50,tx);
	
	xr:=0;
	xoi:=omx;
	xamo:=1;
	for ios:= ox to getmaxx do begin
		if ((xr mod 40) = 0) and (xr <> 0) then begin
			line(ox+xr,oy+7,ox+xr,oy);
			
			str(xoi,tx);
			settextjustify(1,2);
			settextstyle(1,1,1);
			outtextxy(ox + xr,oy + 10,tx);
			
			line(ox-xr,oy+7,ox-xr,oy);
			
			str(xoi,tx);
			settextjustify(1,2);
			settextstyle(1,1,1);
			outtextxy(ox - xr,oy + 10,'-'+tx);
			
			xoi:=xoi+omx;
			inc(xamo);//количество штрихов по иксу для выч функции крайнего левого пложенеия
		
		end;
		inc(xr);
	end;
	
	xr:=0;
	xoi:=omy;
	for ios:= oy downto 0 do begin
		if ((xr mod 40) = 0) and (xr <> 0) then begin
			line(ox-7,oy-xr,ox,oy-xr);
			
			str(xoi,tx);
			settextjustify(2,0);
			settextstyle(1,0,1);
			outtextxy(ox - 9,oy - xr+4,tx);
			
			line(ox-7,oy+xr,ox,oy+xr);
			
			str(xoi,tx);
			settextjustify(2,0);
			settextstyle(1,0,1);
			outtextxy(ox - 9,oy + xr+4,'-'+tx);
			
			xoi:=xoi+omy;
		
		end;
		inc(xr);
	end;

end;
	
	
procedure gra(scx:integer;scy:longint);
	
	var
		xp,yp,gx,gy,cx,cy: real;
		igra,ii,posx,posy,runxm,runxp:integer;
begin	
	cx:=scx/40;//шаг 40 пикселей в одном делении
	cy:=scy/40;//шаг
	
	setlinestyle(0,0,3);
	setcolor(2);
	
	{xp:=-1;
	posy:=oy;
	while posy<=getmaxy do
	begin
		gx:=cx*xp;
		gy:= 4*gx*gx*gx-25*gx*gx+491*gx-2134;
		yp:=gy/cy;
		posy:= trunc(-yp) + oy;
		runxm:=trunc(xp)+ox;
		xp:=xp-1;
	end;
	
	xp:=1;
	posy:=oy;
	while posy>=0 do
	begin
		gx:=cx*xp;
		gy:= 4*gx*gx*gx-25*gx*gx+491*gx-2134;
		yp:=gy/cy;
		posy:= trunc(-yp) + oy;
		runxp:=trunc(xp)+ox;
		xp:=xp+1;
	end;}
	{if runxm<0 then
		runxm:=trunc(-(getmaxx/2));
	if runxp>trunc(getmaxx/2) then
		runxp:=trunc((getmaxx/2));}
	
	
	
	gx:= - scx*xamo ;//крайнее левое положение
	xp:=gx/cx;
	posx:=ox+trunc(xp);
	
	gy:= 4*gx*gx*gx-25*gx*gx+491*gx-2134;
	yp:=gy/cy;
	posy:= trunc(-yp) + oy;
	
	moveto(posx,posy);
	
	ii:=1;
	ch[ii].xn[1]:= 'xp';
	ch[ii].xn[2]:= 'gx';
	ch[ii].xn[3]:= 'posx';
	
	ch[ii].yn[1]:= 'yp';
	ch[ii].yn[2]:= 'gy';
	ch[ii].yn[3]:= 'posy';
	
	ch[ii].x[1]:= xp;
	ch[ii].x[2]:= gx;
	ch[ii].x[3]:= posx;

	ch[ii].y[1]:= yp;
	ch[ii].y[2]:= gy;
	ch[ii].y[3]:= posy;
	
	
	for igra:= trunc(-(getmaxx/2)) to trunc(getmaxx/2) do 
	begin
		xp:=igra;
		gx:=cx*xp;
		posx:=ox+trunc(xp);
		
		gy:= 4*gx*gx*gx-25*gx*gx+491*gx-2134;
		yp:=gy/cy;
		posy:= trunc(-yp) + oy;
		
		lineto(posx,posy);
		
		ch[igra].xn[1]:= 'xp';
		ch[igra].xn[2]:= 'gx';
		ch[igra].xn[3]:= 'posx';
		
		ch[igra].yn[1]:= 'yp';
		ch[igra].yn[2]:= 'gy';
		ch[igra].yn[3]:= 'posy';
		
		ch[igra].x[1]:= xp;
		ch[igra].x[2]:= gx;
		ch[igra].x[3]:= posx;

		ch[igra].y[1]:= yp;
		ch[igra].y[2]:= gy;
		ch[igra].y[3]:= posy;
	end;
	
end;

begin
  detectgraph(gd,gm);
  initgraph(gd,gm,'');
  ox:=trunc(getmaxx/2);
  oy:=trunc(getmaxy/2);
	
	mx[0]:=1;
	my[0]:=100;

	ix:=2;
	for i := 1 to xarr do begin
		mx[i]:=ix;
		ix:=ix+2;
	end;

	iy:=200;
	for i := 1 to yarr do begin
		my[i]:=iy;
		iy:=iy+200;
	end;

	ix:=0;
	iy:=6;
	osi(mx[ix],my[iy]);
	gra(mx[ix],my[iy]);
	
	repeat
		c:= wincrt.readkey;
		if c = #0 then
			begin
				c:= wincrt.readkey;
				case c of
					#75:	begin// стр влево растяжение
									if (ix - 1) >=0 then begin
										dec(ix);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);
									end;									
								end;
					#77:	begin// вправо
									if (ix + 1) <=  xarr then begin
										inc(ix);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);
									end;
								end;
					#72:	begin//вверх
									if (iy -1)>=0 then begin
										dec(iy);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);									
									end;

								end;
					#80:	begin//вниз
									if (iy +1) <=yarr then begin
										inc(iy);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);	
									end;
								
								end;
					#83:	begin// del нормальный масштаб
									ix:=0;
									iy:=6;
									
									osi(mx[ix],my[iy]);
									gra(mx[ix],my[iy]);
									
								end;
				end;
			end
		else
			begin
				case c of
					'+':	begin
									if ((ix - 1) >=0) and ((iy -1)>=0)then begin
										dec(ix);
										dec(iy);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);
									end;
								end;
					'-':	begin
									if ((ix + 1) <=  xarr) and ((iy +1) <=yarr)then begin
										inc(ix);
										inc(iy);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);									
									end;
								end;
				end;
			end;
	until c=#27;
	
  closegraph;
	
	assign(f1,'C:\FPC\2.6.0\bin\i386-win32\lab4_zan2\bugreport.txt');
	rewrite(f1);
	zag:= '|   xp   |   gx   |  posx  |   yp   |   gy   |  posy  |';
	writeln(f1,zag);
	for i:= -1000 to 1000 do 
	begin
		str(ch[i].x[1]:8:1,tx1);
		str(ch[i].x[2]:8:1,tx2);
		str(ch[i].x[3]:8:1,tx3);
		str(ch[i].y[1]:8:1,tx4);
		str(ch[i].y[2]:8:1,tx5);
		str(ch[i].y[3]:8:1,tx6);
		write(f1,tx1+tx2+tx3+tx4+tx5+tx6);
		writeln;
	end;
	close(f1);
	
end.
