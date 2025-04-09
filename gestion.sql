# script créé le : Tue Apr 08 17:32:38 CAT 2025 -   syntaxe MySQL ;

# use  VOTRE_BASE_DE_DONNEE ;

DROP TABLE IF EXISTS eleve ;
CREATE TABLE eleve (id_eleve_ int AUTO_INCREMENT NOT NULL,
nom CHAR,
prenom CHAR,
datedenaissance DATE,
id_paiement INT,
id_presence INT,
PRIMARY KEY (id_eleve_) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS professeur ;
CREATE TABLE professeur (id_professeur int AUTO_INCREMENT NOT NULL,
nomprof CHAR,
prenomprof CHAR,
email CHAR,
specialite CHAR,
PRIMARY KEY (id_professeur) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS cours ;
CREATE TABLE cours (id_cours int AUTO_INCREMENT NOT NULL,
nomcours CHAR,
desription CHAR,
PRIMARY KEY (id_cours) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS classe ;
CREATE TABLE classe (id_classe int AUTO_INCREMENT NOT NULL,
nomclasse CHAR,
niveau INT,
id_eleve_ INT NOT NULL,
PRIMARY KEY (id_classe) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS notes ;
CREATE TABLE notes (id_notes int AUTO_INCREMENT NOT NULL,
note INT,
date INT,
PRIMARY KEY (id_notes) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS paiement ;
CREATE TABLE paiement (id_paiement int AUTO_INCREMENT NOT NULL,
montant CHAR,
date_paiement DATE,
mode_paiement CHAR,
PRIMARY KEY (id_paiement) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS presence ;
CREATE TABLE presence (id_presence int AUTO_INCREMENT NOT NULL,
datepresence DATE,
etatpresence DATE,
PRIMARY KEY (id_presence) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS donner ;
CREATE TABLE donner (id_cours int AUTO_INCREMENT NOT NULL,
id_professeur INT NOT NULL,
PRIMARY KEY (id_cours,
 id_professeur) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS obtenir ;
CREATE TABLE obtenir (id_notes int AUTO_INCREMENT NOT NULL,
id_eleve_ INT NOT NULL,
PRIMARY KEY (id_notes,
 id_eleve_) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS apprendre ;
CREATE TABLE apprendre (id_cours int AUTO_INCREMENT NOT NULL,
id_eleve_ INT NOT NULL,
PRIMARY KEY (id_cours,
 id_eleve_) ) ENGINE=InnoDB;

ALTER TABLE eleve ADD CONSTRAINT FK_eleve_id_paiement FOREIGN KEY (id_paiement) REFERENCES paiement (id_paiement);

ALTER TABLE eleve ADD CONSTRAINT FK_eleve_id_presence FOREIGN KEY (id_presence) REFERENCES presence (id_presence);
ALTER TABLE classe ADD CONSTRAINT FK_classe_id_eleve_ FOREIGN KEY (id_eleve_) REFERENCES eleve (id_eleve_);
ALTER TABLE donner ADD CONSTRAINT FK_donner_id_cours FOREIGN KEY (id_cours) REFERENCES cours (id_cours);
ALTER TABLE donner ADD CONSTRAINT FK_donner_id_professeur FOREIGN KEY (id_professeur) REFERENCES professeur (id_professeur);
ALTER TABLE obtenir ADD CONSTRAINT FK_obtenir_id_notes FOREIGN KEY (id_notes) REFERENCES notes (id_notes);
ALTER TABLE obtenir ADD CONSTRAINT FK_obtenir_id_eleve_ FOREIGN KEY (id_eleve_) REFERENCES eleve (id_eleve_);
ALTER TABLE apprendre ADD CONSTRAINT FK_apprendre_id_cours FOREIGN KEY (id_cours) REFERENCES cours (id_cours);
ALTER TABLE apprendre ADD CONSTRAINT FK_apprendre_id_eleve_ FOREIGN KEY (id_eleve_) REFERENCES eleve (id_eleve_);
