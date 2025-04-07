CREATE TABLE schools (
  id TEXT PRIMARY KEY,
  name TEXT
);

CREATE TABLE courses (
  id TEXT PRIMARY KEY,
  name TEXT,
  price NUMERIC,
  school_id TEXT REFERENCES schools(id)
);

CREATE TABLE students (
  id INT PRIMARY KEY,
  name TEXT,
  enrolled_at DATE,
  course_id TEXT REFERENCES courses(id)
);


