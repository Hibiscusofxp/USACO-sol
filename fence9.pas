{
ID:peng921
PROG:fence9
LANG:PASCAL
}
Const
	delta		=1e-5;
Var
	n,m,p,i,ans	:Longint;
Begin
	assign(input,'fence9.in');
	assign(output,'fence9.out');
	reset(input);
	rewrite(output);
	readln(n,m,p);
	ans:=0;
	for i:=1 to n-1 do
		inc(ans,trunc(i*m/n-delta));
	if n<p	then for i:=n to p-1 do
			inc(ans,trunc((p-i)*m/(p-n)-delta))
		else if n>p
			then for i:=n-1 downto p+1 do
				dec(ans,trunc((i-p)*m/(n-p)));
	if n=0 then dec(ans,m-1);
	writeln(ans);
	close(input);
	close(output);
End.
