SELECT *
FROM student s 
WHERE first_name LIKE "А%"

--Студенты с фамилией на "Иван" --
--Выведите id, last_name, first_name и email студентов, чья фамилия начинается с букв Иван.--

SELECT id AS id, s.last_name AS "Фамилия", s.first_name AS 'Имя', s.email AS "Электронная почта"
FROM student s 
WHERE last_name LIKE "Иван%"

--Курсы с предлогом "для" в названии--
--Найдите id, name и duration курсов, в названии которых встречается слово для.--

SELECT id, c.name, c.duration 
FROM course c  
WHERE c.name  LIKE "%для%"

--Студенты с почтой на популярных доменах--
--Выведите id, last_name и email студентов, чей email заканчивается на @mail.ru или @yandex.ru.--

SELECT id, s.last_name, s.email  
FROM student s  
WHERE s.email  LIKE "%@mail.ru" OR s.email  LIKE "%@yandex.ru"

--Заявки с номером из серии "001"--
--Выберите id, number и total_amount заявок, номер которых начинается с APP-2025-001.--

SELECT id, a.number, a.total_amount 
FROM application a
WHERE a.number LIKE '%APP-2025-001'

--Файлы с расширением PDF--
--Найдите id, name, tipe_file и size файлов, у которых в поле tipe_file содержится подстрока pdf.--

SELECT id, f.name, f.tipe_file, f."size" 
FROM file f 
WHERE f.tipe_file LIKE '%pdf%'

--Уроки с "данных" в заголовке
--Выведите id, title и lesson_type уроков, в заголовке которых встречается слово данных.

SELECT id, l.title, l.lesson_type 
FROM lesson l 
WHERE l.title LIKE '%данных%'

--Студенты из городов на букву "М"
--Найдите id, last_name и city студентов, город проживания которых начинается на М.

SELECT id, s.last_name, s.city 
FROM student s 
WHERE city LIKE 'М%'

--Промокоды с префиксом "SUMMER" или "VIP"
--Выберите id, code и discount_value промокодов, код которых начинается с SUMMER или VIP.

SELECT id, pc.code, pc.discount_value 
FROM promo_code pc 
WHERE pc.code  LIKE 'SUMMER%' OR pc.code  LIKE 'VIP%'

--Уведомления с "Email" в названии
--Выведите id, name и template_text уведомлений, в названии которых есть подстрока Email.

SELECT id, n.name, n.template_text 
FROM notification n  
WHERE n.name  LIKE '%Email%'

--Платежи, оплаченные картой
--Найдите id, payment_number и paid_amount платежей, у которых payment_metod равен card.

SELECT id, p.payment_number, p.paid_amount 
FROM payment p   
WHERE p.payment_metod LIKE '%card%'

--DISTINCT
--Выведите список всех уникальных городов, из которых родом студенты. Используйте таблицу student.

SELECT DISTINCT s.city 
FROM student s 
ORDER BY city ASC

--Получите перечень всех уникальных типов уроков (lesson_type), которые используются в курсе. Таблица: lesson.

SELECT DISTINCT l.lesson_type  
From lesson l 

--Найдите все уникальные способы оплаты (payment_metod), которые встречались в истории платежей. Таблица: payment.

SELECT DISTINCT p.payment_metod  
FROM payment p 

--Выведите уникальные значения поля discount_type из таблицы promo_code, чтобы понять, какие механики скидок используются в проекте.

SELECT DISTINCT discount_type 
FROM promo_code pc 

--Получите список всех уникальных каналов (channel), через которые отправлялись уведомления студентам. Таблица: student_notification.

SELECT DISTINCT sn.channel 
FROM student_notification sn 

--выведите уникальные города только для активных студентов (is_active = 1)

SELECT DISTINCT s.city 
FROM student s 
WHERE is_active=1
ORDER BY city ASC

--Выведите id, last_name, first_name и city студентов, которые активны (is_active = 1) И проживают в Москве.

SELECT id, s.last_name, s.first_name, s.city 
FROM student s 
WHERE is_active=1 AND city="Москва"

--Найдите id, name и duration курсов, длительность которых менее 30 часов ИЛИ которые относятся к категории с category_id = 10 (Мобильная фотография).

SELECT id, c.name, c.duration 
FROM course c 
WHERE c.duration<30 OR c.category_id=10

--Выведите id, last_name и city студентов, которые проживают НЕ в Москве И НЕ в Санкт-Петербурге.

SELECT id, s.last_name, s.city 
FROM student s 
WHERE NOT (city="Москва" OR city="Санкт-Петербург")

SELECT id, s.last_name, s.city 
FROM student s 
WHERE city NOT IN ("Москва","Санкт-Петербург")

--Получите id, surname и position сотрудников, у которых role_id = 1 (преподаватель) И статус is_active = 1.

SELECT id, e.surname, e.position 
FROM employee e 
WHERE e.role_id=1 AND e.is_active=1

--Выберите id, number и discount_amount заявок, у которых заполнен промокод (promo_code IS NOT NULL) ИЛИ скидка превышает 3000 рублей.

