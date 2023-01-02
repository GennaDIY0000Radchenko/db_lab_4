CREATE OR REPLACE FUNCTION first_upper_function() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
	 	  UPDATE People 
          SET f_name = upper(substring(f_name, 1, 1)) || lower(substring(f_name, 2, 100)) WHERE People.passport = NEW.passport and People.id_country = NEW.id_country;
		  UPDATE People 
          SET l_name = upper(substring(l_name, 1, 1)) || lower(substring(l_name, 2, 100)) WHERE People.passport = NEW.passport and People.id_country = NEW.id_country;
		  UPDATE People 
          SET m_name = upper(substring(m_name, 1, 1)) || lower(substring(m_name, 2, 100)) WHERE People.passport = NEW.passport and People.id_country = NEW.id_country;
		  RETURN NULL;
     END;
$$;


CREATE TRIGGER first_upper_trigger
AFTER INSERT ON People
FOR EACH ROW EXECUTE FUNCTION first_upper_function()