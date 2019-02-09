program art;//ghоблыемы : ограничение по единице

uses crt,graph,wincrt;

const
	lxm = -1000;
	rxm = 1000;

type 
	mas = array[lxm..rxm] of real;
	mmsc = record
		x:mas;
		y:mas;
	end;
	
var 
	mx,my:mas;// вспомогательный массив для масшатбов
	mm:mmsc;
	gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im:integer;
	m,j: real;
	c: char;
	fkos,vylrx,vylox,vyly,vylyz,nnew:boolean;
  maxm:string;
	
procedure osi(ntx,nty,ntmx,ntmy:real);// послыать занчение масштаба
	var iosi,xsrt,xstr_,ysrt,colo,dox,doy,shlen,shy,shx,stx,sty,begx,begy: integer;
			dx,xgm,xgn,fxgn,fxgnt: real;
			txn,txm,ty,res,tx,tyt,kost:string;
			foo,foox:boolean;
	begin
	foo:=true;
	foox:=true;
		if not fkos then// есил линии не выплзли тогда очищать экран, а если выползли значит я вызваю функцию как костыль 
			cleardevice;
			
		setcolor(2);
		line(0,oy,getmaxx,oy);
		line(ox,0,ox,getmaxy);
		
		shlen:=10;//длина штриха должна делиться на 2
		shy:=oy - shlen div 2;// начальная точка штриха по у
		shx:=ox - shlen div 2;
		dox:=20;
		xsrt:=ox + dox;
		setusercharsize(4,50,150,1000);
		settextstyle(1,1,0);
    setusercharsize(4,50,150,1000); 
			
		xgn:=0.01;
		dx:=0.01;//0.01
		colo:=2;
		setcolor(colo);
		begx:=0;
		begy:=0;
		while xgn<= 41  do
			begin				
				if (trunc(frac(xgn)*10) = 0) and (trunc(frac(xgn)*100) = 0)  then // число храниться не точно, такой костыль 
					begin
						
						xgm:=xgn*ntx*ntmx;//одновременно и по иксу и синхронное масштаиброание все учитывется одной формулой
						xsrt:=ox + trunc(xgm);
						moveto(xsrt,shy);
						linerel(0,shlen);
						
						str(trunc(xgn),tx);
						stx:=xsrt+1;
						sty:=shy+shlen+2;
						
						
						
						if (tx = '40') and (stx < (getmaxx-20)) then //ограничение по 80
							vylrx:=true
						else	
							vylrx:=false;
							
						if (trunc(xgn)=10) and (stx>(getmaxx)) then// ограничение по единице 
							nnew:=true;
						if (trunc(xgn)=10) and (stx<(getmaxx)) and nnew then
							nnew:=false;
							
						//---------Для минуса----------
						
						settextjustify(1,2);
						settextstyle(1,1,0);
						outtextxy(stx,sty,tx);
						
						xsrt:=ox - trunc(xgm);
						moveto(xsrt,shy);
						linerel(0,shlen);
						
						str(trunc(xgn),tx);
						stx:=xsrt+1;
						sty:=shy+shlen+2;
						
						settextjustify(1,2);
						settextstyle(1,1,0);
						tx:='-'+tx;
						outtextxy(stx,sty,tx);
						
				//if xgn>81 then
				{str(xgn:10:3,tx);
				settextstyle(1,0,0);
				settextjustify(0,2);
				outtextxy(0+begx,0+begy,tx);
				if begy + 5 < getmaxy then	
					begy:=begy+10              /////// отладка
				else 
					begin
						begy:=0;
						begx:=begx+45;
					end;}
					
				end;
				
				

				
				xgm:=xgn*ntx*ntmx;
				fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*nty*ntmy;
				fxgnt:= (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134);
				
				{if ((trunc(xgm) mod 20) = 0) and (trunc(xgm) > 0) and foox then begin
					
					foox:=false;
					xsrt:=ox + trunc(xgm);
					moveto(xsrt,shy);
					linerel(0,shlen);
			
					str(trunc(xgn),tx);
					stx:=xsrt+1;
					sty:=shy+shlen+2;
					
					settextjustify(1,2);
					settextstyle(1,1,0);
					outtextxy(stx,sty,tx);
					
					ysrt:=oy-trunc(fxgn);
					moveto(shx,ysrt);
					linerel(shlen,0);
					str(trunc(fxgnt),tx);
					stx:=shx+shlen+2;
					sty:=ysrt;
					settextjustify(0,0);
					settextstyle(1,0,0);
					outtextxy(stx+1,sty+5,tx);
				
				end;
				
				if not foox and (trunc(xgm) mod 20 <> 0) then foox:=true;}
				
				if (trunc(fxgn) mod 20 = 0) and( trunc(fxgn) > 0) and (foo) then begin
					foo:=false;
					ysrt:=oy-trunc(fxgn);
					moveto(shx,ysrt);
					linerel(shlen,0);
					str((trunc(fxgnt) div 10) * 100,tx);
					stx:=shx+shlen+2;
					sty:=ysrt;
					settextjustify(0,0);
					settextstyle(1,0,0);
					outtextxy(stx+1,sty+5,tx);
					
					ysrt:=oy+trunc(fxgn);
					moveto(shx,ysrt);
					linerel(shlen,0);
					str((trunc(fxgnt) div 100) * 100,tx);
					stx:=shx+shlen+2;
					sty:=ysrt;
					settextjustify(0,0);
					settextstyle(1,0,0);
					tx:='-'+tx;
					outtextxy(stx+1,sty+5,tx);
					
					
				end;
				if not foo and (trunc(fxgn) mod 20 <> 0) then foo:=true;
				
				// ----------------------DBG---------------
				
					//if ((abs((trunc(fxgnt))mod 100) <= 10)and {((((trunc(fxgnt))div 10) mod 10 )<2) and} (xgn <= 5)) then begin
					{setcolor(3);
					str(fxgn:10:3,ty);
					str(xgn:5:2,txn);
					str(xgm:5:2,txm);
					str(trunc(fxgnt),tyt);
					str(((trunc(fxgnt))div 10) mod 10,kost);
					res:=tyt+'|'+ty+'('+txn+'|'+txm+')'+'/'+kost+'\';
					settextstyle(1,0,0);
					settextjustify(0,2);
					outtextxy(0+begx,0+begy,res);
					if begy + 15 < getmaxy then	
						begy:=begy+10             ///////// отладка 
					else 
					begin
						begy:=0;
						begx:=begx+300;
					end;
					setcolor(col);
				end;}
				
				//------------------------DBG-----------------
				
				
				
				
				{fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*nty*ntmy;
				if (fxgn > 0) and ()then begin
					
					
					
				end;}
					
				{str(frac(xgn)*100:5:3,tx);
				settextstyle(1,0,0);
				settextjustify(0,2);
				outtextxy(0+begx,0+begy,tx);
				if begy + 5 < getmaxy then	
					begy:=begy+10             ///////// отладка 
				else 
					begin
						begy:=0;
						begx:=begx+45;
					end;}
				xgn:=xgn + dx;
			end;
			
		{for iosi:= oy downto 5 do begin
			
		end;}
		
			
		
			
		{xgn:=0.01;
		for iosi:= 1 to 8000 do
			begin
				xgm:=xgn*ntx*ntmx;//одновременно и по иксу и синхронное масштаиброание все учитывется одной формулой
				xsrt:=ox - trunc(xgm);
				fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*nty*ntmy;
				fxgnt:=(4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134);
				ysrt:=oy - trunc(fxgn);
				
				if (trunc(frac(xgn)*10) = 0) and (trunc(frac(xgn)*100) = 0)  then // число храниться не точно, такой костыль 
					begin
						moveto(shx,ysrt);
						linerel(shlen,0);
						
						str(trunc(fxgnt),tx);
						stx:=shx - 2;
						sty:=ysrt-2;
						
				if ((xgn>= 1) and (xgn <= 5)) then begin
					setcolor(3);
					str(fxgnt:10:3,tx);
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
					setcolor(col);
				end;
						
						settextjustify(2,2);// правое выравнивание
						settextstyle(1,0,0);
						tx:=''+tx;
						outtextxy(stx,sty,tx);
	
					end;
				xgn:=xgn + dx;
		end;}
		
		
		
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
	end;
	
