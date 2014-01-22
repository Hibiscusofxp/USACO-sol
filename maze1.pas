{
ID:peng921
PROG:maze1
LANG:PASCAL
}
const
	dx		:array[1..4]of shortint=(0,1,0,-1);
	dy		:array[1..4]of shortint=(1,0,-1,0);
	maxn		=100+3;
	maxm		=38+3;
var
        map             :array[1..maxn*2+1,1..maxm*2+1]of char;
	d		:array[1..maxn,1..maxm,1..4]of boolean;
	f		:array[1..maxn,1..maxm]of longint;
	i,j,k,n,m,x,y,ans	:longint;
procedure bfs(x,y:longint);
	var
	a		:array[1..maxn*maxm,1..2]of longint;
	vis		:array[1..maxn,1..maxm]of boolean;
        head,tail,i,x0,y0   :longint;
	begin
	fillchar(vis,sizeof(vis),true);
	f[x,y]:=1;
	vis[x,y]:=false;
	a[1,1]:=x;
	a[1,2]:=y;
	head:=0;
	tail:=1;
	while head<tail do
		begin
		inc(head);
		x:=a[head,1];
		y:=a[head,2];
		for i:=1 to 4 do
		if d[x,y,i] then
			begin
			x0:=x+dx[i];
			y0:=y+dy[i];
			if vis[x0,y0] then
				begin
				inc(tail);
				a[tail,1]:=x0;
				a[tail,2]:=y0;
				vis[x0,y0]:=false;
				if f[x0,y0]>f[x,y]+1
					then f[x0,y0]:=f[x,y]+1;
				end;
			end;
		end;
	end;
begin
	assign(input,'maze1.in');
	assign(output,'maze1.out');
	reset(input);
	rewrite(output);
	readln(m,n);
	for i:=1 to n*2+1 do
		begin
		for j:=1 to m*2+1 do
			read(map[i,j]);
		readln;
		end;
        fillchar(d,sizeof(d),false);
	for i:=1 to n do
	for j:=1 to m do
	for k:=1 to 4 do
		begin
		x:=i*2+dx[k];
		y:=j*2+dy[k];
                if (x>1)and(x<n*2+1)and(y>1)and(y<m*2+1)
			and(map[x,y]=' ') then d[i,j,k]:=true;
		end;
        fillchar(f,sizeof(f),127);
	for i:=1 to m do
		begin
		if map[1,i*2]=' ' then bfs(1,i);
		if map[n*2+1,i*2]=' ' then bfs(n,i);
		end;
	for i:=1 to n do
		begin
		if map[i*2,1]=' ' then bfs(i,1);
		if map[i*2,m*2+1]=' 'then bfs(i,m);
		end;
	ans:=0;
	for i:=1 to n do
	for j:=1 to m do
		if ans<f[i,j] then ans:=f[i,j];
	writeln(ans);
	close(input);
	close(output);
end.
