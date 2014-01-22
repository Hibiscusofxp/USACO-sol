{
ID:peng921
PROG:zerosum
LANG:PASCAL
}
const
	maxn		=9;
var
	p		:array[0..maxn]of char;
	f		:array[0..maxn,0..maxn]of longint;
	i,j,k,s,n		:longint;
procedure dfs(k,t:longint);
	var
	x		:longint;
	begin
	x:=f[t+1,k];
	if p[t]='-' then x:=-x;
	if k=n then
		begin
		if s+x=0 then
			begin
			for i:=1 to n-1 do
				write(i,p[i]);
			writeln(n);
			end;
		exit;
		end;
	if (s+f[t+1,n]<0)or(s-f[t+1,n]>0) then exit;
	p[k]:=' ';
	dfs(k+1,t);
	s:=s+x;
	p[k]:='+';
	dfs(k+1,k);
	p[k]:='-';
	dfs(k+1,k);
	s:=s-x;
	end;
begin
	assign(input,'zerosum.in');
	assign(output,'zerosum.out');
	reset(input);
	rewrite(output);
	readln(n);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
	for j:=i to n do
		f[i,j]:=f[i,j-1]*10+j;
	s:=0;
	p[0]:='+';
	dfs(1,0);
	close(input);
	close(output);
end.
