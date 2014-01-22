{
ID:peng921
PROG:sort3
LANG:PASCAL
}
var
	num		:array[1..3]of longint;
	c		:array[1..3,1..3]of longint;
	a		:array[1..1000]of integer;
	n,i,s,min,d12,d13,d23	:longint;
function getmin(a,b:longint):longint;
	begin
	if a>b then exit(b) else exit(a);
	end;
begin
	assign(input,'sort3.in');
	assign(output,'sort3.out');
	reset(input);
	rewrite(output);
	readln(n);
	fillchar(num,sizeof(num),0);
	for i:=1 to n do
		begin
		readln(a[i]);
		inc(num[a[i]]);
		end;
	fillchar(c,sizeof(c),0);
	for i:=1 to num[1] do
		inc(c[1,a[i]]);
	for i:=1 to num[2] do
		inc(c[2, a[ num[1]+i]]);
	for i:=1 to num[3] do
		inc(c[3,a[ num[1]+num[2]+i]]);
	s:=0;
	min:=getmin(c[1,2],c[2,1]);
	inc(s,min);
	d12:=c[1,2]+c[2,1]-min*2;
	
	min:=getmin(c[1,3],c[3,1]);
	inc(s,min);
	d13:=c[1,3]+c[3,1]-min*2;
	
	min:=getmin(c[2,3],c[3,2]);
	inc(s,min);
	d23:=c[2,3]+c[3,2]-min*2;
	
	inc(s,d12*2);
	writeln(s);
	close(input);
	close(output);
end.
