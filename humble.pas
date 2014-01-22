{
ID:peng921
PROG:humble
LANG:PASCAL
}
Const
	maxn		=100+7;
	maxk		=100000+7;
Var
	f		:array[1..maxk]of longint;
	a,p		:array[1..maxn]of longint;
	n,k,i,j,t,min,last	:longint;
Begin
	assign(input,'humble.in');
	assign(output,'humble.out');
	reset(input);
	rewrite(output);
	readln(n,k);
	for i:=1 to n do
		read(a[i]);
        filldword(p,sizeof(p) shr 2,1);
	f[1]:=1;
	last:=1;
	for i:=2 to k+1 do
		begin
		min:=maxlongint;
		for j:=1 to n do
			begin
			while (f[p[j]]*a[j]<min)and(f[p[j]]*a[j]<=last) do
				inc(p[j]);
                        if f[p[j]]*a[j]<min then
				begin
				min:=f[p[j]]*a[j];
				t:=j;
				end;
			end;
		f[i]:=min;
		last:=min;
		inc(p[t]);
		end;
	writeln(f[k+1]);
	close(input);
	close(output);
End.
