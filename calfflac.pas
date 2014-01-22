{
ID:peng921
PROG:calfflac
LANG:PASCAL
}
var
	s		:array[1..20000]of char;
	i,l,ans,p,max,p0,t	:longint;
procedure dual(i,j:longint;var p0,max:longint);
	begin
	max:=0;
        while true do
		begin
		while (i>0)and (not (s[i] in ['a'..'z','A'..'Z'])) do
			dec(i);
		while (j<l)and (not (s[j] in ['a'..'z','A'..'Z'])) do
			inc(j);
		if (i>0)and(j<l)and(upcase(s[i])=upcase(s[j]))
		then
			begin
			inc(max,2);
			p0:=i;
			dec(i);
			inc(j);
			end
		else break;
		end;
	end;
begin
	assign(input,'calfflac.in');
	assign(output,'calfflac.out');
	reset(input);
	rewrite(output);
	l:=0;
	while not eof do
		begin
		inc(l);
		read(s[l]);
		end;
	ans:=1;
	p:=1;
	for i:=1 to l-1 do
	if s[i] in ['a'..'z','A'..'Z'] then
		begin
		dual(i-1,i+1,p0,max);
		if max+1>ans then
			begin
			ans:=max+1;
			p:=p0;
                        end;
			dual(i,i+1,p0,max);
			if max>ans then
				begin
				ans:=max;
				p:=p0;
                                end;
		end;
	writeln(ans);
	t:=0;
	repeat
		write(s[p]);
		if (s[p] in ['a'..'z','A'..'Z']) then inc(t);
                inc(p);
	until t=ans;
	writeln;
	close(input);
	close(output);
end.
