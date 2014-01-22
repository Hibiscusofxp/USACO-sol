{
ID:peng921
PROG:palsquare
LANG:PASCAL
}
var
	n,i		:longint;
	s,s0		:string;
function str0(n:longint):char;
	begin
		if n>=10
			then exit(chr(ord('A')+n-10))
			else exit(chr(ord('0')+n));
	end;
procedure change(k:longint;var s:string);
	var
	i,v		:longint;
	begin
        s:='';
	while k>0 do
		begin
		v:=k mod n;
		s:=str0(v)+s;
		k:=k div n;
		end;
	end;
function check(s:string):boolean;
	var
	i,l		:longint;
	begin
	l:=length(s);
	for i:=1 to l div 2 do
		if s[i]<>s[l+1-i] then exit(false);
	exit(true);
	end;
begin
	assign(input,'palsquare.in');
	assign(output,'palsquare.out');
	reset(input);
	rewrite(output);
	readln(n);
	for i:=1 to 300 do
		begin
		change(i*i,s);
		if check(s) then
			begin
			change(i,s0);
			writeln(s0,' ',s);
			end;
		end;
	close(input);
	close(output);
end.
