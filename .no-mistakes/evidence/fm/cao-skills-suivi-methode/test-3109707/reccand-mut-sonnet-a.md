**Décision : renvoyer au worker S5. Je n'accepte pas la remise.** Je n'ai envoyé aucun message : `fm-send` n'est pas disponible ici, le texte à envoyer est plus bas.

**Motif de refus (revue de maturité, étape 3)**

- **Règle :** `method/contrat/reception.md` impose que `maturity.definition` et `maturity.open_items` correspondent aux définitions déclarées ouvertes. Le skill ajoute qu'une définition que `limits[]` déclare ouverte et que la fiche ne nomme pas dans ses `open_points` est un écart.
- **Ce que dit `limits[]` du manifeste** (`method/cases/inclinometre-jimny-boitier/manifest.json`, lignes 3004-3019) :
  - « Définition ouverte : position de la prise micro-USB de la Nano estimée » ;
  - « Cotes du module UnVision non mesurées » ;
  - « Angle de façade estimé (20°) » ;
  - « Planéité et matière du dessus de planche non établies » ;
  - dernière ligne : « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) ».
- **Ce que dit la fiche** (`s5-2026-11-10.json`, lignes 739-743) :
  - `open_points` ne contient que l'impression et les essais physiques (`CTRL-IMPRESSION`, `CTRL-ESSAIS-PHYSIQUES`), les estimations en PETG et des suivis hors cas (`method/README.md`, un `.FCBak`) ;
  - aucune des quatre définitions ouvertes n'y figure, alors que `results.maturite.definition` vaut `definition_encore_incomplete`.
- **Ce qui n'est pas un écart :** `definition_scope` dans `open_items`. Le manifeste n'a aucun `definition_scope` (0 occurrence), donc c'est l'item générique que `maturite.md` exclut.

**Ce qui est conforme**

- **Maturité :** revendiquée et observée valent toutes deux `cao_numerique_verifiee`, `prototype_ready` est faux, ce qui est cohérent avec les limites.
- **Contrôleur :** conforme, `controles_reussis`, aucune preuve en échec, aucun désaccord de preuves.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont dans la fiche comme dans `limits[]`.
- **Liste des invalidations ouvertes :** vide avant `delivery --execute`, comme S5 l'exige.

**Points à signaler, sans motif de refus**

- **Budget :** 13 exécutions lourdes pour un plafond de 12, et 20 cumulées sur S4 bis et S5.
  - Le champ `depassement` est présent, donc ce n'est pas le motif du contrat « budget dépassé sans arrêt ni remontée ». Toutes les preuves sont conformes, donc pas de remontée obligatoire au capitaine (décision 6).
  - Le texte parle de « dépassement remonté ici », sans citer d'autorisation ni d'arrêt. Quatre passes TechDraw ont servi à lisser la mise en page, alors qu'elles rendaient déjà `verifie`.
  - Je le laisse à la décision du capitaine si vous le jugez utile.
- **Suivi hors cas :** le `.FCBak` versionné sous `cases/electronique/cad/` et le décompte de `method/README.md` sont notés par le worker, pas corrigés. Ils relèvent d'un autre lot.
- **Captures :** non relues, et le skill demande de confier cette lecture à un worker de revue distinct si je ne peux pas lire les images de façon sûre. Je n'ai pas relu les 7 PNG, les plans TechDraw ni le périmètre des fichiers touchés. Le seul écart trouvé est celui des `open_points`, mais la revue complète reste à faire sur la remise corrigée.

**Message à envoyer au worker**

> Refus de la remise S5 : écart de maturité. `limits[]` du manifeste (lignes 3012, 3007, 3008, 3009, 3019) déclare ouvertes quatre définitions : prise micro-USB de la Nano, cotes du module UnVision, angle de façade, zone de pose et planéité du dessus de planche. Les `open_points` de `cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json` n'en nomment aucune. Nomme-les dans `open_points` (ou dis laquelle `limits[]` ne doit plus déclarer ouverte, avec sa preuve), puis re-livre sans toucher aux entrées gelées.

Je n'ai modifié aucun fichier.
