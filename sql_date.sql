-- Date & Time operations

USE sql_demo;

CREATE TABLE IF NOT EXISTS Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    start_date DATE,
    end_date DATE
);

INSERT INTO Events(event_id, event_name, start_date, end_date) VALUES
(1, 'Tech Conference', '2025-09-28', '2025-09-30'),
(2, 'AI Workshop', '2025-10-01', '2025-10-02'),
(3, 'Music Festival', '2025-11-10', '2025-11-12'),
(4, 'Hackathon', '2025-10-03', '2025-10-05'),
(5, 'Startup Meetup', '2025-09-25', '2025-09-25');

SELECT *
FROM Events;

-- CURRENT_DATE / NOW()
-- Get the current date or timestamp.
SELECT CURRENT_DATE() AS today_date, NOW() AS current_date_time;

-- DATEDIFF()
-- Find the difference between two dates (in days).
SELECT event_name, DATEDIFF(end_date, start_date) as duration
FROM Events;

-- DATE_ADD() / DATE_SUB()
-- Use case: Set reminder or follow-up alerts automatically.
-- Add or subtract days, months, or years.
SELECT event_name,
       DATE_ADD(start_date, INTERVAL 7 DAY) AS reminder_date,
       DATE_SUB(end_date, INTERVAL 2 DAY) AS early_alert_date
FROM Events;

-- EXTRACT() / YEAR() / MONTH() / DAY()
-- Extract specific parts of a date.
SELECT event_name,
    YEAR(start_date) AS event_year,
    MONTH(start_date) AS event_month,
    DAY(start_date) AS event_day
FROM Events;

-- DATE_FORMAT()
-- Format date in a readable way.
SELECT event_name,
    DATE_FORMAT(start_date, '%d-%b-%y') AS formatted_date
FROM Events;

-- DAYNAME() / MONTHNAME()
-- Get the weekday or month name.
SELECT event_name,
    DAYNAME(start_date) AS start_day,
    MONTHNAME(start_date) AS month_name
FROM Events;

-- CURDATE() + INTERVAL
-- Use case: Show upcoming events.
-- Compare with current date (find past or future events).
SELECT event_name, start_date
FROM Events
WHERE start_date > CURDATE();