begin
  detectgraph(gd,gm);
  initgraph(gd,gm,'');
  ox:=trunc(getmaxx/2);
  oy:=trunc(getmaxy/2);
	//setcolor(5);
	//circle(ox,oy,100)
	fkos:=false;
	vylrx:=false;
	vylox:=false;
	vyly:=false;
	vylyz:=false;
	nnew:=false;
	mx[0]:=1;
	my[0]:=1;
	mm.x[0]:=1;
	mm.y[0]:=1;
	
	j:=1.5;
	for i:= 1 to rxm do
		begin
			//mx[i]:=1/j;
			my[i]:=j;
			j:=j+3;
		end;
	j:=5;
	for i:= 1 to rxm do
		begin
			mx[i]:=1/j;
			j:=j+5;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			//mx[i]:=j;
			my[i]:=1/j;
			j:=j+3;
		end;
		
	j:=5;	
	for i:= -1 downto lxm do
		begin
			mx[i]:=j;
			j:=j+5;
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
		
	setcolor(2);
	line(0,oy,getmaxx,oy);
	line(ox,0,ox,getmaxy);
	
	ix:=-10;// масштаб с индексом 5 mx[5] = 1/10
	iy:=-20;
	im:=0;
	gra(mx[ix],my[iy],mm.x[im],mm.y[im]); // выведет график 
	repeat 
		c:= wincrt.readkey;
		if c = #0 then
			begin
				c:= wincrt.readkey;
				case c of
					#75:	begin// стр влево растяжение
									if (not nnew) then begin
										dec(ix);
										osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
										gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
									end;									
								end;
					#77:	begin
									if not vylrx then begin
										inc(ix);
										osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
										gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
									end;
								end;
					#72:	begin
									if not vylyz then begin
										dec(iy);
										osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
										gra(mx[ix],my[iy],mm.x[im],mm.y[im]);									
									end;

								end;
					#80:	begin//стр вниз растяжение
									if not vyly then begin
										inc(iy);
										osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
										gra(mx[ix],my[iy],mm.x[im],mm.y[im]);	
									end;
								
								end;
					#83:	begin// нормальный масштаб
									ix:=-10;
									iy:=-20;
									im:=0;
									
									osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
									
								end;
				end;
			end
		else
			begin
				case c of 
					'+':	begin
									if not(nnew or vylyz ) then begin
										dec(im);
										osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
										gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
									end;
								end;
					'-':	begin
									if not (vylrx or vyly) then begin
										inc(im);
										osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
										gra(mx[ix],my[iy],mm.x[im],mm.y[im]);									
									end;
								end;
				end;
			end;
	until c=#27;
		
  closegraph;
end.
