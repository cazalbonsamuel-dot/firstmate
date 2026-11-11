---
name: design-visuel
description: Load in a web (firstmate-web) home before briefing a visual direction, a mockup or a design system for a site, and before accepting a mockup for handoff to integration.
user-invocable: false
metadata:
  internal: true
---

# design-visuel

Ce skill possède le passage de la structure validée à la maquette acceptée et remise à l'intégration : composition, grille, typographie web, couleur à l'écran, composants, design system, passation.
Il existe parce qu'aucune décision visuelle ne doit être arbitraire [1595266 S1/L1 P8].
Firstmate s'en sert pour briefer le worker, puis pour juger sa maquette.

## Quand charger

- Avant de briefer une direction visuelle, une maquette ou un design system.
- Avant d'accepter une maquette et de la remettre à l'intégration.

## Faire

[préférence] marque un avis du formateur ; [daté : valeur à vérifier au moment du projet], une valeur à vérifier au moment du projet.
Une contradiction se tranche par règle avant préférence, non datée avant datée, cours dédié avant mention ; l'autre position suit. À égalité, « Égalité : » donne les positions et firstmate choisit à l'admission du projet.
Une décision du capitaine passe avant une règle de cours, car elle a été éprouvée sur un vrai projet où les seules règles des cours ne convainquaient pas ; la règle de cours reste citée [décision du capitaine, 11 novembre 2026].

### 1. Vérifier les entrées

- Le design part du wireframe validé [412738 L87 P364].
- Le contenu guide le design, jamais l'inverse [437398 S7 R91].

### 2. Briefer la direction visuelle

- Le brief dit pour qui l'on conçoit [412738 L74 P257] : utilisateurs, spectateurs ou lecteurs [P254-P256].
- Chaque couleur, image et police sert les objectifs et le public [412738 L75 P260] ; le sens des couleurs : `identite-marque-logo` point 38.
- Le brief fixe une personnalité de site qui guide chaque ingrédient [437398 S5 R47, R77] [préférence].
- Le design ne doit pas être générique : si un autre logo y marche aussi, il l'est [412738 L74 P258].
- On regarde de vrais sites de référence, on dit ce qui produit leur effet et on en adapte l'esprit, sans copier texte, image, code ni mise en page [décision du capitaine, 11 novembre 2026].
  Autres positions : ne partir ni du travail d'autres designers ni des tendances [1595266 S1/L2 P16, P18] ; ouvrir 20 à 50 sites et adapter [437398 S5 P9, R78] [préférence] ; retenue la décision du capitaine, les tendances restant écartées.

**Charte de l'agence** : des principes, pas un modèle ; critères de tout brief et de toute réception [décision du capitaine, 11 novembre 2026].

- Un site moderne tient trois choses, dans cet ordre :
  - l'image d'abord : une grande image ou un grand visuel occupe l'écran, le texte l'accompagne ;
  - une ambiance choisie : des couleurs décidées franchement, reconnaissables d'un coup d'œil ;
  - le calme : peu de choses par écran, de l'air, pas de boîtes.
- Du souffle : une page tout entière sombre fatigue ; quand l'ambiance est sombre, la page respire, par exemple par des écrans plus clairs ; la façon de donner du souffle se décide à chaque projet.
- Moderne n'est pas à la mode : les effets spectaculaires vieillissent vite et gênent souvent le visiteur.
- Le socle est obligatoire mais jamais suffisant : téléphone d'abord et juste à toutes les tailles, lisible par tous, rapide, utilisable au clavier, tout ce qui est écrit vrai et venu du client, l'action toujours à portée.
- Ce qui rend un site mauvais :
  - des images pauvres ;
  - tout est petit, rien ne s'impose ;
  - des boîtes, cartes à contour et ombre partout, comme un formulaire ;
  - on explique au lieu de donner envie ;
  - une ambiance timide, du beige par prudence ;
  - un rythme monotone, chaque section de la même forme ;
  - une action énorme ou en bloc de couleur, ou à l'inverse une action réduite à un texte qu'on ne remarque pas ;
  - des textes bateau, qu'un concurrent pourrait signer (`contenu-ecriture`) ;
  - une page si dépouillée qu'elle fait vide : épuré veut dire peu de mots et des écrans pleins.
