{
ID:peng921
PROG:milk3
LANG:PASCAL
}
var
	w		:array[1..3]of longint;
	f		:array[0..20,0..20,0..20]of boolean;
	first		:boolean;
	i		:longint;
procedure water(k:integer;var a,b:longint);
	begin
	if a+b>w[k]
	then
		begin
		a:=a+b-w[k];
		b:=w[k];
		end
	else
		begin
		b:=a+b;
		a:=0;
		end;
	end;
procedure dfs(a,b,c:longint);
	var
	i,j		:longint;
	begin
	if f[a,b,c] then exit;
	f[a,b,c]:=true;

	i:=a;
	j:=b;
	water(2,i,j);
	dfs(i,j,c);
	
	i:=a;
	j:=c;
	water(3,i,j);
	dfs(i,b,j);
	
	i:=b;
	j:=a;
	water(1,i,j);
	dfs(j,i,c);
	
	i:=b;
	j:=c;
	water(3,i,j);
	dfs(a,i,j);
	
	i:=c;
	j:=a;
	water(1,i,j);
	dfs(j,b,i);
	
	i:=c;
	j:=b;
	water(2,i,j);
	dfs(a,j,i);
	end;
	
begin
	assign(input,'milk3.in');
	assign(output,'milk3.out');
	reset(input);
	rewrite(output);
	readln(w[1],w[2],w[3]);
	fillchar(f,sizeof(f),false);
	dfs(0,0,w[3]);
	first:=true;
	for i:=0 to w[3] do
		if (w[3]-i<=w[2]) and f[0,w[3]-i,i] then
			if first
			then
				begin
				first:=false;
				write(i);
				end
			else write(' ',i);
	writeln;
	close(input);
	close(output);
end.
