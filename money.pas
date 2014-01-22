{
ID:peng921
PROG:money
LANG:PASCAL
}
var
	f		:array[0..10000]of int64;
	n,m,i,j,v	:longint;
begin
	assign(input,'money.in');
	assign(output,'money.out');
	reset(input);
	rewrite(output);
	readln(n,m);
	fillchar(f,sizeof(f),0);
        f[0]:=1;
	for i:=1 to n do
		begin
		read(v);
		for j:=v to m do
			inc(f[j],f[j-v]);
		end;
	writeln(f[m]);
	close(input);
	close(output);
end.
