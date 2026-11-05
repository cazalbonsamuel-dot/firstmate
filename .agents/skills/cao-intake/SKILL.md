---
name: cao-intake
description: Load in a CAO (FreeCAD) home when a need for a new object or a change to an existing CAO object arrives, before writing any brief for it.
user-invocable: false
metadata:
  internal: true
---

# Entrée d'un besoin CAO

Ce skill porte le comment d'exécution par le second maître ; la méthode du dépôt `agent-conception-cao` reste l'autorité sur le quoi.
Les chemins ci-dessous sont relatifs à ce dépôt ; `§N` renvoie à `method/methode-cao-operationnelle-v1.md`.
Le second maître n'écrit jamais dans le projet (`AGENTS.md` règle 1) : il décide le contenu des artefacts gelés et un worker les écrit (`cao-worker-brief`).

## Quand charger

- À la réception d'un besoin d'objet neuf ou d'une modification d'un objet existant, avant tout brief de worker.
- Quand une réponse du capitaine change le besoin ou le périmètre d'un cas en cours : reprendre les étapes 2 à 8.

## Faire

1. Classer la demande : idée vague, besoin précis, ou modification d'un cas existant.
   Une modification à architecture inchangée ne rouvre pas la porte de recherche ; une modification de principe, transmission, implantation ou procédé la rouvre (§7).
2. Pour une modification, lire d'abord `python3 method/check_method.py summary method/cases/<cas>/manifest.json`, le manifeste et le gabarit de décision existant ; reprendre les décisions écrites, pas la conversation (§12).
3. Consigner séparément la demande originale citée mot pour mot, les faits sourcés, les hypothèses réversibles et bornées, et les inconnues (§2 « Entrée et modes de travail »).
   Ne pas élargir l'intention ni inventer de préférence.
4. Trier les inconnues : seule une inconnue qui change la conception ou sa vérification devient une question au capitaine ; les autres deviennent hypothèses consignées ou travail de recherche.
   Pas de questionnaire uniforme : une question concise par inconnue retenue, avec son effet sur la suite, toutes envoyées ensemble.
   Pendant l'attente, lancer seulement les travaux indépendants compatibles avec toutes les réponses possibles.
5. Fixer les exigences et leurs critères d'acceptation indépendants, à partir du besoin et jamais d'une sortie : JSON hashé référencé par `requirements[].acceptance_criteria` (§3, contrat « Critères indépendants réellement consommés »).
6. Pour un objet neuf, prévoir le squelette du cas créé vide, sans copier un cas existant (§3 « Squelette d'un nouveau cas ») ; son worker crée le manifeste, que seul le worker S5 touche ensuite.
7. Geler S1 avant tout worker de conception : critères hashés et `design/params.json` initial (§13 « Travail parallèle sous un superviseur »).
   Un worker court les écrit sous dictée sur la branche du cas, qui sert ensuite de base aux workers suivants.
8. Décider la taille du lot et le premier découpage en unités de travail (table du §13) :
   - entrée qui fixe déjà l'architecture : consigner la citation comme décision (§2 porte, préambule) et viser S3 ;
   - sinon, premier lot = porte de recherche : charger `cao-recherche-options` ; seuls recherche, pré-dimensionnement et calculs indépendants des options partent en parallèle ;
   - estimer le nombre de pièces, la présence d'un mécanisme et les exécutions lourdes d'après `method/performance.md` ;
   - un objet trop gros pour un seul dossier se découpe en sous-ensembles reliés par la fiche d'interfaces, ou remonte au capitaine si le découpage change le périmètre.
9. Tenir le cas comme item du backlog du home ; la note dit le classement, le dernier point de synchronisation atteint et les questions ouvertes.
   Tenir chaque question du capitaine selon `captain-hold-lifecycle`.

## Refuser ou remonter

- **Capitaine** : inconnue qui change le besoin ou le périmètre, exigence manquante qui change la conception ou sa vérification (décision 3 du §1) ; tout achat, installation, fabrication ou essai physique (décision 5).
- **Second maître** : classement, hypothèses bornées, critères dérivés du besoin exprimé, découpage, taille de lot, ordre des travaux.
- **Worker** : aucun worker de conception avant S1 ; seuls les workers de recherche peuvent partir.
- Refuser de lancer une CAO détaillée depuis l'entrée, même sur un « fais au mieux » (§2 porte, étape 5).
- Une demande qui change la méthode ou un helper `scripts/` n'est pas un cas : la remonter comme lot méthode séparé (§7).

## Références

- §1 « Règle de base » : statuts, niveaux d'autorité, six décisions du capitaine.
- §2 « Entrée et modes de travail », « Porte obligatoire : recherche et revue des solutions ».
- §3 « Dossier de preuves », « Squelette d'un nouveau cas ».
- §7 « Modifications et invalidation ».
- §13 « Travail parallèle sous un superviseur » : unités de travail, S1-S5.
- `method/proof-contract-v2.md` « Critères indépendants réellement consommés ».
- `method/README.md` « Points d'entrée », brief (a) du second maître.
