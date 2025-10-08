
CREATE DATABASE IF NOT EXISTS sql_interview;

USE sql_interview;

CREATE TABLE baby_names (
    Gender VARCHAR(10),
    Name VARCHAR(50),
    Total INT
);

INSERT INTO baby_names (Gender, Name, Total) VALUES
('Girl', 'Ava', 95),
('Girl', 'Emma', 106),
('Boy', 'Ethan', 115),
('Girl', 'Isabella', 100),
('Boy', 'Jacob', 101),
('Boy', 'Liam', 84),
('Boy', 'Logan', 73),
('Boy', 'Noah', 120),
('Girl', 'Olivia', 100),
('Girl', 'Sophia', 88);

SELECT *
FROM baby_names;

-- order by popularity
SELECT *
FROM baby_names
ORDER BY Total DESC;

-- add a popularity column
SELECT Gender, Name, Total, ROW_NUMBER() OVER(ORDER BY Total DESC) as Popularity
FROM baby_names;

-- rank, dense rank
SELECT Gender, Name, Total, 
    ROW_NUMBER() OVER(ORDER BY Total DESC) as Popularity,
    RANK() OVER(ORDER BY Total DESC) as pop_r,
    DENSE_RANK() OVER(ORDER BY Total DESC) as pop_dr
FROM baby_names;

