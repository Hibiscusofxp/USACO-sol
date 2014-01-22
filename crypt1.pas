{
ID:peng921
PROG:crypt1
LANG:PASCAL
}
var
	f		:array[0..9]of boolean;
	i,j,a,b,c,ans,n	:longint;
function ok(n:longint):boolean;
	begin
	while n>0 do
		begin
		if not f[n mod 10] then exit(false);
		n:=n div 10;
		end;
		exit(true);
	end;
begin
	assign(input,'crypt1.in');
	assign(output,'crypt1.out');
	reset(input);
	rewrite(output);
	readln(n);
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		begin
		read(a);
		f[a]:=true;
		end;
	ans:=0;
	for i:=100 to 999 do
	if ok(i) then
		for j:=10 to 99 do
		if ok(j) then
			begin
			a:=i*(j mod 10);
			b:=i*(j div 10);
			c:=i*j;
			if (a>=100)and(a<=999)
				and(b>=100)and(b<=999)
				and(c>=1000)and(c<=9999)
				and ok(a) and ok(b) and ok(c)
				then inc(ans);
			end;
	writeln(ans);
	close(input);
	close(output);
end.
