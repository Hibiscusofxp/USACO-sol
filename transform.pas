{
ID:peng921
PROG:transform
LANG:PASCAL
}
type
	arr		=array[1..11,1..11]of char;
var
	a,b,c	:arr;
	i,j,n	:longint;
procedure rotato(var f:arr);
	var
	i,j		:longint;
	x		:arr;
	begin
	x:=f;
	for i:=1 to n do
	for j:=1 to n do
		f[i,j]:=x[n+1-j,i];
	end;
procedure overturn(var f:arr);
	var
	i,j		:longint;
	x		:arr;
	begin
	x:=f;
	for i:=1 to n do
	for j:=1 to n do
		f[i,j]:=x[i,n+1-j];
	end;
procedure check(a:arr;x:longint);
	var
	i,j		:longint;
	begin
        for i:=1 to n do
	for j:=1 to n do
		if a[i,j]<>b[i,j] then exit;
	writeln(x);
	close(input);
	close(output);
	halt;
	end;
begin
	assign(input,'transform.in');
	assign(output,'transform.out');
	reset(input);
	rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
		for j:=1 to n do
			read(a[i,j]);
		readln;
		end;
	for i:=1 to n do
		begin
		for j:=1 to n do
			read(b[i,j]);
		readln;
		end;
	c:=a;
	for i:=1 to 3 do
		begin
		rotato(c);
		check(c,i);
		end;
	c:=a;
	overturn(c);
	check(c,4);
	for i:=1 to 3 do
		begin
		rotato(c);
		check(c,5);
		end;
	check(a,6);
	writeln(7);
	close(input);
	close(output);
end.
