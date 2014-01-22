{
ID:peng921
PROG:castle
LANG:PASCAL
}
const
	dx		:array[1..4]of shortint=(0,1,0,-1);
	dy		:array[1..4]of shortint=(1,0,-1,0);
var
	d		:array[0..51,0..51]of integer;
	f		:array[0..51,0..51]of boolean;
	c		:array[0..2500]of integer;
	wall		:array[1..50,1..50,1..4]of boolean;
	n,m,i,j,num,max,t,a,x,y	:longint;
	ch		:char;
procedure walls(a:longint);
	begin
	if a>=8 then
		begin
		wall[i,j,2]:=false;
		dec(a,8);
		end;
	if a>=4 then
		begin
		wall[i,j,1]:=false;
		dec(a,4);
		end;
	if a>=2 then
		begin
		wall[i,j,4]:=false;
		dec(a,2);
		end;
	if a>=1 then
		begin
		wall[i,j,3]:=false;
		dec(a,1);
		end;
	end;
procedure dfs(x,y:longint);
	var
	i,x0,y0		:longint;
	begin
	for i:=1 to 4 do
		begin
		x0:=x+dx[i];
		y0:=y+dy[i];
		if f[x0,y0] and wall[x,y,i] then
			begin
			inc(t);
			f[x0,y0]:=false;
			dfs(x0,y0);
			end;
		end;
	d[x,y]:=num;
	end;
begin
	assign(input,'castle.in');
	assign(output,'castle.out');
	reset(input);
	rewrite(output);
	readln(m,n);
	fillchar(wall,sizeof(wall),true);
	for i:=1 to n do
	for j:=1 to m do
		begin
		read(a);
		walls(a);
		end;
	fillchar(f,sizeof(f),true);
	fillchar(d,sizeof(d),0);
	for i:=0 to n+1 do
		begin
		f[i,0]:=false;
		f[i,m+1]:=false;
		end;
	for i:=0 to m+1 do
		begin
		f[0,i]:=false;
		f[n+1,i]:=false;
		end;
	num:=0;
	fillchar(c,sizeof(c),0);
	for i:=1 to n do
	for j:=1 to m do
	if f[i,j] then
		begin
		inc(num);
		t:=1;
		f[i,j]:=false;
		dfs(i,j);
		c[num]:=t;
		end;
	max:=0;
	for i:=1 to num do
		if max<c[i] then max:=c[i];
	writeln(num);
	writeln(max);
	
	max:=0;
	for j:=1 to m do
		begin
		for i:=n downto 2 do
			if (not wall[i,j,4]) and (d[i,j]<>d[i-1,j]) then
			if max<c[ d[i-1,j]]+c[ d[i,j]] then
				begin
				max:=c[ d[i-1,j]]+c[ d[i,j]];
				x:=i;
				y:=j;
				ch:='N';
				end;
		for i:=n downto 1 do
			if (not wall[i,j,1]) and (d[i,j]<>d[i,j+1]) then
			if max<c[ d[i,j+1]]+c[ d[i,j]] then
				begin
				max:=c[ d[i,j+1]]+c[ d[i,j]];
				x:=i;
				y:=j;
				ch:='E';
				end;
		end;
	writeln(max);
	writeln(x,' ',y,' ',ch);
	close(input);
	close(output);
end.
