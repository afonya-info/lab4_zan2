program art; {$D+,L+}//ghоблыемы : ограничение по единице

uses crt,graph,wincrt;
	
var 
	
begin
  detectgraph(gd,gm);
  initgraph(gd,gm,'');
  ox:=trunc(getmaxx/2);
  oy:=trunc(getmaxy/2);
	
	repeat 
		c:= wincrt.readkey;
		if c = #0 then
			begin
				c:= wincrt.readkey;
				case c of
					#75:	begin //left
								
								end;
					#77:	begin//right
						
								end;
					#72:	begin//up
								
								end;
					#80:	begin//down
															
								end;
				end;
			end
		else
			begin
				case c of 
					#45:	begin//+
								
								end;
					#43:	begin//-
								
								end;
				end;
			end;
	until c=#27;
		
  closegraph;
end.