- Le premier écran fait passer à l'action dont ce client vit (appeler, réserver, demander un devis, venir sur place) : l'image et le titre dominent, l'action ressort dès le premier écran par un vrai bouton bien visible, sans devenir un bloc écrasant ; ce qu'il dit : `contenu-ecriture`.
- Chaque site est différent :
  - chaque client a sa propre ambiance, tirée de son métier, de son lieu et de sa marque : ses images, ses couleurs, son ton ;
  - on ne reprend jamais la palette, les polices ni la mise en page d'un site précédent, et aucun site passé ne sert de gabarit ;
  - le nombre, l'ordre et la forme des écrans viennent du contenu du client ;
  - les choix faits pour un site (tout sombre ou tout clair, alternance, défilement écran par écran, dessin plutôt que photo) se redécident à chaque projet.
- Si le défilement écran par écran est retenu, chaque écran se conçoit pour tenir dans la fenêtre, téléphone et écran peu haut compris ; ses garde-fous : `construction-web`.
- On ne quitte une convention que sur preuve d'une expérience nettement meilleure [412738 L94 P446].

### 3. Poser le design system avant les pages

- Un design system se crée même pour un petit site [4860984 N n°52].
- Un élément réutilisé devient un composant [4860984 N n°59].
- Un style par niveau de texte, partout le même [3918934 S8 R48].

**Grille et espacements**

- La largeur du document se fixe dès le début ; la hauteur suit le contenu [1544922 L57 n°39].
- La grille web a 12 colonnes [4860984 N n°15].
- Les espacements sont des multiples de 8, avec 4 et 12 permis ; aucun pixel au hasard [4860984 N n°11].
  L'échelle 2, 4, 8, 12, 16, 24, 32, 48, 64 px y entre [437398 S5 R69] ; 1544922 prend des valeurs libres [L24-L30].
- Beaucoup d'espace entre sections, moins entre groupes, peu entre petits éléments [437398 S5 R67].
- Aucun espacement ambigu, comme un titre à égale distance de deux sections [437398 S5 R68].

**Typographie**

- Deux familles au maximum [1595266 S6/L38 P247 ; 437398 S5 R49].
  Autres positions : trois « grand maximum » [1544922 L21 n°48] ; une par page [417316 S8 R136].
- Les tailles viennent d'une échelle prédéfinie [437398 S5 R50].
- Texte courant de 16 à 32 px, long texte de 20 px ou plus, graisse jamais sous 400 [437398 S5 R51 ; 4860984 N n°41].
  Autre position : 10 à 14 px [1544922 L29 n°50] [daté : valeur à vérifier au moment du projet].
- Moins de 75 caractères par ligne [437398 S5 R51].
  Autre position : environ 60, 30 à 40 sur mobile [1595266 S6/L38 P250] [daté : valeur à vérifier au moment du projet].
- Égalité :
  interligne de 1,5 à 2, de 1,1 à 1,2 pour les gros titres [437398 S5 R51] ;
  interligne d'environ la moitié de la hauteur des caractères [1595266 S6/L38 P258] ;
  interligne de 0,5 à 1,5 fois la hauteur d'une ligne de texte [1544922 L21 n°44] ;
  firstmate choisit à l'admission du projet et l'écrit dans le brief.
- Texte aligné à gauche, jamais justifié ; seuls de très petits blocs se centrent [437398 S5 R52].
- L'écart entre paragraphes dépasse l'écart entre lignes [1595266 S6/L37 P245].

**Couleur à l'écran**

- La couleur est fonctionnelle ; « elle a l'air jolie » est la mauvaise raison [1595266 S6/L25 P178].
- Système minimal : une couleur principale, des gris, puis un accent, en teintes claires et foncées [437398 S5 R56].
- La palette du site vient de la palette de marque ; sans elle, elle se construit par `identite-marque-logo` point 37, avant la maquette [5313020 L35, L43].
- Au travail, on ne prend que dans la palette, en ne changeant que valeur et saturation : c'est le travail normal du worker [5313020 L30].
- Répartition 60-30-10 : 60 % d'un neutre (blanc, gris, noir), 30 % d'une couleur de contraste pour zones de texte et éléments, 10 % de l'accent le plus intense pour les appels à l'action et les détails [5313020 L31].
  Le cours la donne comme orientation fiable, pas comme règle ; chaque part peut être un groupe de couleurs quasi identiques sur deux des trois aspects teinte, valeur, saturation [5313020 L31].
