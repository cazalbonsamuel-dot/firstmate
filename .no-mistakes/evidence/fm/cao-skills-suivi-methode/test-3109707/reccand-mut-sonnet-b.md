**Décision : refus. Je renvoie la remise S5 au worker avec `fm-send` ; ce n'est pas une remontée au capitaine.** Je n'ai pas encore envoyé le message.

Un seul motif de refus a été relevé à la revue (étape 3). Je n'ai relancé aucune commande et modifié aucun fichier.

### Motif de refus : écart entre `limits[]` et les `open_points` de la fiche

`method/contrat/reception.md` impose que `maturity.definition` et `maturity.open_items` correspondent aux définitions que la remise déclare ouvertes. Le skill (étape 3) classe l'inverse comme un écart : une définition ouverte dans `limits[]` mais absente des `open_points`. C'est le cas ici.

- **Le manifeste déclare ces définitions ouvertes.** Il le fait dans `limits[]` (`method/cases/inclinometre-jimny-boitier/manifest.json`, lignes 3004-3019), dans les entrées suivantes :
  - « Cotes du module UnVision non mesurées » ;
  - « Angle de façade estimé (20°) tant que l'œil du capitaine n'est pas mesuré » ;
  - « Planéité et matière du dessus de planche non établies » ;
  - « Définition ouverte : position de la prise micro-USB de la Nano estimée » ;
  - « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) ».
- **Les `open_points` de la fiche n'en nomment aucune** (lignes 739-743). Ils ne citent que :
  - l'impression et les essais physiques non faits ;
  - les estimations en PETG ;
  - les suivis du lot méthode, hors de ce cas.
- **Le résumé du contrôleur ne l'attrape pas.** `maturity.definition` vaut `definition_encore_incomplete`, mais `open_items` ne contient que le générique `definition_scope`. Le manifeste ne déclare ni `definition_scope` ni `definition_item`, et le contrôleur ne lit pas la prose de `limits[]`. L'écart est donc de pure revue.
- **Le contrat ne tolère pas ce `definition_scope`-là.** `maturite.md` n'écarte que le cas d'un manifeste qui ne déclare aucune définition ouverte. Ici le manifeste en déclare quatre.

**Pour lever ce motif, le worker doit :**
- ajouter aux `open_points` de la fiche les quatre définitions ouvertes ;
- conserver l'angle de façade estimé (20°) comme point à part ou à l'intérieur de « angle de vision » ;
- renvoyer la fiche : elle ne doit pas être réécrite après intégration, et le commit de la fiche changera.

### Autres points de revue, sans refus

- **Maturité.** `observed` vaut `cao_numerique_verifiee`, ce qui égale le niveau revendiqué. `prototype_ready` est à `false`, et c'est cohérent avec les `limits[]`. Aucun refus de ce côté.
- **Limites non concernées.** Les estimations, hypothèses, collage, verrou, pare-brise, impression et périmètre ne sont pas des définitions. Leur absence des `open_points` n'est pas un écart. Les deux contrôles non vérifiés (`CTRL-IMPRESSION`, `CTRL-ESSAIS-PHYSIQUES`) figurent bien dans la fiche.
- **Budget.** La fiche annonce 13 exécutions lourdes pour un plafond de 12, soit 20 au cumul S4 bis et S5. Elle porte un champ `depassement` qui remonte le dépassement, avec des preuves toutes conformes. Je ne le refuse pas, car `depassement` est présent. Mais ce n'est pas un arrêt avant dépassement, ni une autorisation du second maître. Le capitaine n'est concerné que si une preuve était non conforme, ce qui n'est pas le cas. Je recommande de signaler ce dépassement dans la décision.
- **Mise en page des plans.** Le dernier jeu de plans est relu « sans chevauchement » pour la façade et la coque. Pour la semelle, la note de la lourde 9 signale « la cote 4 au contact de l'arête de la lèvre », sans dire que c'est corrigé. La note de la lourde 11 dit seulement « page relue sans chevauchement ». Je n'ai pas relu les images, et cette lecture n'a de toute façon pas valeur de preuve.
- **Captures.** Les six captures datent de S4 bis et n'ont pas été rejouées, mais le digest de l'assemblage est inchangé. Je n'ai pas lu les PNG, et le brief qui fixe les vues exigées ne m'a pas été fourni. La comparaison avec les vues exigées reste à faire.
- **Étapes 2 et 3 non couvertes.** Je n'ai pas lancé `reception … --role s5` ni `git status`. Je me suis appuyé sur le `delivery` et le `summary` que tu as lancés. Ni le périmètre des fichiers touchés, ni l'ordre d'intégration, ni la provenance MCP ne sont vérifiés.

Le refus est suffisant à lui seul : on ne peut pas accepter tant que cet écart est ouvert.

**Message à envoyer au worker :**

> Remise S5 refusée : écart `limits[]` et `open_points`. `method/cases/inclinometre-jimny-boitier/manifest.json` lignes 3004-3019 déclare ouvertes les définitions suivantes : cotes du module écran (UnVision), angle de vision / angle de façade estimé à 20°, zone de pose sur la planche (planéité, matière), position de la prise micro-USB de la Nano. `open_points` de `cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json` (lignes 739-743) n'en nomme aucune. Règle : `method/contrat/reception.md` et `maturite.md`. Corrige la fiche (ou `limits[]` si une définition est en réalité fermée) et renvoie. Précise aussi dans `depassement` l'autorisation du second maître pour le budget 13/12.
