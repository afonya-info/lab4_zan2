{$D+,L+}
program art;//gh������� : ����������� �� �������

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
	mx,my:mas;// ��������������� ������ ��� ���������
	mm:mmsc;
	gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im:integer;
	m,j: real;
	c: char;
	fkos,vylrx,vylox:boolean;
  maxm:string;
	
procedure osi(ntx,nty,ntmx,ntmy:real);// �������� �������� ��
	var iosi,xsrt,ysrt,colo,dox,doy,shlen,shy,shx,stx,sty,begx,begy: integer;
			dx,xgm,xgn,fxgn,fxgnt: real;
			tx:string;
	begin
		if not fkos then// ���� ����� �� ������� ����� ������� �����, � ���� �������� ������ � ������ ������� ��� �������
			cleardevice;
			
		setcolor(2);
		line(0,oy,getmaxx,oy);
		line(ox,0,ox,getmaxy);
		
		shlen:=10;//����� ������ ������ �������� �� 2
		shy:=oy - shlen div 2 ;// ��������� ����� ������ �� �
		shx:=ox - shlen div 2;
		dox:=20;
		xsrt:=ox + dox;
		setusercharsize(4,50,150,1000);
		settextstyle(1,1,0);
    setusercharsize(4,50,150,1000);
			
		xgn:=0.01;
		dx:=0.01;
		colo:=2;
		setcolor(colo);
		begx:=0;
		begy:=0;
		while xgn<= 81  do
			begin
				xgm:=xgn*ntx*ntmx;//������������ � �� ���� � ���������� �������������� ��� ���������� ����� ��������
				xsrt:=ox + trunc(xgm);
				
				if (trunc(frac(xgn)*10) = 0) and (trunc(frac(xgn)*100) = 0)  then // ����� ��������� �� �����, ����� �������
					begin
						moveto(xsrt,shy);
						linerel(0,shlen);
						
						str(trunc(xgn),tx);
						stx:=xsrt+1;
						sty:=shy+shlen+2;
						if (tx = '80') and (stx < (getmaxx-20)) then //����������� �� 80
							vylrx:=true
						else	
							vylrx:=false;
							
						if (trunc(xgn)=1) and (stx>(ox + 100)) then// ����������� �� �������
							vylox:=true
						else
							vylox:=false;
						
						settextjustify(1,2);
						settextstyle(1,1,0);
						outtextxy(stx,sty,tx);
						
				//if xgn>81 then
				{str(xgn:10:3,tx);
				settextstyle(1,0,0);
				settextjustify(0,2);
				outtextxy(0+begx,0+begy,tx);
				if begy + 5 < getmaxy then	
					begy:=begy+10              /////// �������
				else
					begin
						begy:=0;
						begx:=begx+45;
					end;}
					
					end;
					
				{str(frac(xgn)*100:5:3,tx);
				settextstyle(1,0,0);
				settextjustify(0,2);
				outtextxy(0+begx,0+begy,tx);
				if begy + 5 < getmaxy then	
					begy:=begy+10             ///////// �������
				else
					begin
						begy:=0;
						begx:=begx+45;
					end;}
				xgn:=xgn + dx;
			end;
			
		xgn:=0.01;
		for iosi:= 1 to 8000  do
			begin
				xgm:=xgn*ntx*ntmx;//������������ � �� ���� � ���������� �������������� ��� ���������� ����� ��������
				xsrt:=ox - trunc(xgm);
				
				if (trunc(frac(xgn)*10) = 0) and (trunc(frac(xgn)*100) = 0)  then // ����� ��������� �� �����, ����� �������
					begin
						moveto(xsrt,shy);
						linerel(0,shlen);
						
						str(trunc(xgn),tx);
						stx:=xsrt+1;
						sty:=shy+shlen+2;
						
						settextjustify(1,2);
						settextstyle(1,1,0);
						tx:='-'+tx;
						outtextxy(stx,sty,tx);
	
					end;
				xgn:=xgn + dx;
			end;
			
		xgn:=0.01;
		for iosi:= 1 to 8000 do
			begin
				xgm:=xgn*ntx*ntmx;//������������ � �� ���� � ���������� �������������� ��� ���������� ����� ��������
				xsrt:=ox - trunc(xgm);
				fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*nty*ntmy;
				fxgnt:=(4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134);
				ysrt:=oy - trunc(fxgn);
				
				if (trunc(frac(xgn)*10) = 0) and (trunc(frac(xgn)*100) = 0)  then // ����� ��������� �� �����, ����� �������
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
						begy:=begy+10             ///////// �������
					else
					begin
						begy:=0;
						begx:=begx+100;
					end;
					setcolor(col);
				end;
						
						settextjustify(2,2);// ������ ������������
						settextstyle(1,0,0);
						tx:=''+tx;
						outtextxy(stx,sty,tx);
	
					end;
				xgn:=xgn + dx;
			end;
		
	end;
	
	
