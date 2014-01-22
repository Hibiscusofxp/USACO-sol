{
ID:peng921
PROG:fence4
LANG:PASCAL
}
Var
	x,y,ans		:array[0..203]of longint;
	n,i,j,tot	:Longint;
Procedure Swap(var a,b:Longint);
	var
	t		:Longint;
	begin
	t:=a;	a:=b;	b:=t;
	end;
Function Cross(a,b,c:Longint):Longint;
	begin
	exit((x[b]-x[a])*(y[c]-y[a])-(x[c]-x[a])*(y[b]-y[a]));
	end;
Function Across(a,b,c,d:Longint):Longint;
	var
	p,q		:Longint;
	begin
	p:=Cross(a,b,c)*Cross(a,b,d);
	q:=Cross(c,d,a)*Cross(c,d,b);
	if (p<0)and(q<0) then exit(1);		//严格相交
	if (p>0)or(q>0) then exit(-1);		//不相交
	exit(0);				//不严格相交or同一直线但不相交
	end;

Function Check(o,a,b:Longint):boolean;
	var
	a0,b0,i,cr	:Longint;
	begin
	if Cross(o,a,b)=0 then exit(false);
	for i:=1 to n do
		if (i<>a)and(Across(o,a,i,i+1)>=0)and(Across(o,b,i,i+1)>=0) then exit(false);
	if Cross(o,a,b)>0 then Swap(a,b);
	a0:=a;
	b0:=b;
	for i:=2 to n+1 do
	if (Cross(a,b,i)<0)and(Cross(b,o,i)<0)and(Cross(o,a,i)<0) then
		begin
		cr:=Cross(o,i-1,i);
		if (cr<0)and(Cross(o,a0,i)<0) then a0:=i;
		if (cr>0)and(Cross(o,b0,i)>0) then b0:=i;
		end;
	for i:=n downto 1 do
	if (Cross(a,b,i)<0)and(Cross(b,o,i)<0)and(Cross(o,a,i)<0) then
		begin
		cr:=Cross(o,i+1,i);
		if (cr<0)and(Cross(o,a0,i)<0) then a0:=i;
		if (cr>0)and(Cross(o,b0,i)>0) then b0:=i;
		end;
	if Cross(o,a0,b0)<0 then exit(true)
		else exit(false);
	end;
Begin
	assign(input,'fence4.in');
	assign(output,'fence4.out');
	reset(input);
	rewrite(output);
	readln(n);
	readln(x[0],y[0]);
	for i:=1 to n do
		readln(x[i],y[i]);
	x[n+1]:=x[1];
	y[n+1]:=y[1];
	for i:=1 to n-1 do
	for j:=i+1 to n do
		if Across(i,i+1,j,j+1)=1 then
			begin
			writeln('NOFENCE');
			close(input);
			close(output);
			end;
	tot:=0;
	for i:=1 to n do
		if Check(0,i,i+1) then
			begin
			inc(tot);
			ans[tot]:=i;
			end;
	if (ans[tot]=n)and(ans[tot-1]=n-1)
		then Swap(ans[tot],ans[tot-1]);
	writeln(tot);
	for i:=1 to tot do
		if ans[i]=n then writeln(x[1],' ',y[1],' ',x[n],' ',y[n])
			else writeln(x[ans[i]],' ',y[ans[i]],' ',x[ans[i]+1],' ',y[ans[i]+1]);
	close(input);
	close(output);
End.
