create or replace function partest() 
returns int as $$ 
declare n numeric;
begin 
return 1; 
end;
$$ language plpgsql;

