{
ID:peng921
PROG:msquare
LANG:PASCAL
}
Const
	n		=8;
	maxn		=40320+3;
Var
	f		:array[1..n]of boolean;
	fact		:array[0..n]of longint;
	way,pre,list	:array[1..maxn]of longint;
	vis		:array[1..maxn]of boolean;
	i,aim,step,head,tail,ct,q,q0	:longint;

Function Cantor(q:longint):longint;
	var
	num,i,j,k,p	:longint;
	begin
	num:=0;
	fillchar(f,sizeof(f),true);
	for i:=8 downto 2 do
		begin
		k:=q shr (3*(i-1));
		dec(q,k shl (3*(i-1)));
		if k=0 then k:=8;
		p:=0;
		for j:=1 to k-1 do
			if f[j] then inc(p);
		f[k]:=false;
		inc(num,p*fact[i-1]);
		end;
	exit(num+1);
	end;
Function Change(q,ch:longint):longint;
	var
	i,q0		:longint;
	begin
	q0:=0;
	case ch of
	1:	for i:=1 to 8 do
			inc(q0,(q and(7 shl((i-1)*3))) shr((i-1)*3) shl((8-i)*3));
	2:	begin
		inc(q0,(q and &77700000)shr 3);
		inc(q0,(q and &00070000)shl 9);
		inc(q0,(q and &00000777)shl 3);
		inc(q0,(q and &00007000)shr 9);
		end;
	3:	begin
		q0:=q and &70077007;
		inc(q0,(q and &07000000)shr 3);
		inc(q0,(q and &00700000)shr 9);
		inc(q0,(q and &00000700)shr 3);
		inc(q0,(q and &00000070)shl 15);
		end;
	end;
	exit(q0);
	end;
Procedure Print(q0,step:longint);
	begin
	if pre[q0]<>0 then
		begin
		Print(pre[q0],step-1);
		write(chr(ord('A')+way[q0]-1));
		if step mod 60=0 then writeln;
		end;
	end;
Begin
	assign(input,'msquare.in');
	assign(output,'msquare.out');
	reset(input);
	rewrite(output);
	fact[1]:=1;
	for i:=2 to 8 do
		fact[i]:=fact[i-1]*i;
	aim:=0;
	for i:=1 to n do
		begin
		read(q);
		aim:=aim shl 3+q mod n;
		end;
	aim:=Cantor(aim);
	fillchar(vis,sizeof(vis),false);
	head:=0;
	tail:=1;
	list[1]:=&12345670;
	vis[cantor(list[1])]:=true;
	while (not vis[aim])and(head<tail) do
		begin
		inc(head);
		for i:=1 to 3 do
			begin
			q0:=change(list[head],i);
			ct:=cantor(q0);
			if not vis[ct] then
				begin
				vis[ct]:=true;
				inc(tail);
				list[tail]:=q0;
				pre[tail]:=head;
				way[tail]:=i;
				if ct=aim then break;
				end;
			end;
		end;
	q0:=tail;
	step:=0;
	while pre[q0]<>0 do
		begin
		inc(step);
		q0:=pre[q0];
		end;	
	writeln(step);
	Print(tail,step);
	if (step=0)or(step mod 60<>0) then writeln;
	close(input);
	close(output);
End.
