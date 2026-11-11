**Décision : refus, renvoi au worker.** Un seul motif, tiré de la revue de maturité (étape 3), et aucune requalification de ma part.

## Revue de maturité

- **`maturity`** : revendiquée et observée valent `cao_numerique_verifiee`. L'observé n'est donc pas en dessous du revendiqué, et `prototype_ready` est à `false`. Rien à refuser de ce côté.
- **`definition_scope`** : le manifeste n'en déclare pas (aucune occurrence dans `manifest.json`). Le `definition_scope` de `maturity.open_items` est donc l'item générique, pas un écart (`method/contrat/maturite.md`).
- **`limits[]` du manifeste** déclare ouvertes plusieurs définitions :
  - `manifest.json:3012` : « Définition ouverte : position de la prise micro-USB de la Nano estimée ».
  - `manifest.json:3019` : « définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) ».
  - `case_state` (ligne 5) reprend les mêmes quatre définitions.
- **`open_points` de la fiche** (`s5-2026-11-10.json:739-743`) ne nomme aucune de ces définitions. Les trois points sont :
  - impression et essais physiques non faits (`CTRL-IMPRESSION`, `CTRL-ESSAIS-PHYSIQUES`) ;
  - estimations en PETG ;
  - suivis du lot méthode hors du cas.
  Les deux premiers sont cohérents avec `unverified_controls` et `limits`. Mais aucune définition ouverte n'apparaît.

**Motif de refus** : `limits[]` déclare ouvertes quatre définitions (module écran, angle de vision, zone de pose, prise de la Nano) que la fiche ne nomme pas dans ses `open_points`. La règle de l'étape 3 (`method/contrat/reception.md`) qualifie cet écart de refus, même avec un contrôleur vert. Le contrôleur ne le voit pas, c'est un écart de revue.

## Ce qui n'est pas un motif de refus

- **Budget** : 13 exécutions lourdes pour un plafond de 12, mais la fiche porte un `depassement` explicite et aucune preuve n'est non conforme. Le refus « budget dépassé sans arrêt ni remontée » ne s'applique pas. Il reste à signaler au capitaine à titre d'information, ce n'est pas une décision 6.
- **`open_invalidations_before_execute`** : vide, comme S5 l'exige.
- **Avertissement FreeCAD** (`hasher mismatch`) : consigné par le worker, sans effet sur le résultat.

## Ce que je n'ai pas fait

Je n'ai pas relu les captures, les plans TechDraw ni la provenance MCP. Je n'ai pas lancé `reception --role s5`, ni `git status`, ni comparé les fichiers touchés au périmètre du brief. Le refus ci-dessus tient déjà seul. Une acceptation exigerait ces vérifications sur la remise corrigée.

## Message à envoyer au worker (`fm-send`)

> Remise S5 refusée à la revue de maturité (cao-reception, étape 3). `limits[]` du manifeste déclare ouvertes quatre définitions : cotes du module écran, angle de vision, zone de pose sur la planche, prise micro-USB de la Nano (`manifest.json` lignes 3012 et 3019). Les `open_points` de `outputs/remises/s5-2026-11-10.json` n'en nomment aucune. Aligne les deux : nomme ces définitions dans `open_points`, ou retire de `limits[]` celles qui sont réellement fermées, avec la preuve. Ne modifie ni `maturity` ni les critères. Re-pointe la fiche et le manifeste si tu les touches, et signale-moi quand c'est prêt pour une nouvelle réception.

Je ne peux pas envoyer ce message depuis ici : `fm-send` n'est pas disponible dans cette session.
