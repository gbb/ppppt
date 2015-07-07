create or replace function partest(startvalue numeric)
returns int as $$ 
declare n numeric;
begin 
return 1; 
end;
$$ language plpgsql;

