## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce coque du cas `inclinometre-jimny-boitier`.
Applique `method/worker.md`, puis la colonne « Lire » de cette ligne : §5 « Fabrication » (lue seule), `method/guides/techdraw.md`, `method/guides/freecad.md`.
La méthode et le contrat de preuves font foi.
Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître, sans trancher.

**Base.** Commit `01b88f2` de la branche du cas.
Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce même commit.

**Livrable.** Un jeu de pages pour la coque : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié.

**Fichiers que tu possèdes.**
- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`. Tu en es le seul propriétaire.
- Leurs lignes dans `method/cases/inclinometre-jimny-boitier/manifest.json`, dont la preuve `PLAN-COQUE`.
- Ta fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`.

**Budget.**
- 2 itérations, réduites depuis les 3 par défaut : l'unité ne porte qu'un jeu de pages.
- 6 exécutions lourdes (`max_heavy_runs_per_brief`, valeur par défaut de `method/iteration_budget.json`, §13).
- Dans ces 6, `max_techdraw_runs_per_page_set` = 2 exécutions TechDraw pour ce jeu de pages.

**Exécutions lourdes.**
- Je les autorise dès le lancement, en série.
- Délai maximal d'une exécution TechDraw : 600 s (`FREECAD_TIMEOUT_S=600`).
- Délai maximal d'un contrôle natif du cas : le `timeout_s` de sa ligne `delivery_checks[]` du manifeste.

**Remise.** Commandes et fiche selon `method/worker.md` §8 et le contrat (« Commandes du worker », « Fiche de remise »).

**Points propres au cas.**
- Le dossier contient déjà un jeu livré le 2026-11-10 (une page A3 `coque-p1`, trois vues, huit cotes). Pars de sa spécification et garde ses huit cotes.
- Cotes serrées à garder lisibles :
  - rainure en queue d'aronde : jeu de 0,3 par face, chanfreins de 0,5 (gel n°10) ; embouchure 17,074 ; plafond 21,0392 ; hauteur 4,3 ;
  - ouverture micro-USB : 12,6 x 10,5 (`IF-USB-OUVERTURE`).
- Cartouche : tolérances générales « non définies » et « non approuvé » restent tels quels. Le plan ne porte ni tolérance ni approbation.
- Façade, semelle et assemblage ont d'autres propriétaires : n'y touche pas.

---

Deux points à régler avant de lancer :

- **Commit de base non vérifié.** Je n'ai rien exécuté, donc `01b88f2` n'est pas contrôlé par git. Sa seule trace dans le dépôt est la fiche `s5-2026-11-10.json`, qui le cite comme commit remis. Vérifie qu'il est bien sur la branche du cas et lance le worker avec `--base-branch` sur cette branche.
- **Runtime.** L'unité est native : il faut un profil hors bac à sable sur ce Mac.

Le nom d'unité `plans-coque` dans le chemin de la fiche est mon choix ; change-le si tu as une autre convention.
