{
ID:peng921
PROG:contact
LANG:PASCAL
}
Const
	maxn		=1 shl 13;
Var
	count		:array[0..maxn]of longint;
	s0		:array[0..maxn]of string;
	s		:ansistring;
	ss		:string;
	a,b,m,n,st,en,i,j,k,t	:longint;

Procedure swapn(var a,b:longint);
	var
	t		:longint;
	begin
	t:=a;	a:=b;	b:=t;
	end;
Procedure swaps(var s1,s2:string);
	var
	s0		:string;
	begin
	s0:=s1;	s1:=s2;	s2:=s0;
	end;
Function smaller(i,j:longint):boolean;
	begin
	exit(	(count[i]<count[j])or
		(count[i]=count[j])and(length(s0[i])>length(s0[j]))or
		(count[i]=count[j])and(length(s0[i])=length(s0[j]))and(s0[i]>=s0[j]));
	end;
Procedure qsort(l,r:longint);
	var
	i,j,k		:longint;
	begin
	i:=l-1;
	j:=r+1;
	k:=random(r-l+1)+l;
	count[0]:=count[k];
	s0[0]:=s0[k];
	while true do
		begin
		repeat inc(i) until smaller(i,0);
		repeat dec(j) until smaller(0,j);
		if i<j
		then	begin
			swapn(count[i],count[j]);
			swaps(s0[i],s0[j]);
			end
		else	break;
		end;
	if j>l then qsort(l,j);
	if j+1<r then qsort(j+1,r);
	end;
Begin
	assign(input,'contact.in');
	assign(output,'contact.out');
	reset(input);
	rewrite(output);
	readln(a,b,m);
	s:='';
	while not eof do
		begin
		readln(ss);
		s:=s+ss;
		end;
	fillchar(count,sizeof(count),0);
	for i:=1 to length(s) do
		begin
		k:=i;
		t:=1;
		while (k>=1)and(i-k+1<=b) do
			begin
			t:=t shl 1;
			if s[k]='1' then inc(t);
			inc(count[t]);
			dec(k);
			end;
		end;
	//fillchar(s0,sizeof(s0),'');
	st:=1 shl a;
	en:=1 shl (b+1)-1;
	n:=0;
	for i:=st to en do
	if count[i]>0 then
		begin
		inc(n);
		count[n]:=count[i];
		k:=i;
		while k>1 do
			begin
			if k and 1=0
				then s0[n]:=s0[n]+'0'
				else s0[n]:=s0[n]+'1';
			k:=k shr 1;
			end;
		end;
	randomize;
	qsort(1,n);
	j:=1;
	while (m>=1)and(j<=n) do
		begin
		writeln(count[j]);
		t:=0;
		repeat
			if (t mod 6=0)and(t>0) then writeln;
			if (t mod 6=5)or(count[j]<>count[j+1])
			then	write(s0[j])
			else	write(s0[j],' ');
			inc(j);
			inc(t);
		until (j>n)or(count[j]<>count[j-1]);
		writeln;
		dec(m);
		end;
	close(input);
	close(output);
End.
