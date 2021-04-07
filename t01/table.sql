USE ucode_web;

CREATE TABLE IF NOT EXISTS heroes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    race VARCHAR(30) NOT NULL DEFAULT 'human',
    class_role ENUM('tankman', 'healer', 'dps') NOT NULL
);
