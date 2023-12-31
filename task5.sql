/**

Задание 5

Выведите таблицу со средним возрастом студентов во всех группах (Группа, Средний возраст),
где средний возраст равен максимальному возрасту в группе 1100.

*/

select Н_УЧЕНИКИ.ГРУППА as "Группа",
       avg(age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ)) as "Средний возраст"
from Н_УЧЕНИКИ
join Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
group by Н_УЧЕНИКИ.ГРУППА
having avg(age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ)) = (
  select max(age(Н_ЛЮДИ.ДАТА_РОЖДЕНИЯ))
  from Н_УЧЕНИКИ
  join Н_ЛЮДИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
  where Н_УЧЕНИКИ.ГРУППА = '1100'
);