- Site riche en images : un grand neutre et un petit accent là où l'on clique, ou des photos qui suivent la palette [5313020 L31].
- Peu de teintes : la variété vient de la valeur et de la saturation, pas d'une teinte de plus [5313020 L21].
- Toute couleur forte ajoutée se dompte : petite, désaturée, très sombre ou très claire ; plus il y a de couleurs, plus on dompte [5313020 L21].
- Un accent intense et petit sur un ensemble calme « marche toujours » ; en grande surface, une couleur vive se désature [5313020 L43, L08, L11].
- Au-delà de deux ou trois couleurs saturées, chacune a une raison d'être [5313020 L43].
- La valeur dirige l'attention mieux que la teinte ; on règle les valeurs avant de compter sur les teintes [5313020 L04, L38].
- Tout clair, l'œil va au sombre, et inversement ; sur un ensemble désaturé, il va au plus coloré [5313020 L04, L17].
- Pour faire ressortir un élément, on vérifie d'abord valeur et forme ; la saturation n'est pas nécessaire [5313020 L43].
- La couleur principale est celle du logo, par petites touches [3918934 S7 R39].
- Les couleurs exactes du logo ne couvrent pas de grandes surfaces : trop saturées [1595266 S6/L29 P206].
- On baisse la saturation jusqu'à ce que les bords ne vibrent plus (exemple : 86 % à 72 %) [1595266 S6/L29 P208] [daté : valeur à vérifier au moment du projet].
- Une palette imposée par le client se saisit en valeurs exactes [4860984 A n°36].
- Texte noir ou bleu foncé sur blanc, blanc sur noir ou gris foncé [5313020 L43] ; retenu 5313020, cours dédié à la couleur.
  Autres positions : ni noir pur ni blanc pur, le foncé est un gris teinté de la primaire [4860984 N n°28-n°29 ; 412738 L87 P377] ; le noir sur blanc est « le mieux » [417316 S8 R137].
- Fond sombre et mode sombre : gris foncé plutôt que noir pur ; le mode sombre se prévoit dans la palette et se teste [5313020 L18, L30].
- Beaucoup de couleurs saturées sur blanc peuvent fatiguer et font vite enfantin, un risque ; un fond noir ou gris foncé les porte sans fatiguer [5313020 L16, L17, L18].
- Le blanc sur noir n'est pas plus difficile à lire, c'est un mythe [1595266 S6/L31 P214 ; 412738 L83 P319].
- Les indices d'un même type ont la même couleur ; un changement d'état en a une autre [1595266 S6/L24 P166-P167].
- Un indice établi est respecté partout [1595266 S6/L47 P322].
- Les fonds de lecture sont clairs et désaturés ; le saturé reste un accent [412738 L87 P383 ; 1595266 S6/L24 P173].
- Deux couleurs voisines s'influencent : on les juge côte à côte et on les distingue par la teinte, la valeur et la saturation [5313020 L20].
- Les teintes suivent un schéma [5313020 L22, L29] :
  - analogue : 2 à 4 teintes voisines, un quart de roue au plus, le plus sûr [L24] ;
  - complémentaire : pour faire ressortir, une couleur domine et l'autre reste un petit accent [L25] ;
  - triadique : site minimal, une dominante et deux accents, jamais trois parts égales [L26] ;
  - split-complémentaire : pour se démarquer, une couleur principale et deux accents [L27] [préférence] ;
  - tétradique : plutôt en image qu'en aplats, au risque d'imiter Google ou Microsoft [L28] [préférence].
- Dégradés : par valeur, saturation ou teintes analogues, sur une plage courte ; jamais entre complémentaires ou teintes éloignées, au milieu gris et boueux ; un dégradé étendu compte dans la palette [5313020 L33].
- Une palette par page ou section perçue comme un tout ; jamais deux schémas qui se suivent au défilement : on change de page ou on passe lentement par des neutres [5313020 L41].
- L'intensité se garde pour les moments forts, jamais la plus forte en ouverture sauf choix voulu [5313020 L41] [préférence].

**Composants et boutons**

