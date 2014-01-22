{
ID:peng921
PROG:butter
LANG:PASCAL
}
Const
	inf		=maxlongint shr 1;
	maxn		=800+3;
	
Var
	c,d		:array[1..maxn,0..maxn]of longint;
	cow,f,q,min	:array[1..maxn]of longint;
	vis		:array[1..maxn]of boolean;
	p,n,e,i,k,u,v,head,tail,ans	:longint;
	
Begin
	assign(input,'butter.in');
	assign(output,'butter.out');
	reset(input);
	rewrite(output);
	readln(p,n,e);
	for i:=1 to p do
		readln(cow[i]);
	fillchar(c,sizeof(c),127);
	for i:=1 to e do
		begin
		read(u,v);
		readln(c[u,v]);
		c[v,u]:=c[u,v];
		inc(d[u,0]);
		d[u,d[u,0]]:=v;
		inc(d[v,0]);
		d[v,d[v,0]]:=u;
		end;
	fillchar(min,sizeof(min),0);
	for k:=1 to p do
		begin
		fillchar(f,sizeof(f),127);
		fillchar(vis,sizeof(vis),false);
		head:=0;
		tail:=1;
		f[cow[k]]:=0;
		vis[cow[k]]:=true;
		q[1]:=cow[k];
		while head<>tail do
			begin
			inc(head);
			if head>maxn then head:=1;
			u:=q[head];
			vis[u]:=false;
			for i:=1 to d[u,0] do
				begin
				v:=d[u,i];
				if f[v]>f[u]+c[u,v] then
					begin
					f[v]:=f[u]+c[u,v];
					if not vis[v] then
						begin
						inc(tail);
						if tail>maxn then tail:=1;
						q[tail]:=v;
						vis[v]:=true;
						end;
					end;
				end;
			end;
		for i:=1 to n do
			inc(min[i],f[i]);
		end;
	ans:=inf;
	for i:=1 to n do
		if ans>min[i] then ans:=min[i];
	writeln(ans);
	close(input);
	close(output);
End.
