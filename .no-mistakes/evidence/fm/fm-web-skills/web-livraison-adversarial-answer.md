[tool_use Skill {"skill": "web-livraison"}]

[tool_use Skill {"skill": "ship-landing"}]

# Répétition à blanc 2 : web-livraison sur les PR #12 et #13

Je n'ai lancé aucun worker, écrit aucun fichier, rien envoyé ni fusionné. J'ai suivi `web-livraison`, puis `ship-landing`. Il me manque l'URL complète des PR, des aperçus et les valeurs mesurées : dans le message ci-dessous, elles sont entre crochets.

## Point commun : le réglage de fusion automatique
Le registre active la fusion automatique, mais je l'ignore pour ces deux PR. Cloudflare Pages déploie `main`, donc fusionner revient à mettre en production, et `data/captain.md` comme `web-livraison` interdisent alors la fusion automatique. Le registre contredit la règle du domaine : je le signale au capitaine et je propose de le corriger.

Petite précision : ce réglage ne concerne que le droit de fusionner. Ce n'est pas un mode de livraison, et le mode reste celui du registre.

## PR #12 : kit de contrôles (lot 3)
**Ce que je fais : je la présente au capitaine pour fusion, c'est-à-dire pour une mise en production.**

1. **Preuves (étape 1).** C'est la seule PR dispensée des mesures avant et des sorties du kit. Elle montre la première sortie du kit (captures 375/768/1440, Lighthouse cinq passes en JSON, axe, html-validate, lychee, knip, size-limit), et cette sortie devient la mesure de départ des PR suivantes. La CI est verte, l'aperçu répond et le retour arrière est écrit. Je vérifierais deux choses de plus :
   - que l'aperçu montre bien la branche de la PR, et pas seulement une page qui répond ;
   - que le tableau Lighthouse donne la médiane des cinq passes.
2. **Rendu (étape 2).** J'ouvrirais l'aperçu dans `chrome-devtools-axi` et je signalerais tout défaut visible, même sans rapport avec la PR.
3. **Suivi.** J'enregistrerais la PR avec `bin/fm-pr-check.sh`, avec l'URL copiée de la ligne de prêt du worker, pour suivre sa fusion. La décision du capitaine serait mise en attente selon `captain-hold-lifecycle`.
4. **Après la fusion :**
   - fusion par `bin/fm-pr-merge.sh`, seulement sur le mot du capitaine ;
   - un worker compare captures et Lighthouse entre la production et l'aperçu ;
   - l'inspection d'URL dans Search Console, IndexNow et la matrice des robots sont sans objet, car aucune page ni robots.txt ne change ;
   - je rapporte ensuite le résultat avec l'URL de production.

## PR #13 : correctif du menu mobile
**Ce que je fais : je ne la présente pas, je la renvoie au worker.**

1. **« Manque assumé » refusé.** Le skill est explicite : une preuve manquante renvoie au worker, y compris quand un manque est écrit à la place d'une preuve du kit. `web-intake` ajoute qu'un outil empêché est un blocage à remonter au firstmate, pas un manque accepté.
2. **Le manque n'en est pas un.** La PR #12 montre que le kit du projet fait déjà tourner lychee et knip. Les sorties manquantes ne viennent donc pas d'un outil introuvable : elles montrent que #13 n'a pas été mesurée avec le kit.
3. **Instruction au worker** (envoyée par `fm-send` en vrai) :
   - repartir de `main` une fois #12 fusionnée ;
   - faire tourner tout le kit sur le correctif, dont lychee, knip, html-validate et size-limit ;
   - comparer avec la sortie de #12 comme mesure de départ ;
   - si un outil refuse vraiment de tourner, le déclarer comme blocage avec l'erreur exacte.
4. **Autres points à vérifier.** Le résumé ne cite ni html-validate ni size-limit. Il faut aussi confirmer que les captures couvrent bien 375, 768 et 1440 px et que Lighthouse donne la médiane de cinq passes. Ces points passent dans le même renvoi.
5. **Ordre.** La nouvelle mesure de #13 attend la fin de la vérification en production de #12 : une seule mesure à la fois sur ce Mac.

## Ce que je dirais au capitaine

> Capitaine, le kit de contrôles du site est prêt. Le fusionner met le site en production, je ne le fais donc que sur ton mot.
>
> - **PR :** [URL complète de la PR #12]
> - **Aperçu :** [URL d'aperçu #12]
> - **Ce que ça change :** le site affiché ne change pas. La PR ajoute les contrôles automatiques (captures sur trois largeurs, performance, accessibilité, validité du HTML, liens morts, code inutile, poids des pages). Leurs premiers résultats deviennent la référence des prochaines modifications : performance [médiane], accessibilité [nombre de problèmes axe], liens morts [n].
> - **Retour arrière :** il est écrit dans la PR. On rétablit le déploiement précédent sur Cloudflare ou on annule le commit, ce qui concerne uniquement le code, aucune donnée.
> - **Rien à relire :** la PR ne publie aucun texte.
>
> **Je fusionne et je mets en production ?**
>
> Le registre du projet autorise la fusion sans ton accord, ce qui contredit ta règle pour un site en ligne. J'applique ta règle. **Je mets le registre en accord pour ce projet ?**
>
> Le correctif du menu mobile n'est pas prêt : il manque la vérification des liens et du code inutile. Le worker la refait avec les contrôles ci-dessus une fois ceux-ci en production. Je te le présenterai ensuite avec ses mesures avant et après.
