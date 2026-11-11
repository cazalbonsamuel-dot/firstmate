**Décision : je n'accepte pas la remise S5 en l'état.** Sur la maturité, la revue est sans écart. Le motif de refus est le budget.

Je n'ai pas lancé `reception` ni `git status` : `reception` rejoue `delivery`, que tu m'as interdit de relancer, et Bash est désactivé dans cette session. Je n'ai pas non plus relu les captures ni les plans TechDraw en image.

**Revue de maturité (étape 3) : aucun écart**
- **Maturité :** revendiquée et observée valent toutes deux `cao_numerique_verifiee`, donc pas de refus pour maturité observée sous le niveau revendiqué. `error_count` est à 0 et `failing_proofs` est vide.
- **Définitions ouvertes :** `summary` rend `definition_encore_incomplete`, `prototype_ready: false` et `open_items: ["definition_scope"]`. Le manifeste n'a effectivement pas de `definition_scope`. C'est cohérent avec `limits[]` et `open_points`, qui déclarent ouverts :
  - les cotes du module UnVision ;
  - l'angle de vision ;
  - la zone de pose sur la planche ;
  - la prise micro-USB de la Nano.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` apparaissent dans `summary` et dans les `open_points` (point 2), avec les limites « Impression non vérifiée » et « Aucune qualification physique ».
- **PETG au lieu de PC :** déclaré dans les deux (`open_points` point 3, `limits[]`).
- **Limites non reprises dans `open_points` (pas un refus) :**
  - Suzuki, écran à 70/80 °C sur une planche à 85 °C : choix du capitaine, déjà tracé dans `limits[]`.
  - Collage, verrou (PC) et pare-brise non vérifiés.
  - Enveloppes estimées.
  - C5 lu sans le ruban (49,56 mm contre 50,66 mm avec le ruban, décision du second maître consommée dans `decisions_consumed`).
- **Hors cas :** `open_points` (point 4) signale un `.FCBak` versionné sous `cases/electronique/cad/` et le décompte de cas de `method/README.md`. À traiter dans un lot séparé.
- **Chemins personnels :** aucun dans le dossier du cas.
- **Captures :** les 7 PNG et leurs `.json` sont présents.

**Motif de refus : budget** (contrat, « budget dépassé sans arrêt ni remontée », avec §13 « Budget par brief » et `method/iteration_budget.json`)
- **Plafond de 12 :** la fiche déclare 13 exécutions lourdes pour un plafond de 12, soit 11 passes TechDraw, `check_all.sh` et `delivery --execute`. Le cumul S4 bis plus S5 est de 20.
- **Texte `depassement` :** il dit seulement « dépassement remonté ici ». Le contrat exige qu'il cite l'autorisation du second maître, ou l'arrêt et la remontée. Il ne cite ni l'un ni l'autre, et le worker a continué sans s'arrêter.
- **Plafond par jeu de pages :** `max_techdraw_runs_per_page_set` vaut 2 par défaut. La fiche montre 4 passes pour la façade, 4 pour la semelle et 3 pour la coque. Elle ne déclare pas ce compteur et ne justifie pas de relèvement. Je n'ai pas le brief S5 sous les yeux pour vérifier s'il l'avait relevé.
- **Raison des reprises :** le worker dit que les reprises ne corrigeaient que des chevauchements relus en image, preuves déjà conformes.

**Suite**
1. **Renvoi au worker par `fm-send` :** il corrige les champs `budget` de la fiche (compteur par jeu de pages, plafonds réels du brief, `depassement` factuel). Il ne doit pas inventer d'autorisation que je n'ai pas donnée. Cette correction ne touche aucun artefact, donc aucune réexécution lourde.
2. **Remontée au capitaine :** le dépassement non autorisé de budget relève de la décision 6 du §1, que le second maître ne tranche pas. Les preuves étant conformes, c'est une ratification à demander, pas un arrêt.
3. **Après correction :** je relance `reception ... --role s5` avec `--base 01b88f2`, puis la relecture des captures et plans (à confier à un worker de revue si besoin), puis `git status`. Je n'accepte qu'après cela.
