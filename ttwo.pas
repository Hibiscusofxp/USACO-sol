{
ID:peng921
PROG:ttwo
LANG:PASCAL
}
const
	n		=10;
	limit		=400*400+7;
        dx              :array[1..4]of shortint=(1,0,-1,0);
	dy		:array[1..4]of shortint=(0,1,0,-1);
var
	map		:array[0..n+1,0..n+1]of boolean;
	a		:array[1..2]of record
					x,y,t:longint;
					end;
	ch		:char;
	i,j		:longint;
procedure move(k:longint);
	var
	x0,y0		:longint;
	begin
	x0:=a[k].x+dx[a[k].t];
	y0:=a[k].y+dy[a[k].t];
	if map[x0,y0]
	then	begin
		a[k].x:=x0;
		a[k].y:=y0;
		end
	else a[k].t:=a[k].t mod 4+1;
	end;
begin
	assign(input,'ttwo.in');
	assign(output,'ttwo.out');
	reset(input);
	rewrite(output);
	fillchar(map,sizeof(map),false);
	for i:=n downto 1 do
		begin
		for j:=1 to n do
			begin
			read(ch);
			if ch='*' then map[i,j]:=false
				else map[i,j]:=true;
			case ch of
			'C':begin
				a[1].x:=i;
				a[1].y:=j;
				a[1].t:=1;
				end;
			'F':begin
				a[2].x:=i;
				a[2].y:=j;
				a[2].t:=1;
				end;
			end;
			end;
		readln;
		end;
	for i:=1 to limit do
	begin
	move(1);
	move(2);
	if (a[1].x=a[2].x)and(a[1].y=a[2].y) then break;
	end;
	if i<limit then writeln(i)
		else writeln(0);
	close(input);
	close(output);
end.
