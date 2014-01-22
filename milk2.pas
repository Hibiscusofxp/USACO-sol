{
ID:peng921
PROG:milk2
LANG:PASCAL
}
type
	arr		=array[1..5001]of longint;
var
	a,b		:arr;
	i,n,work,rest,p,q,t:longint;
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
function getmax(var a,b:longint):longint;
        begin
        if a>b then exit(a)
                else exit(b);
        end;
begin
	assign(input,'milk2.in');
	assign(output,'milk2.out');
	reset(input);
	rewrite(output);
        readln(n);
	for i:=1 to n do
		readln(a[i],b[i]);
	qsort(a,1,n);
	work:=0;
	rest:=0;
	p:=a[1];
	q:=b[1];
	for i:=2 to n do
		begin
		if a[i]>q
		then
			begin
                        t:=q-p;
                        work:=getmax(work,t);
                        t:=a[i]-q;
                        rest:=getmax(rest,t);
			p:=a[i];
			end;
		q:=getmax(q,b[i]);
		end;
	if q-p>work then work:=q-p;
	writeln(work,' ',rest);
	close(input);
	close(output);
end.
