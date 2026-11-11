**Décision : je ne peux pas accepter la remise S5 en l'état. Je la mets en attente et je remonte au capitaine un point de budget.** J'ai bien trouvé un écart à la revue, mais il ne suffit pas à la refuser à lui seul.

**Ce que je n'ai pas pu contrôler.** Le Bash est désactivé dans cette session. Voici les deux contrôles de l'étape 2 que je n'ai donc pas faits :
- `reception ... --role s5` n'a pas tourné : je n'ai que la sortie de `summary`. Son code de retour (qui doit être 0) conditionne l'acceptation, et je ne le déduis pas d'ailleurs.
- `git status` n'a pas été lancé : je ne peux pas dire que la copie est restée propre.

Aucun fichier n'a été modifié.

**Revue de maturité (étape 3)**
- **Maturité** : `claimed` et `observed` valent tous deux `cao_numerique_verifiee`, donc pas de revendication au-dessus de l'observé. `prototype_ready` vaut `false` et `maturity.definition` vaut `definition_encore_incomplete`, ce qui est cohérent.
- **`open_items`** : `definition_scope` est l'item générique. Le manifeste n'a pas de `definition_scope` (0 occurrence), donc ce n'est pas un écart (`maturite.md`). `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont `non_verifie` avec raison, et la fiche les nomme.
- **`limits[]` contre `open_points`** : les quatre définitions ouvertes de `limits[]` sont toutes nommées dans la fiche, et le dossier (ligne 115) dit la même chose. Les autres limites (enveloppes estimées, collage, verrou, pare-brise, impression, électronique hors périmètre) sont des estimations ou des hypothèses, pas des définitions ouvertes.

| Définition ouverte (`limits[]`) | Dans `open_points` |
|---|---|
| Cotes du module UnVision | cotes du module écran UnVision |
| Angle de façade estimé à 20° | angle de vision (œil) |
| Planéité et matière du dessus de planche | zone de pose sur la planche |
| Position de la prise micro-USB de la Nano | prise de la Nano |

  Il n'y a donc aucun écart de maturité.
- **Captures** : j'ai relu `assemblage-axo.png` et `assemblage-coupe_verrou.png`. Elles sont lisibles et cohérentes avec leur `state`. Les sept ont leur identité dans la fiche, et leur digest est égal à celui de l'assemblage. Je n'ai pas relu les cinq autres.
- **Chemins personnels** : aucun dans `cases/inclinometre-jimny-boitier/` ni dans le manifeste.
- **Périmètre** : les fichiers livrés restent dans le cas, plus le manifeste.

**Motifs de refus ou de remontée**
1. **Contrôle mécanique incomplet.** Faute de `reception` et de `git status`, la condition « contrôleur vert » de l'étape 5 n'est pas établie. Il faut les lancer, ou me rendre Bash.
2. **Budget dépassé (§13, guide TechDraw).** `depassement` est déclaré, donc ce n'est pas un refus du contrat (« sans `depassement` »). Mais :
   - 13 exécutions lourdes contre un plafond de 12 pour S5, et 20 cumulées avec S4 bis.
   - 4 passes TechDraw pour la façade, 4 pour la semelle et 3 pour la coque, contre `max_techdraw_runs_per_page_set` = 2.
   - La justification du dépassement est mince : les reprises ne corrigeaient que des chevauchements. Le piège de l'origine de coupe en x = 0 est justement cité dans le guide, `--check` aurait dû l'éviter.
   - Les preuves sont conformes, donc je n'arrête pas le worker. Je remonte l'avis au capitaine, qui tranche si ce dépassement est toléré.
3. **Écart de mise en page (relu sur `semelle-p1.pdf`).** La cote « 4 » de la semelle touche l'arête de la lèvre. La fiche le reconnaît elle-même. Le plan est sans valeur de preuve et `layout_defects` est à 0, donc ce n'est pas un motif du contrat. Une nouvelle reprise coûterait une cinquième passe, au-delà du budget : je ne la renvoie pas au worker sans accord du capitaine, qui peut accepter ce défaut ou autoriser une dernière reprise.
4. **Suivis hors cas (non bloquants).**
   - `method/README.md` décompte encore sept cas, pour huit manifestes.
   - Un `.FCBak` est versionné sous `cases/electronique/cad/`.
   - Cela relève d'un lot méthode séparé et ne bloque pas S5.

**Suite.** Si `reception` rend 0 et que la copie est propre, il n'y a aucun refus du contrat. J'accepterais alors la remise, sous réserve de l'avis du capitaine sur les points 2 et 3. Sinon, je renvoie au worker par `fm-send` avec la règle et la sortie en cause. Pour l'intégration de la PR, la décision 5 reste au capitaine et le nettoyage suit `ship-landing` ; la livraison continue avec `cao-livraison`.
