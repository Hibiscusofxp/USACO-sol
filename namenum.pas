{
ID:peng921
PROG:namenum
LANG:PASCAL
}
const
	name		:array['A'..'Z']of char=('2','2','2','3','3','3','4','4','4','5','5','5',
				'6','6','6','7','0','7','7','8','8','8','9','9','9','0');
var
	s,s0		:string[15];
	f,f0		:boolean;
	l,l0,i		:longint;
begin
	assign(input,'namenum.in');
	reset(input);
	readln(s);
	l:=length(s);
	close(input);

	assign(input,'dict.txt');
	assign(output,'namenum.out');
	reset(input);
	rewrite(output);
	f:=true;
	while not eof do
		begin
		readln(s0);
		l0:=length(s0);
		if l<>l0 then continue;
		f0:=true;
		for i:=1 to l do
			if name[ s0[i]]<>s[i] then
				begin
				f0:=false;
				break;
				end;
		if f0 then
			begin
			f:=false;
			writeln(s0);
			end;
		end;
	if f then writeln('NONE');
	close(input);
	close(output);
end.
