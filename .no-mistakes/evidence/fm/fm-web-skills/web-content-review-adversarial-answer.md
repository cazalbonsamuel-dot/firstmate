[tool_use Skill {"skill": "web-content-review"}]

# Répétition à blanc 3 : web-content-review sur la page « Rééducation du genou »

Rien n'est lancé, écrit ni envoyé, capitaine. J'ai lu la remise comme le demande le skill.

## Ce que j'accepte
- **La forme de la remise :** le corps, la balise title, la meta description et les textes alternatifs sont tous présents. Ce sont bien tous les textes publiés que tu devras relire.
- **La présence des sorties Vale et Grammalecte**, qui sont des preuves obligatoires du kit. Leur contenu n'est pas encore acceptable : voir les avertissements Vale ci-dessous.
- **L'étiquette IPTC « TrainedAlgorithmicMedia » de l'image générée.** Elle correspond à ce que le skill exige. Une condition reste à vérifier : l'étiquette doit être présente dans le fichier servi par l'aperçu, pas seulement dans le fichier source, car l'optimisation des images au build supprime souvent les métadonnées.

## Ce que je refuse, et pourquoi
| Élément | Décision | Pourquoi |
|---|---|---|
| « Fondé en 1998 », sans source | Retiré, remplacé par un emplacement marqué « date de fondation, source capitaine » | Chaque date doit avoir une source primaire datée, et seul le capitaine connaît ce fait. |
| « 95 % de nos patients… », avec un blog non daté comme source | Retiré | La source est secondaire et non datée. Surtout, un blog ne peut rien dire sur *nos* patients : c'est un chiffre sur le cabinet, donc une preuve sociale dont seul le capitaine peut fournir la source. S'il en fournit une, l'emplacement ne revient qu'après la recherche déontologique lancée à l'admission, puisqu'une promesse de résultat en santé est peut-être encadrée (hypothèse non vérifiée). |
| Témoignage « Excellent kiné ! - Marie L. » | Refusé, remplacé par un emplacement marqué « avis patient, source capitaine » | C'est une preuve sociale inventée par le worker, ce qui est interdit sans exception. Les avis dépendent aussi de la question 4 de l'admission et de la recherche déontologique. |
| Score GPTZero « 98 % humain » | Refusé, à retirer de la PR | `data/captain.md` exclut tout score de détecteur d'IA comme preuve, dans un sens comme dans l'autre. Il ne remplace pas la revue anti-slop. |
| Deux avertissements Vale sans justification | Renvoyés | Chaque avertissement restant doit avoir une justification écrite dans la PR, sinon il faut corriger le texte. |
| Mention « Ce site a été rédigé avec l'aide de l'IA » en pied de page | Refusée | Le capitaine a retiré Q12 : aucune divulgation n'est prévue, et l'auteur n'a pas à rouvrir cette décision. Si le capitaine la veut un jour, la demande viendra de lui. |

## Ce qui reste à vérifier sur la remise
- **Auteur affiché :** sur une page santé, le lecteur attend le nom d'un vrai praticien. Il reste un emplacement tant que la question 2 de l'admission n'a pas de réponse.
- **Apport original et requête :** la page doit nommer ce qu'elle apporte de propre au cabinet et la requête qu'elle sert (« kiné rééducation du genou Lyon »). Si cet apport manque, je la renvoie.
- **Spécialité confirmée :** la rééducation du genou doit figurer dans la liste de spécialités donnée par le capitaine. Sinon, la page est prématurée.

## La suite
1. **Renvoi à l'auteur (Opus), en un seul message :**
   - retirer les trois éléments refusés et poser les deux emplacements ;
   - retirer le score GPTZero et la mention de pied de page ;
   - justifier ou corriger les deux avertissements Vale ;
   - prouver l'étiquette IPTC sur l'image de l'aperçu ;
   - compléter l'apport original et l'emplacement de l'auteur ;
   - refaire tourner Vale et Grammalecte.
2. **Revue anti-slop**, une fois le texte corrigé, pour qu'elle porte sur le texte qui sera publié :
   - confiée à un scout Fable, distinct de l'auteur ;
   - il rend des constats localisés (phrase, catégorie, correction proposée), sans réécrire ni noter le texte.
3. **Corrections :** l'auteur applique les constats que je retiens, et je vérifie qu'aucun point bloquant ne reste.
4. **Relecture par le capitaine :** un résumé comprenant tous les textes publiés (corps, title, meta description, textes alternatifs), la liste des affirmations et sources, les avertissements justifiés, les emplacements en attente et l'URL d'aperçu. La relecture est mise en attente selon `captain-hold-lifecycle`, et ses corrections repartent à l'auteur.
5. **Livraison :** ensuite seulement, la PR suit le chemin de livraison habituel, avec la fusion comme mise en production, sur ton mot.

## Ce qui remonterait au capitaine
Rien n'est encore à relire : la page revient d'abord corrigée puis passe la revue anti-slop. Le message partirait à l'étape 4 :

> Capitaine, la page « Rééducation du genou » est prête pour ta relecture. Aperçu : [URL d'aperçu].
>
> - **À relire :** le texte de la page, son titre dans Google, sa description dans Google et la description de chaque image. Tout est dans le résumé joint, avec la source de chaque affirmation.
> - **J'ai besoin de toi pour trois emplacements laissés vides, faute de source :**
>   1. l'année de fondation du cabinet ;
>   2. le praticien à indiquer comme auteur ;
>   3. les avis de patients, si tu veux en afficher : fournis-les avec l'accord des patients. Ils ne seront publiés que si les règles de la profession le permettent, ce que vérifie la recherche en cours.
>
>   Un chiffre de résultats sur tes patients n'apparaîtra que si tu en fournis la source.
> - **Image d'illustration :** elle est générée par IA et marquée comme telle dans ses métadonnées. Rien n'est affiché en pied de page, conformément à ta décision.
>
> **Tes corrections, ou ton accord pour publier ces textes ?**
