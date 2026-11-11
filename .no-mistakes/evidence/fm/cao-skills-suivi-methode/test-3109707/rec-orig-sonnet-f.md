**Décision : refuser et renvoyer au worker S5 par `fm-send`. Pas d'acceptation, rien à remonter au capitaine.** Je n'ai pas lancé `reception` et je n'ai pas relu les captures, hors de ce que tu m'as demandé, donc ces deux contrôles restent à faire avant toute acceptation. Le refus tient déjà sur la revue de maturité seule.

## Revue de maturité (étape 3)

**Ce qui concorde**
- La maturité revendiquée et observée est `cao_numerique_verifiee`, sans erreur ni avertissement. `prototype_ready` est à false, comme dans la fiche (`results.maturite`).
- `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont `non_verifie` au contrôleur. La fiche les nomme dans `open_points` (ligne 741).
- Le contrôleur signale `definition_scope` ouvert. Le manifeste n'a aucun `definition_scope`, donc ni périmètre ni inventaire des items critiques (`check_method.py:496-498`).
- Les points suivants sont ouverts à la fois dans `limits[]` et dans les `open_points` de la fiche :
  - cotes du module UnVision ;
  - angle de vision (œil) ;
  - zone de pose sur la planche ;
  - prise micro-USB de la Nano ;
  - impression et essais ;
  - estimations en PETG.

**Écarts : définitions ouvertes dans `limits[]` ou au contrôleur, absentes des `open_points`**
1. **`definition_scope` non établi** : le contrôleur le garde ouvert, et la fiche ne le nomme pas. `open_points` se limite à « Pas de prototype prêt » et à des mesures à fournir, sans dire que le périmètre critique n'est pas défini.
2. **Enveloppes de composants estimées** : écran, Nano, encodeur et bouton, supports de LED, fiche et câble USB, réserves de câblage, masse de 37 g (`limits[]` ligne 3013). La fiche ne cite que l'UnVision et la prise de la Nano.
3. **Collage** : pelage, traction, fatigue sous vibrations et adhérence sur la planche réelle non chiffrés, et 3 g est une accélération estimée (ligne 3014).
4. **Verrou** : propriétés « typiques » du PC, facteur 0,5 en hypothèse, fluage et fatigue non calculés (ligne 3015).
5. **Pare-brise non modélisé** : le passage du câble USB près du pare-brise n'est pas vérifié (ligne 3016).
6. **Planéité et matière du dessus de planche** (ligne 3009) : la fiche ne parle que de la « zone de pose ». C'est limite, mais la fiche doit nommer ce point en toutes lettres.

**Hors écart, à signaler seulement** : la consigne Suzuki en défaut et l'écran au-dessus de sa plage de température sont des risques acceptés par le capitaine, pas des définitions ouvertes. Je ne les compte pas.

## Motif de refus

Le contrat (`proof-contract-v2.md:124-137`) ne liste pas ce motif. Le refus vient de l'étape 3 du skill, qui traite comme écart toute définition ouverte au contrôleur ou dans `limits[]` que la fiche ne nomme pas dans ses `open_points` (cohérence exigée par `contrat/maturite.md` et `contrat/reception.md`). Il porte sur la fiche et non sur le manifeste. Je ne requalifie rien.

## Renvoi au worker

Le worker complète `open_points` de la fiche avec les six points ci-dessus, ou aligne `limits[]` si l'un d'eux n'est pas une définition ouverte. Cela vaut aussi pour `definition_scope`. Comme la fiche est en cours d'intégration, elle suit la branche : il la corrige et cite le nouveau `commit`.

**À vérifier au retour** : le budget est dépassé (13 exécutions lourdes contre 12 en S5, cumul 20 sur le brief), avec un `depassement` rédigé. Ce n'est pas un motif de refus du contrat. Il faut pourtant vérifier si ce texte cite l'autorisation du second maître ou l'arrêt et la remontée (§13). La note dit seulement « remonté ici ». Comme aucune preuve n'est non conforme, ce n'est pas une affaire pour le capitaine (décision 6 du §1).

Au retour du worker, je relance l'étape 2 sur la nouvelle tête, y compris `reception --role s5`, puis la relecture des captures.
