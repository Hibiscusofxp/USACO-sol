{
ID:peng921
PROG:beads
LANG:PASCAL
}
const
	maxn		=400;
var
	s		:array[1..maxn]of char;
	ch,ch1		:char;
	i,n,max,l,r,lt,lr:longint;
begin
	assign(input,'beads.in');
	assign(output,'beads.out');
	reset(input);
	rewrite(output);
	readln(n);
	for i:=1 to n do
		read(s[i]);
	max:=0;
	for i:=1 to n do
		begin
		l:=i;
		r:=i+1;
		if r>n then r:=1;
		ch:=s[i];
		ch1:=s[r];
		lt:=0;
		while ((s[l]=ch)or(s[l]='w'))and(lt<=n) do
			begin
			dec(l);
			if l=0 then l:=n;
			inc(lt);
			end;
		lr:=0;
		while ((s[r]=ch1)or(s[r]='w'))and(lr<=n) do
			begin
			inc(r);
			if r>n then r:=1;
			inc(lr);
			end;
		if max<lt+lr then max:=lt+lr;
		end;
	if max>n then max:=n;
	writeln(max);
	close(input);
	close(output);
end.