procedure gra(scx,scy,scmx,scmy: real);
	var dx,xgn,xgm,x1,y1,fxgn,fxgnt : real;
			igra,dlx,dly,rd,begx,begy:integer;
			col:word;
			tx:string;
	begin
		xgn:=-80;
		dx:=0.01;
		col:=4;//red
		setcolor(col);
				xgm:=xgn*scx*scmx;//������������ � �� ���� � ���������� �������������� ��� ���������� ����� ��������
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
				xgm:=xgn*scx*scmx;//������������ � �� ���� � ���������� �������������� ��� ���������� ����� ��������
				x:=ox + trunc(xgm);
				fxgn := (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134)*scy*scmy;
				fxgnt:= (4 * xgn * xgn * xgn - 25 * xgn * xgn + 491 * xgn - 2134);
				y:=oy - trunc(fxgn);
				
				{if ((xgn>= 4) and (xgn <= 5)) then begin
					setcolor(3);
					str(fxgnt:10:3,tx);
					settextstyle(1,0,0);
					settextjustify(0,2);
					outtextxy(0+begx,0+begy,tx);
					if begy + 5 < getmaxy then	
						begy:=begy+10             ///////// �������
					else
					begin
						begy:=0;
						begx:=begx+100;
					end;
					setcolor(col);
				end;}
				lineto(x,y);
			end;
			
		dlx:= ox - 1;
		dly:= oy - 1;
		for igra:= dlx downto 0 do//�������� ������ �����
			begin
				if getpixel(igra,dly) = col then
					begin
						setcolor(0);//black
						bar(0,0,igra,getmaxy);//������ ������ �����
						fkos:=true;
						osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
						fkos:=false;
					end;
			end;
		
		dlx:=ox +1;
		while (getpixel(dlx,0) <> col) and (dlx <=getmaxx) do // ���� � ������� � ����� �����
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
	mx[0]:=1;
	my[0]:=1;
	mm.x[0]:=1;
	mm.y[0]:=1;
	
	j:=1.5;
	for i:= 1 to rxm do
		begin
			mx[i]:=1/j;
			my[i]:=j;
			j:=j+0.5;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			mx[i]:=j;
			my[i]:=1/j;
			j:=j+0.5;
		end;
				
	j:=1.5;	
	for i:= 1 to rxm do
		begin
			mm.x[i]:=1/j;
			mm.y[i]:=j;
			j:=j+0.05;
		end;
	j:=1.5;
	for i:= -1 downto lxm do
		begin
			mm.x[i]:=j;
			mm.y[i]:=1/j;
			j:=j+0.05;
		end;
		
	setcolor(2);
	line(0,oy,getmaxx,oy);
	line(ox,0,ox,getmaxy);
	
	ix:=-20;// ������� � �������� 5 mx[5] = 1/10
	iy:=-20;
	im:=0;
	gra(mx[ix],my[iy],mm.x[im],mm.y[im]); // ������� ������
	repeat
		c:= wincrt.readkey;
		if c = #0 then
			begin
				c:= wincrt.readkey;
				case c of
					#75:	begin// ��� ����� ����������
									if (not vylox) then begin
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
									dec(iy);
									osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
								end;
					#80:	begin//��� ���� ����������
									inc(iy);
									osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
									gra(mx[ix],my[iy],mm.x[im],mm.y[im]);									
								end;
				end;
			end
		else
			begin
				case c of
					#45:	begin//-
									if not vylox then begin
										dec(im);
										osi(mx[ix],my[iy],mm.x[im],mm.y[im]);
										gra(mx[ix],my[iy],mm.x[im],mm.y[im]);
									end;
								end;
					#43:	begin//+
									if not vylrx then begin
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
