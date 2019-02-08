program art;//ghоблыемы : ограничение по единице

uses crt,graph,wincrt;

const
	xarr = 31;
	yarr = 20;

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
	
end;
	
	
procedure gra(scx,scy,scmx,scmy: real);
	
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
