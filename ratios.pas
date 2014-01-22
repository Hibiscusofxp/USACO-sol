{
ID:peng921
PROG:ratios
LANG:PASCAL
}
Const
	inf		=maxlongint shr 1;
Var
	a,b,c		:array[0..3]of longint;
	x,y,z,n,best,sum,num,ia,ib,ic,mina,minb,minc,mind	:longint;
Begin
	assign(input,'ratios.in');
	assign(output,'ratios.out');
	reset(input);
	rewrite(output);
	readln(x,y,z);
	sum:=x+y+z;
	readln(a[1],a[2],a[3]);
	readln(b[1],b[2],b[3]);
	readln(c[1],c[2],c[3]);
	a[0]:=a[1]+a[2]+a[3];
	b[0]:=b[1]+b[2]+b[3];
	c[0]:=c[1]+c[2]+c[3];
	mind:=0;
	best:=inf;
	for ia:=0 to 99 do
	for ib:=0 to 99 do
	for ic:=0 to 99 do
		begin
		num:=ia+ib+ic;
                if num>=best then continue;
		n:=a[0]*ia+b[0]*ib+c[0]*ic;
		if (n mod sum<>0)or(n=0) then continue;
		n:=n div sum;
		if	(x*n=ia*a[1]+ib*b[1]+ic*c[1])and
			(y*n=ia*a[2]+ib*b[2]+ic*c[2])and
			(z*n=ia*a[3]+ib*b[3]+ic*c[3]) then
			begin
			best:=num;
			mina:=ia;
			minb:=ib;
			minc:=ic;
			mind:=n;
			end;
		end;
	if best=inf
		then writeln('NONE')
		else writeln(mina,' ',minb,' ',minc,' ',mind);
	close(input);
	close(output);
End.
