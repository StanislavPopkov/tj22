DELETE FROM meals;
DELETE FROM user_roles;
DELETE FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, email, password)
VALUES ('User', 'user@yandex.ru', 'password'),
       ('Admin', 'admin@gmail.com', 'admin');

INSERT INTO user_roles (role, user_id)
VALUES ('USER', 100000),
       ('ADMIN', 100001);

INSERT INTO meals (user_id, date_time, description, calories) VALUES
  ('100000', '2016-06-22 19:11:25-07', 'Завтрак',  '1000'),
  ('100000', '2016-06-23 19:10:25-07', 'Обед',  '1200'),
  ('100000', '2016-06-24 19:10:25-07', 'Ужин',  '800'),
  ('100001', '2016-07-22 19:10:25-07', 'Завтрак',  '500'),
  ('100001', '2016-07-23 19:10:25-07', 'Обед',  '800'),
  ('100001', '2016-07-24 19:15:25-07', 'Ужин',  '700'),
  ('100000', '2016-07-25 18:10:25-07', 'Завтрак',  '1000');
