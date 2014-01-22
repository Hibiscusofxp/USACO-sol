{
ID:peng921
PROG:range
LANG:PASCAL
}
Var
        f               :array[1..250,1..250]of boolean;
	i,j,ans,n,size	:longint;
	ch		:char;
Begin
	assign(input,'range.in');
	assign(output,'range.out');
	reset(input);
	rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
		for j:=1 to n do
			begin
			read(ch);
			f[i,j]:=(ch='1');
			end;
		readln;
		end;
	for size:=2 to n do
		begin
		ans:=0;
		for i:=1 to n+1-size do
		for j:=1 to n+1-size do
			begin
			f[i,j]:=f[i,j] and f[i+1,j] and f[i,j+1] and f[i+1,j+1];
			if f[i,j] then inc(ans);
			end;
		if ans>0
		then	writeln(size,' ',ans)
		else	break;
		end;
	close(input);
	close(output);
End.
