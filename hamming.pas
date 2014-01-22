{
ID:peng921
PROG:hamming
LANG:PASCAL
}
var
	p		:array[0..100]of longint;
	f		:array[0..2 shl 8-1]of boolean;
	n,b,d,maxn,i,x,t	:longint;
procedure dfs(k:longint);
	var
	limit,i,j		:longint;
	f0		:boolean;
	begin
	if k>n then
		begin
		for i:=1 to n do
			begin
			if i mod 10=1
				then write(p[i])
				else write(' ',p[i]);
			if i mod 10=0 then writeln;
			end;
		if n mod 10<>0 then writeln;
		close(input);
		close(output);
		halt;
		end;
	limit:=maxn-(n-k+1)+1;
	for i:=p[k-1]+1 to limit do
		begin
		f0:=true;
		for j:=1 to k-1 do
			if not f[i xor p[j]] then
				begin
				f0:=false;
				break;
				end;
		if f0 then
			begin
			p[k]:=i;
			dfs(k+1);
			end;
		end;
	end;
begin
	assign(input,'hamming.in');
	assign(output,'hamming.out');
	reset(input);
	rewrite(output);
	readln(n,b,d);
	maxn:=2 shl b-1;
	for i:=1 to maxn do
		begin
		x:=i;
		x:=(x and $55)+((x shr 1) and $55);
		x:=(x and $33)+((x shr 2) and $33);
		x:=(x and $0F)+((x shr 4) and $0F);
		if x>=d
			then f[i]:=true
			else f[i]:=false;
		end;
	t:=0;
	p[0]:=-1;
	dfs(1);
	close(input);
	close(output);
end.
