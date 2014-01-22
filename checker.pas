{
ID:peng921
PROG:checker
LANG:PASCAL
}
var
	p			:array[1..13]of longint;
	i,n,s,ans,limit         :longint;
procedure dfs(k:longint);
	var
	i,j		:longint;
	f0		:boolean;
	begin
	if ans=3 then exit;
	if k>n then
		begin
		inc(ans);
		for i:=1 to n do
		if i=1
			then write(p[i])
			else write(' ',p[i]);
		writeln;
		exit;
		end;
	for i:=1 to n do
		begin
		f0:=true;
		for j:=1 to k-1 do
			if (abs(p[j]-i)=abs(k-j))or(p[j]=i) then
				begin
				f0:=false;
				break;
				end;
		if f0 then
			begin
			p[k]:=i;
			dfs(k+1);
			end;
		end;
	end;
procedure super(row,ld,rd:longint);
	var
	pos,p		:longint;
	begin
	if row=limit
	then inc(ans)
	else
		begin
		pos:=limit and not (row or ld or rd);
		while pos<>0 do
			begin
			p:=pos and (not pos +1);
			pos:=pos-p;
			super(row+p,(ld+p)shl 1,(rd+p)shr 1);
			end;
		end;
	end;
begin
	assign(input,'checker.in');
	assign(output,'checker.out');
	reset(input);
	rewrite(output);
	readln(n);
	ans:=0;
	dfs(1);
	ans:=0;
	limit:=1 shl n -1;
	super(0,0,0);
	writeln(ans);
	close(input);
	close(output);
end.
