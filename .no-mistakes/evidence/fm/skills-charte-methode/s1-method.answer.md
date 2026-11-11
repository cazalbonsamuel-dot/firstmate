Outils appelés : Skill({"skill": "agence-projet-client"}), Skill({"skill": "photographie-web"})

Capitaine, voici les réponses tirées du seul texte des deux skills (aucun script exécuté, aucun worker lancé).

## 1. Chaîne de production

Cinq postes, chacun tenu par un worker distinct qui lit le livrable écrit du précédent au lieu de tout refaire (`agence-projet-client` §4 règle 1).

| Ordre | Poste | Reçoit | Rend | Ne fait pas |
|---|---|---|---|---|
| 1 | Constat (§4.3) | Le site existant ou le besoin, les skills de cadrage | Une fiche courte (détail ci-dessous) | Ne conçoit rien, ne propose aucune direction, n'écrit aucun texte de page, ne tranche pas l'identité |
| 2 | Rédaction (§4.4) | Le constat, `contenu-ecriture`, `seo` | Plan du site, textes de toutes les pages écran par écran, questions-réponses, données structurées, voix, demandes au client | N'invente aucun fait, ne dessine rien, ne construit rien |
| 3 | Ambiances (§4.5) | Le constat, les textes, `design-visuel`, `photographie-web` | Trois ambiances vraiment différentes, chacune sur quelques écrans (ordinateur et téléphone), avec une fiche pour le constructeur et le relevé de ses images | Ne choisit pas, ne construit rien en entier avant le choix |
| 4 | Construction (§4.6) | L'ambiance choisie et sa fiche, les textes, le constat | Toutes les pages avec navigation et pied de page communs, ses captures, le rapport de ses contrôles | Ne change pas d'ambiance, ne réécrit pas un texte, ne se relit pas lui-même |
| 5 | Relecture indépendante (§4.7) | Le site construit | Un verdict, puis ses remarques de la plus grave à la moins grave, chacune avec sa preuve | Ne modifie rien |

- **Constat** : la fiche contient les faits du client avec leur source (« non indiqué » quand il manque), les contradictions signalées sans les trancher, les défauts mesurés de l'existant, les images réutilisables avec leurs dimensions réelles, les preuves de confiance, la voie d'image qui s'impose, le test de l'identité (§1.10) et les questions au client (§4.3).
- **Rédaction** : le rédacteur fait relire ses textes par un sous-agent neuf qui chasse le bateau, le faux et le jargon (§4.4).
- **Construction** : le constructeur monte les textes mot pour mot et signale celui qui ne tient pas (§4.6).
- **Après la relecture** : firstmate tranche les remarques « à discuter », un worker corrige, le relecteur repasse, puis vient la présentation (§4.7).
- **Contrôles à la réception** : tailles d'écran et sans JavaScript, texte agrandi à 150 % et 200 %, texte sur photo, clavier, sincérité des images, vérité de chaque fait contre le constat (§4.8).

Pour les images de ce plombier :
- La voie banque est tranchée avant toute proposition visuelle (§1.12 ; `photographie-web` §2.1).
- La banque est gratuite pour le moment, sous licence permettant l'usage commercial (`photographie-web` §2.2).
- Chaque image est relevée : page d'origine, auteur, licence, emplacement (`photographie-web` §2.4).
- Une image de banque donne l'ambiance et ne se fait jamais passer pour le travail, le lieu ou les personnes du client (`photographie-web` §3.2 et §3.3).

## 2. Moments où le client décide

- **Dans la chaîne** : deux moments remontent au capitaine, puis au client : le choix de l'ambiance et la présentation du résultat (§4.2).
- **Au cadrage** : conserver, faire évoluer ou remplacer l'identité existante appartient au client (§1.10 et « Refuser ou remonter », Capitaine). Il fixe aussi le niveau d'accessibilité visé (§1.15), et la question de l'affichage des prix lui est posée à chaque projet (« Refuser ou remonter », Capitaine).
- **Aux validations** : il signe la validation des livrables (§5.6) et approuve formellement le site construit avant mise en ligne (§6.1).

Tout message, présentation ou livrable au client passe par le capitaine, et le worker ne contacte jamais le client (« Refuser ou remonter », Capitaine et Worker).

## 3. Qui écrit les textes, et quand

- Le client fournit les faits et le rédacteur du poste 2 écrit les textes (§2.9).
- La rédaction passe avant le design : le poste Ambiances reçoit les textes déjà écrits (§4.4 et §4.5).
- La facturation suit le cours : rédiger se facture en plus (§2.9).

## 4. Relecture du travail du constructeur

Non, dans les deux cas : le constructeur « ne se relit pas lui-même, sous-agent compris » (§4.6).

Le relecteur est neuf : il n'a ni écrit ni construit (§4.7). Il procède dans cet ordre (§4.7) :
1. Il écrit ses remarques avant de lire le rapport du constructeur.
2. Il juge d'abord sur la charte, écran par écran et à chaque taille (`design-visuel`, étape 6), y compris le fait que le site ne pourrait pas être celui d'un autre client.
3. Il juge ensuite sur le socle.

## 5. Une ambiance sans photo de banque ?

Non. Les trois ambiances sont « toutes dans la voie d'image tranchée au début du projet » (§4.5), donc toutes en banque d'images ici. Le site sans photo est une autre voie, choisie au cadrage quand il n'y a rien à photographier, pas une variante à glisser parmi les ambiances (`photographie-web` §2.1).

Les trois doivent différer par les images, les couleurs et le ton, pas par la mise en page (§4.5). En banque, cela passe par des séries cohérentes du même photographe (`photographie-web` §2.1 et §3.8) et un stock authentique, jamais générique (`photographie-web` §2.3).

## 6. Choix du modèle d'IA pour les workers

Aucune règle dans ces deux skills. Ils imposent seulement des workers distincts par poste (§4.1) et un relecteur neuf (§4.7), sans rien dire du modèle.