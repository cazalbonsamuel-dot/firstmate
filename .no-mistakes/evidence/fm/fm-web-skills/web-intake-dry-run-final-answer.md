# Répétition à blanc : web-intake (lot 1, section 5)

J'ai seulement lu le home de test. Je n'ai lancé aucun worker, créé aucun item ni écrit ou envoyé quoi que ce soit. Le home ne contient que `data/captain.md` : aucun projet enregistré, aucun backlog, aucune config.

## 1. Classement
**Site neuf.** Il n'y a ni projet, ni dépôt, ni propriété Search Console. Ce n'est pas un audit, donc le besoin aboutira à des PR.

## 2. Demande et cadrage
**Demande mot pour mot :** « Je veux un site vitrine pour mon cabinet de kinésithérapie à Lyon, avec une page par spécialité et des avis de patients, et qu'il apparaisse dans les réponses de ChatGPT. »

- **Objectif mesurable.** Mettre en ligne un site où :
  - chaque page est indexée dans Google et Bing ;
  - chaque page peut apparaître en extrait ;
  - le robot de recherche d'OpenAI (OAI-SearchBot) y a accès, vérifié aussi côté CDN ;
  - mesure : couverture dans Search Console et Bing, et rapport « AI Performance » de Bing, datés.
  - « Apparaître dans ChatGPT » ne se garantit pas et ne se mesure pas directement. Un « rang IA » ponctuel n'est pas une mesure, et l'éventuel suivi des visites venant de ChatGPT est exclu par Q5. Cet écart doit être dit au capitaine.
- **Public (hypothèse bornée) :** des patients potentiels à Lyon qui cherchent un kiné pour un besoin précis.
- **Requêtes, une intention par page :**
  - accueil : trouver ce cabinet à Lyon ;
  - une page par spécialité réellement pratiquée : « kiné + spécialité + Lyon » ;
  - les avis ne s'ajoutent qu'après la vérification déontologique (voir les hypothèses ci-dessous).
- **Refusé d'office :** les variantes par quartier ou par ville, les synonymes, les FAQPage et HowTo, llms.txt et les « versions pour IA ».
- **Faits sourcés :** seulement la demande et les décisions Q3 à Q13.
- **Hypothèses à faire vérifier par une recherche sur sources primaires datées :**
  - le code de déontologie des masseurs-kinésithérapeutes pourrait encadrer, voire interdire, les témoignages de patients sur le site d'un praticien ;
  - un avis révèle qu'une personne est soignée, ce qui touche peut-être au RGPD (donnée de santé, consentement écrit) ;
  - les mentions légales obligatoires.
- **Inconnues :**
  - nom, adresse et praticiens du cabinet ;
  - liste des spécialités, avec la source de chaque titre ou diplôme affiché ;
  - existence d'un site actuel ;
  - origine des avis.

## 3. Pages déjà existantes
Il n'y a pas de propriété Search Console. Je le consigne et je vérifie sur le plan du site. Si le cabinet a déjà un site, il faut le mesurer et rediriger plutôt que dupliquer, d'où la question 1.

## 4. Mesure de départ
- Il n'y a pas de kit de contrôles. Le premier travail est donc la PR du lot 3 qui crée le projet et le kit : Playwright avec axe et Lighthouse CI. C'est la seule PR dispensée de mesure de départ, et sa première sortie sert de référence aux suivantes.
- Si un site existe déjà, on le mesure avant : captures 375/768/1440, Lighthouse en médiane de cinq passes, axe.
- Une seule mesure à la fois sur ce Mac.

## 5. Grille
| Ligne | Verdict |
|---|---|
| Domaine, registraire | **remonte** (Q2) |
| Hébergeur, compte, CGU | sans objet : Q3, Cloudflare Pages. Le compte sera demandé à la mise en ligne |
| Search Console, Bing, autre service | sans objet : Q4, à la mise en ligne. Le dépôt du code **remonte** (Q3) |
| Outil payant | sans objet (Q6/Q7) |
| Traceur, service tiers, polices, bandeau | sans objet (Q5), sauf un widget d'avis tiers, traité en Q4 |
| Direction de design | **remonte** (Q5, application de Q8) |
| Textes à publier | **remonte** : annoncé maintenant, demandé à la livraison, après la revue anti-slop par un worker distinct (Q10) |
| Preuve sociale (avis) | **remonte** (Q4) |
| Robots d'entraînement IA | sans objet : Q9 les autorise déjà, et la demande ChatGPT ne change pas la matrice |
| Fusion sur le site en ligne | **remonte** : annoncée maintenant, demandée à la livraison avec l'URL d'aperçu |

