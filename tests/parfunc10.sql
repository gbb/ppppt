create or replace function partest() 
returns int as $$ 
begin 
return count(ST_AsPNG(ST_AsRaster(ST_Buffer(ST_Point(1,5),10),1500, 1500, '8BUI')));
end;
$$ language plpgsql;


