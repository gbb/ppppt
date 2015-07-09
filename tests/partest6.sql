-- test of two postgres internal functions, md5 and repeat
select md5(repeat('TestString',10000));

