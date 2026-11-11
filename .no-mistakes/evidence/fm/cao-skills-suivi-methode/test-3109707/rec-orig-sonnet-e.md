**Décision : je n'accepte pas la remise S5 en l'état et je ne propose pas la suite vers `cao-livraison`.** Un seul motif de refus est établi, le budget. La revue de maturité, elle, est sans écart.

## Revue de maturité (étape 3)

- **Niveau :** `claimed` et `observed` valent tous deux `cao_numerique_verifiee`, `prototype_ready` est à `false`. `observed` n'est pas sous `claimed`, donc pas de refus de ce côté. Le contrôleur, `limits[]` et la fiche disent la même chose : pas de prototype prêt.
- **Définitions ouvertes :** le contrôleur affiche `definition_encore_incomplete` avec `open_items: ["definition_scope"]`. Le manifeste n'a pas de `definition_scope`, c'est le cas générique de `check_method.py:496`. Ce n'est pas un écart par rapport à la fiche.
- **Les quatre définitions que la fiche déclare ouvertes** (module UnVision, angle de vision, zone de pose, prise de la Nano) figurent aussi dans `limits[]`, avec le même libellé. Le détail est dans `docs/mesures-a-fournir.md`.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont `non_verifie` dans le contrôleur, dans `limits[]` et dans les `open_points`. C'est cohérent.
- **Deux mentions de `limits[]` absentes des `open_points` :** la planéité et la matière de la planche, et le pare-brise non modélisé.
  - La planéité fait partie de la ligne « zone de pose » de `mesures-a-fournir.md`, donc elle est couverte par le point « zone de pose ».
  - Le pare-brise n'est pas une définition ouverte. Le dossier le traite comme une vérification non faite (`dossier-conception.md:119`).
  - Je ne les retiens pas comme écart. C'est une lecture de ma part, le texte ne tranche pas.

## Motif de refus : budget (contrat, « Refus »)

- **Dépassement des exécutions lourdes :** la fiche en déclare 13 pour S5 contre un plafond de 12. Elle indique : « 12 exécutions lourdes annoncées pour S4 bis, aucune pour S5 ».
- **Ce que le contrat exige :** le champ `depassement` doit citer l'autorisation reçue du second maître, ou l'arrêt et la remontée (contrat, ligne 122 ; méthode §13).
- **Ce que la fiche dit :** « Dépassement remonté ici », c'est-à-dire dans la fiche elle-même, après coup. Aucune autorisation n'est citée et le worker ne s'est pas arrêté avant de dépasser. Le motif du contrat, « budget dépassé sans arrêt ni remontée », est donc établi sur le fond, même si le champ est présent.
- **Exécutions TechDraw par jeu de pages :** `method/iteration_budget.json` fixe un plafond par défaut de 2. La fiche en compte 4 pour la façade (lourdes 1, 2, 5 et 8), 4 pour la semelle (3, 6, 9 et 11) et 3 pour la coque (4, 7 et 10). Je n'ai pas le brief sous les yeux, donc je ne sais pas si ce plafond avait été relevé. Rien dans la fiche n'indique que ces passes ont été autorisées.

Les preuves sont conformes : contrôleur vert, aucune preuve non conforme. Ce n'est donc pas le cas « budget consommé sans preuve conforme » de la décision 6 du §1.

## Suite

- **Si je n'ai pas autorisé ce dépassement dans le brief :** je renvoie au worker par `fm-send`. Le point exact est `budget.depassement`, qui doit citer l'autorisation reçue ou l'arrêt et la remontée. Il ne doit pas inventer d'autorisation. Les passes TechDraw supplémentaires doivent aussi être justifiées.
- **Si le brief a relevé les plafonds :** l'écart disparaît et la remise peut être acceptée, sous réserve des points ci-dessous.
- **Si l'écart reste un vrai dépassement non autorisé :** je le remonte au capitaine plutôt que de le requalifier moi-même. Je ne baisse aucun critère pour accepter.

## Ce que je n'ai pas fait

- Je n'ai pas lancé `reception ... --role s5` : il rejoue `delivery` en interne et vous m'avez demandé de ne pas relancer `delivery`. Il reste donc à le passer pour la base, le rebase, les commits postérieurs, les fichiers hors du cas et les empreintes.
- Je n'ai pas fait la lecture des captures ni des plans TechDraw. Je n'ai pas non plus vérifié la provenance MCP ni les fichiers touchés par rapport au brief. Les six captures sont celles de S4 bis, non rejouées. Cette lecture doit être confiée à un worker de revue distinct du concepteur.
- Je n'ai pas fait `git status`. La copie était propre au départ et je n'ai rien modifié.
