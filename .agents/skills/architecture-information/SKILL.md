---
name: architecture-information
description: Load in a web (firstmate-web) home before briefing a site's content inventory, sitemap, navigation or wireframes, and before having any of them validated.
user-invocable: false
metadata:
  internal: true
---

# architecture-information

Ce skill possède la structure du site, de la stratégie de contenu au wireframe validé.
Il existe parce que les cours placent cette structure avant tout design et tout code.
Une structure corrigée après coup se refait sans pouvoir négocier temps ni budget [936690 R39].

## Quand charger

- Avant de briefer une stratégie, un audit ou un inventaire de contenu.
- Avant de briefer une arborescence, une navigation ou ses libellés.
- Avant de briefer un tri de cartes, un test d'arborescence ou du coffre.
- Avant de briefer des croquis ou des wireframes.
- Avant d'accepter ces livrables.
- Avant de les faire valider.

## Faire

Firstmate met les étapes 1 à 5 dans le brief, dans cet ordre, et vérifie l'étape 6 à la réception.

### 1. Le contenu d'abord

1. Demander au client qui crée, qui approuve (idéalement chez lui), qui met à jour, et quels types de contenu sur quels appareils [936690 P1].
2. Ne garder que le contenu pertinent, approprié et utile [936690 R12-R15].
3. Cartographier les flux de contenu avec les parties prenantes, une demi-journée ou plus : processus actuel, rôles, étapes, dépendances [936690 R30, P2].
4. En tirer les critères de choix du CMS [936690 R29].
5. Fixer des objectifs SMART et qui crée, approuve, maintient, à quelle fréquence [5613976 SC·L9].
6. Pour un site existant, inventorier en tableur, auditer en quantité et en qualité, puis consolider, mettre à jour, combler [5613976 SC·L11-L12].

### 2. Priorité et arborescence

Si le client attend du trafic de recherche, le plan de mots-clés précède l'arborescence : `seo`.

1. Tenir compte des cinq états du contexte d'usage : physique, environnemental, préférentiel, émotionnel, cognitif [936690 R40-R45].
2. Confronter l'ordre du client aux vrais utilisateurs par questions ouvertes [936690 R70-R71, P4].
3. Choisir le modèle selon l'audience, le contenu et les tâches [936690 R79] :
   - arbre hiérarchique : site riche en contenu, grand écran [R82] ;
   - liste imbriquée : petit écran [R83] ;
   - moyeu et rayons : site orienté tâches [R84] ;
   - boîte bento : données agrégées [R85] ;
   - vue filtrée : un seul jeu de données [R86].
4. Combiner des modèles seulement entre systèmes distincts, jamais dans un même site [936690 R87-R88].
5. Dans une catégorie chargée, ordonner par date, alphabet, lieu, popularité ou processus [936690 R69].
6. Appliquer la divulgation progressive [936690 R76].
7. Aucun contenu important à plus de trois clics de l'accueil [2649302 P97, 3918934 R30].
   Égalité : quatre règles non datées, aucun cours dédié ; position gardée parce qu'elle se vérifie à la réception ; autre position, trois clics est un mythe si chaque clic apporte de la valeur [412738 P344, 1595266 P71] ; deux clics au plus [417316 R88 [préférence]], écarté : règle avant préférence.
8. Noms de fichiers et répertoires identiques aux libellés des catégories, 1 à 1 [936690 R65].

### 3. Libellés

1. Prendre les termes des visiteurs, clairs, « plutôt ennuyeux », sans jargon ni mot inventé [936690 R59-R60, 3769310 P108].
2. Pas de catégories qui se chevauchent, comme « Support » et « Solutions » [936690 R61, 3769310 P112].
3. Demander au client : « Est-ce ainsi que vos clients l'appelleraient ? », « Où s'attendraient-ils à le trouver ? », « Que fait-on en cliquant ? » [412738 PR15].
4. Remplacer « FAQ » par une formulation parlante comme « Questions et réponses » [412738 P158].
   Retenu : règle avant préférence ; autre position, 5613976 SC·L8 emploie « FAQ » sans réserve.
5. Fixer un vocabulaire contrôlé : un terme par notion pour toute l'équipe [5613976 AI·L29].

### 4. Navigation

1. Primaire : la raison de la visite ; secondaire : l'utile moins important [936690 R102-R103].
2. L'importance est relative au site : le parcours d'un consultant indépendant devient primaire [936690 R105].
   Retenu : « À propos » et « Contact » vont en primaire si le modèle mental du public les y attend [3769310 P98, P102], règle avant préférence ; autre position, jamais [936690 R104].
3. Six ou sept éléments au plus en primaire ; trop long signale trop de contenu [3769310 P100-P101].
4. Navigation globale identique partout, locale propre à la catégorie [936690 R106, R109].
5. Fil d'Ariane sur un site hiérarchisé, inutile sur une page unique, partiel sur mobile [3918934 R83, R85].
6. Planifier chaque niveau d'utilisateur, connecté ou non, avant le design [936690 R110-R111].
7. Surligner les chemins clés de valeur pour l'utilisateur et l'entreprise, les raccourcir, les mettre en primaire [936690 P6].
8. Mobile : hamburger ou barre du bas, cinq onglets au plus [5613976 AI·L38, 3918934 R112].
   Retenu : cours dédié ; autre position, un contrôle caché est supposé inexistant [1595266 P66].
