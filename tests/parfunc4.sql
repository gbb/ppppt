create or replace function partest() 
returns int as $$ 
declare n int; a int;
begin 
for n in 1..10000 loop
a:=n;
end loop;
return 1; 
end;
$$ language plpgsql;

