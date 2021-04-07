USE ucode_web;

CREATE TABLE IF NOT EXISTS powers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hero_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    points INT NOT NULL,
    type ENUM('attack', 'defense') NOT NUll,
    FOREIGN KEY(hero_id) REFERENCES heroes(id) on delete cascade
);

CREATE TABLE IF NOT EXISTS races (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hero_id INT NOT NULL,
    name TEXT(30) NOT NULL,
    FOREIGN KEY(hero_id) REFERENCES heroes(id) on delete cascade
);

CREATE TABLE IF NOT EXISTS teams (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hero_id INT NOT NULL,
    name TEXT(30) NOT NULL,
    FOREIGN KEY(hero_id) REFERENCES heroes(id) on delete cascade
);

INSERT INTO powers (hero_id, name, points, type)
VALUES ('1', 'bloody fist', '110', 'attack');
INSERT INTO powers (hero_id, name, points, type)
VALUES ('2', 'iron shield', '200', 'defense');
INSERT INTO powers (hero_id, name, points, type)
VALUES ('3', 'iron shield', '200', 'attack');

INSERT INTO races (hero_id, name)
VALUES ('1', 'Kree');
INSERT INTO races (hero_id, name)
VALUES ('3', 'Kree');
INSERT INTO races (hero_id, name)
VALUES ('2', 'Human');

INSERT INTO teams (hero_id, name)
VALUES ('2', 'Avengers');
INSERT INTO teams (hero_id, name)
VALUES ('2', 'Hydra');
INSERT INTO teams (hero_id, name)
VALUES ('1', 'Avengers');
INSERT INTO teams (hero_id, name)
VALUES ('3', 'Hydra');
