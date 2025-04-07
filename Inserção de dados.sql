
INSERT INTO schools (id, name) VALUES
('s1', 'Escola de Dados'),
('s2', 'Sistemas de informação');


INSERT INTO courses (id, name, price, school_id) VALUES
('c1', 'Data Science', 1000, 's1'),
('c2', 'Data Analysis', 800, 's1'),
('c3', 'Web Development', 900, 's2');


INSERT INTO students (id, name, enrolled_at, course_id) VALUES
(1, 'Ana', '2024-01-01', 'c1'),
(2, 'João', '2024-01-01', 'c2'),
(3, 'Carlos', '2024-01-02', 'c1'),
(4, 'Lívia', '2024-01-02', 'c3'),
(5, 'Beatriz', '2024-01-03', 'c2'),
(6, 'Rafael', '2024-01-05', 'c1'),
(7, 'Sofia', '2024-01-06', 'c1'),
(8, 'Tiago', '2024-01-07', 'c2'),
(9, 'Lucas', '2024-01-07', 'c2');
