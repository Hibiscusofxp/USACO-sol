{
ID:peng921
PROG:comehome
LANG:PASCAL
}
const
	maxn		=52+7;
	inf		=maxlongint shr 1;
var
	p		:array[chr(1)..chr(127)]of longint;
	f		:array[1..maxn,1..maxn]of longint;
	a,dis		:array[1..maxn]of longint;
	vis		:array[1..maxn]of boolean;
	ch		:array[1..maxn]of char;
        s0              :string;
	n,m,i,ans,head,tail,x,v1,v2	:longint;
	code		:integer;
begin
	assign(input,'comehome.in');
	assign(output,'comehome.out');
	reset(input);
	rewrite(output);
	readln(m);
	fillchar(f,sizeof(f),$FF);
	fillchar(p,sizeof(p),0);
	n:=0;
	for i:=1 to m do
		begin
		readln(s0);
		if p[s0[1]]=0 then
			begin
			inc(n);
			p[s0[1]]:=n;
			ch[n]:=s0[1];
			end;
		v1:=p[s0[1]];
		if p[s0[3]]=0 then
			begin
			inc(n);
			p[s0[3]]:=n;
			ch[n]:=s0[3];
			end;
		v2:=p[s0[3]];
		delete(s0,1,4);
		val(s0,x,code);
		if (f[v1,v2]=-1) or (x<f[v1,v2]) then
			begin
			f[v1,v2]:=x;
			f[v2,v1]:=x;
			end;
		end;
	filldword(dis,sizeof(dis) shr 2,inf);
	fillchar(vis,sizeof(vis),false);
	head:=0;
	tail:=1;
	a[1]:=p['Z'];
	vis[a[1]]:=true;
	dis[a[1]]:=0;
	while head<>tail do
		begin
		inc(head);
		if head>maxn then head:=1;
		x:=a[head];
		for i:=1 to n do
		if (f[i,x]<>-1) and (dis[i]>dis[x]+f[i,x]) then
			begin
			dis[i]:=dis[x]+f[i,x];
			if not vis[i] then
				begin
				inc(tail);
				if tail>maxn then tail:=1;
				a[tail]:=i;
				vis[i]:=true;
				end;
			end;
		vis[x]:=false;
		end;
	ans:=inf;
	for i:=1 to n do
		if (ch[i] in ['A'..'Y']) and (ans>dis[i]) then
			begin
			ans:=dis[i];
			x:=i;
			end;
	writeln(ch[x],' ',ans);
	close(input);
	close(output);
end.
