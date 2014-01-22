{
ID:peng921
PROG:sprime
LANG:PASCAL
}
const
	maxn		=10007;
var
	f		:array[0..maxn]of boolean;
	p		:array[1..maxn shr 1]of integer;
	n,i,t		:longint;
procedure doit;
	var
	i,j		:longint;
	begin
	fillchar(f,sizeof(f),true);
	f[0]:=false;
	f[1]:=false;
	for i:=2 to trunc(sqrt(maxn)) do
	if f[i] then
		begin
		j:=i+i;
		while j<=maxn do
			begin
			f[j]:=false;
			inc(j,i);
			end;
		end;
	end;
function ok(n:longint):boolean;
	var
	limit,i		:longint;
	begin
	limit:=trunc(sqrt(n));
	for i:=1 to t do
	if p[i]<=limit
	then
		begin
		if n mod p[i]=0 then exit(false);
		end
	else break;
	exit(true);
	end;
procedure dfs(k,s:longint);
	var
	i,s0		:longint;
	f0		:boolean;
	begin
	if k>n then
		begin
		writeln(s);
		exit;
		end;
	if k=1 then dfs(k+1,2);
	for i:=0 to 4 do
		begin
		s0:=s*10+i*2+1;
		if s0<=maxn
			then f0:=f[s0]
			else f0:=ok(s0);
		if f0 then dfs(k+1,s0);
		end;
	end;
begin
	assign(input,'sprime.in');
	assign(output,'sprime.out');
	reset(input);
	rewrite(output);
	readln(n);
	doit;
	t:=0;
	for i:=0 to maxn do
	if f[i] then
		begin
		inc(t);
		p[t]:=i;
		end;
	dfs(1,0);
	close(input);
	close(output);
end.