9. Ne pas sacrifier la navigation d'un site complet à l'épure mobile : concevoir mobile first n'est pas en cause, retirer les aides à la navigation l'est [936690 R80].
10. Recherche indulgente aux fautes, flexible aux variantes, résultats triés par pertinence et filtrables [3769310 P117-P118, P121].

### 5. Tests de structure, puis wireframes

1. Tri de cartes ouvert, fermé ou hybride, en tête-à-tête, questions non directives [4593434 n°129-136, 663850 2.2.32].
2. Le tri fermé imite le rangement, pas la recherche [936690 R95].
3. Test d'arborescence : une fiche par niveau, scénarios « trouvez ceci », sans guider ; noter hésitations et abandons [936690 P5].
4. Vingt personnes suffisent ; une hésitation signale plutôt la hiérarchie [936690 R63, R96].
5. Test du coffre en tout point : « Où suis-je ? Comment suis-je arrivé ici ? Que puis-je faire ici ? Où puis-je aller d'ici ? » [936690 R116].
6. Exiger le contenu réel avant les wireframes, même approuvé à moins de 100 % [412738 P209].
   Retenu : cours dédié au wireframe ; autre position, le Lorem ipsum calibre la page en attendant le texte [3918934 R117].
7. Parler aux développeurs avant [412738 P200].
8. Croquis d'abord : 60 secondes à 2 minutes chacun, 20 à 25 au moins, plusieurs solutions avant une [412738 P205, 663850 2.2.54].
9. Le wireframe valide structure, contenu, hiérarchie, fonctionnalité, comportement, en gris, sans images ni polices [412738 P195, P201].
    Conventions : Arial, bleu pour les liens, boîte barrée d'un X [412738 P207, préférence].
10. Chaque élément est étiqueté ; chaque page dit ce que l'utilisateur doit y faire ; desktop et mobile [412738 P197, P224, 3918934 R74].
11. Dessiner les cas d'erreur [412738 P210].

### 6. Réception et validation

1. Montrer le wireframe avant le design : 15 à 20 minutes contre 3 à 4 heures [1544922 n°25].
2. Circulation, présentation écran par écran et règle « pas dans le wireframe, pas construit » : `agence-projet-client`.

## Refuser ou remonter

**Capitaine**

- Tout envoi au client ou à des utilisateurs, et toute dépense [autorité firstmate].
- Un volume de contenu qui dépasse le périmètre, car le silence vaut accord [936690 R23].
- Le contenu réel absent au moment des wireframes [412738 P209].
- Une mise à jour du contenu qui retomberait sur l'agence sans être payée [936690 R20].

**Firstmate**

- Le modèle d'IA et l'acceptation d'un livrable [autorité firstmate].
- La validation signée, qu'il fait passer par `agence-projet-client` [412738 P241].

**Worker**

- Les libellés proposés, les croquis et le montage des tests [autorité firstmate].

**Refus nets**

- Pas de design ni de code avant la validation de la structure [936690 R38-R39, 412738 P240-P241].
- Pas de navigation calquée sur l'organigramme [3769310 P107, 936690 R46-R48].
- Pas de Lorem ipsum dans un wireframe [412738 P196].
- Ne pas faire classer aux utilisateurs la liste du client [936690 R71].

## Références

Cours sources :
- 936690 « Information Architecture Fundamentals » (Joe Natoli) : entier.
- 412738 « UX & Web Design Master Course: Strategy, Design, Development » (Joe Natoli) : L36-L72, L85.
- 5613976 « UX Writing: Tone and Voice, Microcopy » : SC·L7-L13, AI·L24-L38.
- 3769310 « Usability (learnux.io) » : Wrapping up > Navigation, Recherche.
- 4593434 « User Research and Testing for UX Writing » (Katharina Grimm) : C2·L18.
- 663850 « An introduction to the BCS Foundation Certificate in User Experience » (David Travis) : S4.
- 3918934 « Fondamentaux du webdesign » : S6 Introduction, S10 Wireframe, Fil d'Ariane, Spécificités, Définition.
- 1544922 cours de web design en français, sans titre transcrit : L18-L20.
- 2649302 « Formation complète SEO : le référencement naturel de A à Z » : III · Structure.
- 417316 « Modern SEO » (Andy Williams) : S6, deux clics R88 [préférence], écarté.
- 1595266 « Design Rules » (Joe Natoli) : S6/L7-L8, positions contraires.

Frontières :
- Format des URL, mots-clés, maillage interne et silos : `seo`.
- Texte des pages, des erreurs et des boutons : `contenu-ecriture`.
- Maquette visuelle : `design-visuel`.
- Comportement clavier des menus : `accessibilite`.
- Champs des formulaires : `formulaires`.
- Recrutement et taille des séances : `ux-recherche-tests`.
- Qui rédige, le devis : `agence-projet-client`.
- Validation signée : `agence-projet-client`.
