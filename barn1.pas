{
ID:peng921
PROG:barn1
LANG:PASCAL
}
var
	d		:array[1..207]of longint;
	m,s,n,i,j,size,ans:longint;
procedure swap(var a,b:longint);
        var
        t               :longint;
        begin
        t:=a;
        a:=b;
        b:=t;
        end;
procedure mincheck(t:longint);
	var
	k,r,l		:longint;
	begin
	while t<=size shr 1 do
		begin
		k:=t;
		l:=k*2;
		r:=l+1;
		if (l<=size)and(d[k]>d[l])
			then k:=l;
		if (r<=size)and(d[k]>d[r])
			then k:=r;
		if k<>t
		then
			begin
			swap(d[k],d[t]);
			t:=k;
			end
		else break;
		end;
	end;
begin
	assign(input,'barn1.in');
	assign(output,'barn1.out');
	reset(input);
	rewrite(output);
	readln(m,s,n);
	if m>=n then
		begin
		writeln(n);
		close(input);
		close(output);
		halt;
		end;
	for i:=1 to n do
		readln(d[i]);
	for i:=1 to n-1 do
	for j:=i+1 to n do
		if d[i]>d[j] then swap(d[i],d[j]);
	for i:=1 to n-1 do
		d[i]:=d[i+1]-d[i];
	size:=n-1;
	for i:=n shr 1 downto 1 do
		mincheck(i);
	ans:=0;
	while size>m-1 do
		begin
		inc(ans,d[1]);
		d[1]:=d[size];
		mincheck(1);
		dec(size);
		end;
	writeln(ans+m);
	close(input);
	close(output);
end.
