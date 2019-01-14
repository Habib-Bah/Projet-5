

CREATE TABLE public.LigneDeCommande (
                Quantite INTEGER NOT NULL,
                ReferenceProduit INTEGER NOT NULL
);


CREATE TABLE public.Client (
                clientID INTEGER NOT NULL,
                eMail VARCHAR(20) NOT NULL,
                adresseDeLivraison Adresse NOT NULL,
                restaurant Restaurant NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (clientID)
);


CREATE TABLE public.Restaurant (
                Nom VARCHAR NOT NULL,
                horaire VARCHAR NOT NULL,
                CONSTRAINT restaurant_pk PRIMARY KEY (Nom)
);


CREATE TABLE public.Adresse (
                numeroRue INTEGER NOT NULL,
                clientID INTEGER NOT NULL,
                nomRue VARCHAR NOT NULL,
                ville VARCHAR NOT NULL,
                codePostal INTEGER NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (numeroRue, clientID)
);

CREATE TABLE public.Produit (
                reference INTEGER NOT NULL,
                numero INTEGER NOT NULL,
                NomRestaurant VARCHAR NOT NULL,
                nom VARCHAR NOT NULL,
                descriptif VARCHAR NOT NULL,
                prix DOUBLE PRECISION NOT NULL,
                recette Recette NOT NULL,
                CONSTRAINT produit_pk PRIMARY KEY (reference)
);


CREATE TABLE public.Carte (
                NomRestaurant VARCHAR NOT NULL,
                ListProduit Produit NOT NULL,
                CONSTRAINT carte_pk PRIMARY KEY (NomRestaurant)
);




CREATE SEQUENCE public.produit_reference_seq;


CREATE SEQUENCE public.commande_numero_seq;



CREATE TABLE public.Commande (
                numero INTEGER NOT NULL DEFAULT nextval('public.commande_numero_seq'),
                clientID INTEGER NOT NULL,
                ListeProduit Produit NOT NULL,
                prixTotal DOUBLE PRECISION NOT NULL,
                typeCommande VARCHAR(20) NOT NULL,
                paiementEnLigne BOOLEAN NOT NULL,
                status VARCHAR(20) NOT NULL,
                heureDeLivraison VARCHAR(20) NOT NULL,
                AdresseDeLivraison Adresse NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (clientID)
);


ALTER SEQUENCE public.commande_numero_seq OWNED BY public.Commande.numero;

CREATE SEQUENCE public.facture_numerocommande_seq;


CREATE TABLE public.Facture (
                NumeroCommande INTEGER NOT NULL DEFAULT nextval('public.facture_numerocommande_seq'),
                numero INTEGER NOT NULL,
                clientID INTEGER NOT NULL,
                montantTTC DOUBLE PRECISION NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (clientID)
);


ALTER SEQUENCE public.facture_numerocommande_seq OWNED BY public.Facture.NumeroCommande;


CREATE TABLE public.Categorie (
                reference INTEGER NOT NULL DEFAULT nextval('public.produit_reference_seq'),
                numero INTEGER NOT NULL,
                NomRestaurant VARCHAR NOT NULL,
                Nom VARCHAR NOT NULL,
                Description VARCHAR NOT NULL,
                CONSTRAINT categorie_pk PRIMARY KEY (reference)
);

ALTER SEQUENCE public.produit_reference_seq OWNED BY public.Categorie.reference;

CREATE SEQUENCE public.recette_recetteid_seq;

CREATE TABLE public.Recette (
                recetteID INTEGER NOT NULL DEFAULT nextval('public.recette_recetteid_seq'),
                reference INTEGER NOT NULL,
                numero INTEGER NOT NULL,
                NomRestaurant VARCHAR NOT NULL,
                referenceProduit VARCHAR NOT NULL,
                CONSTRAINT recette_pk PRIMARY KEY (recetteID)
);


ALTER SEQUENCE public.recette_recetteid_seq OWNED BY public.Recette.recetteID;

CREATE SEQUENCE public.ingredienrecette_ingredientid_seq;

CREATE TABLE public.IngredienRecette (
                ingredientID INTEGER NOT NULL DEFAULT nextval('public.ingredienrecette_ingredientid_seq'),
                recetteID INTEGER NOT NULL,
                reference INTEGER NOT NULL,
                numero INTEGER NOT NULL,
                NomRestaurant VARCHAR NOT NULL,
                nomIngredient VARCHAR NOT NULL,
                CONSTRAINT ingredienrecette_pk PRIMARY KEY (ingredientID)
);


ALTER SEQUENCE public.ingredienrecette_ingredientid_seq OWNED BY public.IngredienRecette.ingredientID;

ALTER TABLE public.Commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (clientID)
REFERENCES public.Client (clientID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Column types mismatch in the following column mapping(s):
        clientID: INTEGER -- Nom: VARCHAR
*/
ALTER TABLE public.Restaurant ADD CONSTRAINT client_restaurant_fk
FOREIGN KEY (Nom)
REFERENCES public.Client (clientID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (clientID)
REFERENCES public.Client (clientID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Carte ADD CONSTRAINT restaurant_carte_fk
FOREIGN KEY (NomRestaurant)
REFERENCES public.Restaurant (Nom)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Produit ADD CONSTRAINT carte_produit_fk
FOREIGN KEY (NomRestaurant)
REFERENCES public.Carte (NomRestaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Column types mismatch in the following column mapping(s):
        clientID: INTEGER -- NomRestaurant: VARCHAR
*/
ALTER TABLE public.Produit ADD CONSTRAINT commande_produit_fk
FOREIGN KEY (numero, NomRestaurant)
REFERENCES public.Commande (numero, clientID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Facture ADD CONSTRAINT commande_facture_fk
FOREIGN KEY (numero, clientID)
REFERENCES public.Commande (numero, clientID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Recette ADD CONSTRAINT produit_recette_fk
FOREIGN KEY (reference, numero, NomRestaurant)
REFERENCES public.Produit (reference, numero, NomRestaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Categorie ADD CONSTRAINT produit_categorie_fk
FOREIGN KEY (reference, numero, NomRestaurant)
REFERENCES public.Produit (reference, numero, NomRestaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.IngredienRecette ADD CONSTRAINT recette_ingredienrecette_fk
FOREIGN KEY (recetteID, reference, numero, NomRestaurant)
REFERENCES public.Recette (recetteID, reference, numero, NomRestaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
