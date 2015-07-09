create or replace function partest() 
returns int as $$ 
declare int a;
return count(ST_GeomFromText('LINESTRING(-71.160281 42.258729,-71.160837 42.259113,-71.161144 42.25932)',4269));
end;
$$ language plpgsql;


