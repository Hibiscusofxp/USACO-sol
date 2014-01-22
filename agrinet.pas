{
ID:peng921
PROG:agrinet
LANG:PASCAL
}
const
	maxn		=100;
        maxm            =(100*101) shr 1;
type
	arr		=array[1..maxm]of longint;
var
	e		:array[1..maxm,1..2]of longint;
	f		:array[1..maxn]of longint;
	w		:arr;
	i,j,n,m,ans,u,v	:longint;
	time		:tdatetime;
procedure find(var k:longint);
	begin
	if f[k]<>k then
		begin
		find(f[k]);
		k:=f[k];
		end;
	end;
procedure swap(var a,b:longint);
	begin
	a:=a+b;	b:=a-b;	a:=a-b;
	end;
procedure qsort(var w:arr;l,r:longint);
	var
	k,i,j		:longint;
        begin
	k:=w[random(r-l+1)+l];
	i:=l-1;
	j:=r+1;
	repeat
		repeat inc(i) until w[i]>=k;
		repeat dec(j) until w[j]<=k;
		if i<j then
			begin
			swap(w[i],w[j]);
			swap(e[i,1],e[j,1]);
			swap(e[i,2],e[j,2]);
			end;
	until i>=j;
	if l<j then qsort(w,l,j);
	if j+1<r then qsort(w,j+1,r);
	end;
begin
	assign(input,'agrinet.in');
	assign(output,'agrinet.out');
	reset(input);
        rewrite(output);
	readln(n);
	m:=0;
	for i:=1 to n do
		begin
		for j:=1 to i-1 do
			begin
			inc(m);
			e[m,1]:=i;
			e[m,2]:=j;
			read(w[m]);
			end;
		for j:=i to n do
			read(u);
		end;
	randomize;
	qsort(w,1,m);
	for i:=1 to n do
		f[i]:=i;
	ans:=0;
	j:=1;
	for i:=1 to n-1 do
		while (j<=m) do
			begin
			u:=e[j,1];
			v:=e[j,2];
			find(u);
			find(v);
			if u<>v then
				begin
				inc(ans,w[j]);
				f[u]:=v;
				inc(j);
				break;
				end;
			inc(j);
			end;
        writeln(ans);
	close(input);
	close(output);
end.
