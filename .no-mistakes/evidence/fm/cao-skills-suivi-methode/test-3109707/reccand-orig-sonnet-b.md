**Décision : ne pas accepter. Renvoi au worker S5 par `fm-send` pour un seul motif de refus, le budget (point 1 ci-dessous).**

Le renvoi est incomplet sur trois points. Bash est désactivé dans cette session, donc je n'ai pas pu vérifier `git status`. Je n'ai pas lancé `reception --role s5`, car il rejoue `delivery`. Je n'ai pas relu les captures ni les plans TechDraw. Je n'ai donc ni jugé la lecture des vues, ni confirmé que la copie est restée propre.

**Revue de maturité : aucun écart**
- `summary` donne revendiqué et observé `cao_numerique_verifiee`, `prototype_ready: false`. Le niveau observé n'est pas en dessous du revendiqué, donc pas de refus de ce côté.
- Les définitions ouvertes de `limits[]` sont le module UnVision, l'angle de façade 20° à confirmer à l'œil, le dessus de planche (planéité, matière) et la prise micro-USB de la Nano. Les `open_points` de la fiche les nomment aussi : module écran, angle de vision, zone de pose, prise de la Nano. Ils correspondent dans les deux sens.
- `definition_scope` : le manifeste n'en déclare pas, donc cet item de `maturity.open_items` est le générique et n'est pas un écart. Les contrôles CTRL-IMPRESSION et CTRL-ESSAIS-PHYSIQUES, en `non_verifie` avec raison, sont déclarés dans les deux documents.
- Les autres limites sont des estimations et hypothèses : Suzuki, plage de température de l'écran, collage, verrou en PC, PETG au lieu du PC, hors périmètre. Elles n'en sont pas non plus.
- `limits[]` a un point que la fiche ne reprend pas : le pare-brise non modélisé, donc le passage du câble USB non vérifié. C'est une limite de périmètre, pas une définition ouverte. Je le note sans le retenir comme écart.

**Motif de refus : budget dépassé sans autorisation ni arrêt cités (contrat, « Refus », dernier motif sur le budget ; méthode §13)**
- Le plafond du brief est de 12 exécutions lourdes. La fiche en compte 13 pour S5 et 20 au cumul S4 bis plus S5, avec 3 itérations sur 3.
- Elle contient bien un champ `depassement`, donc le contrôle mécanique passe.
- Mais le contrat demande que ce texte cite « l'autorisation reçue du second maître ou l'arrêt et la remontée ». Celui-ci ne cite ni l'une ni l'autre. Il dit seulement « dépassement remonté ici », après coup.
- Quatre des treize passes lourdes reprennent la mise en page TechDraw, et la fiche dit que toutes rendaient déjà `verifie`.
- Je n'ai trouvé aucune autorisation dans le dépôt. Si j'en ai donné une, le worker doit la citer dans le texte. Sinon le dépassement n'était pas autorisé.
- Ce n'est pas une remontée au capitaine. Les preuves sont conformes, donc la décision 6 du §1 ne s'applique pas.

**Points relevés qui ne motivent pas de refus**
- La fiche dit qu'un `.FCBak` est versionné sous `cases/electronique/cad/`. Dans cette copie, il n'y a que le FCStd et deux STEP à cet endroit, aucun `.FCBak`. Soit l'information est périmée, soit la fiche se trompe. Elle est hors cas et hors périmètre S5 de toute façon.
- Les six captures datent de S4 bis, à digest d'assemblage égal. La fiche les déclare non rejouées avec leur identité complète, ce qui est admis. Leur contenu reste à relire.

**À joindre au renvoi**
- Citer l'autorisation de dépassement reçue, ou reconnaître qu'il n'y en avait pas.
- Éclaircir « 12 annoncées pour S4 bis, aucune pour S5 » par rapport au plafond de 12 inscrit dans la fiche.

Après correction de la fiche, je relance l'étape 2 puis termine la revue des captures et plans, par un worker de revue si mon runtime ne lit pas les images de façon sûre. Les modifications de la fiche donneront un nouveau commit : le worker devra citer le nouveau `commit` dans la fiche.
