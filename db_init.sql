CREATE DATABASE IF NOT EXISTS db_pfo2;

USE db_pfo2;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(25),
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW TABLES;

INSERT INTO user (name, email) VALUES
('maria','maria@email.com'),
('jose','jose@email.com');

SELECT * FROM user;