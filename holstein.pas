{
ID:peng921
PROG:holstein
LANG:PASCAL
}
var
	w		:array[1..15,1..25]of longint;
	f,feed		:array[1..25]of boolean;
	p,g		:array[1..25]of longint;
	i,j,m,n,min,power	:longint;
procedure dfs(k,num:integer);
	var
	i,s		:longint;
	f0		:boolean;
	begin
	if num>min then exit;
	if k>m then
		begin
		s:=0;
		f0:=true;
		for i:=1 to n do
			if p[i]<g[i]
				then
					begin
					f0:=false;
					break;
					end
				else inc(s,p[i]);
		if f0 and ( (num<min)or (num=min)and(s<power) ) then
			begin
			min:=num;
			power:=s;
			feed:=f;
			end;
		exit;
		end;
	f[k]:=true;
	for i:=1 to n do
		inc(p[i],w[k,i]);
	dfs(k+1,num+1);
	for i:=1 to n do
		dec(p[i],w[k,i]);
	f[k]:=false;
	dfs(k+1,num);
	end;
begin
	assign(input,'holstein.in');
	assign(output,'holstein.out');
	reset(input);
	rewrite(output);
	readln(n);
	for i:=1 to n do
		read(g[i]);
	readln;
	readln(m);
	for i:=1 to m do
	for j:=1 to n do
		read(w[i,j]);
	fillchar(p,sizeof(p),0);
	fillchar(f,sizeof(f),false);
	min:=maxlongint;
	power:=0;
	dfs(1,0);
	write(min);
	for i:=1 to m do
		if feed[i] then write(' ',i);
	writeln;
	close(input);
	close(output);
end.
