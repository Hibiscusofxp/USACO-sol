{
ID:peng921
PROG:lamps
LANG:PASCAL
}
type
	arr		=array[1..100]of longint;
var
	ans		:array[1..32]of arr;
	f0		:array[1..32]of boolean;
	light,p		:arr;
	n,i,j,c,t,k,a	:longint;
	ff		:boolean;
procedure swap(var a,b:longint);
	begin
	a:=a+b;	b:=a-b;	a:=a-b;
	end;
function check(a:arr):boolean;
	var
	i		:longint;
	begin
	for i:=1 to n do
		if (light[i]<>-1) and (light[i]<>a[i]) then exit(false);
	exit(true);
	end;
procedure doit(var a:arr;k:longint);
	var
	i		:longint;
	begin
	case k of
		1:for i:=1 to n do
			a[i]:=1-a[i];
		2:for i:=1 to (n+1) shr 1 do
			a[i*2-1]:=1-a[i*2-1];
		3:for i:=1 to n shr 1 do
			a[i*2]:=1-a[i*2];
		4:for i:=0 to (n-1) div 3 do
			a[i*3+1]:=1-a[i*3+1];
	end;
	end;
function bigger(a,b:arr):longint;
	var
	j		:longint;
	begin
	j:=1;
	while (j<=n)and(a[j]=b[j]) do
		inc(j);
	if j>n then exit(0);
	if a[j]>b[j]
		then exit(1)
		else exit(-1);
	end;
procedure dfs(p:arr;k,s:longint);
	var
	i		:longint;
	begin
        if (c>=s)and( (c-s) and 1=0) and check(p) then
		begin
		inc(t);
		for i:=1 to n do
			ans[t,i]:=p[i];
		end;
	if k>4 then exit;
	dfs(p,k+1,s);
	doit(p,k);
	dfs(p,k+1,s+1);
	end;
begin
	assign(input,'lamps.in');
	assign(output,'lamps.out');
	reset(input);
	rewrite(output);
	readln(n);
	readln(c);
	fillchar(light,sizeof(light),$FF);
	read(a);
	while a<>-1 do
		begin
		light[a]:=1;
		read(a);
		end;
	readln;
	read(a);
	while a<>-1 do
		begin
		light[a]:=0;
		read(a);
		end;
	t:=0;
	fillchar(ans,sizeof(ans),0);
	for i:=1 to n do
		p[i]:=1;
	dfs(p,1,0);
	fillchar(f0,sizeof(f0),true);
	for i:=1 to t-1 do
	for j:=i+1 to t do
		if f0[i] and f0[j] then
			begin
			a:=bigger(ans[i],ans[j]);
			if a=0 then f0[j]:=false;
			if a=1 then
				for k:=1 to n do
				swap(ans[i,k],ans[j,k]);
			end;
	ff:=true;
	for i:=1 to t do
		if f0[i] then
			begin
			for j:=1 to n do
				write(ans[i,j]);
			writeln;
			ff:=false;
			end;
	if ff then writeln('IMPOSSIBLE');
	close(input);
	close(output);
end.
