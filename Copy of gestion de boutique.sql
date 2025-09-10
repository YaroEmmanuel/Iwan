CREATE TABLE `Utilisateur` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `nom` varchar(255),
  `prenom` varchar(255),
  `telephone` varchar(255),
  `motDePasse` varchar(255),
  `dateCreation` datetime,
  `actif` boolean
);

CREATE TABLE `Role` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255),
  `actif` boolean
);

CREATE TABLE `Permission` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `label` varchar(255),
  `description` text,
  `actions` ENUM ('Ajouter', 'Modifier', 'Supprimer', 'Voir')
);

CREATE TABLE `UtilisateurRole` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `utilisateur_id` int,
  `role_id` int,
  `dateAttribution` datetime,
  `actif` boolean
);

CREATE TABLE `RolePermission` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `role_id` int,
  `permission_id` int,
  `dateAttribution` datetime,
  `actif` boolean
);

CREATE TABLE `Produit` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `codeBarre` varchar(255),
  `nom` varchar(255),
  `description` text,
  `prixVente` decimal,
  `prixAchat` decimal,
  `quantiteStock` int,
  `seuilAlerte` int,
  `actif` boolean,
  `categorie_id` int
);

CREATE TABLE `Vente` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `utilisateur_id` int,
  `numeroTicket` varchar(255),
  `dateVente` datetime,
  `montantHT` decimal,
  `montantTVA` decimal,
  `montantTotal` decimal,
  `methodePaiement` varchar(255),
  `remise` decimal,
  `statut` varchar(255)
);

CREATE TABLE `LigneVente` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `vente_id` int,
  `produit_id` int,
  `quantite` int,
  `prixUnitaire` decimal,
  `remiseLigne` decimal,
  `sousTotal` decimal
);

CREATE TABLE `Paiement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `vente_id` int,
  `montant` decimal,
  `methodePaiement` varchar(255),
  `reference` varchar(255),
  `dateHeure` datetime,
  `statut` varchar(255)
);

CREATE TABLE `Categorie` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom` varchar(255)
);

CREATE TABLE `Stock` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `produit_id` int UNIQUE,
  `quantiteActuelle` int,
  `quantiteReservee` int,
  `derniereMiseAJour` datetime
);

CREATE TABLE `HistoriqueAction` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `utilisateur_id` int,
  `typeAction` varchar(255),
  `description` text,
  `tableConcernee` varchar(255),
  `idEnregistrement` int,
  `valeursAvant` text,
  `valeursApres` text,
  `dateHeure` datetime,
  `adresseIP` varchar(255)
);

ALTER TABLE `Permission` COMMENT = 'Permissions prédéfinies dans le code, pas de CRUD - lecture seule';

ALTER TABLE `Paiement` COMMENT = 'Transformer en Enum et retirer le statut vu que la vente a déja un statut';

ALTER TABLE `UtilisateurRole` ADD FOREIGN KEY (`utilisateur_id`) REFERENCES `Utilisateur` (`id`);

ALTER TABLE `UtilisateurRole` ADD FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`);

ALTER TABLE `RolePermission` ADD FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`);

ALTER TABLE `RolePermission` ADD FOREIGN KEY (`permission_id`) REFERENCES `Permission` (`id`);

ALTER TABLE `Produit` ADD FOREIGN KEY (`categorie_id`) REFERENCES `Categorie` (`id`);

ALTER TABLE `Vente` ADD FOREIGN KEY (`utilisateur_id`) REFERENCES `Utilisateur` (`id`);

ALTER TABLE `LigneVente` ADD FOREIGN KEY (`vente_id`) REFERENCES `Vente` (`id`);

ALTER TABLE `LigneVente` ADD FOREIGN KEY (`produit_id`) REFERENCES `Produit` (`id`);

ALTER TABLE `Paiement` ADD FOREIGN KEY (`vente_id`) REFERENCES `Vente` (`id`);

ALTER TABLE `Stock` ADD FOREIGN KEY (`produit_id`) REFERENCES `Produit` (`id`);

ALTER TABLE `HistoriqueAction` ADD FOREIGN KEY (`utilisateur_id`) REFERENCES `Utilisateur` (`id`);