## 6. Mode de livraison
Le projet n'est pas enregistré. Livraison donc par le pipeline complet, fusion automatique désactivée. Elle le resterait de toute façon pour un site en ligne. Le manque d'enregistrement remonte avec la question du dépôt.

## 7. Découpage
1. **Recherche (scout, sans PR), lancée dès maintenant car compatible avec toutes les réponses :** déontologie des kinés et avis patients, RGPD, mentions légales.
2. **Lot 3 :** projet et kit de contrôles, dès que la question du dépôt est tranchée.
3. **Direction de design :** deux ou trois DESIGN.md présentés sur planche, à partir des sites du capitaine.
4. **Pages :**
   - accueil et cabinet ;
   - une page par spécialité ;
   - contact et mentions légales ;
   - avis, seulement si la recherche le permet et si les sources sont fournies.
5. **Textes :** revue anti-slop, puis relecture du capitaine.
6. **Technique de référencement :** robots.txt, données structurées de type « Local business » si la galerie de Google les retient.
7. **Mise en ligne :** domaine, Cloudflare, Search Console et Bing, puis fusion sur ton mot.

Un seul travail lourd à la fois.

## 8. Backlog (non écrit)
Je créerais un item noté : site neuf, l'objectif ci-dessus, les requêtes par page et les questions ouvertes. Chaque question ci-dessous serait mise en attente selon `captain-hold-lifecycle`.

---

## Ce qui remonte au capitaine, tel que je l'enverrais

> Capitaine, pour le site du cabinet de kinésithérapie à Lyon, j'ai cinq questions. Une recherche sur les règles applicables aux avis de patients démarre dès maintenant, car elle sert quelles que soient tes réponses.
>
> 1. **Site existant et domaine.** Le cabinet a-t-il déjà un site ou un nom de domaine ? Si oui, lequel ? Sinon, quel nom veux-tu et chez quel registraire ? *Effet : un site existant est mesuré et redirigé plutôt que dupliqué. Le domaine ne bloque que la mise en ligne.*
> 2. **Spécialités et cabinet.** Quelles spécialités pratiquez-vous réellement ? Donne aussi la source de chaque titre ou diplôme à afficher, plus le nom, l'adresse et les praticiens. *Effet : chaque spécialité devient une page. Rien n'est affirmé sans source.*
> 3. **Dépôt du code.** Où veux-tu que le code du site soit hébergé, par exemple un dépôt privé sur ton compte GitHub ? *Effet : c'est la condition du premier travail, la création du projet et de ses contrôles automatiques.*
> 4. **Avis de patients.** D'où viennent-ils : avis écrits que tu fournis avec le consentement des patients, ou avis Google ou Doctolib affichés par un module externe ? *Effet : un module externe est un service tiers qui demande ton accord. Les règles de communication des kinés pourraient interdire les témoignages, et la recherche lancée me le dira avec ses sources avant toute page d'avis.*
> 5. **Design.** Peux-tu me donner trois à cinq sites que tu aimes ? *Effet : j'en tire deux ou trois directions à comparer sur une planche. Aucune page n'est dessinée avant ton choix.*
>
> Sur ChatGPT, je ne peux pas garantir l'apparition dans ses réponses, et aucun outil ne la mesure de façon fiable sans traceur, ce que tu as exclu. Je m'engage sur ce qui se vérifie : site indexé dans Google et Bing, accessible au robot de recherche d'OpenAI, citations suivies dans le rapport IA de Bing. Si cet objectif te convient, je pars là-dessus.
>
> Pour la suite, deux autres demandes viendront plus tard : relire chaque texte avant publication, y compris les descriptions et les textes des images, puis décider de la mise en ligne avec l'URL d'aperçu. Le reste est déjà réglé par tes décisions : Cloudflare Pages, Search Console et Bing à la mise en ligne, pas de mesure d'audience, aucun outil payant, robots IA autorisés.
