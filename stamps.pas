{
ID:peng921
PROG:stamps
LANG:PASCAL
}
Const
	maxv		=2000000+3;
	maxn		=50+3;
Var
	v		:array[1..maxn]of integer;
	f		:array[0..maxv]of integer;
	m,n,i,j		:longint;
Begin
	assign(input,'stamps.in');
	assign(output,'stamps.out');
	reset(input);
	rewrite(output);
	readln(m,n);
	for i:=1 to n do
		read(v[i]);
	fillchar(f,sizeof(f),100);
	f[0]:=0;
	j:=0;
	repeat
		inc(j);
		for i:=1 to n do
		if (j>=v[i])and(f[j-v[i]]+1<f[j])
			then f[j]:=f[j-v[i]]+1;
		if f[j]>m then break;
	until j>maxv;
	writeln(j-1);
	close(input);
	close(output);
End.
