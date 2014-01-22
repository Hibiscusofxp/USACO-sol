{
ID:peng921
PROG:ariprog
LANG:PASCAL
}
var
	f		:array[0..250*250*2]of boolean;
	w		:array[0..250*250*2]of longint;
	f0		:boolean;
	n,m,d,limit,end0,a,b,p,t	:longint;
begin
	assign(input,'ariprog.in');
	assign(output,'ariprog.out');
	reset(input);
	rewrite(output);
	readln(n);
	readln(m);
	fillchar(f,sizeof(f),false);
	for a:=0 to m do
	for b:=0 to m do
		f[a*a+b*b]:=true;
	limit:=m*m*2;
	d:=0;
	for a:=1 to limit do
		if f[a] then
			begin
			w[d]:=a;
			d:=a;
			end;
	w[limit]:=limit+1;
	f0:=true;
	d:=(m*m*2) div (n-1);
	for b:=1 to d do
		begin
		a:=b*(n-1);
		while not f[a] do inc(a);
		while (a<=limit) do
			begin
			p:=a;
			t:=0;
			while f[p] and (t<n) do
				begin
				inc(t);
				dec(p,b);
				end;
			if t=n then
				begin
				writeln(p+b,' ',b);
				f0:=false;
				end;
			a:=w[a];
			end;
		end;
	if f0 then writeln('NONE');
	close(input);
	close(output);
end.
