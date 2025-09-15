DROP DATABASE IF EXISTS alchemy;
CREATE DATABASE alchemy;
USE alchemy;

CREATE TABLE ingredients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (100) NOT NULL,
    slug VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    image1 VARCHAR(255) NOT NULL
);

INSERT INTO ingredients (
name,
slug,
description, 
image1
) VALUES
("Chardon couronné", "chardon", "Le chardon pique un peu, ça lui donne un petit côté agressif qui n'enlève rien à son charme. En consommer peut faciliter un peu trop la digestion.", "/images/chardon.png"),
("Fleur d'Irisse", "iriss", "Cette fleur est si légère qu'il est difficile de croire en sa rigidité et sa résistance.", "/images/iriss.png"),
("Fleur de lin", "lin", "Cette fleur est si légère qu'il est difficile de croire en sa rigidité et sa résistance.", "/images/lin.png"),
("Feuille de menthe", "menthe", "La feuille de menthe donne un arôme naturel à tous vos mets.", "/images/menthe.png");


CREATE TABLE potions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    image1 VARCHAR(255) NOT NULL
);

INSERT INTO potions (
    name,
    description,
    image1
) VALUES 
    ("Potion grossière", "Cette potion vous rendra un peu de vitalité mais vous rendra aussi plus léger...", "/images/potions.png"),
    ("Potion rudimentaire", "Cette potion rafraîchissante vous restaurera de la vitalité et vous rendra plus résistant.", "/images/potions.png");

CREATE TABLE recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    potion_id INT NOT NULL,
    ingredient_1_id INT NOT NULL,
    ingredient_2_id INT NOT NULL,
    potion_name VARCHAR(200) NOT NULL,
    potion_description TEXT NOT NULL,
    potion_image VARCHAR(255) NOT NULL
);

INSERT INTO recipes (potion_id, potion_name, potion_image, potion_description, ingredient_1_id, ingredient_2_id) VALUES
    (1, 1, 1, 1, 1, 2),
    (2, 2, 2, 2, 2, 3);