SELECT id, number,a.discount_amount 
FROM application a 
WHERE a.promo_code IS NOT NULL OR a.discount_amount > 3000

--Найдите id, name и tipe_file файлов, тип которых НЕ mp4 И НЕ png.

SELECT id, name, f.tipe_file 
FROM file f 
WHERE NOT (f.tipe_file='mp4' OR f.tipe_file='png')

--Выведите id, title и webinar_url уроков, у которых тип lesson_type = 'webinar' И заполнено поле webinar_url.

SELECT id, l.title, l.webinar_url
FROM lesson l 
WHERE l.lesson_type="webinar" AND l.webinar_url IS NOT NULL

--Получите id, last_name, city и is_loyalty студентов, у которых включена лояльность (is_loyalty = 1) ИЛИ город начинается на букву К.

SELECT  id, s.last_name, s.city, s.is_loyalty
FROM student s 
WHERE is_loyalty=1 OR s.city LIKE 'Е%'

--Найдите id, payment_number и payment_metod платежей, у которых state_id равен 4 (in_progress) ИЛИ 6 (cancelled), НО способ оплаты НЕ crypto.

SELECT id, p.payment_number, p.payment_metod
FROM payment p 
WHERE (p.state_id=4 OR p.state_id=6) AND payment_metod !="crypto"

--Выведите id, surname, first_name и position сотрудников, которые не уволены.

SELECT e.id, e.surname,e.first_name, e.position 
FROM employee e 
WHERE e.terminated_at IS NULL

--Найдите id, name и created_at курсов, которые ни разу не обновлялись после создания.

SELECT id, c.name, c.created_at 
FROM course c 
WHERE c.updated_at IS NULL

--Выведите id, name и tipe_file файлов, которые не привязаны к урокам, а относятся к домашним заданиям.

SELECT id, f.name, f.tipe_file  
FROM file f 
WHERE f.lesson_id IS NULL 

SELECT id, f.name, f.tipe_file  
FROM file f 
WHERE f.homework_id  IS NOT NULL 

--Выберите id, number и total_amount заявок, при оформлении которых не был применён промокод.

SELECT a.id, a.number, a.total_amount 
FROM application a 
WHERE a.promo_code IS NULL

--Получите id, payment_number и paid_amount платежей, у которых указана дата фактической оплаты (платёж прошёл, не в статусе ожидания или рассрочки).

SELECT p.id, p.payment_number, p.paid_amount 
FROM payment p 
WHERE p.paid_at IS NOT NULL

--Выведите id, name и duration курсов, длительность которых составляет от 30 до 60 часов включительно.

SELECT c.id, c.name, c.duration 
FROM course c 
WHERE c.duration BETWEEN 30 AND 60

--Найдите id, payment_number и paid_amount платежей, сумма оплаты которых находится в диапазоне от 5 000 до 15 000 рублей включительно.

SELECT p.id, p.payment_number, p.paid_amount
FROM payment p 
WHERE p.paid_amount BETWEEN 5000 AND 15000

--Выведите id, last_name и last_login_at студентов, чей последний вход в систему произошёл с 10 по 13 ноября 2025 года включительно.

SELECT s.id, s.last_name, s.last_login_at 
FROM student s 
WHERE last_login_at BETWEEN '2025-11-10 00:00:00' AND '2025-11-13 23:59:59'

SELECT s.id, s.last_name, s.last_login_at 
FROM student s 
WHERE last_login_at BETWEEN '2025-11-10' AND '2025-11-14'

--Выведите id, last_name, first_name и last_login_at всех студентов, отсортированных по дате последнего входа в систему от самой новой к самой старой.

SELECT s.id, s.last_name, s.first_name, s.last_login_at 
FROM student s 
ORDER BY s.last_login_at DESC

--Получите список id, name и duration курсов, отсортированный по длительности обучения от кратчайшего курса к самому длинному.

SELECT c.id, c.name, c.duration 
FROM course c 
ORDER BY c.duration ASC

--Выведите id, name и size файлов, отсортированных по размеру файла в порядке убывания (от самых тяжёлых к самым лёгким).

SELECT f.id, f.name, f.size
FROM file f 
ORDER BY f.size DESC

--Выведите id, last_name и city студентов, которые проживают в Москве, Казани или Краснодаре.

SELECT s.id,s.last_name, city
FROM student s 
WHERE city IN ('Москва', 'Казань', 'Краснодар')

--Найдите id, name и category_id курсов, относящихся к категориям с id 1 (Веб-разработка), 2 (Машинное обучение) или 10 (Мобильная фотография).

SELECT c.id, c.name, c.category_id 
FROM course c 
WHERE c.category_id IN ("1", "2", "10")

--Выберите id, payment_number и paid_amount платежей, где способ оплаты (payment_metod) равен card или sbp. Исключите крипто-платежи.

SELECT p.id, p.payment_number, p.paid_amount 
FROM payment p 
WHERE p.payment_metod IN ('card', 'sbp')

--Выведите пол (gender) и количество студентов для каждой группы.

SELECT s.gender, COUNT (s.id) AS "Количество"
FROM student s 
GROUP BY gender

