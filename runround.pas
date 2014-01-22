{
ID:peng921
PROG:runround
LANG:PASCAL
}
type
	arr		=array[1..10]of longint;
var
	a		:arr;
	n,l,i	:longint;
procedure inca(var a:arr);
	var
	i		:longint;
	begin
	i:=1;
	while a[i]=9 do
		begin
		a[i]:=0;
		inc(i);
		end;
	inc(a[i]);
	if i>l then l:=i;
	end;
function ok(a:arr):boolean;
	var
	f		:array[0..10]of boolean;
	i,j,s		:longint;
	begin
	fillchar(f,sizeof(f),false);
	s:=0;
	for i:=1 to l do
		begin
		if f[a[i]] then exit(false);
		inc(s,a[i]);
		f[a[i]]:=true;
		end;
	if s mod l<>0 then exit(false);
	j:=l;
	s:=a[l];
	fillchar(f,sizeof(f),false);
	for i:=1 to l do
		begin
		if f[j]
			then exit(false)
			else f[j]:=true;
		j:=((j-s) mod l+l-1) mod l+1;
		s:=a[j];
		end;
	if j=l
		then exit(true)
		else exit(false);
	end;
begin
	assign(input,'runround.in');
	assign(output,'runround.out');
	reset(input);
	rewrite(output);
	readln(n);
	l:=0;
	while n<>0 do
		begin
		inc(l);
		a[l]:=n mod 10;
		n:=n div 10;
		end;
	repeat
		inca(a);
	until ok(a);
	for i:=l downto 1 do
		write(a[i]);
	writeln;
	close(input);
	close(output);
end.
