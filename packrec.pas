{
ID:peng921
PROG:packrec
LANG:PASCAL
}
const
	inf		=1000;
var
	w,h		:array[1..4]of longint;
	m		:array[1..100]of longint;
	f		:array[1..inf]of boolean;
	maxs,t,i1,i2,i3,i4,r1,r2,r3,r4,w0,h0:longint;
function max2(a,b:longint):longint;
	begin
	if a>b then exit(a) else exit(b);
	end;
function max3(a,b,c:longint):longint;
	begin
	exit(max2( max2(a,b),c));
	end;
function max4(a,b,c,d:longint):longint;
	begin
	exit(max2( max3(a,b,c),d));
	end;
procedure swap(var a,b:longint);
	var
	t		:longint;
	begin
	t:=a;
	a:=b;
	b:=t;
	end;
procedure check;
	var
	min		:longint;
	begin
	if w0*h0>maxs then exit;
	if w0<h0
		then min:=w0
		else min:=h0;
	if (w0*h0=maxs)
	then
		begin
		if f[min] then
			begin
			inc(t);
			m[t]:=min;
			f[min]:=false;
			end
		end
	else
		begin
		maxs:=w0*h0;
		fillchar(f,sizeof(f),true);
		t:=1;
		m[1]:=min;
		f[min]:=false;
		end;
	end;
procedure doit(n1,n2,n3,n4:longint);
	begin
	w0:=w[n1]+w[n2]+w[n3]+w[n4];
	h0:=max4(h[n1],h[n2],h[n3],h[n4]);
	check;

	w0:=max2(w[n1]+w[n2]+w[n3],w[n4]);
	h0:=max3(h[n1],h[n2],h[n3])+h[n4];
	check;

	w0:=max2(w[n1]+w[n2],w[n3])+w[n4];
	h0:=max3(h[n1]+h[n3],h[n2]+h[n3],h[n4]);
	check;

	w0:=w[n1]+w[n2]+max2(w[n3],w[n4]);
	h0:=max3(h[n1],h[n2],h[n3]+h[n4]);
	check;

	h0:=max2(h[n1]+h[n3],h[n2]+h[n4]);
	if (h[n3]>=h[n2]+h[n4]) then
		w0:=max3(w[n1],w[n3]+w[n2],w[n3]+w[n4]);
	
	if (h[n3]>h[n4])and(h[n3]<h[n2]+h[n4]) then
		w0:=max3(w[n1]+w[n2],w[n3]+w[n2],w[n3]+w[n4]);

	if (h[n4]>h[n3])and(h[n4]<h[n1]+h[n3]) then
		w0:=max3(w[n1]+w[n2],w[n1]+w[n4],w[n3]+w[n4]);
	
	if (h[n4]>=h[n1]+h[n3]) then
		w0:=max3(w[n2],w[n4]+w[n1],w[n3]+w[n4]);
	
	if h[n3]=h[n4] then
		w0:=max2(w[n1]+w[n2],w[n3]+w[n4]);
	check;
	end;
		
begin
	assign(input,'packrec.in');
	assign(output,'packrec.out');
	reset(input);
	rewrite(output);
	for i1:=1 to 4 do
		readln(w[i1],h[i1]);
	t:=0;
	maxs:=inf*inf;
	fillchar(f,sizeof(f),true);
	for i1:=1 to 4 do
		for i2:=1 to 4 do
		if (i2<>i1) then
			for i3:=1 to 4 do
			if (i3<>i1)and(i3<>i2) then
				begin
				i4:=10-i1-i2-i3;
				for r1:=1 to 2 do
					begin
					for r2:=1 to 2 do
						begin
						for r3:=1 to 2 do
							begin
							for r4:=1 to 2 do
								begin
								doit(i1,i2,i3,i4);
								swap(w[i4],h[i4]);
								end;
							swap(w[i3],h[i3]);
							end;
						swap(w[i2],h[i2]);
						end;
					swap(w[i1],h[i1]);
					end;
				end;
	writeln(maxs);
	for i1:=1 to t-1 do
		begin
		i4:=i1;
		for i2:=i1+1 to t do
			if m[i4]>m[i2] then
				i4:=i2;
		swap(m[i1],m[i4]);
		end;
	for i1:=1 to t do
		writeln(m[i1],' ',maxs div m[i1]);
	close(input);
	close(output);
end.