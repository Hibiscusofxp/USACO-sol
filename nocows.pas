{
ID:peng921
PROG:nocows
LANG:PASCAL
}
var
	f		:array[0..200,0..100]of longint;
	n,t,i,i0,j,limitj,k,k0	:longint;
begin
	assign(input,'nocows.in');
	assign(output,'nocows.out');
	reset(input);
	rewrite(output);
	readln(n,t);
	fillchar(f,sizeof(f),0);
	for i:=1 to t do f[1,i]:=1;
	for i:=2 to (n+1) shr 1 do
		begin
		i0:=i*2-1;
		for j:=2 to t do
		for k:=1 to (i0-1) shr 1 do
			begin
			k0:=k*2-1;
			inc(f[i0,j],f[k0,j-1]*f[i0-k0-1,j-1]);
			f[i0,j]:=f[i0,j] mod 9901;
			end;
		end;
	writeln( (f[n,t]+9901-f[n,t-1]) mod 9901 );
	close(input);
	close(output);
end.