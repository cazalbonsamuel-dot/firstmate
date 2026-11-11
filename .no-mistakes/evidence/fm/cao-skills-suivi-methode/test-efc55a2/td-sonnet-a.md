## Firstmate spec

**Unité.** Plans normatifs TechDraw de la pièce **coque** du cas `inclinometre-jimny-boitier` : un jeu de pages, une page `coque-p1`. Ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13.

**Règles et lecture.**
- Applique `method/worker.md`, puis le noyau du contrat de preuves, puis la colonne « Lire » de cette ligne :
  - §5 « Fabrication » du noyau, lu seul ;
  - `method/guides/techdraw.md` ;
  - `method/guides/freecad.md`.
- §15 du noyau : `techdraw.md` en reprend déjà le texte « Plans TechDraw ». Ne lis du §15 que ce que ce guide ne couvre pas.
- Ajoute le `README.md` du cas, la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`, et tes propres lignes du manifeste extraites par `jq`.
- Aucune autre lecture n'est ajoutée.

**Base.** Commit `01b88f2` de la branche du cas. Lance le worker avec `--base-branch` sur cette branche, car les artefacts gelés n'y sont pas sur la branche par défaut.

**Entrées gelées**, à ne pas modifier, vérifiées selon `method/worker.md` §3 :
- les fichiers gelés du cas à `01b88f2` : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/` ;
- `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, au digest qu'il a à `01b88f2`. Il est rouvert en lecture seule et jamais enregistré.

**Livrable.**
- Pour la page `coque-p1` : le SVG, le PDF et un `techdraw_report.json` en `verifie`, ainsi que les pages relues en image.
- Aucun FCStd modifié.
- Rien d'autre que ces plans n'est livré.

**Fichiers que tu possèdes.** Seul propriétaire du dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` :
- `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.

Dans le manifeste, seulement les lignes de ces quatre fichiers et la preuve `techdraw_report.json` que tu rejoues. Tu déclares dans ta fiche les preuves d'autres propriétaires que ce re-pointage invalide (`method/worker.md` §4).

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, suffixe `-2`, `-3` pour une remise suivante le même jour.

**Budget.**

| Compteur | Valeur |
|---|---|
| `max_techdraw_runs_per_page_set` | 2 (`method/iteration_budget.json`) |
| `max_iterations` | 2 (défaut 3, réduit : une seule page, spécification existante) |
| `max_heavy_runs_per_brief` | 3 (défaut 6, réduit : les 2 passes TechDraw y sont comprises, plus une relance après plantage) |

Déclare-les au schéma fixe du contrat. Un dépassement n'est permis que si le second maître l'autorise par écrit, et il se déclare dans `depassement`.

**Exécutions lourdes.**
- Chaque exécution TechDraw attend l'autorisation du second maître, qui te la transmet par `fm-send`. Sans autorisation, tu n'en lances aucune.
- Délai maximal par exécution : 600 s (`FREECAD_TIMEOUT_S=600`, soit environ 30 fois la durée attendue d'une vingtaine de secondes).
- Elles se font en série avec tout autre travail lourd du cas, sous le bail `freecad`.

**Commandes de remise.** Celles de `method/worker.md` §8 et du contrat (« Commandes du worker »). Le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_coque.sh`. Son rapport `outputs/check_coque.json` appartient à l'unité coque, tu ne le réécris pas.

**Points propres au cas.**
- La spécification `pages.json` existe déjà, au gel n°10 (rainure avec chanfreins de 0,5). Pars d'elle. Un changement de cote ou de vue qui toucherait une entrée gelée, ou une cote que le modèle ne tient pas, se remonte en `needs-decision`, jamais en valeur choisie.
- Un `techdraw_report.json` d'une exécution précédente est déjà présent à côté de la spécification (voir le guide).
- Trois vues : gauche (1:1), dessous (1:1), coupe B-B (3:2), et huit cotes à porter.
- Historique à connaître : sur ce cas, l'origine de coupe en x = 0 a déjà coûté trois passes. Le guide en décrit la règle.
- Hors périmètre : les plans de la façade et de la semelle (autres unités), les helpers `scripts/`, `method/`.

**Escalade.** Ce que le budget ne permet pas ou tout besoin de modifier un helper : arrête-toi en `blocked`, remonte au second maître, ne baisse pas la rigueur.
