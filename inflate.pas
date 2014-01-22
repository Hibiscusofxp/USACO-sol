{
ID:peng921
PROG:inflate
LANG:PASCAL
}
var
	f		:array[0..10000]of longint;
	m,n,i,j,v,w	:longint;
begin
	assign(input,'inflate.in');
	assign(output,'inflate.out');
	reset(input);
	rewrite(output);
	readln(m,n);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		begin
		read(w,v);
		for j:=v to m do
			if f[j]<f[j-v]+w then f[j]:=f[j-v]+w;
		end;
	writeln(f[m]);
	close(input);
	close(output);
end.
