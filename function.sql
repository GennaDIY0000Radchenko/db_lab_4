DROP FUNCTION IF EXISTS people_count(country_name character(30), from_date date);

CREATE OR REPLACE FUNCTION people_count(country_name character(30), from_date date)
RETURNS TABLE (death_type character(100), count bigint)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT coalesce(type_death.definition, 'Other'), count(passport)
		FROM people
		left join country ON country.id_country = people.id_country
		left join type_death ON type_death.type_death = people.type_death
		where country.name_country = country_name and coalesce(people.d_death, from_date) >= from_date
		group by type_death.definition;
END;
$$

select * from people_count('United States', '1500-01-01')