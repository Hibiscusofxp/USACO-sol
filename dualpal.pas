{
ID:peng921
PROG:dualpal
LANG:PASCAL
}
var
	n,s,dep,j		:longint;
function dual(s:string):boolean;
	var
	i,l		:longint;
	begin
	l:=length(s);
	for i:=1 to l div 2 do
		if s[i]<>s[l+1-i] then exit(false);
	exit(true);
	end;
function check(n:longint):boolean;
	var
		k,p,m		:longint;
		s		:string;
	begin
		k:=0;
		p:=2;
                repeat
			s:='';
			m:=n;
			while m>0 do
				begin
				s:=chr(ord('0')+m mod p)+s;
				m:=m div p;
				end;
			if dual(s) then inc(k);
			inc(p);
		until (p>10)or(k=2);
		exit(k=2);
	end;
begin
	assign(input,'dualpal.in');
	assign(output,'dualpal.out');
	reset(input);
	rewrite(output);
	readln(n,s);
	dep:=0;
        j:=s;
	repeat
		inc(j);
		if check(j) then
			begin
			writeln(j);
			inc(dep);
			end;
	until dep=n;		
	close(input);
	close(output);
end.
