Предполагаемый список сущностей и примерные атрибуты:

1) User:
id (pk);
username (not null);
password (захешированный, not null);
first_name;
second_name;
ROLE (домен: админ (который производит манипуляции над тестами) или простой пользователь (который проходит тесты))

2) Test:
id (pk);
description;

3) Question:
id (pk);
text (not null);
correct_answer (not null);
test_id (fk);

4) Score:
id (pk);
user_id (fk);
test_id (fk);
points (not null)
