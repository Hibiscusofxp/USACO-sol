{
ID:peng921
PROG:rockers
LANG:PASCAL
}
Var
	f		:array[1..21,0..20]of longint;
	n,t,m,x,k,i,j,ans	:Longint;
Function Getmax(a,b:Longint):Longint;
	begin
	if a>b	then exit(a)	else exit(b);
	end;
Begin
	assign(input,'rockers.in');
	assign(output,'rockers.out');
	reset(input);
	rewrite(output);
	readln(n,t,m);
	fillchar(f,sizeof(f),0);
	for k:=1 to n do
		begin
		read(x);
		for i:=m downto 1 do
		for j:=t downto x do
		if f[i,j]<f[i,j-x]+1 then
			begin
			f[i,j]:=f[i,j-x]+1;
			f[i+1,0]:=Getmax(f[i+1,0],f[i,j]);
			end;
		end;
	ans:=0;
	for i:=1 to n+1 do
		ans:=Getmax(ans,f[i,0]);
	writeln(ans);
	close(input);
	close(output);
End.
