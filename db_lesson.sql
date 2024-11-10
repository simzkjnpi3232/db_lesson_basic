-- q1
CREATE TABLE
  `departments`(
  department_id INT unsigned AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );

-- q2
ALTER TABLE
  people
ADD
  department_id
INT
  unsigned
AFTER
  email;


-- q3
INSERT INTO
  departments (name)
VALUES
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUES
  ('Aさん', 'a@gizumo.jp', '1', '20', '1'),
  ('Bさん', 'b@gizumo.jp', '1', '24', '2'),
  ('Cさん', 'c@gizumo.jp', '1', '28', '1'),
  ('Dさん', 'd@gizumo.jp', '2', '32', '2'),
  ('Eさん', 'e@gizumo.jp', '2', '36', '1'),
  ('Fさん', 'f@gizumo.jp', '2', '40', '2'),
  ('Gさん', 'g@gizumo.jp', '2', '44', '1'),
  ('Hさん', 'h@gizumo.jp', '3', '48', '2'),
  ('Iさん', 'i@gizumo.jp', '4', '52', '1'),
  ('Jさん', 'j@gizumo.jp', '5', '56', '2');

INSERT INTO reports (person_id, content)
VALUES
  ('12', '〇〇社との契約が成立しました。'),
  ('13', '〇〇社との商談が成立しました。'),
  ('14', '明日は〇〇社との商談に行きます。'),
  ('15', '新アプリの開発を始めました。'),
  ('16', '新システムを導入しました。'),
  ('17', 'システムに問題が発生しました。'),
  ('18', 'システムの問題を解決しました。'),
  ('19', '年末調整の手続きが終わりました。'),
  ('20', '12月から新入社員が入ります。'),
  ('21', '新システムをリリースします。');

-- q4
UPDATE
  people
SET
  department_id = '1'
WHERE
  person_id <= 6;

-- q5
SELECT
  name, age
FROM
  people
WHERE
  gender = 1
ORDER BY
  age DESC;

-- q6
peopleテーブルから`department_id` = 1に合致する`name`, `email`, `age`カラムをレコードの作成日時の昇順でレコードを取得する。

-- q7
SELECT
  name
FROM
  people
WHERE
  gender = '2' AND age BETWEEN 20 AND 29
OR
  gender = '1' AND age BETWEEN 40 AND 49;

-- q8

SELECT
  *
FROM
  people
WHERE
  department_id = '1'
ORDER BY
  age;

-- q9
SELECT
  AVG(age) AS average_age
FROM
  people
WHERE
  department_id = '2' AND gender = '2';

-- q10
SELECT
  p.department_id, p.name, r.content
FROM
  people p
JOIN
  reports r
USING
  (person_id);

-- q11
SELECT
  p.name
FROM
  people p
LEFT OUTER JOIN
  reports r
USING
  (person_id)
WHERE
  content
IS
  NULL;