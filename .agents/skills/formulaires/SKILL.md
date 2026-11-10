---
name: formulaires
description: Load in a web (firstmate-web) home when a page contains a form (contact, quote, sign-up, login or payment), before briefing its build and again before accepting it.
user-invocable: false
metadata:
  internal: true
---

# formulaires

Ce skill possède la structure, la disposition, la validation, l'envoi et la sécurité de tout formulaire, point d'entrée des prospects et sujet le plus contradictoire des cours.

## Quand charger

- Une page contient un formulaire (contact, devis, inscription, connexion, paiement) : avant le brief qui le construit ou le modifie, et avant d'accepter la maquette ou le site.

## Faire

### 1. Cadrer

- Toute l'attention, même pour un ou deux champs [3918934 S10 Formulaire, R86].
- Aussi court que possible, sans trop demander au début, champs inutiles supprimés [3491366 S7, P106 ; 1595266 S6/L8, P77].
- Tout rendre obligatoire fait abandonner [4013140 S4, R-28].
- Contact : message requis, téléphone facultatif mais vérifié s'il est rempli [805992 PHP/Projet, 89].
- Paiement : paiement en invité, sinon les gens abandonnent [412738 L166, P545].

### 2. Briefer la structure

- Un `<form>` avec action et method, qui marche sans JavaScript [3491366 S2, P10-P11].
- POST dès qu'il y a un mot de passe ou des données sensibles [3491366 S2, P16, P18].
- Sur chaque contrôle, un label relié par for = id et un name explicite, sinon rien ne part [3491366 S4, P51, P53 ; S6, P57].
- Un titre en tête qui dit le but du formulaire [3491366 S1, P107 ; 3769310 Formulaires, P145].
- Questions connexes groupées par fieldset et legend [3918934 S10 Formulaire, R88 ; 3491366 S4, P46-P47].
- Types email et tel, pour le clavier mobile [805992 PHP/Projet, 88].
- multipart/form-data dès qu'un fichier part [3491366 S2, P27].
- La saisie contrainte quand un format précis est requis [412738 L79, P286].
- Un `<button>` pour envoyer [3491366 S5, P74] [préférence].
- Ni reset, ni choix par défaut destructeur [3491366 S5, P73 ; 4013140 S4, R-67].
- Pas d'autofocus [3491366 S6, P63].
- Des contrôles conventionnels, jamais changés pour l'esthétique [3769310 Formulaires, P155].

### 3. Briefer la disposition

- Une seule colonne, libellés au-dessus [3918934 S10 Formulaire, R87] ; autre avis, au-dessus ou à gauche [1544922 L23, n°71] [préférence].
- Le libellé précède immédiatement son champ, aligné à gauche, visible pendant la saisie [412738 L83, P315 ; 3769310 Formulaires, P153].
- Le placeholder montre le format attendu, d'une date par exemple [3739678 S5, n° 60], disparaît à la saisie, se distingue de la valeur saisie [437398 S7 · CTA, R106 ; 3769310 Formulaires, P150, P151].
- Il est inutile si l'explication est au-dessus [4860984 N Amélioration du site, n°50].
- Son texte décrit sans instruire (« Prénom », pas « Entrez votre prénom »), sans jargon [5613976 MC·L16].
  Égalité avec 4280514 R59 (question, CTA ou exemple), deux règles non datées de cours dédiés : position gardée pour un champ de formulaire, au libellé visible.
- Au plus 5 ou 6 champs visibles à la fois [3769310 Formulaires, P159].
- Long, il passe en étapes avec barre de progression [3918934 S10 Formulaire, R88].
- Aucun lien qui invite à partir [3918934 S10 Formulaire, R89].
- Champs de même largeur, ou dont la somme égale les longs ; bouton plus court, de même hauteur [1595266 S6/L14, P110-P112].
- Zone d'erreur de hauteur fixe, pour que rien ne bouge [805992 PHP/Projet, 84].
- États maquettés : défaut, focus, erreur, lecture seule, désactivé [3769310 Formulaires, PR9].

### 4. Briefer l'obligatoire et les erreurs

