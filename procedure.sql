-- Процедура повертає таблицю,
-- де в першому стовпчику вказано країну,
-- а в другому кількість живих людей, що внесені в базу
-- Виводиться построково

DROP PROCEDURE IF EXISTS stayin_alive();

CREATE OR REPLACE PROCEDURE stayin_alive()
LANGUAGE 'plpgsql'
AS $$

DECLARE t_d country.name_country%TYPE;
DECLARE d_c bigint;
DECLARE curs cursor for (
	select country.name_country, count(passport)
	from country
	left join (select * from people where people.d_death is null) as p_a ON country.id_country = p_a.id_country
	group by country.name_country
	order by country.name_country);

BEGIN
	open curs;
	loop
		fetch curs into t_d, d_c;
		exit when not found;
		RAISE INFO 'Country: % | alive: %', t_d, d_c;
	end loop;
END
$$

call stayin_alive()