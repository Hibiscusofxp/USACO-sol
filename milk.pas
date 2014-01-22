{
ID:peng921
PROG:milk
LANG:PASCAL
}
type
	arr		=array[1..5007]of longint;
var
	a,b		:arr;
	s,n,i,s0,money	:longint;
procedure swap(var a,b:longint);
	var
	k		:longint;
	begin
	k:=a;
	a:=b;
	b:=k;
	end;
procedure qsort(var a:arr;l,r:longint);
	var
	k,i,j		:longint;
  	begin
	if l>=r then exit;
	k:=a[random(r-l+1)+l];
	i:=l-1;
	j:=r+1;
	repeat
		repeat inc(i) until a[i]>=k;
		repeat dec(j) until a[j]<=k;
		if i<j then
			begin
			swap(a[i],a[j]);
			swap(b[i],b[j]);
			end;
	until i>=j;
	qsort(a,l,j);
	qsort(a,j+1,r);
	end;
begin
	assign(input,'milk.in');
	assign(output,'milk.out');
	reset(input);
	rewrite(output);
	readln(s,n);
	for i:=1 to n do
		readln(a[i],b[i]);
	randomize;
	qsort(a,1,n);
	s0:=0;
	money:=0;
	for i:=1 to n do
		if s0+b[i]>=s
		then
			begin
			inc(money,(s-s0)*a[i]);
			break;
			end
		else
			begin
                        inc(money,b[i]*a[i]);
                        inc(s0,b[i]);
                        end;
	writeln(money);
	close(input);
	close(output);
end.
