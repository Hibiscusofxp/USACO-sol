{
ID:peng921
PROG:prefix
LANG:PASCAL
}
const
	single		=500107;
	maxn		=200000+7;
var
	s,s0		:ansistring;
	d		:array[1..10]of longint;
	ss		:array[1..10]of char;
	f		:array[1..maxn]of longint;
	hash		:array[0..single]of boolean;
	ch		:char;
	l,i,j,n,limit,t	:longint;
begin
	assign(input,'prefix.in');
	assign(output,'prefix.out');
	reset(input);
	rewrite(output);
	fillchar(hash,sizeof(hash),false);
	l:=0;
	j:=0;
	repeat
		read(ch);
		if (ch<>'.')and ((ch=' ')or eoln)
		then
			begin
			if eoln then
				begin
				inc(j);
				ss[j]:=ch;
				readln;
				end;
			t:=0;
			if j>l then l:=j;
			for i:=1 to j do
				t:=( ord(ss[i])-ord('A')+1+ t*27) mod single;
			hash[t]:=true;
			j:=0;
			end
		else
			begin
			inc(j);
			ss[j]:=ch;
			end;
	until ch='.';
	readln;
	s:='';
	repeat
		readln(s0);
		s:=s+s0;
	until eof;
	n:=length(s);
	fillchar(f,sizeof(f),0);
	for i:=n downto 1 do
                begin
		if i+l-1>n
			then limit:=n
			else limit:=i+l-1;
		t:=0;
		for j:=i to limit do
			begin
			t:=(t*27+ ord(s[j])-ord('A')+1) mod single;
			if hash[t] and (f[i]<f[j+1]+j-i+1) then
				f[i]:=f[j+1]+j-i+1;
			end;
                end;
	writeln(f[1]);
	close(input);
	close(output);
end.
