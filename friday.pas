{
ID:peng921
PROG:friday
LANG:PASCAL
}
const
	month		:array[1..12]of integer=(31,31,28,31,30,31,30,31,31,30,31,30);
var
	f		:array[0..6]of longint;
	day,i,j,n       :longint;
begin
	assign(input,'friday.in');
	assign(output,'friday.out');
	reset(input);
	rewrite(output);
	readln(n);
	fillchar(f,sizeof(f),0);
        day:=3;
	for i:=1900 to 1900+n-1 do
	for j:=1 to 12 do
		begin
		inc(day,month[j]);
		if (j=3)and( (i mod 4=0)and(i mod 100<>0) or (i mod 400=0) )
			then inc(day);
		day:=day mod 7;
		inc(f[day]);
		end;
	for i:=6 to 11 do
		write(f[i mod 7],' ');
        writeln(f[5]);
	close(input);
	close(output);
end.
