-- Function

-- Функція повертає таблицю
-- де в першому стовпчику вказано тип смерті,
-- а в другому - кількість людей,
-- що загинули такою смертю

select * from people

select * from people_count('United States', '1500-01-01')

-- Procedure

-- Процедура повертає таблицю,
-- де в першому стовпчику вказано країну,
-- а в другому - кількість живих людей, що внесені в базу
-- Виводиться построково

select * from people

call stayin_alive()

-- Trigger

-- Тригер спрацьовує при внесенні нових людей в базу та
-- змінює ФІО так, що перша літера буде у верхньому регістрі, а інші у нижньому

select * from people

insert into People (passport, id_country, sex, f_name, l_name, m_name, d_birth, d_death, type_death)
values
(00782678, 95, 1 , 'maria', 'MAGdaLenA', 'sandrOVANA', CURRENT_DATE, null, null);

select * from people
