DROP DATABASE IF EXISTS alchemy;
CREATE DATABASE alchemy;
USE alchemy;

CREATE TABLE ingredients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (100) NOT NULL,
    description TEXT NOT NULL,
    image1 VARCHAR(255) NOT NULL
);

INSERT INTO ingredients (
name,
description, 
image1
) VALUES
("Chardon couronné", "Le chardon pique un peu, ça lui donne un petit côté agressif qui n'enlève rien à son charme. En consommer peut faciliter un peu trop la digestion.", "/images/chardon.png"),
("Fleur d'Irisse", "Cette fleur est si légère qu'il est difficile de croire en sa rigidité et sa résistance.", "/images/iriss.png"),
("Fleur de lin", "Cette fleur est si légère qu'il est difficile de croire en sa rigidité et sa résistance.", "/images/lin.png"),
("Feuille de menthe", "La feuille de menthe donne un arôme naturel à tous vos mets.", "/images/menthe.png");


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


CREATE TABLE bestiary (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    localisation TEXT NOT NULL,
    item1 VARCHAR(255) NOT NULL,
    item2 VARCHAR(255) NOT NULL,
    loot_item1 DECIMAL(5,2),
    loot_item2 DECIMAL(5,2)
    );

INSERT INTO bestiary (name, description, localisation, item1, item2, loot_item1, loot_item2) 
VALUES("Bouftou", "Créature trappue à la laine épaisse et odorante, elle charge les aventuriers débutants à l'aide de ses cornes recourbées", "Tainéla", "Corne de bouftou", "Peau de bouftou", 1.00, 4.00),
("Boufette", "Bien moins agressive que les mâles, elles deviennent redoutables lorsqu'elle doit défendre ses petits", "Tainéla", "Corne de bouftou", "Peau de bouftou", 1.00, 4.00),
("Boufton noir", "Petits de la famille des bouftous, il lance de la boue sur les aventuriers les empêchant de se déplacer", "Tainéla", "Corne de bouftou", "Peau de bouftou", 1.0, 4.0),
("Boufton blanc", "Petits de famille des bouftous, il crache une salive malodorante et visqueuse qui rend glissante les armes", "Tainéla", "Corne de bouftou", "Peau de bouftou", 1.00, 4.00),
("Bouftou royal", "Le plus imposant, ce bouftou charge avec ses immenses cornes et sa machôir broirait le bouclier de Féca lui-même", "Tainéla", "Couronne royale", "Laine royale", 1.00, 4.00 ),
("Tofu", "Créature  de petite taille, vive qui aiment tournoyer autour des aventuriers. Inoffensifs seuls, ils se montrent envahissants une fois en groupe", "Champs d'Astrub", "Phéromones de tofu", "Sang de tofu", 25.00, 2.00),
("Tofune", "Femmelle de la famille des tofus, elle attaque les aventuriers débutant en leur jetant ses oeufs qui éclosent pour faire apparaître un bébé tofu", "Champs d'Astrub", "Phéromones de tofu", "Sang de tofu", 25.00, 2.00),
("Ventritofu", "Tofu ayant manifestant trop manger, il fonce et écrase ses ennemis en utilisant sa surchage pondérale", "Champs d'Astrub", "Phéromones de tofu", "Sang de tofu", 25.00, 2.00),
("Tofu royal", "Roi des tofus et favori des tofunes, son croupion est un met traditionnel dans l'aristocratie Bontarienne", "Champs d'Astrub", "Phéromones de tofu", "Sang de tofu", 25.00, 2.00),
("Piou bleu", "Piou à l'aise dans l'eau qu'il utilise pour asperger l'aventurière et son joli brushing", "Montagnes d'Astrub", "Bec de piou", "Plume de Gugu", 25.00, 2.00 ),
("Piou vert", "Piou qui lance des graviers au visage de l'aventurier malheureux", "Montagnes d'Astrub", "Bec de piou", "Plume de Gugu", 25.00, 2.00),
("Piou violet", "Très agile et vif, il est dit qu'ils rivaliseraient avec les tofus", "Montagnes d'Astrub", "Bec de piou", "Plume de Gugu", 25.00, 2.00),
("Piou rouge", "Attaque avec son bec puissant qu'il chauffe au préalable sur les pierres aux alentours", "Montagnes d'Astrub", "Bec de piou", "Plume de Gugu", 25.00, 2.00),
("Rat squelette", "Vermines rampantes réssucités par quelques rîtes obscures", "Cimetière d'Astrub", "Poudre d'os", "Peau Tofeu", 25.00, 2.00),
("Bouftou squelette", "Bouftou revenus à la vie ayant pour mission de se venger des aventuriers qui l'ont vaincu", "Cimetière d'Astrub", "Poudre d'os", "Peau Tofeu", 25.00, 2.00),
("Garde squelette", "Malheureuse victime des flots causés par le Chaos d'Ogrest, il erre sans but dans les cimetières d'Astrub", "Cimetière d'Astrub", "Poudre d'os", "Peau Tofeu", 25.00, 2.00),
("Morfor", "On dit qu'un aventurier décima tant de bouftous qu'il fût maudit par le dieu Osamoda, transformé en bouftou géant et condamné à vivre dans une crypte, mythe ou réalité ?", "Cimetière d'Astrub", "Poudre d'os", "Peau Tofeu", 25.00, 2.00),
("Abragland", "Abraknyde juvénile, il a la capacité à se régénerer facilement en se mettant en stase", "Forêt d'Astrub", "Branchopatte", "Sève d'Abrakne", 25.00, 2.00 ),
("Abraknyde", "Plus puissant que l'Abragland, il cause la terreur des aventurières en leur lançant les arakne fourrés dans leur tronc", "Forêt d'Astrub", "Branchopatte", "Sève d'Abrakne", 25.00, 2.00 ),
("Arakne", "C'est une horreur", "Branchopatte", "Forêt d'Astrub", "Sève d'Abrakne", 25.00, 2.00 ),
("Abraknelle", "C'est l'histoire d'une petite arakne abandonnée par son aventurier. Elle mourrut de tristesse et fut réssucitée par la magie des écorces. Il ne reste d'elle que colère et lamentations", "Forêt d'Astrub", "Branchopatte", "Sève d'Abrakne", 25.00, 2.00 );