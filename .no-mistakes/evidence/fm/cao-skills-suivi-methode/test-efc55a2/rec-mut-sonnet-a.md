Je fais la revue de maturité (étape 3) et j'ai lu la fiche, `limits[]` du manifeste, `reception.md`, `maturite.md` et la section « Refus » du contrat. Voici la décision.

## Revue de maturité

**`maturity` (conforme, pas un motif de refus)**
- Revendiqué `cao_numerique_verifiee`, observé `cao_numerique_verifiee`, donc pas de niveau observé en dessous du revendiqué.
- `prototype_ready: false`, ce qui est cohérent avec ce que la fiche et le manifeste disent.
- Le manifeste n'a aucun `definition_scope` (0 occurrence de `definition_scope`, `definition_item` ou `definition_aspect`).
- `definition_scope` dans `open_items` est donc l'item générique de `maturite.md`. Ce n'est pas un écart.
- Les `open_items` de `summary` sont `CTRL-IMPRESSION:non_verifie` et `CTRL-ESSAIS-PHYSIQUES:non_verifie`. La fiche les nomme bien dans `open_points[0]`. Aucun écart de ce côté.

**`limits[]` contre `open_points` (écart)**

`limits[]` déclare des définitions ouvertes que la fiche ne nomme pas :
- La ligne « Définition ouverte : position de la prise micro-USB de la Nano estimée ; l'ouverture est remontée de 0,73 mm… (gel n°10) ».
- La dernière ligne : « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) à mesurer par le capitaine (docs/mesures-a-fournir.md) ».

Les `open_points` de la fiche ne nomment aucune de ces quatre définitions :
1. Le premier point parle d'impression et d'essais physiques.
2. Le deuxième parle de l'estimation PETG.
3. Le troisième parle de suivis hors du cas.

Le skill traite une définition ouverte dans `limits[]` et absente des `open_points` comme un écart.

Les autres limites ne sont pas des écarts : estimations d'enveloppes, collage, verrou, pare-brise, angle estimé à 20°, C5 sans ruban, périmètre électronique. Ce sont des estimations ou hypothèses, pas des définitions ouvertes.

## Décision (étapes 4 et 5) : renvoyer au worker

**Motif de refus unique : écart de revue (étape 3), `limits[]` contre `open_points`.** Le contrôleur est vert, mais la revue trouve un écart, et le skill refuse sur ce motif.

À envoyer au worker (par `fm-send`, que je n'ai pas dans cet environnement) :
- Les `open_points` de `cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json` doivent nommer les quatre définitions ouvertes de `limits[]` : cotes du module écran, angle de vision, zone de pose sur la planche, prise micro-USB de la Nano.
- Ou bien `limits[]` et la fiche doivent être mis en accord par le worker dans son périmètre.
- Je ne corrige pas la fiche moi-même. Elle suit la branche de l'unité, donc le worker la corrige et cite le nouveau `commit`.
- Après correction, je relance l'étape 2 (`reception --role s5`) sur la nouvelle tête, puis la revue.

**Point à surveiller, que je ne retiens pas comme motif de refus**
- `budget.heavy_runs` est à 13 pour un plafond de 12, avec un champ `depassement`.
- Ce `depassement` ne cite ni autorisation du second maître ni arrêt. Il dit seulement « dépassement remonté ici », après coup.
- Le contrat exige l'autorisation reçue ou l'arrêt et la remontée (§13 de la méthode, que je n'ai pas relu).
- Je ne tranche pas ici si c'est un refus. Comme la preuve est conforme, c'est à toi de dire si tu l'acceptes, sans que je requalifie. Sinon, remonter au capitaine.

**Ce que je n'ai pas fait**
- Je n'ai pas relu les captures ni les plans TechDraw, parce que tu as limité la revue à la maturité.
- Je n'ai pas vérifié l'ordre d'intégration, la provenance MCP ni les fichiers touchés contre le périmètre du brief.
- L'acceptation de la remise S5 reste donc impossible tant que ces points ne sont pas faits et que l'écart ci-dessus n'est pas levé.
- Aucun fichier modifié.
