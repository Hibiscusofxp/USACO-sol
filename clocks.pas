{
ID:peng921
PROG:clocks
LANG:PASCAL
}
const
	l		:array[1..9]of integer=(4,3,4,3,5,3,4,3,4);
	w		:array[1..9,1..5]of integer=
				((1,2,4,5,0)
				,(1,2,3,0,0)
				,(2,3,5,6,0)
				,(1,4,7,0,0)
				,(2,4,5,6,8)
				,(3,6,9,0,0)
				,(4,5,7,8,0)
				,(7,8,9,0,0)
				,(5,6,8,9,0));
type
	arr		=array[1..9]of integer;
var
	a		:arr;
	ans,p		:arr;
	i,min,j,t		:longint;
procedure check;
	var
	b		:arr;
	i,j,t		:longint;
	f		:boolean;
	begin
	b:=a;
	for i:=1 to 9 do
	if p[i]>0 then
		for j:=1 to l[i] do
			inc(b[ w[i,j]],p[i]);
	for i:=1 to 9 do
		if b[i] mod 4<>0 then exit;
	t:=0;
	for i:=1 to 9 do
		inc(t,p[i]);
	if t>min then exit;
	f:=true;
	if t=min then
		for i:=1 to 9 do
			if ans[i]<>p[i] then
				begin
				if ans[i]>p[i] then f:=false;
				break;
				end;
	if f then
		begin
		for i:=1 to 9 do
			ans[i]:=p[i];
		min:=t;
		end;
	end;
procedure dfs(k:longint);
	var
	i		:longint;
	begin
	if k>9 then
		begin
		check;
		exit;
		end;
	for i:=0 to 3 do
		begin
		p[k]:=i;
		dfs(k+1);
		end;
	end;
begin
	assign(input,'clocks.in');
	assign(output,'clocks.out');
	reset(input);
	rewrite(output);
	for i:=1 to 9 do
		begin
		read(a[i]);
		a[i]:=a[i] div 3;
		end;
	fillchar(p,sizeof(p),0);
	fillchar(ans,sizeof(ans),0);
	min:=maxlongint;
	dfs(1);
	t:=1;
	for i:=1 to 9 do
	for j:=1 to ans[i] do
		if t=min
		then writeln(i)
		else
			begin
			write(i,' ');
			inc(t);
			end;
	close(input);
	close(output);
end.
