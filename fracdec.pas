{
ID:peng921
PROG:fracdec
LANG:PASCAL
}
var
	d,f		:array[1..100007]of longint;
	a,b,len,l,i	:longint;
	s		:string;
procedure check;
	begin
	inc(l);
	if l mod 76=0 then writeln;
	end;
begin
	assign(input,'fracdec.in');
	assign(output,'fracdec.out');
	reset(input);
	rewrite(output);
	readln(a,b);
	i:=a div b;
	str(i,s);
	l:=length(s)+1;
	write(i,'.');
	a:=a mod b;
	fillchar(d,sizeof(d),0);
	len:=0;
	while (a<>0) and (d[a]=0)  do
		begin
		inc(len);
		d[a]:=len;
		a:=a*10;
		f[len]:=a div b;
		a:=a mod b;
		end;
	if len=0 then len:=1;
	if a=0
	then	for i:=1 to len do
			begin
			write(f[i]);
			check;
			end
	else	begin
		for i:=1 to len do
			begin
			if i=d[a] then
				begin
				write('(');
				check;
				end;
			write(f[i]);
			check;
			end;
		write(')');
		check;
		end;
	if l mod 76<>0 then writeln;
	close(input);
	close(output);
end.
