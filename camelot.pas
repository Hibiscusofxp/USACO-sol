{
ID:peng921
PROG:camelot
LANG:PASCAL
}
Const
	maxn		=30;
	maxm		=26;
	inf		=maxlongint shr 1;
	dx		:array[1..8]of shortint=(1,-1,2,-2,2,-2,1,-1);
	dy		:array[1..8]of shortint=(-2,-2,-1,-1,1,1,2,2);
Var
	d		:array[1..maxn,1..maxm,1..maxn,1..maxm]of integer;
	dk		:array[1..maxn,1..maxm]of integer;
	x,y		:array[1..maxn*maxm]of integer;
	q		:array[1..maxn*maxm,1..2]of integer;
	vis		:array[1..maxn,1..maxn]of boolean;
	n,m,num,i,j,i1,j1,k,kx,ky,x1,x2,y1,y2,kx1,kx2,ky1,ky2,dis,kdis,ans	:longint;
	ch,blank	:char;

Function Getmax(a,b:longint):Longint;
	begin
	if a>b	then exit(a)	else exit(b);
	end;
Function Getmin(a,b:longint):Longint;
	begin
	if a<b	then exit(a)	else exit(b);
	end;
Function Getnum(ch:char):longint;
	begin
	exit(ord(ch)-ord('A')+1);
	end;
Procedure Bfs(x,y:longint);
	var
	head,tail,tot,i,j,x0,y0	:longint;
	begin
	d[x,y,x,y]:=0;
	fillchar(vis,sizeof(vis),false);
	vis[x,y]:=true;
	head:=0;
	tail:=1;
	q[1,1]:=x;
	q[1,2]:=y;
	while head<tail do
		begin
		inc(head);
		x:=q[head,1];
		y:=q[head,2];
		for i:=1 to 8 do
			begin
			x0:=q[head,1]+dx[i];
			y0:=q[head,2]+dy[i];
			if (x0>=1)and(x0<=n)and(y0>=1)and(y0<=m)and(not vis[x0,y0]) then
				begin
				inc(tail);
				q[tail,1]:=x0;
				q[tail,2]:=y0;
				vis[x0,y0]:=true;
				d[q[1,1],q[1,2],x0,y0]:=d[q[1,1],q[1,2],x,y]+1;
				end;
			end;
		end;
	end;
Begin
	assign(input,'camelot.in');
	assign(output,'camelot.out');
	reset(input);
	rewrite(output);
	readln(n,m);
	readln(ch,kx);
	ky:=Getnum(ch);
	num:=0;
	x1:=kx;
	y1:=ky;
	while not eof do
		begin
		inc(num);
		read(ch,blank,x[num]);
		read(blank);
		y[num]:=Getnum(ch);
		inc(x1,x[num]);
		inc(y1,y[num]);
		if eoln then readln;
		if eoln then readln;
		end;
	x1:=x1 div (num+1);
	y1:=y1 div (num+1);
	if num<=1
	then	begin
		x1:=1;
		x2:=n;
		y1:=1;
		y2:=m;
		end
	else	begin
		x2:=Getmin(x1+2,n);
		x1:=Getmax(x1-2,1);
		y2:=Getmin(y1+2,m);
		y1:=Getmax(y1-2,1);
		end;
	kx1:=Getmax(kx-1,1);
	kx2:=Getmin(kx+1,n);
	ky1:=Getmax(ky-1,1);
	ky2:=Getmin(ky+1,m);
	for i:=1 to n do
	for j:=1 to m do
		dk[i,j]:=Getmax(abs(i-kx),abs(j-ky));
	fillchar(d,sizeof(d),127);
	for i:=x1 to x2 do
	for j:=y1 to y2 do
		Bfs(i,j);
	for i:=kx1 to kx2 do
	for j:=ky1 to ky2 do
		Bfs(i,j);
	ans:=inf;
	for i:=x1 to x2 do
	for j:=y1 to y2 do
		begin
		dis:=0;
		for k:=1 to num do
			inc(dis,d[i,j,x[k],y[k]]);
		if dis>=ans then continue;
		kdis:=dk[i,j];
		for i1:=kx1 to kx2 do
		for j1:=ky1 to ky2 do
		for k:=1 to num do
			kdis:=Getmin(kdis,dk[i1,j1]+d[i1,j1,x[k],y[k]]+d[i1,j1,i,j]-d[i,j,x[k],y[k]]);
		ans:=Getmin(ans,kdis+dis);
		end;
	writeln(ans);
	close(input);
	close(output);
End.
