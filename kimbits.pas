{
ID:peng921
PROG:kimbits
LANG:PASCAL
}
Const
	maxn		=32;
Var
	f		:array[0..maxn,0..maxn]of qword;
	n,l,i,j		:longint;
	k		:int64;
Begin
	assign(input,'kimbits.in');
	assign(output,'kimbits.out');
	reset(input);
	rewrite(output);
	readln(n,l,k);
	for i:=0 to n do
		begin
		f[0,i]:=1;
		f[i,0]:=1;
		end;
	for i:=1 to n do
	for j:=1 to l do
		f[i,j]:=f[i-1,j]+f[i-1,j-1];
	for i:=n downto 1 do
		begin
		if (l>0)and(f[i-1,l]<k)
		then	begin
			write(1);
			dec(k,f[i-1,l]);
			dec(l);
			end
		else	write(0);
		end;
	writeln;
	close(input);
	close(output);
End.