- Un bouton ressemble à un bouton [412738 L81 P294 ; 3918934 S10 R57].
- Primaire pleine, secondaire en contour, tertiaire sans bordure [3012636 S6 R92 ; 1595266 S6/L48 P327].
- L'action primaire garde même couleur et même place [1595266 S6/L46 P315].
- « Enregistrer » et « annuler » ne sont jamais deux boutons identiques [1595266 S6/L48 P325].
- Casse de phrase, la même partout [3012636 S6 R105].
  Autre position : libellés de boutons en majuscules [1595266 S6/L46 P314].
- Rayon : 0 sérieux, 3 à 6 px traditionnel, 100 % ludique, selon la marque [3012636 S6 R91].
  Autre position : jamais 15 px [1544922 L22 n°59] [daté : valeur à vérifier au moment du projet].
- Aucune carte à contour et ombre autour d'un contenu : il se pose sur la page [décision du capitaine, 11 novembre 2026].
  Autre position : ombres légères et rares, d'autant plus que le design est sérieux [437398 S5 R64] ; retenue la décision du capitaine, les boîtes ayant été l'un des pires défauts à l'essai.
- Ce qui n'est pas cliquable ne ressemble pas à un bouton [3012636 S6 R101].
- Hors formulaire, un objet inutilisable se retire plutôt que d'être grisé [4013140 S4 R-66] ; le bouton d'envoi indisponible d'un formulaire relève de `formulaires`.
- Un seul pack d'icônes, un seul style, même taille, même couleur [437398 S5 R62 ; 3918934 S9 R53].
- Un concept courant garde son icône établie [1595266 S6/L42 P289].
- Le carrousel d'accueil est une habitude à questionner [412738 L74 P251].
  Autres positions : « très dépassé » [1544922 L58] ; décrit sans réserve [437398 S6 R81].

### 4. Composer chaque page

- L'espace négatif suffit souvent à créer les groupes [1595266 S6/L9 P84].
- Ce qui est lié est proche, le reste est éloigné [1595266 S6/L20 P147].
- Dans le doute, tout s'aligne avec tout, bords droits compris [1595266 S6/L19 P145, P139].
- Un seul élément dominant, puis un ordre décroissant [1595266 S6/L15 P120].
- Le contenu se sépare des contrôles [1595266 S6/L47 P321].
- Chaque écran a un seul point focal évident [3769310 Wrapping up > Simplicité P70].
- Un design qui ne marche pas manque d'alignement, de proximité, de répétition ou de contraste [412738 L82 P310 ; 663850 S4 2.2.46].
- Motif en Z pour peu de contenu ; motif en F avec un élément convaincant dans le tiers supérieur [412738 L84 P327, P329].
- Pas de faux bas de page : le contenu suivant dépasse [412738 L86 P354].
  Exception, si le défilement écran par écran est retenu : chaque écran remplit la fenêtre [décision du capitaine, 11 novembre 2026].
- Le haut de page n'a pas d'avalanche de publicités [417316 S8 R142].
- Un texte sur image reste lisible grâce à un fondu sombre ou un fond flouté [4860984 A n°77].
- On conçoit pour le cas non idéal : un nom sur trois lignes [412738 L92 P436].

### 5. Décliner par écran

- On maquette au moins le desktop et le mobile [3918934 S10 R104], en maquettes distinctes [4860984 N n°73].
- Mobile first : le mobile d'abord, puis l'enrichissement [3918934 S10 R102].
  Autre position : les démonstrations partent du desktop [1544922 L34 ; 4860984 N Hero section].
- La taille des éléments ne change pas ; le nombre de colonnes diminue [1544922 L36 n°103].

### 6. Contrôler la maquette rendue

- La charte d'abord, écran par écran, à chaque taille : les trois choses du moderne tiennent, rien de « ce qui rend un site mauvais », aucune boîte à contour ou ombre, un site qui ne pourrait pas être celui d'un autre client ; le socle ensuite [décision du capitaine, 11 novembre 2026].
- Test du gris : en niveaux de gris, l'ordre d'importance tient [1595266 S6/L33 P228 ; 412738 L84 PR25] ; sur une capture d'écran, zones importantes, boutons et éléments restent distinguables [5313020 L38] ; la dépendance à la couleur se contrôle dans `accessibilite`.
- Couleur : parcimonie, hiérarchie renforcée, cohérence d'écran en écran, usage fonctionnel [1595266 S6/L25 P177].
- Erreurs de couleur à écarter : trop de couleurs ou de saturation, contraste de valeur faible, couleurs non décidées avant la maquette, tendance suivie au lieu d'une intention, palette générée [5313020 L43].
- La maquette soutient les objectifs, clarifie les options, donne une priorité claire et laisse prédire la suite [412738 L82 P309].
- On dézoome pour juger, puis on regarde à 100 % [4860984 N n°23-n°24].
- Fin de maquette : proximité, styles partout, multiples de 8, chaque bouton testé [4860984 N P6].
- Puis `accessibilite` contrôle la maquette avant toute acceptation.

