{
ID:peng921
PROG:fact4
LANG:PASCAL
}
Var
	n,num,digit,k,i	:longint;
Begin
	assign(input,'fact4.in');
	assign(output,'fact4.out');
	reset(input);
	rewrite(output);
	readln(n);
	num:=0;
	digit:=1;
	for i:=2 to n do
		begin
		k:=i;
		while k mod 10=0 do
			k:=k div 10;
		while k mod 2=0 do
			begin
			inc(num);
			k:=k div 2;
			end;
		while k mod 5=0 do
			begin
			dec(num);
			k:=k div 5;
			end;
		digit:=(digit*k) mod 10;
                end;
	if num>0 then num:=(num-1+4) mod 4+1;
	for i:=1 to num do
		digit:=(digit*2) mod 10;
	writeln(digit);
	close(input);
	close(output);
End.
