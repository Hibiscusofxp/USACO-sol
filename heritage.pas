{
ID:peng921
PROG:heritage
LANG:PASCAL
}
Var
	s1,s2		:string;
Procedure Doit(ml,mr,fl,fr:Longint);
	var
	j,len		:Longint;
	begin
	if (ml>mr)or(fl>fr) then exit;
	for j:=ml to mr do
		if s1[j]=s2[fl] then break;
	len:=j-ml;
	Doit(ml,ml+len-1,fl+1,fl+len);
	Doit(j+1,mr,fl+len+1,fr);
	write(s2[fl]);
	end;
Begin
	assign(input,'heritage.in');
	assign(output,'heritage.out');
	reset(input);
	rewrite(output);
	readln(s1);
	readln(s2);
	Doit(1,length(s1),1,length(s2));
	writeln;
	close(input);
	close(output);
End.
