{
ID:peng921
PROG:preface
LANG:PASCAL
}
const
	d		:array[1..14]of integer=(1000,900,500,400,100,90,50,40,10,9,5,4,1,0);
	s		:array[1..13]of string[2]=('M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I');
	list		='IVXLCDM';
var
	num		:array['C'..'X']of longint;
	n,i,j,k,l	:longint;
begin
	assign(input,'preface.in');
	assign(output,'preface.out');
	reset(input);
	rewrite(output);
	readln(n);
	fillchar(num,sizeof(num),0);
	for i:=1 to n do
		begin
		k:=i;
		j:=1;
		repeat
			while k<d[j] do inc(j);
			for l:=1 to length(s[j]) do
				inc(num[ s[j,l]]);
			dec(k,d[j]);
		until k=0;
		end;
	for i:=1 to 7 do
		if num[list[i]]>0 then
			writeln(list[i],' ',num[list[i]]);
	close(input);
	close(output);
end.
