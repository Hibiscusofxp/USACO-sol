{
ID:peng921
PROG:nuggets
LANG:PASCAL
}
Var
	f		:array[0..70000]of boolean;
	a		:array[1..10]of longint;
	n,m,i,j,g	:Longint;
Function Gcd(a,b:Longint):Longint;
	begin
	if a mod b=0 then exit(b)
		else exit(Gcd(b,a mod b));
	end;
Function Getmax(a,b:Longint):Longint;
	begin
	if a>b	then exit(a)	else exit(b);
	end;
Procedure Print(k:Longint);
	begin
	writeln(k);
	close(input);
	close(output);
	halt;
	end;
Begin
	assign(input,'nuggets.in');
	assign(output,'nuggets.out');
	reset(input);
	rewrite(output);
	readln(n);
	m:=0;
	for i:=1 to n do
		begin
		readln(a[i]);
		if a[i]=1 then Print(0);
		if i=1	then g:=a[i]
			else g:=gcd(Getmax(g,a[i]),g+a[i]-Getmax(g,a[i]));
		m:=Getmax(m,a[i]);
		end;
	if g<>1 then Print(0);
	m:=m*m;
	fillchar(f,sizeof(f),false);
	f[0]:=true;
	for i:=1 to n do
	for j:=a[i] to m do
		if f[j-a[i]] then f[j]:=true;
	j:=m;
	while f[j] do dec(j);
	Print(j);
	close(input);
	close(output);
End.
