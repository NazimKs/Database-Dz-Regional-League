
CREATE TABLE if not exists Joueur(
   NumeroJoueur INT,
   NomJoueur VARCHAR(50),
   PrenomJoueur VARCHAR(50),
   DateNaissanceJoueur DATE,
   GSJoueur VARCHAR(50),
   PRIMARY KEY(NumeroJoueur)
);



CREATE TABLE if not exists Entraineur(
   NumeroEntraineur INT,
   NomEntraineur VARCHAR(50),
   PrenomEntraineur VARCHAR(50),
   DateNaissanceEntraineur DATE,
   LieuNaissanceEntraineur VARCHAR(50),
   PRIMARY KEY(NumeroEntraineur)
);

CREATE TABLE if not exists Arbitre(
   NumeroArbitre INT,
   NomArbitre VARCHAR(50),
   PrenomArbitre VARCHAR(50),
   DateNaissanceArbitre VARCHAR(50),
   PRIMARY KEY(NumeroArbitre)
);


CREATE TABLE if not exists Division(
   IdDivision INT,
   NomDivision VARCHAR(50),
   PRIMARY KEY(IdDivision)
);

CREATE TABLE if not exists Groupe(
   IdDivision INT,
   IdGroupe VARCHAR(50),
   PRIMARY KEY(IdDivision, IdGroupe),
   FOREIGN KEY(IdDivision) REFERENCES Division(IdDivision)
);

CREATE TABLE if not exists Saison(
   IdSaison VARCHAR(50),
   PRIMARY KEY(IdSaison)
);

CREATE TABLE if not exists Dirigant(
   IdDirigant INT,
   NomDirigant VARCHAR(50),
   PrenomDirigant VARCHAR(50),
   PRIMARY KEY(IdDirigant)
);


CREATE TABLE if not exists Wilaya(
   IdWilaya INT,
   DesignationWilaya VARCHAR(50),
   PRIMARY KEY(IdWilaya)
);

CREATE TABLE if not exists Journee(
   IdSaison VARCHAR(50),
   NumJournee INT,
   PRIMARY KEY(IdSaison, NumJournee),
   FOREIGN KEY(IdSaison) REFERENCES Saison(IdSaison)
);

CREATE TABLE if not exists Stade(
   IdStade INT,
   NomStade VARCHAR(50),
   IdWilaya INT NOT NULL,
   PRIMARY KEY(IdStade),
   FOREIGN KEY(IdWilaya) REFERENCES Wilaya(IdWilaya)
);

CREATE TABLE if not exists Club(
   Sigle VARCHAR(50),
   NomClub VARCHAR(50),
   IdStade INT NOT NULL,
   IdWilaya INT NOT NULL,
   PRIMARY KEY(Sigle),
   FOREIGN KEY(IdStade) REFERENCES Stade(IdStade),
   FOREIGN KEY(IdWilaya) REFERENCES Wilaya(IdWilaya)
);

CREATE TABLE if not exists Equipe(
   Sigle VARCHAR(50),
   CategorieEquipe VARCHAR(50),
   PRIMARY KEY(Sigle, CategorieEquipe),
   FOREIGN KEY(Sigle) REFERENCES Club(Sigle)
);



CREATE TABLE if not exists Rencontre(
   IdSaison VARCHAR(50),
   NumJournee INT,
   NumeroRencontre INT,
   ButsEquipeA INT,
   ButsEquipeB INT,
   DateRencontre DATE,
   NumeroArbitre INT NOT NULL,
   SigleA VARCHAR(50) NOT NULL,
   CategorieEquipeA VARCHAR(50) NOT NULL,
   SigleB VARCHAR(50) NOT NULL,
   CategorieEquipeB VARCHAR(50) NOT NULL,
   IdStade INT NOT NULL,
   PRIMARY KEY(IdSaison, NumJournee, NumeroRencontre),
   FOREIGN KEY(IdSaison, NumJournee) REFERENCES Journee(IdSaison, NumJournee),
   FOREIGN KEY(NumeroArbitre) REFERENCES Arbitre(NumeroArbitre),
   FOREIGN KEY(SigleA, CategorieEquipeA) REFERENCES Equipe(Sigle, CategorieEquipe),
   FOREIGN KEY(SigleB, CategorieEquipeB) REFERENCES Equipe(Sigle, CategorieEquipe),
   FOREIGN KEY(IdStade) REFERENCES Stade(IdStade)
);

CREATE TABLE if not exists Entrainer(
   Sigle VARCHAR(50),
   CategorieEquipe VARCHAR(50),
   NumeroEntraineur INT,
   IdSaison VARCHAR(50),
   PRIMARY KEY(Sigle, CategorieEquipe, NumeroEntraineur, IdSaison),
   FOREIGN KEY(Sigle, CategorieEquipe) REFERENCES Equipe(Sigle, CategorieEquipe),
   FOREIGN KEY(NumeroEntraineur) REFERENCES Entraineur(NumeroEntraineur),
   FOREIGN KEY(IdSaison) REFERENCES Saison(IdSaison)
);

CREATE TABLE if not exists Paticiper(
   Sigle VARCHAR(50),
   CategorieEquipe VARCHAR(50),
   IdDivision INT,
   IdGroupe VARCHAR(50),
   IdSaison VARCHAR(50),
   PRIMARY KEY(Sigle, CategorieEquipe, IdDivision, IdGroupe, IdSaison),
   FOREIGN KEY(Sigle, CategorieEquipe) REFERENCES Equipe(Sigle, CategorieEquipe),
   FOREIGN KEY(IdDivision, IdGroupe) REFERENCES Groupe(IdDivision, IdGroupe),
   FOREIGN KEY(IdSaison) REFERENCES Saison(IdSaison)
);

CREATE TABLE if not exists Jouer(
   Sigle VARCHAR(50),
   CategorieEquipe VARCHAR(50),
   NumeroJoueur INT,
   IdSaison VARCHAR(50),
   PRIMARY KEY(Sigle, CategorieEquipe, NumeroJoueur, IdSaison),
   FOREIGN KEY(Sigle, CategorieEquipe) REFERENCES Equipe(Sigle, CategorieEquipe),
   FOREIGN KEY(NumeroJoueur) REFERENCES Joueur(NumeroJoueur),
   FOREIGN KEY(IdSaison) REFERENCES Saison(IdSaison)
);

CREATE TABLE if not exists Diriger(
   IdSaison VARCHAR(50),
   Sigle VARCHAR(50),
   IdDirigant INT,
   PRIMARY KEY(IdSaison, Sigle, IdDirigant),
   FOREIGN KEY(IdSaison) REFERENCES Saison(IdSaison),
   FOREIGN KEY(Sigle) REFERENCES Club(Sigle),
   FOREIGN KEY(IdDirigant) REFERENCES Dirigant(IdDirigant)
);


