---
name: identite-marque-logo
description: Load in a web (firstmate-web) home when a client has no usable brand identity or asks for a logo or brand guidelines, before briefing their creation, and again before each presentation of logo concepts to the client.
user-invocable: false
metadata:
  internal: true
---

# identite-marque-logo

Ce skill possède l'identité de marque : brief, logo, système de logo, palette et typographie de marque, charte, kit de fichiers.
L'identité est un livrable distinct du site, créé seulement quand le client n'en a pas.
Elle se crée aussi quand l'issue « remplacer » de `agence-projet-client` point 1.10 est retenue [décision du capitaine, 10 novembre 2026].
Firstmate s'en sert pour briefer le worker et pour vérifier chaque livraison, dans l'ordre ci-dessous.

## Quand charger

- Le client n'a pas d'identité exploitable.
- Le client demande un logo, sa reprise ou une charte.
- Avant de briefer la création d'une identité.
- Avant chaque présentation de concepts au client.

## Faire

### 1. Partir de l'existant

1. Récupérer l'existant du client (logo, couleurs, polices, sources) : `agence-projet-client`.
2. Une petite entité n'a souvent qu'un logo et une ou deux couleurs : on les développe [3918934 S6 R32].
3. Logo et icônes se font en vectoriel [3918934 S10 Logo R160].

### 2. Brief de marque

4. Pas de création sans les réponses du client [2401332 S10·L16 P112-P113].
5. Questionnaire, adapté à chaque client [2401332 S10·L16 PR1 ; 3543948 Système logo P2] :
   - mission en une ou deux lignes ;
   - public cible ;
   - principal concurrent ;
   - argument unique ;
   - niveau de prix ;
   - couleurs et styles à éviter ;
   - deux ou trois logos aimés ;
   - nom exact, signature, ® ou TM ;
   - mots qui décrivent l'entreprise ;
   - besoins autres que le logo ;
   - attentes et objectifs.
   - pour la couleur, le plus de mots-clés possible : frappant ou détendu, actif ou calme, bon marché ou cher, pastel ou franc, flashy ou authentique ; lieu et fréquence d'affichage [5313020 L35].
6. Demander explicitement les interdits [3543948 Logo R12].
7. Respecter les consignes du brief [3543948 Logo R13].
8. Relever les mots récurrents des réponses [3543948 Système logo R18].
9. La recherche précède tout visuel [3543948 Logo R10].

### 3. Direction de style

10. Deux ou trois stylescapes : au-delà le client se perd, un seul ne laisse pas de choix [3543948 Voix R39].
11. Noter l'artiste et le lien de chaque logo de référence [3543948 Photo R37].

### 4. Concepts

12. Carte de mots : nom au centre, mots du brief, un symbole par bulle [3543948 Manuel P7].
13. Ne vectoriser que les croquis lisibles et adaptés à la cible [3543948 Bonus R57].
14. Au moins un concept dans le style que le client aime [2401332 S10·L18 P119].
15. Trois niveaux : un concept sûr, un qui pousse, un audacieux [2401332 S10·L21 P121 ; 3543948 Bonus R83].
16. Le logo sert la cible, pas l'effet [3543948 Bonus R69].
17. Il évite les tendances : tiendra-t-il 2, 5, 10 ans ? [2401332 S5·L06 P42] [daté : exemples, valeur à vérifier au moment du projet].
18. Il tient en noir et blanc [2401332 S6·L07 P57].
19. Il se lit dans un carré de 48 x 48 pixels, en une encre [2401332 S5·L06 P40].
20. Traits et espacements épais ; dans le doute, plus épais [2401332 S10·L15 P14, S10·L19 P16].
21. Test de visibilité : au dézoom, chaque lettre et chaque objet restent lisibles [3543948 Bonus R60].
22. Le nom domine un peu ; la signature est plus petite sans être minuscule [3543948 Bonus R66].
23. Jamais deux polices trop proches [2401332 S10·L34 P67].

### 5. Premier tour

