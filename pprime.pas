{
ID:peng921
PROG:pprime
LANG:PASCAL
}
const
	maxn		=10000;
var
	f		:array[0..maxn]of boolean;
	p		:array[1..maxn shr 1]of integer;
	ans		:array[0..1000]of longint;
	t,la,lb,i,j,dep,limit,a,b	:longint;
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
	if n<=maxn then exit(f[n]);
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
procedure print(n:longint);
	begin
	if (n>=a)and(n<=b)and(ok(n)) then
		begin
		inc(ans[0]);
		ans[ans[0]]:=n;
		end;
	end;
procedure dfs(k:longint;s:string);
	var
	code		:integer;
	i,s0		:longint;
	ch		:char;
	begin
	if k=limit then
		begin
		for i:=0 to 4 do
			begin
			ch:=chr(ord('0')+i*2+1);
			val(ch+s+ch,s0,code);
			print(s0);
			end;
		exit;
		end;
	for i:=0 to 9 do
		begin
		ch:=chr(ord('0')+i);
		dfs(k+1,ch+s+ch);
		end;
	end;
begin
	assign(input,'pprime.in');
	assign(output,'pprime.out');
	reset(input);
	rewrite(output);
	readln(a,b);
	fillchar(ans,sizeof(ans),0);
	doit;
	t:=0;
	for i:=0 to maxn do
	if f[i] then
		begin
		inc(t);
		p[t]:=i;
		end;
	la:=0;
	i:=a;
	while i<>0 do
		begin
		inc(la);
		i:=i div 10;
		end;
	lb:=0;
	i:=b;
	while i<>0 do
		begin
		inc(lb);
		i:=i div 10;
		end;
	for dep:=la to lb do
		begin
		if dep=1 then
			begin
			print(2);
			print(3);
			print(5);
			print(7);
			continue;
			end;
		if (dep=2) then print(11);
		if odd(dep) then
			begin
			limit:=dep shr 1;
			for i:=0 to 9 do
				dfs(1,chr(ord('0')+i));
			end;
		end;
	for i:=1 to ans[0]-1 do
	for j:=i+1 to ans[0] do
		if ans[i]>ans[j] then
			begin
			dep:=ans[i];
			ans[i]:=ans[j];
			ans[j]:=dep;
			end;
	for i:=1 to ans[0] do
		writeln(ans[i]);
	close(input);
	close(output);
end.w
