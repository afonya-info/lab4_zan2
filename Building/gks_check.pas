uses windows,dos,crt;
const
  c = 6;
var poz:byte;
procedure restrain(h,m,s,ms:word);

var
	h1,m1,s1,ms1,h2,m2,s2,ms2:word;

begin
	gettime(h1,m1,s1,ms1);
	gettime(h2,m2,s2,ms2);
	repeat
		gettime(h2,m2,s2,ms2);
	until (h2-h1 = h)and(m2-m1=m)and(s2-s1=s)and(ms2-ms1=ms);
end;

begin
poz:=1;
repeat
		if GetKeyState(vk_down) and $8000 > 0 then 
		begin
			delay(150);
			writeln('down')
		end
		else if GetKeyState(vk_up) and $8000 > 0 then 
		begin
			delay(150);
			writeln('up')
		end
		else if GetKeyState(vk_return) and $8000 > 0 then
		begin
			delay(150);
			writeln('return');
		end;
	until (GetKeyState(vk_escape) and $8000) > 0;
	end.