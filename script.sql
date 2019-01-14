
INSERT INTO Adresse VALUES (1, 1, 'rue du client 1', 'ville du client 1', 1111);
INSERT INTO Adresse VALUES (2, 2, 'rue du client 2', 'ville du client 2', 1112);
INSERT INTO Adresse VALUES (3, 3, 'rue du client 3', 'ville du client 3', 1113);
INSERT INTO Adresse VALUES (4, 4, 'rue du client 4', 'ville du client 4', 1113);
INSERT INTO Adresse VALUES (5, 5, 'rue du client 5', 'ville du client 5', 1112);
INSERT INTO Adresse VALUES (6, 6, 'rue du client 6', 'ville du client 6', 1111);
INSERT INTO Adresse VALUES (7, 7, 'rue du client 7', 'ville du client 7', 1112);
INSERT INTO Adresse VALUES (8, 8, 'rue du client 8', 'ville du client 8', 1112);
INSERT INTO Adresse VALUES (9, 9, 'rue du client 9', 'ville du client 9', 1111);
INSERT INTO Adresse VALUES (10, 10, 'rue du client 10', 'ville du client 10', 1113);


INSERT INTO Restaurant VALUES ('restaurant 1', 1022);
INSERT INTO Restaurant VALUES ('restaurant 2', 1022);
INSERT INTO Restaurant VALUES ('restaurant 3', 1000);
INSERT INTO Restaurant VALUES ('restaurant 4', 1000);

insert into client values (1, 'email du client 1', (1, 1, 'rue du client 1', 'ville du client 1', 1111), ('restaurant 1', 1022));
insert into client values (2, 'email du client 2', (2, 2, 'rue du client 2', 'ville du client 2', 1112), ('restaurant 2', 1022));
insert into client values (3, 'email du client 3', (3, 3, 'rue du client 3', 'ville du client 3', 1113), ('restaurant 3', 1000));
insert into client values (4, 'email du client 4', (4, 4, 'rue du client 4', 'ville du client 4', 1111), ('restaurant 4', 1000));
insert into client values (5, 'email du client 5', (5, 5, 'rue du client 5', 'ville du client 5', 1112), ('restaurant 2', 1022));


INSERT INTO recette VALUES(1, 1, 1, 'restaurant 1', 1);
INSERT INTO recette VALUES(2, 2, 2, 'restaurant 1', 2);
INSERT INTO recette VALUES(3, 3, 3, 'restaurant 1', 3);
INSERT INTO recette VALUES(4, 4, 4, 'restaurant 1', 4);
INSERT INTO recette VALUES(5, 5, 5, 'restaurant 1', 5);
INSERT INTO recette VALUES(9, 9, 9, 'restaurant 1', 9);
INSERT INTO recette VALUES(6, 6, 6, 'restaurant 2', 6);
INSERT INTO recette VALUES(2, 2, 2, 'restaurant 2', 2);
INSERT INTO recette VALUES(2, 2, 2, 'restaurant 3', 2);
INSERT INTO recette VALUES(8, 8, 8, 'restaurant 3', 8);
INSERT INTO recette VALUES(7, 7, 7, 'restaurant 3', 7);


INSERT INTO Produit VALUES (1, 1, 'restaurant 1', 'canibale', 'pizza composée de beouf poulet et merguez', 10, (1, 1, 1, 'restaurant 1', 1));
INSERT INTO Produit VALUES (2, 2, 'restaurant 1', 'marguerita', 'pizza composée que de mozza', 7, (2, 2, 2, 'restaurant 1', 2));
INSERT INTO Produit VALUES (3, 3, 'restaurant 1', 'marguerita', 'pizza composée que de mozza', 7, (2, 2, 2, 'restaurant 2', 2));
INSERT INTO Produit VALUES (4, 4, 'restaurant 2', 'reine', 'pizza composée de mozza jambon et champignon', 7, (2, 3, 3, 'restaurant 3', 3));
INSERT INTO Produit VALUES (5, 5, 'restaurant 3', 'indienne', 'pizza composée de mozza poulet champignon et emmental', 10, (5, 5, 5, 'restaurant 1', 1));
INSERT INTO Produit VALUES (6, 6, 'restaurant 3', 'savoyarde', 'pizza composée de mozza patates et lardons', 10, (7, 7, 7, 'restaurant 2', 2));


insert into carte values ('restaurant 1', (1, 1, 'restaurant 1', 'canibale', 'pizza composée de beouf poulet et merguez', 10, (1, 1, 1, 'restaurant 1', 1)));
insert into carte values ('restaurant 2', (4, 4, 'restaurant 2', 'reine', 'pizza composée de jambon et champignon', 9, (2, 3, 3, 'restaurant 3', 1)));
insert into carte values ('restaurant 3', (5, 5, 'restaurant 3', 'savoyarde', 'pizza composée de lardons et patates', 8, (3, 2, 2, 'restaurant 2', 2)));


insert into categorie values (1, 1, 'restaurant 1', 'categorie 1', '1ère categorie');
insert into categorie values (2, 2, 'restaurant 1', 'categorie 2', '2ème categorie');
insert into categorie values (3, 3, 'restaurant 2', 'categorie 3', '3ème categorie');
insert into categorie values (4, 4, 'restaurant 2', 'categorie 4', '4ème categorie');
insert into categorie values (5, 5, 'restaurant 5', 'categorie 5', '5ème categorie');


insert into commande values (1, 1, (1, 1, 'restaurant 1', 'canibale', 'beouf poulet merguez', 10, (1, 1, 1, 'restaurant 1', 1)), 10, 'livraison', false, 'terminée', 1230, (1, 1, 'rue du client 1', 'ville du client 1', 1111));
insert into commande values (2, 2, (2, 2, 'restaurant 1', 'reine, canibale', 'beouf poulet merguez et jambom champignon', 18, (2, 2, 2, 'restaurant 2', 2)), 18, 'livraison', true, 'terminée', 1250, (2, 2, 'rue du client 2', 'ville du client 2', 1112));
insert into commande values (3, 3, (3, 3, 'restaurant 2', 'reine', 'jambom champignon', 8, (3, 3, 3, 'restaurant 2', 2)), 8, 'à emporter', false, 'en cours', 1300, (3, 3, 'rue du client 3', 'ville du client 3', 1113));


insert into facture values (1, 1, 1, 10);
insert into facture values (2, 2, 2, 18);
insert into facture values (3, 3, 3, 8);


insert into ingredienrecette values (1, 1, 1, 1, 'restaurant 1', 'ingredient 1');
insert into ingredienrecette values (2, 2, 2, 2, 'restaurant 1', 'ingredient 2');
insert into ingredienrecette values (3, 3, 3, 3, 'restaurant 2', 'ingredient 3');
insert into ingredienrecette values (4, 4, 4, 4, 'restaurant 3', 'ingredient 4');

