program art;{$D+,L+}//ghоблыемы : ограничение по единице

uses crt,graph,wincrt;

const
	xarr = 30;
	yarr = 20;
	lxm = -1000;
	rxm = 1000;

type
	masx = array[0..xarr] of integer;
	masy = array[0..yarr] of longint;
	pixels = array [-800..800] of integer;
	mas = array[lxm..rxm] of real;
	mmsc = record
		x:mas;
		y:mas;
	end;

var
	mx:masx;// вспомогательный массив для масшатбов
	my:masy;
	mnx,mny:mas;
	mni:mmsc;
	xpix,ypix:pixels;
	gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im:integer;
	m,j,stex,stey: real;
	c: char;
	fkos,vylrx,vylox,vyly,vylyz,nnew:boolean;
  maxm:string;
	
procedure osi(omx:integer;omy:longint);// послыать занчение масштаба
	var
		ios,xr,xoi:longint;
		tx:string;
		
begin
	cleardevice;
	
	//stex:=omx/40;//шаг
	//stey:=omy/40;//шаг

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
	
procedure gra(scx,scy,scmx,scmy: real);
	var dx,xgn,xgm,x1,y1,fxgn,fxgnt : real;
			igra,dlx,dly,rd,begx,begy:integer;
			col:word;
			txn,txm,ty,res,tx:string;
	begin
		xgn:=-80;
		dx:=0.5;// раньше dx = 0.01
		col:=4;//red
		setcolor(col);
				
		xgm:=xgn*scx*scmx;//одновременно и по иксу и синхронное масштаиброание все учитывется одной формулой
		x:=ox + trunc(xgm);
		fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*scy*scmy;
		y:=oy - trunc(fxgn);
		//putpixel(x,y,red);
		moveto(x,y);
				
		begx:=0;
		begy:=0;
		
		while xgn<=80 do
			begin
				xgn:=xgn+dx;
				xgm:=xgn*scx*scmx;//одновременно и по иксу и синхронное масштаиброание все учитывется одной формулой
				x:=ox + trunc(xgm);
				fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*scy*scmy;
				fxgnt:= (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134);
				y:=oy - trunc(fxgn);
				
				{if ((xgn>= -20) and (xgn <= 30)) then begin
					setcolor(3);
					str(fxgn:10:3,ty);
					str(xgn:5:2,txn);
					str(xgm:5:2,txm);
					res:=ty+'('+txn+'|'+txm+')';
					settextstyle(1,0,0);
					settextjustify(0,2);
					outtextxy(0+begx,0+begy,res);
					if begy + 15 < getmaxy then	
						begy:=begy+10             ///////// отладка 
					else 
					begin
						begy:=0;
						begx:=begx+200;
					end;
					setcolor(col);
				end;}
				{if y mod 100 = 0 then	begin
					str(y,tx);
					settextstyle(1,0,0);
					settextjustify(0,2);
					outtextxy(0+begx,0+begy,tx);
					if begy + 5 < getmaxy then	
						begy:=begy+10             ///////// отладка 
					else 
					begin
						begy:=0;
						begx:=begx+100;
					end;
				end;}
				lineto(x,y);
			end;
			
			if fxgn >=130000 then 
				vyly:=true
			else
				vyly:=false;
			
			if fxgn <=4300 then
				vylyz:=true
			else
				vylyz:=false;
				
					str(fxgn:20:3,tx);
					settextjustify(2,2);// правое выравнивание
					settextstyle(1,0,2);
					tx:=''+tx;
					outtextxy(ox,oy,tx);
		
			
		dlx:= ox - 1;
		dly:= oy - 1;
		for igra:= dlx downto 0 do//убирание лишних полос
			begin
				if getpixel(igra,dly) = col then
					begin
						setcolor(0);//black
						bar(0,0,igra,getmaxy);//сотрет лишние линии
						fkos:=true;
						osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
						fkos:=false;
					end;
			end;
		
		dlx:=ox +1;
		while (getpixel(dlx,0) <> col) and (dlx <=getmaxx) do // ищет х графика в самом верху
			inc(dlx);
		setcolor(0);
		bar(dlx+1,0,getmaxx,getmaxy);
		fkos:=true;
		osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
		fkos:=false;


begin
  detectgraph(gd,gm);
  initgraph(gd,gm,'');
  ox:=trunc(getmaxx/2);
  oy:=trunc(getmaxy/2);
	
	ix:=1;
	for i:= -767 to 767 do begin
		xpix[i]:=ix;
		inc(ix);
	end;
	
	ix:=1;
	for i:= 400 downto -400 do begin
		ypix[i]:=ix;
		inc(ix);
	end;
	
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
	
	fkos:=false;
	vylrx:=false;
	vylox:=false;
	vyly:=false;
	vylyz:=false;
	nnew:=false;
	mnx[0]:=1;
	mny[0]:=1;
	mni.x[0]:=1;
	mni.y[0]:=1;
	
	j:=1.5;
	for i:= 1 to rxm do
		begin
			//mx[i]:=1/j;
			my[i]:=j;
			j:=j+3;
		end;
	j:=10;
	for i:= 1 to rxm do
		begin
			mx[i]:=1/j;
			j:=j+10;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			//mx[i]:=j;
			my[i]:=1/j;
			j:=j+3;
		end;
		
	j:=10;	
	for i:= -1 downto lxm do
		begin
			mx[i]:=j;
			j:=j+10;
		end;		
		
	j:=1.5;	
	for i:= 1 to rxm do
		begin
			mm.x[i]:=1/j;
			mm.y[i]:=1/j;
			j:=j+0.05;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			mm.x[i]:=j;
			mm.y[i]:=j;
			j:=j+0.05;
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
	
	wincrt.readkey;
	
  closegraph;
end.
