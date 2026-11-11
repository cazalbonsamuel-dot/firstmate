## Décision : renvoyer au worker (`fm-send`), pas d'acceptation

La remise est refusée sur un seul motif de refus ferme, un écart de maturité. Je ne l'ai pas requalifiée.

Je n'ai pas relancé `reception` ni lu les captures, les plans et la provenance MCP (hors de la demande). `reception` rejoue `delivery`, que tu m'as interdit de relancer. Son code de retour reste donc à confirmer avant toute acceptation, tout comme `git status`.

### Revue de maturité (étape 3)

**`maturity` : conforme.**
- Le niveau revendiqué est `cao_numerique_verifiee` et le niveau observé est le même, donc aucun refus de ce côté.
- `prototype_ready` vaut `false`, déclaré honnêtement.
- La définition reste `definition_encore_incomplete`, ce que `maturite.md` admet.

**Motif de refus : écart entre `open_items` du contrôleur et `open_points` de la fiche.**
- Le contrôleur ne remonte qu'un seul item ouvert : `definition_scope`.
  - Le manifeste n'a pas de clé `definition_scope`. Le contrôleur lit donc « Périmètre et définitions critiques non établis » (`method/check_method.py:496-498`).
  - Ce chemin n'est pas une erreur : `maturite.md` l'admet pour un manifeste sans `definition_scope`.
- Ni les `open_points` de la fiche, ni `limits[]` ne nomment cet item. Aucun des deux ne dit que le périmètre et l'inventaire des items critiques ne sont pas établis.
- Dans l'autre sens, `limits[]` et `open_points` nomment des définitions précises que le contrôleur ne voit pas : module UnVision, angle de vision, zone de pose, prise de la Nano. Cette divergence n'est pas nommée non plus.
- L'étape 3 du skill compte cet écart dans les deux sens.

**Points à aligner dans le même renvoi.**
- `limits[]` déclare des enveloppes estimées (encodeur et bouton, supports de LED, fiche et câble USB, réserves de câblage). Les `open_points` ne nomment que l'écran et la Nano.
- `limits[]` déclare le pare-brise non modélisé et le passage du câble USB non vérifié. Les `open_points` n'en disent rien.
- Les autres éléments concordent :
  - Nano, angle de vision et module écran sont dans les deux.
  - `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont nommés.
  - La mention PETG est présente.

### Budget : pas un refus du contrat, à signaler

- La fiche porte `depassement` : 13 exécutions lourdes contre 12, et 20 au cumul S4 bis et S5. Le refus du contrat porte sur l'absence de `depassement`, qui est présent. Les preuves sont conformes, donc pas de remontée au capitaine (décision 6).
- Le texte ne cite ni autorisation du second maître ni arrêt du worker : il a continué jusqu'à 13. À toi de dire si le brief l'autorisait.
- `max_techdraw_runs_per_page_set` vaut 2 par défaut (`method/iteration_budget.json`). La fiche compte 4 passes pour la façade, 4 pour la semelle et 3 pour la coque, sans compteur dédié. Je n'ai pas le brief pour savoir si ce plafond avait été relevé.

### Quoi renvoyer au worker

1. Nommer dans les `open_points` de la fiche et dans `limits[]` l'item `definition_scope` du contrôleur (périmètre et inventaire des items critiques non établis). Y ajouter ce que `limits[]` déclare déjà : enveloppes estimées de l'encodeur, des LED et du câble USB, et pare-brise.
2. Toucher `limits[]` change le manifeste. Le worker doit donc re-pointer l'empreinte du manifeste dans la fiche, puis relancer `delivery` et `summary` sans `--execute`.
3. Ne pas rouvrir FreeCAD ni relancer `delivery --execute`.

Note sans valeur de preuve : la fiche signale la cote 4 de la semelle au contact de l'arête de la lèvre. À relire en image avec `method/guides/techdraw.md` pendant la revue des plans.
