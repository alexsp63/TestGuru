Предполагаемый список сущностей и примерные атрибуты:

1) User:
id (pk);
username (not null);
password (захешированный, not null);
first_name;
second_name;
ROLE (домен: админ (который производит манипуляции над тестами) или простой пользователь (который проходит тесты));

2) Test:
id (pk);
title;
level;
category_id (fk);

3) Question:
id (pk);
title (not null);
test_id (fk);

<!-- 4) Score:
id (pk);
user_id (fk);
test_id (fk);
points (not null); -->

5) Answer
id (pk);
correct (boolean);
title (not null);
question_id (fk);

6) Category
id (pk);
title (not null)