### 7. Remettre à l'intégration

- Après validation, toutes les ressources de l'intégrateur sont prêtes [3918934 S10 R153].
- Seuls les styles de police utilisés sont fournis [3918934 S10 R154].
- Survols et animations se décrivent aux développeurs [1544922 L22 n°61].
- La section prête est marquée « Ready for dev » [4860984 A n°108] [daté : valeur à vérifier au moment du projet].
- Les améliorations proposées sont dites abandonnables [412738 L92 P438] [préférence].

## Refuser ou remonter

**Capitaine**

- Le choix de la direction visuelle remonte au capitaine, puis au client par `agence-projet-client` [autorité firstmate].
- Toute dépense remonte, comme une police payante [autorité firstmate].
- Tout écart à la charte du client remonte, avec `identite-marque-logo` [autorité firstmate].
- Modifier la palette présentée au client (ajouter, retirer ou remplacer une couleur, changer une teinte) remonte [autorité firstmate] : le cours veut tout changement de couleur coordonné avec le client et juge risqués même les ajustements de valeur ou de saturation [5313020 L35].
- L'habillage d'un site ancien n'est pas une charte : ce qui se garde suit l'issue choisie par `agence-projet-client` point 1.10 [décision du capitaine, 10 novembre 2026].

**Firstmate**

- Il fixe dans le brief la personnalité, la grille, les espacements, les polices et les couleurs [autorité firstmate].
- Il accepte ou refuse une maquette d'après l'étape 6 et `accessibilite` [autorité firstmate].
- Il fait vérifier toute valeur [daté] avant usage [autorité firstmate].

**Worker**

- Il choisit les valeurs dans les échelles fixées [4860984 N n°11].
- Il corrige dans le composant, jamais instance par instance [4860984 N n°58].

**Refus nets**

- Aucune décision visuelle arbitraire ; « cool » n'est jamais une justification [1595266 S1/L1 P8 ; 412738 L82 P308].
- Pas de décoration qui ne communique rien [412738 L82 P307].
- Une seule action primaire par zone [437398 S7 R97 ; 3012636 S6 R92, R100].
- Choix par défaut jamais destructeur : `formulaires`.

## Références

Cours sources :
- 1595266 « Design Rules » : S1/L1-L2, S6/L9-L48.
- 437398 « Build Responsive Real-World Websites with HTML and CSS » : S5, S6, S7.
- 1544922 web design sur Adobe XD, sans titre : L16-L36, L56-L58.
- 3918934 « Fondamentaux du webdesign » : S7-S10.
- 4860984 formation Figma, sans titre : N et A.
- 412738 « UX & Web Design Master Course » : L73-L94.
- 3769310 « Usability » : Wrapping up > Simplicité, Formulaires.
- 4013140 « The Simple Way to Conduct a UX Audit » : S4.
- 3012636 « How To Design for Accessibility: for UX Designers » : S6.
- 663850 BCS Foundation Certificate in User Experience : S4 Visual Design.
- 417316 « Modern SEO » : S8.
- 5313020 « the color class », cours dédié à la couleur : L04, L08, L11, L16-L18, L20-L22, L24-L31, L33, L35, L38, L41, L43.

Frontières :
- La structure, la navigation et les wireframes relèvent de `architecture-information`.
- La palette de marque relève de `identite-marque-logo`.
- Le contraste, les cibles, le focus et les états relèvent de `accessibilite`.
- Le contenu des images relève de `photographie-web`.
- Les formats d'export relèvent de `performance-web`.
- Le CSS relève de `construction-web`.
- Le texte des boutons relève de `contenu-ecriture`.
- L'affichage des erreurs relève de `formulaires`.
- La présentation des maquettes relève de `agence-projet-client`.
