**Décision : je n'accepte pas encore, mais je ne refuse pas non plus la remise. La revue de maturité ne relève aucun écart, et `reception` n'a pas tourné, ce qui laisse la décision en attente.** Sans Bash dans cette session, je n'ai pu lancer ni `reception` ni `git status`. Étape 2 incomplète : `reception` est le contrôle des refus mécaniques (rôle `s5`, base `01b88f2`) et n'a pas été passé. Il faut donc le relancer, puis vérifier `git status`, avant d'accepter.

**Revue de maturité (étape 3)**
- **Niveau :** `summary` donne `claimed = observed = cao_numerique_verifiee`, avec cinq preuves natives retenues. Ce n'est pas un refus, puisque l'observé n'est pas en dessous du revendiqué. `prototype_ready` est à `false`, et la fiche, `case_state` et `limits[]` le disent tous trois.
- **Définitions ouvertes dans `limits[]` :**
  - cotes du module UnVision non mesurées ;
  - angle de façade estimé à 20° (œil non mesuré) ;
  - planéité et matière du dessus de planche non établies ;
  - prise micro-USB de la Nano estimée ;
  - la dernière limite récapitule ces quatre définitions.
- **Définitions nommées dans les `open_points` de la fiche :** cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano. Les quatre correspondent. Je n'y trouve aucun écart dans un sens ni dans l'autre.
- **`definition_scope` :** l'item de `maturity.open_items` est l'item générique d'un manifeste qui n'en déclare pas. Je n'ai trouvé aucun `definition_scope` dans le manifeste. D'après `method/contrat/maturite.md`, ce n'est pas un écart.
- **Autres limites :** enveloppes estimées, collage, verrou, PETG au lieu de PC, pare-brise non modélisé et électronique hors périmètre sont des estimations ou des hypothèses, pas des définitions. Elles n'ont pas à figurer dans les `open_points`.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont `non_verifie` avec raison, et la fiche les cite. Ils ne sont pas des écarts non plus.

**Motifs de refus du contrat, un par un**
- **Chemins personnels :** aucune occurrence de `/Users`, `/private/var` ou `/home` dans les JSON du cas ni dans le manifeste.
- **`delivery` et maturité :** `delivery` et `summary` sont verts (`ok`, `conforme`, 0 erreur, 0 avertissement). La liste des invalidations ouvertes est vide avant `--execute`, comme S5 l'exige.
- **Budget :** la fiche déclare 13 exécutions lourdes pour un maximum de 12, et porte un champ `depassement` qui l'explique. Le motif « dépassement sans remontée » ne s'applique donc pas. Aucune preuve n'est non conforme, donc la décision 6 du capitaine n'est pas en jeu.
- **Non revérifié :** les autres motifs mécaniques (manifeste, re-pointage, captures, rebase, commits postérieurs) relèvent de `reception`.

**Restes de la revue humaine**
- **Captures :** les sept captures de l'assemblage datent de S4 bis et n'ont pas été rejouées (digest identique). Je ne les ai pas relues, et je n'ai pas non plus relu les plans TechDraw, qui sont des SVG et des PDF.
- **Cote 4 de la semelle :** la fiche signale elle-même que la cote 4 reste au contact de l'arête de la lèvre. C'est à confirmer sur le plan.
- **Suites hors cas :** le décompte « sept cas » de `method/README.md` et le `.FCBak` versionné dans `cases/electronique/cad/` sont signalés comme suites hors de ce cas. Je ne les ai pas comparés au périmètre du brief, et ils ne motivent aucun refus. Ils relèvent de la sphère du capitaine ou d'un lot méthode.

**Prochaines étapes**
1. Lancer `reception` avec `--role s5` et `--base 01b88f2`, puis `git status` (j'ai ouvert un chemin 1 plus haut : le résultat décide de l'acceptation).
2. Si `reception` rend 0, la copie est propre et les captures et plans relus sont sans écart, j'accepte. La remise S5 continue alors avec `cao-livraison`.
3. Je ne renvoie rien au worker pour l'instant, faute de point précis en cause.