--Найдите способ оплаты (payment_metod) и среднюю сумму платежа для каждого способа.

SELECT p.payment_metod, AVG(p.paid_amount) AS "Средняя сумма платежа"
FROM payment p 
GROUP BY p.payment_metod 

--Выведите тип урока (lesson_type) и общее количество уроков для каждого формата.

SELECT l.lesson_type, COUNT(l.id) AS "Общее кол-во уроков"
FROM lesson l 
GROUP BY l.lesson_type 

--Выведите id, last_name и first_name студентов, отсортированных по фамилии в алфавитном порядке. Верните только первые 3 записи.

SELECT s.id, s.last_name, s.first_name
FROM student s 
ORDER BY s.last_name ASC
LIMIT 3 

--Получите id, payment_number и paid_amount платежей, отсортированных по id. Пропустите первые 3 записи и выведите следующие 3 (эмуляция второй страницы пагинации с размером 3).

SELECT p.id, p.payment_number, p.paid_amount 
FROM payment p 
ORDER BY id ASC 
LIMIT 3 OFFSET 3

--Выведите id, name и duration курсов, отсортированных по длительности обучения по убыванию. Ограничьте выборку 2 записями.

SELECT c.id, c.name, c.duration 
FROM course c 
ORDER BY c.duration DESC
LIMIT 2

--Выведите id, name и size файлов, отсортированных по имени файла (name) по возрастанию. Пропустите первые 3 файла и верните ровно 2 следующих.

SELECT id, name, size
FROM file
ORDER BY name ASC
LIMIT 2 OFFSET 3

--Выведите способ оплаты (payment_metod) и количество его использований. Оставьте только те способы, которые были применены более 2 раз.

SELECT p.payment_metod, COUNT(p.id) AS "Кол-во использований"
FROM payment p 
GROUP BY p.payment_metod 
HAVING COUNT(p.id)>2

--Найдите course_id и среднюю оценку по курсам. Отберите только те курсы, у которых средний рейтинг не менее 4.0.

SELECT cr.course_id, AVG(cr.rating) AS "Средний рейтинг"
FROM course_review cr  
GROUP BY course_id
HAVING AVG(cr.rating)>=4

--Выведите тип файла (tipe_file) и общее количество файлов этого типа. Оставьте только те форматы, которые встречаются в системе 2 раза или чаще.

SELECT  f.tipe_file, COUNT(id) AS "Кол-во файлов"
FROM file f 
GROUP BY f.tipe_file 
HAVING COUNT(id)>=2

--Выведите фамилию и должность сотрудника (employee), а также название его роли (role), чтобы получить только тех сотрудников, у которых явно назначена роль.

SELECT e.surname, e.position, r.name AS "Роль"
FROM employee e 
INNER JOIN role r ON e.role_id=r.id

--Выведите фамилию и имя студента (student), а также серийный номер выданного ему сертификата (certificate). Используйте LEFT JOIN, чтобы в результат попали все студенты, даже если у них ещё нет сертификата.

SELECT s.last_name, s.first_name, c2.serial_number AS "Серийный номер"
FROM student s 
LEFT JOIN certificate c2 ON s.id=c2.student_id

--Получите название курса (course) и название соответствующей ему категории (category). Используйте INNER JOIN, чтобы отобразить только курсы с назначенной категорией.

SELECT c.name AS "Имя курса" , c2.name AS "Категория" 
FROM course c 
INNER JOIN category c2 ON c.category_id=c2.id 

--Выведите название курса (course) и текст отзыва (review_text) из таблицы course_review. Используйте LEFT JOIN, чтобы список содержал все курсы, независимо от того, оставляли ли по ним отзывы студенты.

SELECT c.name AS "Наименование курса", cr.review_text AS "Текст отзыва"
FROM course c 
LEFT JOIN course_review cr ON c.id=cr.course_id 

--Выведите единый список всех уникальных телефонных номеров, объединив данные из таблиц student и employee. Используйте оператор, который автоматически удалит дубликаты.

SELECT s.phone 
FROM student s 
UNION 
SELECT e.phone 
FROM employee e 

--Выведите все значения поля channel из таблиц student_notification и employee_notification. Сохраните абсолютно все записи, включая повторы, чтобы позже можно было посчитать частоту использования каждого канала.

SELECT sn.channel 
FROM student_notification sn 
UNION ALL
SELECT en.channel 
FROM employee_notification en 

--Составьте список названий всех курсов и модулей в одной колонке. Во второй колонке добавьте текстовую пометку 'Курс' или 'Модуль'. Примените оператор, который уберёт возможные совпадения названий.

SELECT c.name, 'Курс' AS entity_type
FROM course c 
UNION 
SELECT m.name, 'Модуль' AS entity_type
FROM module m 

--Объедините в один столбец суммы из заявок (application.total_amount) и суммы из платежей (payment.paid_amount). Сохраните все записи без фильтрации дубликатов для последующей агрегации в BI-отчётах.

SELECT a.total_amount
FROM application a 
UNION ALL
SELECT p.paid_amount
FROM payment p  