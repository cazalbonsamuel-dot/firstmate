## Firstmate spec

**Unité** : « Recherche d'une famille de solutions » (§13, 2 à 4 workers, un par famille). Famille confiée : **fixation par ventouse** du boîtier de l'inclinomètre. Les autres familles sont traitées par d'autres workers.
**Type** : scout. Recherche, sans exécution FreeCAD. Tu n'écris rien dans le dépôt, tu ne commits rien et tu ne crées aucune branche.
**Cas** : `inclinometre-jimny-boitier`.

**À appliquer et à lire**
- Applique `method/worker.md`. Il fait foi pour le rôle, les entrées gelées, le refus des exécutions et les remontées.
- Lis ensuite la colonne « Lire » de ta ligne du §13 : le §2 de la méthode, porte étapes 1 et 2 (rechercher l'existant, comparer les principes), plus « Proportion de la recherche ». Lis aussi `method/templates/recherche-annexes.md`, section 2.
- Aucune lecture ajoutée.

**Base** : commit `7d74a39` de la branche du cas. Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3).
- Tu lis surtout `cases/inclinometre-jimny-boitier/design/recherche-options.md`, section 1 : besoin, exigences E1 à E5, inconnues U2, U7 à U10. Tu lis aussi `design/recherche/`, notamment `schema-familles.svg`.
- Vérifie ces fichiers au début : `git diff --exit-code 7d74a39 -- <chemins>` doit rendre 0, sinon `blocked`.

**Livrable** : section 2 des annexes du gabarit (tableau à cinq colonnes, sources datées) pour la seule famille « fixation par ventouse ». Tu la remets dans ton message final, au format de `method/templates/recherche-annexes.md`, §2, à insérer dans `design/recherche/annexes.md`. Ce fichier n'existe pas dans ce cas, qui est en forme à un seul fichier. Le second maître décide de la consolidation, écrite par le worker de gel sous dictée.
- Chaque source porte son marqueur de nature : [doc], [extrait], [image], [vidéo], [vente], [secondaire] ou [estimé].
- Chaque source porte sa date de consultation (la date réelle) et sa version ou date de document.
- Les refus d'accès et les données manquantes sont consignés, sans contournement.
- Fin du message : points ouverts et limites, classés comme tels.

**Fichiers possédés** : aucun. Pas de fiche de remise `cases/<cas>/outputs/remises/` (aucun commit à remettre) ni de ligne de manifeste. Tu ne lances aucune commande de remise, et `method/worker.md` §8 ne s'applique pas à un scout.

**Budget** : 3 itérations, 0 exécution lourde (`method/iteration_budget.json` réduit : un scout n'exécute pas FreeCAD). Budget consommé sans résultat conforme : arrêt avec le compte rendu `stop_explanation` du fichier, remontée au second maître.

**Points propres au cas**
- **Cadrage de la famille.** Il s'agit du principe « ventouse » comme moyen de fixation, à comparer aux moyens déjà sourcés dans le dossier : adhésif VHB, Dual Lock, tapis silicone, vis d'origine.
  - Exemples de ventouses à documenter : RAM Twist-Lock Ø 3,3", Garmin/Arkon Ø 80 mm.
  - Les ventouses à levier, à gel, à vide et les bases magnétiques ou à aspiration adhésive sont à classer par principe, pas à lister comme variantes.
- **Support d'application.** Les inclinomètres de la pratique observée (REDARC HMDS0400, Smittybilt, Rampage) se posent ou se collent sur le dessus du tableau de bord (E2, réponse du capitaine du 2026-11-10). Ce dessus est grainé (U8) et sa matière n'est pas établie.
  - Établis la tenue d'une ventouse sur surface grainée ou texturée et sur plastique basse énergie, avec sources primaires si elles existent.
  - Établis aussi les moyens connus d'y remédier (disque de transfert, pastille adhésive) et leurs limites. Ne conclus pas sur ce que le dossier n'établit pas.
- **Pare-brise.** Le dossier le donne comme écarté par la notice Suzuki 99011-77R42 (aucun accessoire sur le pare-brise, page 2-35) et par un risque d'incendie par effet de loupe. L'emplacement a été fixé par le capitaine.
  - Ne rouvre pas cette décision. Relis la source avant de la reprendre : vérifie l'actualité de la notice et de l'allégation de loupe, qui n'est pas sourcée.
  - Documente la ligne d'exclusion (source, date, information tirée) sans recherche détaillée supplémentaire (proportion de la recherche).
- **Contraintes à confronter à la famille**
  - E4 : le boîtier doit garder son orientation entre deux calibrations (vibrations et chocs tout-terrain). Cherche des données sur la tenue d'une ventouse sous vibration, le fluage et la perte de dépression.
  - E5 : dessus de planche jusqu'à 85,0 °C et moyenne 68,9 °C après environ 1 h au soleil (Vanos et al. 2018). Cherche la plage de température des ventouses (silicone, PU, PVC).
  - Cherche aussi le comportement à la chaleur sur plastique grainé, l'effet sur le grain et la trace laissée.
  - U7 (tenue réelle à la chaleur d'un objet posé) reste inconnue. Aucune mesure n'est à inventer.
- **Notice Suzuki.** Page 2-5, elle demande de ne rien poser sur le dessus de la planche. Cette contrainte vaut pour toute la famille A et ne se contourne pas : consigne-la telle quelle, sans la présenter comme levée par le mode de fixation.
- **Réutilisation de l'existant.** Les lignes RAM, Garmin/ProClip/Arkon des §2.2 et 2.3 de `recherche-options.md` sont des extraits non ouverts. Tu peux les citer avec leur référence et leur date, après vérification de leur actualité (méthode §13) ; une source seulement indexée n'est jamais présentée comme lue.
- **Hors périmètre**
  - Pas de pré-dimensionnement : il relève d'un autre scout (ligne « Pré-dimensionnement d'une option »).
  - Pas de choix d'architecture ni de recommandation à la place du capitaine.
  - Pas d'achat, pas de contact fournisseur, pas d'essai physique.
  - Pas d'autres familles, pas de CAO.
- **Remontée.** Toute question qui touche une entrée gelée, un compromis ou une des six décisions du §1 remonte au second maître (`needs-decision`), jamais au capitaine.
