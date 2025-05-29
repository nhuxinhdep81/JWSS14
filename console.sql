create database ss14;
use  ss14;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL
);

DELIMITER $$

CREATE PROCEDURE save_user_b7 (
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO users(username, password, email)
    VALUES (p_username, p_password, p_email);
END$$

DELIMITER ;