24. Trois concepts au plus ; plusieurs versions d'un concept restent permises [2401332 S10·L25 P123].
   Autre position : 3543948 R82 prépare deux à quatre idées ; retenu 2401332, cours dédié au logo.
25. Noir et blanc, et le dire dans l'email [2401332 S10·L20 P122].
26. Un concept par page, dans un PDF en RVB [2401332 S10·L25 P124, P103].
27. Deux ou trois phrases par concept : typo, icônes, lien avec mission et cible [2401332 S10·L25 P129].
28. Dire que ce n'est pas final [3543948 Bonus R88].

### 6. Système de logo

29. Après le choix seulement, perfectionner et caler sur grille [3543948 Bonus R77, R78].
30. Même rayon d'angle partout, crénage optique à l'œil [3543948 Bonus R79, R80].
31. Zone de protection en unités x, 2x en standard [3543948 Bonus R96].
32. Versions [3543948 Bonus P15] :
   - complète avec signature ;
   - standard ;
   - texte seul ;
   - icône seule ;
   - responsive (en-tête mobile, icône d'app, profils, 50 x 50 px) ;
   - alternatives (cercle, bannière, sceau).
33. Nommer chaque version et dire quand l'utiliser [3543948 Bonus R97].
34. Tester fond foncé, fond coloré, gris, filigrane, profil social ; un échec appelle une retouche [2401332 S10·L38 PR15].

### 7. Palette et typographie de marque

35. Trois couleurs au plus dans le logo [2401332 S10·L27 P60] [préférence].
36. Le système de marque décline nuances, tons et neutres [3543948 Bonus R123].
   Pas de contradiction avec la règle précédente : l'une vise le logo, l'autre la palette.
37. Construire la palette dans l'ordre [5313020 L35, L30] :
   - mots-clés du brief (point 5), puis sens des couleurs (point 38), puis schéma de teintes (`design-visuel`, « Couleur à l'écran ») ;
   - 4 à 7 couleurs : les principales avec au moins une variation de chaque teinte, les plus utilisées, les extrêmes (plus claire, plus sombre, plus saturée) ;
   - couleur principale et accents marqués, chacun à l'échelle de son usage ;
   - palette présentée au client et ajustée avant formes et composition ;
   - faite à la main : une palette générée ou d'utilisateurs sert au mieux d'inspiration, une tendance n'est pas une raison [5313020 L43] [préférence].
   Autre position : 5313020 L35, cours dédié à la couleur, fixe la palette avant les formes ; pour le logo, retenu 2401332, cours dédié au logo : concepts en noir et blanc d'abord (point 25).
38. Sens des couleurs, tel que le cours le présente : les sens associés sont des avis du formateur [préférence], les limites d'usage des règles [5313020 L06-L19] :
   - des probabilités, pas des certitudes : âge, culture, climat et genre les déplacent ; le formateur les dit prouvés sans citer de source [L06, L19] ;
   - le symbolisme change selon les pays : le vérifier pour chaque couleur retenue avant une marque ou une campagne [L19] ;
   - bleu : confiance et compétence ; seul, ou en site bleu et blanc, générique : ajouter une couleur plus énergique en contraste [L07] ;
   - rouge : attention, urgence, couleur d'appel à l'action ; fatigant en grande surface, risqué en couleur de marque unique [L08] ;
   - jaune : optimisme ; vif et saturé, jamais sombre ; petit accent plutôt que couleur principale [L09] ;
   - vert : nature, finance, très courant ; saturé sur un objet artificiel, « plastique bon marché » [L10] ;
   - orange : polarisant, rare hors jouets et alimentation, donc différenciant ; désaturé en grande surface [L11] ;
   - violet : luxe, seulement si l'offre est à la hauteur ; un peu, avec noir, blanc, gris ou beige [L12] ;
   - rose : clair pour un public féminin, foncé pour un air moderne ; surutilisé, « cheap » [L14] ;
   - turquoise : frais, sous-utilisé ; avec des couleurs peu saturées [L15] ;
   - brun, gris, noir, blanc : fonds et soutiens ; seuls, ternes ou sans attrait [L13, L16-L18].
39. Tester chaque couleur sur fond clair et foncé [2401332 S10·L38 P59 ; 5313020 L30].
40. Donner RVB, CMJN, hex, et Pantone en option, arrondis [3543948 Bonus R125].
41. Fixer les combinaisons autorisées et interdites [3543948 Bonus R128].
42. Typographie : tailles, graisses, interlignage, alignement et césure spécifiés par niveau [3543948 Bonus R103, R111].

### 8. Présentation finale

43. Le second tour est final ; un troisième ou quatrième tour de petits changements reste possible [2401332 S10·L26 P136].
44. Contenu : versions, fonds, palette en hex, grille, applications, textes [2401332 S10·L39 PR16].
45. Expliquer le logo d'abord [3543948 Bonus R149].
46. Mockups, dont au moins une application numérique [2401332 S10·L39 P135 ; 3543948 Bonus R153].

### 9. Kit de fichiers

47. Toujours une version vectorielle [2401332 S10·L19 P88].
48. PNG transparents de toutes les versions [2401332 S10·L42 P106].
49. CMJN pour l'impression, RVB pour l'écran, en dossiers séparés [2401332 S10·L42 P105].
50. Jamais de JPEG à l'impression [2401332 S10·L42 P109].
51. PNG d'impression au-dessus de 300 PPI [2401332 S10·L42 P107] [préférence] [daté : valeur à vérifier au moment du projet].
52. Le client ne doit jamais redemander un fichier [2401332 S10·L40 P111].

### 10. Charte

53. Elle dit ce qui est visuellement permis et ce qui ne l'est pas [3918934 S6 R31].
54. Elle est technique, claire, concise, intemporelle [3543948 Bonus R166, R167].
55. Contenu : mission, versions, mauvais usages, espacement, couleurs, typo [3543948 Bonus P25, R164].

## Refuser ou remonter

**Capitaine**
- Nom légal, ® ou TM [2401332 S10·L16 P117].
- Manuel, facturé en plus [3543948 Bonus R163].
- Pantone, une plaque d'impression de plus par couleur [3543948 Bonus R126].
- Toute dépense et tout envoi au client [autorité firstmate].

**Firstmate** [autorité firstmate]
- Vérifie le brief avant la création.
- Fixe le nombre de stylescapes et de concepts.
- À la réception, refuse une livraison qui échoue à l'une de ces listes : tests du logo (points 18 à 21), tests des versions (point 34), kit de fichiers (points 47 à 52), charte (points 53 à 55).
- Renvoie le hors-périmètre à son propriétaire.

**Worker** [autorité firstmate]
- Croquis, typos essayées, ordre des concepts.
- Retouches issues des tests.

**Refus nets**
- Jamais copier une référence [2401332 S10·L21 P92].
- Jamais de couleur au premier tour [2401332 S10·L20 P122].
- Jamais un logo qui dépend de la couleur [2401332 S5·L06 P39].
- Jamais de stylescape d'œuvres d'autrui rendu public [3543948 Voix R36].

## Références

**Cours sources**
- 2401332, « Logo Design Mastery » : entier.
- 3543948, « The Branding Masterclass » : entier.
- 3918934, « Fondamentaux du webdesign (français) » : S6 Introduction, S10 Logo & charte graphique.
- 5313020, « the color class », cours dédié à la couleur : L06-L19, L30, L35, L43.

**Frontières**
- Voix, ton et langage de marque : `contenu-ecriture`.
- Règles photo : `photographie-web`.
- Palette à l'écran, typographie web : `design-visuel`.
- Contrat et devis : `agence-projet-client`.
- Persona et analyse concurrentielle : `ux-recherche-tests`.
- Ratios de contraste : `accessibilite`.
- Export web des images : `performance-web`.
- Favicon : `construction-web`.
