{
ID:peng921
PROG:concom
LANG:PASCAL
}
const
	maxn            =100;
var
	d		:array[1..maxn,1..maxn]of integer;
        f               :array[1..maxn]of integer;
	vis		:array[1..maxn]of boolean;
	n,m,a,b,i,j	:longint;
procedure dfs(k:longint);
	var
	i		:longint;
	begin
	for i:=1 to m do
		begin
		inc(f[i],d[k,i]);
		if vis[i] and (f[i]>50) then
			begin
			vis[i]:=false;
			dfs(i);
			end;
		end;
	end;
begin
	assign(input,'concom.in');
	assign(output,'concom.out');
	reset(input);
	rewrite(output);
	readln(n);
	m:=0;
	for i:=1 to n do
		begin
		read(a,b);
		if m<a then m:=a;
		if m<b then m:=b;
		readln(d[a,b]);
		end;
	for i:=1 to m do
		begin
		fillchar(vis,sizeof(vis),true);
		fillchar(f,sizeof(f),0);
		vis[i]:=false;
		dfs(i);
		for j:=1 to m do
			if (not vis[j]) and (i<>j) then
				writeln(i,' ',j);
		end;
	close(input);
	close(output);
end.
