{
ID:peng921
PROG:subset
LANG:PASCAL
}
var
        f               :array[0..400]of dword;
	n,sum,i,j		:longint;
begin
	assign(input,'subset.in');
	assign(output,'subset.out');
	reset(input);
	rewrite(output);
	readln(n);
	sum:=(n*(n+1)) shr 1;
	if sum mod 2=1 then
		begin
		writeln(0);
		close(input);
		close(output);
		halt;
		end;
	sum:=sum shr 1;
	fillchar(f,sizeof(f),0);
	f[0]:=1;
	for i:=1 to n do
	for j:=sum downto i do
		inc(f[j],f[j-i]);
	writeln(f[sum] shr 1);
	close(input);
	close(output);
end.
