{
ID:peng921
PROG:shopping
LANG:PASCAL
}
Const
	maxn		=5;
	maxm		=5;
	maxl		=100;
Var
	f		:array[0..maxm,0..maxm,0..maxm,0..maxm,0..maxm]of longint;
	low		:array[1..maxl,0..maxm]of longint;
	use		:array[1..maxl]of boolean;
	num,cost,a{mount}	:array[1..maxn]of longint;
	n,m,x,c,k,i,i1,i2,i3,i4,i5	:Longint;

Function Getnum(k:Longint):Longint;
	var
	i		:Longint;
	begin
	for i:=1 to n do
		if num[i]=k then exit(i);
	exit(0);
	end;
Begin
	assign(input,'shopping.in');
	assign(output,'shopping.out');
	reset(input);
	rewrite(output);
	readln(m);
	for i:=1 to m do readln;
	readln(n);
	for i:=1 to n do
		readln(num[i],a[i],cost[i]);
	reset(input);
	readln(m);
	fillchar(use,sizeof(use),true);
	for i:=1 to m do
		begin
		read(x);
		for i1:=1 to x do
			begin
			read(c,k);
			c:=Getnum(c);
			if c=0	then use[i]:=false
				else low[i,c]:=k;
			end;
		readln(low[i,0]);
		end;
	for i1:=0 to a[1] do
	for i2:=0 to a[2] do
	for i3:=0 to a[3] do
	for i4:=0 to a[4] do
	for i5:=0 to a[5] do
		f[i1,i2,i3,i4,i5]:=i1*cost[1]+i2*cost[2]+i3*cost[3]+i4*cost[4]+i5*cost[5];
	for i:=1 to m do
	if use[i] then
		for i1:=low[i,1] to a[1] do
		for i2:=low[i,2] to a[2] do
		for i3:=low[i,3] to a[3] do
		for i4:=low[i,4] to a[4] do
		for i5:=low[i,5] to a[5] do
			begin
			x:=f[i1-low[i,1],i2-low[i,2],i3-low[i,3],i4-low[i,4],i5-low[i,5]]+low[i,0];
			if x<f[i1,i2,i3,i4,i5] then f[i1,i2,i3,i4,i5]:=x;
			end;
	writeln(f[a[1],a[2],a[3],a[4],a[5]]);
	close(input);
	close(output);
End.
