CREATE DATABASE ucode_web;
CREATE USER 'yvovnenko'@'localhost' IDENTIFIED WITH mysql_native_password BY 'securepass';
USE ucode_web;
GRANT ALL PRIVILEGES ON ucode_web TO 'yvovnenko'@'localhost';
