SELECT
  schools.name AS school_name,
  students.enrolled_at::date AS enrollment_date,
  COUNT(students.id) AS total_students,
  SUM(courses.price) AS total_amount
FROM students
JOIN courses ON students.course_id = courses.id
JOIN schools ON courses.school_id = schools.id
WHERE courses.name ILIKE 'data%'
GROUP BY schools.name, students.enrolled_at
ORDER BY students.enrolled_at DESC;

WITH daily_data AS (
  SELECT
    schools.name AS school_name,
    students.enrolled_at::date AS enrollment_date,
    COUNT(students.id) AS total_students
  FROM students
  JOIN courses ON students.course_id = courses.id
  JOIN schools ON courses.school_id = schools.id
  WHERE courses.name ILIKE 'data%'
  GROUP BY schools.name, students.enrolled_at
)

SELECT
  school_name,
  enrollment_date,
  total_students,
  SUM(total_students) OVER (
    PARTITION BY school_name
    ORDER BY enrollment_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_sum,
  AVG(total_students) OVER (
    PARTITION BY school_name
    ORDER BY enrollment_date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS moving_avg_7d,
  AVG(total_students) OVER (
    PARTITION BY school_name
    ORDER BY enrollment_date
    ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
  ) AS moving_avg_30d
FROM daily_data
ORDER BY school_name, enrollment_date;