- Un champ optionnel le dit dans son libellé ; le requis porte un astérisque ou « requis », lié au contrôle [3491366 S9, P108, P109], et une mention explique l'astérisque [805992 PHP/Projet, P7].
- Autre avis : marquer la minorité, requis ou facultatifs [3769310 Formulaires, P154] [préférence].
- Règles de saisie annoncées avant la tentative, retour en direct [4013140 S4, R-88 ; 3918934 S10 Formulaire, R93 ; 412738 L79, P287].
- Rien en rouge à l'arrivée : l'erreur s'affiche une fois la saisie commencée [3491366 S7, P112].
- `:user-invalid`, invalide à la perte du focus, était peu supporté [3491366 S9, P127] [daté : valeur à vérifier au moment du projet].
- Erreurs signalées avant l'envoi, un message général plus un par champ [3739678 S4, n° 43 ; 3769310 Formulaires, P157].
- L'erreur change la structure : icône, bordure plus épaisse ou barre [3012636 S4, R35] ; autre avis, fond vert ou rose [3491366 S7, PR15].
- Erreur et aide sous le libellé, avant le champ [3012636 S4, R37] ; autre avis, après le champ dans les démonstrations [3491366 S9, PR20].
- Saisies gardées en cas d'erreur [805992 PHP/Projet, 85 ; 4013140 S4, R-89].
- Le bouton reste désactivé tant que le formulaire n'est pas rempli [3769310 Formulaires, P140, P145].
- Autre avis : retirer plutôt que griser [4013140 S4, R-66] ; retenu 3769310 : cours dédié (section consacrée aux formulaires) avant simple mention.

### 5. Briefer l'envoi et la sécurité

- Validation côté navigateur pour l'expérience, côté serveur toujours [3491366 S10, P131-P132 ; 805992 PHP/Projet, 87].
- Le serveur renvoie une erreur par champ ; front et back s'accordent sur les paires name:value [3491366 S12, P142, P9].
- Envoi en AJAX, sans rechargement qui ramène en haut [805992 PHP/Projet, 94].
- Chaque envoi efface les erreurs précédentes ; après succès, remerciement et champs vidés [3491366 S12, P143 ; 805992 PHP/Projet, 83, 85].
- L'email reçu a le visiteur en Reply-To [805992 PHP/Projet, 92].
- Chaque entrée est nettoyée côté serveur, l'adresse d'envoi est en HTTPS [805992 PHP/Projet, 86 ; 3491366 S12, P141, P140].
- Un champ hidden ou password ne protège rien [3491366 S5, P65, P67].
- autocomplete à off pour le code de carte [3491366 S2, P32].
- Un message d'erreur trop précis aide un pirate : le valider avec un développeur [3012636 S4, R38].
- Jamais de mot de passe par un formulaire Netlify [437398 S9, R122].

### 6. Accepter

- Chaque cas d'erreur est maquetté puis testé [3918934 S10 Formulaire, R91].
- L'envoi est testé en ligne : en local, l'email part mal [805992 PHP/Projet, 93, P7].
- En gris, une erreur ne ressemble pas à une aide [3012636 S4, P5].
- Un point manquant des étapes 2 à 5 renvoie le travail au worker [autorité firstmate].

## Refuser ou remonter

**Capitaine**
- Données personnelles collectées et mention légale : conditions, confidentialité, RGPD [3769310 Formulaires, P145] [daté : valeur à vérifier au moment du projet].
- Service payant d'envoi ou de paiement, engagement envers un tiers, ajout ou retrait d'un champ voulu par le client [autorité firstmate].
- Anti-spam, captcha, CSRF : aucun cours ne les traite, chaque cas remonte [carte, section 5].

**Firstmate** [autorité firstmate] : fixe champs, requis et étapes dans le brief ; refuse ce qui viole les positions retenues.

**Worker** : choisit types, attributs et code de validation dans ce cadre [3491366 S10, P133].

**Refus nets**
- Jamais de validation côté navigateur seule [805992 PHP/Projet, 87 ; 3491366 S10, P132].
- Jamais le placeholder comme libellé [3491366 S4, P60 ; 3769310 Formulaires, P153 ; 3918934 S10 Formulaire, R87].
- Jamais la couleur seule pour le requis ou l'erreur [3491366 S9, P109 ; 3012636 S4, R35].
- Jamais de mot de passe en GET [3491366 S2, P16].

## Références

Cours sources :
- 3491366 « Web Forms » : S1-S12.
- 805992 « Développement web » : PHP/Projet.
- 3769310 « Usability » : Wrapping up > Formulaires.
- 3918934 « Fondamentaux du webdesign » : S10 Formulaire.
- 1544922 web design généraliste : L23.
- 1595266 « Design Rules » : S6/L8, S6/L14.
- 4013140 « UX Audit » : S4.
- 3012636 « How To Design for Accessibility » : S4.
- 412738 « UX & Web Design Master Course » : L79, L83, L166.
- 437398 « Build Responsive Real-World Websites » : S7, S9.
- 4860984 formation Figma : N.
- 3739678 « Accessibilité web » : S4, S5.
- 5613976 « UX Writing » : MC·L16 ; 4280514 « UX Writing » : Placeholders.

Frontières :
- Texte des libellés, messages et boutons : `contenu-ecriture`.
- Contraste, cibles, focus : `accessibilite` ; 3491366 retire le contour de focus, ne pas le reprendre.
- Style visuel des champs : `design-visuel` ; extension, serveur, service d'envoi, HTTPS : `construction-web` ; mesure de l'abandon : `ux-recherche-tests`.
