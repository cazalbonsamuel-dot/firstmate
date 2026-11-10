---
name: accessibilite
description: Load in a web (firstmate-web) home when scoping a client project, before briefing any mockup or build, before accepting any mockup or built site, and when a client is subject to an accessibility obligation or asks for a conformance level.
user-invocable: false
metadata:
  internal: true
---

# accessibilite

Ce skill possède ce qui rend un site perceptible et utilisable par tous, maquette et code, et sa preuve.
Il existe parce qu'un seul rôle qui oublie l'accessibilité rompt la chaîne [3739678 S5 n° 32, n° 94].

## Quand charger

- Au cadrage d'un projet, pour fixer le niveau visé.
- Avant de briefer toute maquette ou construction.
- Avant d'accepter une maquette ou un site construit.
- Quand un client est soumis à une obligation d'accessibilité ou demande un niveau de conformité.

## Faire

Marques : [préférence] avis du formateur ; [daté] valeur à vérifier au moment du projet.
Contradiction : règle avant préférence, non daté avant daté, cours dédié avant mention.

### 1. Cadrer le niveau

1. Au cadrage, faire fixer par le capitaine niveau visé et statut légal, avant tout brief [3739678 S5 n° 37, n° 79].
2. Proposer AA, niveau minimum accepté mondialement [2398160 The 3 Levels Of Conformance].
   Autre : « toujours viser AAA » [3012636 S3 R26] [préférence].
3. Niveaux cumulatifs : AA = critères A et AA [2398160 The WCAG 2.1 Principles] ; référentiel WCAG 2.1 [3739678 S5 n° 46] [daté : valeur à vérifier au moment du projet].
4. Par POUR, ne retenir que les critères pertinents [2398160 The POUR Principles].

### 2. Briefer le worker

1. Nommer ce skill et le niveau dans le brief de toute maquette ou construction [autorité firstmate] : l'accessibilité s'intègre dès le début [3012636 S1 R6].
2. Impliquer des personnes handicapées dès la collecte des besoins [663850 S2 2.2.6].
3. Exiger un rapport : chaque contrôle de l'étape 5, son outil, son résultat [autorité firstmate].

### 3. Contrôler la maquette

