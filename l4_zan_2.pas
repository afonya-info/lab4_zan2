program art;//gh������� : ����������� �� �������

uses crt,graph,wincrt;

const
	xarr = 30;
	yarr = 20;

type
	masx = array[0..xarr] of integer;
	masy = array[0..yarr] of integer;

var
	mx:masx;// ��������������� ������ ��� ���������
	my:masy;
	gd,gm:integer;
  ox,oy,ch,col,i,a,b,x,y,y2,a1,a2,d,kol,ix,iy,im:integer;
	m,j: real;
	c: char;
	fkos,vylrx,vylox,vyly,vylyz,nnew:boolean;
  maxm:string;
	
procedure osi(omx,omy:integer);// �������� �������� ��������
	//var
		
begin

	setlinestyle(0,0,3);
	setcolor(15);
	line(0,oy,getmaxx,oy);
	line(ox,0,ox,getmaxy);

end;
	
	
procedure gra(scx,scy:integer);
begin	
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

	
	osi(mx[2],mx[4]);
	
	{ix:=-10;// ������� � �������� 5 mx[5] = 1/10
	iy:=-20;
	im:=0;
	gra(mx[ix],my[iy]); // ������� ������
	repeat
		c:= wincrt.readkey;
		if c = #0 then
			begin
				c:= wincrt.readkey;
				case c of
					#75:	begin// ��� ����� ����������
									if (not nnew) then begin
										dec(ix);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);
									end;									
								end;
					#77:	begin
									if not vylrx then begin
										inc(ix);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);
									end;
								end;
					#72:	begin
									if not vylyz then begin
										dec(iy);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);									
									end;

								end;
					#80:	begin//��� ���� ����������
									if not vyly then begin
										inc(iy);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);	
									end;
								
								end;
					#83:	begin// ���������� �������
									ix:=-10;
									iy:=-20;
									im:=0;
									
									osi(mx[ix],my[iy]);
									gra(mx[ix],my[iy]);
									
								end;
				end;
			end
		else
			begin
				case c of
					'+':	begin
									if not(nnew or vylyz ) then begin
										dec(im);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);
									end;
								end;
					'-':	begin
									if not (vylrx or vyly) then begin
										inc(im);
										osi(mx[ix],my[iy]);
										gra(mx[ix],my[iy]);									
									end;
								end;
				end;
			end;
	until c=#27;}
	
	wincrt.readkey;
	
  closegraph;
end.
