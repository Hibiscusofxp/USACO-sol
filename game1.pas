{
ID:peng921
PROG:game1
LANG:PASCAL
}
Const
	maxn		=100;
Var
	s,f		:array[0..maxn,0..maxn]of longint;
	a		:array[1..maxn]of longint;
	n,i,j,k		:longint;
Function Getmax(a,b:longint):Longint;
	begin
	if a>b	then exit(a)	else exit(b);
	end;
Begin
	assign(input,'game1.in');
	assign(output,'game1.out');
	reset(input);
	rewrite(output);
	readln(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
	for j:=i to n do
		s[i,j]:=s[i,j-1]+a[j];
	for i:=1 to n do
		f[i,i]:=a[i];
	for k:=2 to n do
	for i:=1 to n+1-k do
		begin
		j:=i+k-1;
		f[i,j]:=Getmax(a[i]+s[i+1,j]-f[i+1,j],a[j]+s[i,j-1]-f[i,j-1]);
		end;
	writeln(f[1,n],' ',s[1,n]-f[1,n]);
	close(input);
	close(output);
End.