Contraste :
1. Classer chaque élément : porteur d'information (texte dans tous ses états, image de texte, icône autonome) ou décoratif et désactivé [3012636 S3 R13, R14].
2. Porteur d'information : au moins 4,5:1 [3012636 S3 R17].
3. Au moins 3:1 : gros texte (14 pt gras ou 18 pt), contrôles d'interface et leurs états, objets graphiques [3012636 S3 R18].
   Autre : gros texte = 18 px ou gras [437398 S5 WDR#2] ; retenu 3012636, cours dédié.
4. AAA : 7:1, et 4,5:1 pour le gros texte [3012636 S3 How to Check Color Contrast].
5. Désactivé, décoratif, photos, logos : aucune exigence, mais ce qui doit être vu reste visible [3012636 S3 R16, R19].
6. Exiger « pass » en texte normal et large, jamais « large text only » [2398160 Choose Accessible Colours].
7. Chaque couche d'un composant, focus compris, a 3:1 avec la suivante [3012636 S3 R28, R30].
8. Sur image, viser la zone la plus claire ou la plus sombre, car l'image se recadre [3012636 S4 R49, S6 R95].
9. Vérifier chaque couleur dès son choix, contre la vraie couleur de fond [3012636 S3 R23, R25].

Couleur :
1. Jamais la couleur seule pour informer, indiquer une action ou distinguer [3012636 S4 R32 ; 1595266 S6/L24 P171 ; 3739678 S5 n° 52].
2. Éviter d'abord rouge et vert [3012636 S3 R21].
3. Erreur, correct, incorrect : icône ou symbole en plus de la couleur [3769310 Wrapping up > Accessibilité P176 ; 1595266 S6/L25 P180].
4. Menu courant : forme, ligne, texte ou taille, à défaut 3:1 entre états ; un soulignement d'un pixel ne suffit pas [3012636 S4 R39, R41].
5. Survol conforme et indépendant de la couleur ; la main du curseur ne suffit pas [3012636 S4 R43].
6. Graphique : motifs à 3:1 avec la barre, description textuelle, tableau de données [3012636 S4 R50, R60].

Liens :
1. Soulignés dans un texte, gras quand autonomes [3012636 S7 R113].
2. Non souligné : 3:1 avec le texte autour, 4,5:1 avec le fond [3012636 S7 R120].
3. Survol et focus : deux styles distincts [3012636 S7 R121].
4. Un seul traitement partout ; soulignement et bleu réservés aux liens [3012636 S7 R125, R126].

Cibles et gestes :
1. Zone réactive d'au moins 44 x 44 px, même pour une icône plus petite [3918934 S10 Spécificités R109].
   Autre : 9 mm ou 48 px [1595266 S6/L8 P74] [daté : valeur à vérifier au moment du projet] ; retenu 44 px, non daté.
2. Cibles espacées [1595266 S6/L8 P76 ; 3918934 S10 Spécificités R110].
3. Aucune fonction accessible par un geste seul [1595266 S6/L7 P67].
4. Écran tactile : survol et tap [3012636 S4 R53 ; 3918934 S10 Spécificités R111].

Mouvement :
1. Rien ne clignote plus de 3 fois par seconde [3739678 S5 n° 55].
2. Une animation se met en pause et se relance [3739678 S5 n° 54].

Tests :
1. Test en niveaux de gris pendant la conception et à la fin : « que ne pouvez-vous plus identifier ? » [3012636 S4 R33, P4] ; une action principale qui disparaît trahit la dépendance à la couleur [1595266 S6/L33 P228] ; la hiérarchie en gris : `design-visuel`.
2. Simuler les daltonismes [1595266 S6/L25 P179].

### 4. Contrôler le site construit

Structure :
1. HTML5 sémantique d'abord, clavier natif compris ; ARIA seulement si HTML5 ne suffit pas [3739678 S5 n° 65-67].
2. `lang` sur `<html>`, et sur tout bloc d'une autre langue [2398160 Set The Page Language].
3. Lien « aller au contenu » avant tous les autres, vers l'ID du contenu principal ; visible au focus s'il est masqué [2398160 Bypass Repeating Content ; 3769310 Wrapping up > Accessibilité P180].
   Trois liens d'évitement au plus [2398160 Bypass Repeating Content] [préférence].
4. Un seul H1 ; aucun saut de niveau, sauf en fermant une section [2398160 Create Logical Headings].
5. Repères `header`, `footer`, `main` unique, `article`, `nav`, en plus du lien d'évitement [2398160 Add HTML5 Landmark Regions].
6. Lien pour aller quelque part, bouton pour une action [3828556 BONUS › Liens et boutons #67 ; 437398 S7 R96].

Clavier et focus :
1. Tout se fait au clavier [3739678 S5 n° 53 ; 3828556 BONUS › Liens et boutons #83].
2. Contour de focus stylisé, jamais supprimé sans remplacement [437398 S7 R108 ; 3828556 #84].
3. `tabindex` -1 et 0 seulement [2398160 Avoid An Artificial Tabindex ; 3828556 #86].
4. Menu hamburger fermé : liens à -1, puis 0 à l'ouverture [2398160 Avoid An Artificial Tabindex].
5. Nouvel onglet annoncé par un texte `sr-only` [3828556 BONUS › Liens et boutons #69].

ARIA :
1. Pas d'ARIA si possible ; sémantique native changée en dernier recours ; élément ARIA navigable au clavier ; aucun élément focusable caché ; tout élément interactif a un nom [3828556 BONUS › ARIA #87-#91].
2. Bouton sans texte : `aria-label` ou texte `sr-only` [3828556 BONUS › ARIA #93].
3. Référencer les textes existants (`aria-labelledby`, `aria-describedby`) ; `aria-live` assertive pour l'urgent, polite sinon [5613976 AC·L41].

Images et médias :
1. Chaque `img` a un `alt` [2398160 Decorative & Descriptive Images ; 437398 S2 R11].
2. Décorative : `alt=""` [2398160 Decorative & Descriptive Images].
   Autre : image de fond CSS avec `role="img"` et `aria-label` [437398 S7 R98] ; retenu 2398160, cours dédié.
3. Descriptive : ce qu'elle montre et pourquoi [2398160 Decorative & Descriptive Images] ; 5 à 15 mots, sujet, action ou émotion, jamais « image of », mots-clés naturels [5613976 AC·L40 P20].
   Autres : une courte phrase au plus [2398160] [préférence] ; 125 mots lus [3828556 #78] [daté : valeur à vérifier au moment du projet] ; retenu 5613976, règle.
4. Vidéo : transcription et sous-titres avec indices sonores [3739678 S5 n° 50 ; 5613976 AC·L39].

### 5. Prouver

1. F78 : focus clavier sur chaque élément ; attendu : il est clairement identifié [2398160 How To Assess Web Accessibility].
2. G130 : chaque titre identifie sa section [2398160 How To Assess Web Accessibility].
3. Lecteur d'écran, synthèse vocale, lisibilité, clavier seul, personnes handicapées, vérificateur [5613976 AC·L42 P21].
4. Outils : WAVE, axe, Lighthouse, Tenon [3739678 S5 À l'échelle du web] ; corriger ARIA, contraste, liens sans nom [3828556 BONUS › Faire un audit].
5. Tous les tests en vert [3828556 BONUS › Le contraste #95], l'outil automatique restant la dernière vérification, jamais la seule [3012636 S3 R24].

## Refuser ou remonter

**Capitaine**
- Niveau visé, AA proposé [3739678 S5 n° 37].
- Statut légal : RGAA 4 vise administrations, privés en mission de service public ou d'intérêt général, privés de 250 M€ de chiffre d'affaires en France [3739678 S5 n° 79] [daté : valeur à vérifier au moment du projet].
- Pour une cible : déclaration d'accessibilité, schéma pluriannuel de 3 ans au plus, plan d'action annuel [3739678 S5 n° 83] ; RGAA 4 = WCAG 2.1 A et AA, 106 critères [n° 87] [daté : valeur à vérifier au moment du projet].
- Toute dérogation pour charge disproportionnée [3739678 S5 n° 82].
- Pas un avis juridique : consulter un avocat [3012636 S1 note 1.1].
- Coût des tests avec des personnes handicapées [autorité firstmate].

**Firstmate**
- Critères pertinents par POUR [2398160 The POUR Principles].
- Acceptation d'un livrable selon les étapes 3 à 5, renvoi de tout livrable qui porte un refus net [autorité firstmate].

**Worker**
- Technique suffisante pour chaque critère [2398160 Types Of Sufficient Techniques].
- Couleur ajustée jusqu'au « pass » [3012636 S3 P2].

**Refus nets**
- Information portée par la seule couleur [3012636 S4 R32].
- Contour de focus supprimé sans remplacement [437398 S7 R108].
- `tabindex` positif [2398160 Avoid An Artificial Tabindex].
- Fonction par geste seul [1595266 S6/L7 P67].
- Image sans `alt` [437398 S2 R11].
- Clignotement au-delà de 3 fois par seconde [3739678 S5 n° 55].

## Références

Cours :
- 2398160 « Introduction to Web Accessibility WCAG 2.2 » : entier.
- 3012636 « How To Design for Accessibility » : S1, S3-S8.
- 3739678 « Accessibilité web : maîtrisez les notions clés » : entier.
- 3828556 « Le SEO pour les développeurs » : accessibilité, BONUS.
- 5613976 « UX Writing » : AC·L39-L42.
- 437398 « Build Responsive Real-World Websites » : S2, S5, S7.
- 1595266 « Design Rules » : S6/L7-L8, L24-L25, L33.
- 3769310 « Usability » : Wrapping up > Accessibilité.
- 3918934 « Fondamentaux du webdesign » : S10 Spécificités.
- 663850 « BCS Foundation Certificate in User Experience » : S2.

Frontières :
- `seo` : `<title>`, contenu des titres, mots-clés des pages.
- `formulaires` : libellés, groupes de champs, place des erreurs, champs obligatoires.
- `contenu-ecriture` : texte des liens, boutons et messages.
- `construction-web` : mise en page, unités, media queries.
- `design-visuel` : couleur à l'écran, typographie, hiérarchie des boutons.
- `ux-recherche-tests` : recrutement et nombre de participants.
