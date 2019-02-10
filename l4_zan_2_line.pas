program art;{$D+,L+}//gh������� : ����������� �� �������

uses crt,graph,wincrt;

const
	xarr = 30;
	yarr = 20;

type
	masx = array[0..xarr] of integer;
	masy = array[0..yarr] of longint;

	

var
	mx:masx;// ��������������� ������ ��� ���������
	my:masy;
	checkx: array [1..2000] of integer;
	checky: array [1..1000] of integer;
	gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im:integer;
	m,j,stex,stey: real;
	c: char;
	fkos,vylrx,vylox,vyly,vylyz,nnew:boolean;
  maxm:string;
	
procedure osi(omx:integer;omy:longint);// �������� �������� ��������
	var
		ios,xr,xoi:longint;
		tx:string;
		
begin
	cleardevice;
	
	//stex:=omx/40;//���
	//stey:=omy/40;//���

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
	
	
procedure gra(scx:integer;scy:longint);
	
	const
		cx=scx/40;//��� 40 �������� � ����� �������
		cy=scy/40;//���
	
	var
		xp,yp,gx,gy: real;
		igra,ii,posx,posy:integer;
begin	
	//cx:=scx/40;//��� 40 �������� � ����� �������
	//cy:=scy/40;//���
	
	setlinestyle(0,0,3);
	setcolor(2);
	
	gx:=6;
	xp:=gx/cx;
	posx:=ox+xp;
	moveto(posx,1);
	for igra:= 2 to getmaxy do 
	begin
		lineto(posx,igra);
	end;
	{xgra:=igra*stex;
	ygra:=(4 * xgra * xgra * xgra - 25 * xgra * xgra + 491 * xgra - 2134);
	ngra:= ygra/stey;}
	
end;

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
					#75:	begin// ��� ����� ����������
									if (ix - 1) >=0 then begin
										dec(ix);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);
									end;									
								end;
					#77:	begin// ������
									if (ix + 1) <=  xarr then begin
										inc(ix);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);
									end;
								end;
					#72:	begin//�����
									if (iy -1)>=0 then begin
										dec(iy);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);									
									end;

								end;
					#80:	begin//����
									if (iy +1) <=yarr then begin
										inc(iy);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);	
									end;
								
								end;
					#83:	begin// del ���������� �������
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
