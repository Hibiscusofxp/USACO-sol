{
ID:peng921
PROG:fence
LANG:PASCAL
}
Const
	maxn		=500+3;
	maxe		=1025+3;
Var
	c		:array[1..maxn,1..maxn]of longint;
	d		:array[1..maxn]of longint;
	path		:array[1..maxe]of longint;
	i,e,u,v,n,step	:longint;
	
Procedure Euler(u:longint);
	var
	v		:longint;
	begin
	for v:=1 to n do
	if c[u,v]>0 then
		begin
		dec(c[u,v]);
		dec(c[v,u]);
		Euler(v);
		end;
	inc(step);
	path[step]:=u;
	end;
Begin
	assign(input,'fence.in');
	assign(output,'fence.out');
	reset(input);
	rewrite(output);
	readln(e);
	n:=0;
	for i:=1 to e do
		begin
		readln(u,v);
		inc(c[u,v]);
		inc(c[v,u]);
		inc(d[u]);
		inc(d[v]);
		if u>n then n:=u;
		if v>n then n:=v;
		end;
	u:=0;
	for i:=1 to n do
	if odd(d[i]) then
		begin
		u:=i;
		break;
		end;
	step:=0;
	if u=0	then Euler(1)
		else Euler(u);
	for i:=step downto 1 do
		writeln(path[i]);
	close(input);
	close(output);
End.
