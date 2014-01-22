{
ID:peng921
PROG:rect1
LANG:PASCAL
}
Const
	maxl		=10000+7;
	maxn		=1000+7;
	maxc		=2500+7;
Var
	color		:array[1..maxl*5]of integer;
	x1,y1,x2,y2,c	:array[1..maxn]of integer;
	num		:array[1..maxc]of longint;
	s,n,m,k,i,y0	:longint;

Procedure Paint(t,l,r,left,right:longint);
	var
	mid,lch,rch	:longint;
	begin
	if color[t]>0 then exit;
	if (l=left)and(r=right)and(color[t]=0) then
		begin
		color[t]:=1;
		inc(num[c[i]],r-l+1);
		exit;
		end;
	mid:=(l+r) shr 1;
	lch:=t shl 1;
	rch:=lch+1;
	if right<=mid
	then	Paint(lch,l,mid,left,right)
	else	if left>=mid+1
		then	Paint(rch,mid+1,r,left,right)
		else	begin
			Paint(lch,l,mid,left,mid);
			Paint(rch,mid+1,r,mid+1,right);
			end;
	if (color[lch]>0)and(color[rch]>0)
		then color[t]:=1
		else color[t]:=-1;
	end;

Begin
	assign(input,'rect1.in');
	assign(output,'rect1.out');
	reset(input);
	rewrite(output);
	readln(n,m,k);
	for i:=1 to k do
		begin
	readln(x1[i],y1[i],x2[i],y2[i],c[i]);
	inc(x1[i]);
	inc(y1[i]);
	end;
	fillchar(num,sizeof(num),0);
	for y0:=0 to m do
		begin
		fillchar(color,sizeof(color),0);
		for i:=k downto 1 do
		if (y1[i]<=y0)and(y2[i]>=y0) then
			Paint(1,1,n,x1[i],x2[i]);
		end;
	s:=n*m;
	for i:=2 to maxc do
		dec(s,num[i]);
	if s>0 then writeln('1 ',s);
	for i:=2 to maxc do
		if num[i]>0 then
			writeln(i,' ',num[i]);
	close(input);
	close(output);
End.
