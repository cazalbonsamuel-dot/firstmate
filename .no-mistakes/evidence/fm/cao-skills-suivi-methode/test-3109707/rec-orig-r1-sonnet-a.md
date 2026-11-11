**Décision : je n'accepte pas encore.** Je renvoie au worker pour 2 points de fiche et je remonte 3 points au capitaine. Aucun motif de refus du contrat n'est établi sur ce que j'ai pu lire. Il manque deux preuves de réception, et je n'ai pas pu relire les plans en image.

Limites de cette revue : je n'ai pas de Bash dans cette session. Je n'ai donc ni `git status` ni `reception`, et je n'ai pas non plus recalculé les empreintes. Seul `summary` m'a été fourni (`delivery` ne figure que dans les commandes de la fiche, rc 0).

## Revue de maturité (étape 3)

- **Niveau observé.** `maturity` annonce `cao_numerique_verifiee` à la fois revendiqué et observé, soit aucun écart vers le bas. `prototype_ready` est à false et `definition_encore_incomplete`, ce qui ne surévalue rien. Les 5 preuves natives sont retenues et `failing_proofs` est vide.
- **Contrôles non vérifiés.** Les deux ouverts sont `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES`. Ils sont déclarés `non_verifie` dans le manifeste et repris dans les `open_points` de la fiche.
- **Lien avec les définitions ouvertes.** `maturity.open_items` ne contient que `definition_scope`, car le manifeste n'a pas de `definition_scope`. Les 4 définitions ouvertes (cotes du module écran, angle de vision, zone de pose, prise Nano) ne sont donc pas listées par le contrôleur. Elles sont cohérentes entre `limits[]`, `case_state` et la fiche. Je ne le compte pas comme refus, mais je le signale.
- **`open_points` plus courts que `limits[]`.** La fiche (4 points) n'a pas repris plusieurs limites déclarées dans le manifeste (15) :
  - l'écran au-dessus de sa plage thermique (70 °C en marche) sur une planche à 85 °C ;
  - la consigne Suzuki 99011-77R42 laissée en défaut ;
  - le passage du câble USB près du pare-brise, non vérifié ;
  - le collage et le verrou, non chiffrés au-delà des hypothèses ;
  - la hauteur de C5 avec le ruban.
- **C5 (hauteur ≤ 50 mm).** Le critère n'est tenu que si le ruban VHB est exclu : 49,56 mm sans ruban, 50,66 mm avec (`limits[]`). La fiche le justifie par une décision du second maître, mais le critère gelé dit « boîte posée sur sa semelle » et la hauteur réellement posée dépasse 50 mm.
- **Captures.** Les 7 PNG ont leur `.png.json` d'identité et sont indiquées « non rejouées, digest inchangé ». J'ai lu `assemblage-cote.png`, qui montre une façade inclinée d'environ 20°, la Nano visible et la semelle en dessous, sans anomalie visible. Une vue ne prouve pas le fonctionnement. Je n'ai pas le brief sous les yeux, donc je n'ai pas comparé les 7 vues aux vues exigées. J'ai lu 1 capture sur 7.

## Motifs qui bloquent l'acceptation

1. **Plans TechDraw non relus en image.** Le guide rend la relecture en image obligatoire pour la passe livrée. Ici `pdftoppm` est absent (les 3 PDF ne se rendent pas) et je ne lis pas les SVG en image. Le contrôle automatique est vert (`layout_defects` à 0 dans les 3 rapports), mais il ne remplace pas la relecture. Il faut la confier à un worker de revue distinct du concepteur.
2. **`reception` non fourni.** Sans sa sortie, je ne peux pas confirmer les motifs mécaniques : empreinte du manifeste contre la fiche, commits postérieurs, chemins personnels, copie propre. Un point à vérifier à cette occasion : la fiche déclare 547682cd… pour le manifeste, alors que `summary` affiche 76bf6582… (sans doute une empreinte canonique, mais seul `reception` le confirmera).
3. **Fiche à compléter (renvoi au worker).**
   - Aligner les `open_points` sur les limites ouvertes de `limits[]` citées plus haut.
   - Déclarer le compteur `max_techdraw_runs_per_page_set` (plafond 2) avec sa justification dans `depassement`. Il manque dans `budget`, alors que les jeux de pages ont pris 4 passes (façade), 4 (semelle) et 3 (coque).

## Budget

Les exécutions lourdes sont à 13 contre 12 (plafond de ce brief, `iteration_budget.json` en prévoit 6 par défaut). Le cumul S4 bis plus S5 est de 20. Le `depassement` est renseigné et chaque passe rendait `verifie`. Ce n'est donc pas le refus « budget dépassé sans arrêt ni remontée », ni un budget consommé sans preuve conforme.

## À remonter au capitaine

- **C5.** Entériner ou non la lecture « sans ruban » d'un critère gelé, alors que la hauteur posée est de 50,66 mm.
- **Thermique.** L'écran dépasse sa plage de température avec la boîte en place sur une planche à 85 °C, et la consigne Suzuki reste en défaut. Ce sont des choix du capitaine, à confirmer maintenant que le dossier est livré.
- **Budget.** Le dépassement de budget de S5.

## Hors périmètre à traiter à part

Ces deux points sont signalés par la fiche et n'ont rien à voir avec ce cas :
- `method/README.md` compte encore 7 cas pour 8 manifestes.
- Un `.FCBak` est versionné sous `cases/electronique/cad/`.

Le warning FreeCAD « hasher mismatch » vu pendant un contrôle est aussi à suivre.

Prochaine étape : me donner la sortie de `reception` avec `--role s5`, et lancer la relecture des plans par un worker de revue. Si les deux sont verts et que le worker corrige les `open_points` et le budget, la remise passe en acceptation, la décision C5 restant au capitaine. L'intégration de la PR est de toute façon sa décision (décision 5).
