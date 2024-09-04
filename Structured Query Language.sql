DROP DATABASE IF EXISTS e_commerce_db;

CREATE DATABASE e_commerce_db;

USE e_commerce_db;
CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO Members (id, name, age) VALUES
(1, 'Zachary Landers', 30),
(2, 'Jacob Neil', 25),
(3, 'Gage Canterbury', 35);  -- Corrected the name

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) VALUES
(1, 1, '2024-09-01', '08:00 AM', 'Cardio'),  
(2, 2, '2024-09-01', '10:00 AM', 'Weightlifting'),  
(3, 3, '2024-09-01', '11:15 AM', 'Basketball'),  
(4, 1, '2024-09-02', '09:30 AM', 'Gym');  

SELECT id FROM Members WHERE name = 'Jacob Neil';

UPDATE WorkoutSessions
SET session_time = '06:00 PM'
WHERE member_id = 2 AND session_time = '10:00 AM';
DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jacob Neil');
DELETE FROM Members
WHERE name = 'Jacob Neil';
