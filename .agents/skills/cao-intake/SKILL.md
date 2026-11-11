---
name: cao-intake
description: Load in a CAO (FreeCAD) home when a need for a new object or a change to an existing CAO object arrives, before writing any brief for it.
user-invocable: false
metadata:
  internal: true
---

# Entrée d'un besoin CAO

Ce skill porte le comment d'exécution par le second maître ; la méthode du dépôt `agent-conception-cao`, à la tête de sa branche par défaut, reste l'autorité sur le quoi.
Les chemins ci-dessous sont relatifs à ce dépôt ; `§N` renvoie au noyau `method/methode-cao-operationnelle-v1.md`, « contrat » au noyau `method/proof-contract-v2.md` et à ses parties `method/contrat/`.
Le second maître n'écrit jamais dans le projet (`AGENTS.md` règle 1) : il décide le contenu des artefacts gelés et un worker de gel les écrit sous dictée (`cao-worker-brief`).

## Quand charger

- À la réception d'un besoin d'objet neuf ou d'une modification d'un objet existant, avant tout brief de worker.
- Quand une réponse du capitaine change le besoin ou le périmètre d'un cas en cours : reprendre les étapes 2 à 8.
- Quand une question d'unité demande de modifier une entrée gelée après S3 : étape 9.

## Faire

1. Classer la demande : idée vague, besoin précis, ou modification d'un cas existant.
   Une modification à architecture inchangée ne rouvre pas la porte de recherche ; une modification de principe, transmission, implantation ou procédé la rouvre (§7).
2. Pour une modification, lire d'abord `python3 method/check_method.py summary method/cases/<cas>/manifest.json` (vue de réception), le `README.md` du cas et son gabarit de décision ; reprendre les décisions écrites, pas la conversation (§12).
3. Consigner séparément demande originale citée mot pour mot, faits sourcés, hypothèses réversibles et bornées, et inconnues (§2 « Entrée et modes de travail »), sans élargir l'intention ni inventer de préférence.
4. Trier les inconnues : seule une inconnue qui change la conception ou sa vérification devient une question au capitaine ; les autres deviennent hypothèses consignées ou travail de recherche.
   Une question concise par inconnue retenue, avec son effet sur la suite, toutes envoyées ensemble ; pendant l'attente, seulement les travaux compatibles avec toutes les réponses possibles.
5. Fixer les exigences et leurs critères d'acceptation indépendants à partir du besoin, jamais d'une sortie (§3, `method/contrat/criteres.md`).
6. Pour un objet neuf, faire créer le squelette du cas vide, sans copier un cas existant (§3 « Squelette d'un nouveau cas ») ; qui écrit ensuite le manifeste suit la liste fermée du contrat (« Écrivains du manifeste de cas », section « Remise d'un worker et acceptation par le superviseur »).
7. Geler S1 avant tout worker de conception (§13 « Travail parallèle sous un superviseur ») : un worker de gel écrit sous dictée, sur la branche du cas, les critères et le `design/params.json` initial ; le commit obtenu sert de base aux workers suivants.
8. Décider la taille du lot et le premier découpage en unités de travail (table du §13) :
   - entrée qui fixe déjà l'architecture : consigner la citation comme décision (§2 porte, préambule) et viser S3 ;
   - sinon, premier lot = porte de recherche : charger `cao-recherche-options` ; seuls recherche, pré-dimensionnement et calculs indépendants des options partent en parallèle ;
   - estimer le nombre de pièces, la présence d'un mécanisme et les exécutions lourdes d'après `method/performance.md` ;
   - un objet trop gros pour un seul dossier se découpe en sous-ensembles reliés par la fiche d'interfaces, ou remonte au capitaine si le découpage change le périmètre.
9. Préparer S3, pour un ensemble de plusieurs pièces, avant tout worker de pièce :
   - dicter chaque entrée de `design/interfaces.json` seulement quand elle passe toute la liste « Complétude avant gel » (§2) ; une entrée incomplète laisse S3 ouvert ;
   - faire produire par le worker de gel la pré-implantation chiffrée du cas et son rapport (§2 « Pré-implantation chiffrée avant S3 ») ; une contrainte en défaut se règle par une nouvelle dictée, jamais en lançant les pièces ;
   - gel complémentaire après S3 (§13, puce « Gel complémentaire ») : dicter la modification au worker de gel, en réglant d'un coup toutes les interfaces voisines incomplètes, puis transmettre aux unités en cours, par `fm-send`, le seul identifiant du commit obtenu (`method/worker.md` §3) ; jamais une liste d'empreintes.
     Un gel, complémentaire compris, qui modifie une entrée gelée en re-pointe aussi le `sha256` dans chaque `delivery_checks[].inputs` qui la cite, rien d'autre du contrôle, et déclare invalidées dans sa fiche les preuves des propriétaires qui la citent (contrat, « Écrivains du manifeste de cas », écrivain 2).
10. Tenir le cas comme item du backlog du home ; la note dit le classement, le dernier point de synchronisation atteint, le commit de base courant de la branche du cas et les questions ouvertes.
    Tenir chaque question du capitaine selon `captain-hold-lifecycle`.

## Refuser ou remonter

- **Capitaine** : inconnue qui change le besoin ou le périmètre, exigence manquante qui change la conception ou sa vérification (décision 3 du §1) ; tout achat, installation, fabrication ou essai physique (décision 5).
- **Second maître** : classement, hypothèses bornées, critères dérivés du besoin exprimé, contenu des gels, découpage, taille de lot, ordre des travaux.
- **Worker** : aucun worker de conception avant S1, aucun worker de pièce avant S3 ; seuls les workers de recherche peuvent partir avant S2.
- Refuser de lancer une CAO détaillée depuis l'entrée, même sur un « fais au mieux » (§2 porte, étape 5).
- Une demande qui change la méthode ou un helper `scripts/` n'est pas un cas : la remonter comme lot méthode séparé (§7).

## Références

- §1 « Règle de base » : statuts, niveaux d'autorité, six décisions du capitaine.
- §2 « Entrée et modes de travail », « Porte obligatoire : recherche et revue des solutions », « Implantation avant le détail » (fiche d'interfaces, « Complétude avant gel », « Pré-implantation chiffrée avant S3 »).
- §3 « Dossier de preuves », « Squelette d'un nouveau cas ».
- §7 « Modifications et invalidation ».
- §13 « Travail parallèle sous un superviseur » : unités de travail, S1-S5, gel complémentaire.
- `method/worker.md` §3 « Entrées gelées ».
- `method/contrat/criteres.md` ; contrat, « Remise d'un worker et acceptation par le superviseur » (écrivains du manifeste).
- `method/README.md` « Points d'entrée », brief (a) du second maître.
