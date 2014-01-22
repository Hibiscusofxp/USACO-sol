{
ID:peng921
PROG:spin
LANG:PASCAL
}
Const
	num		=5;
Var
	speed,n		:array[1..num]of longint;
	a		:array[1..num,1..5,1..2]of longint;
	d		:array[0..359]of longint;
	dep,i,j,k	:longint;
Begin
	assign(input,'spin.in');
	assign(output,'spin.out');
	reset(input);
	rewrite(output);
	for i:=1 to num do
		begin
		read(speed[i]);
		read(n[i]);
		for j:=1 to n[i] do
			read(a[i,j,1],a[i,j,2]);
		readln;
		end;
	for dep:=0 to 359 do
		begin
		fillchar(d,sizeof(d),0);
		for i:=1 to num do
		for j:=1 to n[i] do
		for k:=a[i,j,1] to a[i,j,1]+a[i,j,2] do
			inc(d[k mod 360]);
		for i:=0 to 359 do
		if d[i]=num then
			begin
			writeln(dep);
			close(input);
			close(output);
			halt;
			end;
		for i:=1 to num do
		for j:=1 to n[i] do
			a[i,j,1]:=(a[i,j,1]+speed[i]) mod 360;
		end;
	writeln('none');
	close(input);
	close(output);
end.