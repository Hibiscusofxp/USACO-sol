{
ID:peng921
PROG:cowtour
LANG:PASCAL
}
const
	inf		=maxlongint;
	maxn		=150;
var
        f               :array[1..maxn,1..maxn]of real;
	x,y		:array[1..maxn]of longint;
        d               :array[1..maxn]of real;
	n,i,j,k		:longint;
        x0,ans          :real;
	s0		:string[maxn];
begin
	assign(input,'cowtour.in');
	assign(output,'cowtour.out');
	reset(input);
	rewrite(output);
	readln(n);
	for i:=1 to n do
		readln(x[i],y[i]);
        fillchar(f,sizeof(f),0);
        for i:=1 to n do
		begin
		readln(s0);
		for j:=1 to length(s0) do
		if s0[j]='1'
			then f[i,j]:=sqrt( sqr(x[i]-x[j])+sqr(y[i]-y[j]) );
		end;
	for k:=1 to n do
	for i:=1 to n-1 do
	for j:=i+1 to n do
        if (f[i,k]<>0)and(f[k,j]<>0) then
		begin
		x0:=f[i,k]+f[k,j];
		if (f[i,j]=0) or (x0<f[i,j]) then
			begin
			f[i,j]:=x0;
			f[j,i]:=x0;
			end;
		end;
        fillchar(d,sizeof(d),0);
	for i:=1 to n do
	for j:=1 to n do
	if (f[i,j]<>0) and (d[i]<f[i,j])
		then d[i]:=f[i,j];
	ans:=inf;
	for i:=1 to n do
	for j:=1 to n do
	if (i<>j) and (f[i,j]=0) then
		begin
		x0:=sqrt( sqr(x[i]-x[j])+sqr(y[i]-y[j]) );
		if ans>d[i]+d[j]+x0 then ans:=d[i]+d[j]+x0;
		end;
	for i:=1 to n do
		if ans<d[i] then ans:=d[i];
	writeln(ans:0:6);
	close(input);
	close(output);
end.
