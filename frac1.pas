{
ID:peng921
PROG:frac1
LANG:PASCAL
}
type
	arr		=array[1..10000]of real;
var
	a,b		:array[1..10000]of integer;
	c		:arr;
	n,i,j,t		:longint;
procedure swap(var a,b:integer);
	var
	t		:integer;
	begin
	t:=a;
	a:=b;
	b:=t;
	end;
procedure swap1(var a,b:real);
	var
	t		:real;
	begin
	t:=a;
	a:=b;
	b:=t;
	end;
procedure qsort(var c:arr;l,r:longint);
	var
	i,j		:longint;
	k		:real;
	begin
	if l>=r then exit;
	i:=l-1;
	j:=r+1;
	k:=c[random(r-l+1)+l];
	repeat
		repeat inc(i) until c[i]>=k;
		repeat dec(j) until c[j]<=k;
		if i<j then
			begin
			swap1(c[i],c[j]);
			swap(a[i],a[j]);
			swap(b[i],b[j]);
			end;
	until i>=j;
	qsort(c,l,j);
	qsort(c,j+1,r);
	end;
function gcd(a,b:longint):longint;
	begin
	if b=0 then exit(a)
		else gcd:=gcd(b,a mod b);
	end;
begin
	assign(input,'frac1.in');
	assign(output,'frac1.out');
	reset(input);
	rewrite(output);
	readln(n);
	t:=0;
	for i:=1 to n-1 do
	for j:=i+1 to n do
                if gcd(j,i)=1 then
			begin
			inc(t);
			a[t]:=i;
			b[t]:=j;
			end;
	for i:=1 to t do
		c[i]:=a[i]/b[i];
	randomize;
	qsort(c,1,t);
	writeln('0/1');
	for i:=1 to t do
		writeln(a[i],'/',b[i]);
	writeln('1/1');
	close(input);
	close(output);
end.
