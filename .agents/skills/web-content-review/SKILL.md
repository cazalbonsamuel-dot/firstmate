---
name: web-content-review
description: Load in a web (firstmate-web) home before accepting any text meant to be published - a page, an article, metadata, or alternative text - and before presenting it to the captain for reading.
user-invocable: false
metadata:
  internal: true
---

# Revue d'un contenu à publier

Deux portes, dans cet ordre, fixées par `data/captain.md` : une revue anti-slop par un worker distinct pour toute page de contenu rédactionnel, puis la relecture par le capitaine de tout texte publié, métadonnées et textes alternatifs compris.
La revue par worker distinct est une demande explicite du capitaine (Q10) : elle est autorisée hors du pipeline pour le contenu rédactionnel, jamais pour le code.
Aucun agent ne remplace la relecture du capitaine, que Google exige pour le contenu généré.

## Quand charger

- Avant d'accepter tout texte destiné à être publié : page, article, `<title>`, meta description, JSON-LD, textes alternatifs, microcopie.
- Avant de présenter ce texte au capitaine.

## Faire

1. Vérifier que la remise porte la liste « affirmations et sources » : chaque chiffre, date, citation, règle de moteur ou fait technique a sa source primaire (documentation officielle, étude, donnée du site), datée, qui soutient vraiment l'affirmation.
   Une source secondaire, absente ou qui ne dit pas ce qu'on lui fait dire renvoie au worker.
2. Vérifier que la page nomme l'élément original qu'elle apporte (mesure, expérience vécue, exemple réel, donnée du capitaine) et la requête réelle qu'elle sert.
   Vérifier aussi que le texte répond aux objections et craintes du plan de contenu et mène à l'action principale (`web-intake`) ; une FAQ visible est permise pour cela, sans balisage FAQPage.
3. Lire les sorties de Vale (tournures interdites, en avertissement) et de Grammalecte, preuves du kit obligatoires (`web-worker-brief`) ; chaque avertissement restant porte une justification écrite dans la PR.
   Une remise sans ces sorties renvoie au worker, hors la PR qui crée le kit (lot 3) ; un outil empêché est un blocage remonté au firstmate, pas un manque accepté.
4. Page de contenu rédactionnel : lancer la revue anti-slop par un worker Fable distinct de l'auteur, brief écrit avec `web-worker-brief`, en scout ; il rend des constats localisés (phrase, catégorie, correction proposée), sans réécrire ni noter le texte.
   Catégories de départ, à calibrer sur les premiers textes réels avant de durcir quoi que ce soit :
   - ouvertures et transitions creuses (« Dans un monde en constante évolution », « Il est important de noter que », « Plongeons dans ») ;
   - superlatifs de promotion sans preuve (« révolutionnaire », « incontournable », « de pointe », « clé en main », « booster ») ;
   - attributions vagues (« les experts s'accordent », « de nombreuses études montrent ») ;
   - structures mécaniques (« Ce n'est pas X, c'est Y » en série, énumérations systématiques par trois, « En conclusion », « N'hésitez pas à », questions rhétoriques en intertitre) ;
   - typographie de gabarit (tiret cadratin comme ponctuation, émojis dans les titres, gras sur un mot par phrase) ;
   - voix : chaque phrase comparée à la fiche `VOIX.md` du site, entrée figée de l'auteur (`web-intake`, `web-worker-brief`) nommée dans le brief du réviseur, et signalée quand on ne la dirait pas à voix haute à un client ;
   - langage clair : terme technique expliqué à sa première occurrence ou retiré, l'essentiel d'abord, intertitres qui disent ce que contient la section, une idée par paragraphe, mots du visiteur plutôt que ceux du métier ; sans longueur maximale de phrase, sans bannir le passif ni la négation, sans score de lisibilité ;
   - liens et titres, contrôlés sur la liste des liens et des titres extraite de la page : chaque lien, bouton et entrée de menu dit où il mène ou ce qu'il fait, compréhensible seul (jamais « cliquez ici », « en savoir plus » ou « nos services » seuls), et le `<title>` de la page dit sa fonction.
5. Faire corriger par l'auteur les constats retenus, puis vérifier qu'aucun point bloquant ne reste.
6. Vérifier la byline d'un auteur réel là où le lecteur l'attend, et qu'une image générée publiée garde ses métadonnées IPTC de type de source numérique `trainedAlgorithmicMedia` (http://cv.iptc.org/newscodes/digitalsourcetype/trainedAlgorithmicMedia).
   La valeur est exacte, casse comprise (`trainedAlgorithmicMedia` ou l'URI complète ci-dessus) ; toute autre valeur, `TrainedAlgorithmicMedia` compris, renvoie au worker.
   Aucune page ni mention de divulgation de l'usage de l'IA n'est imposée (Q12 retirée par le capitaine).
7. Préparer pour le capitaine un résumé à relire lui-même : tous les textes publiés de la PR (y compris `<title>`, meta description, JSON-LD, textes alternatifs), la liste « affirmations et sources », les avertissements justifiés, les emplacements de preuve sociale en attente de sa source, et l'URL d'aperçu ; le résumé l'invite à lire les textes à voix haute.
   Tenir sa relecture selon `captain-hold-lifecycle` ; ses corrections repartent au worker auteur.

## Refuser ou remonter

- **Capitaine** : la relecture de tout texte publié ; la source de toute preuve sociale (témoignage, logo, chiffre d'usage, note, prix, distinction).
- **Firstmate** : acceptation de la liste des sources, lancement de la revue anti-slop, constats retenus, forme du résumé.
- **Worker réviseur** : ses constats, sans réécrire le texte ni contacter le capitaine ; **worker auteur** : les corrections.
- Refuser toute preuve sociale inventée ou sans source fournie par le capitaine ; à la place, un emplacement marqué.
- Refuser tout score de détecteur de texte IA comme preuve, contrôle ou argument, dans un sens comme dans l'autre.
- Refuser un objectif de nombre de mots : la longueur suit le sujet.

## Références

- `data/captain.md` : relecture du capitaine, revue anti-slop (Q10), sources primaires, détecteurs, Q12.
- Google, contenu utile (Who, How, Why) : https://developers.google.com/search/docs/fundamentals/creating-helpful-content
- Google, contenu généré par IA et vérification humaine, métadonnées comprises : https://developers.google.com/search/docs/fundamentals/using-gen-ai-content
- Wikipédia, signes d'écriture par IA (catégories de tournures) : https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing
- Skill `website-design:landing-page` : preuves inventées et mots interdits.
- GOV.UK, Use the right tone (« Write conversationally ») : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/right-tone/
- GOV.UK, Use clear language (termes expliqués à leur première occurrence) : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/clear-language/
- GOV.UK, Create a clear structure (l'essentiel d'abord, intertitres) : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/clear-structure/
- GOV.UK, Write effective links (pas de « click here » ni de « more ») : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/add-links/
- NN/g, How Users Read on the Web (1997) : https://www.nngroup.com/articles/how-users-read-on-the-web/
- NN/g, Better Link Labels: 4Ss (2019) : https://www.nngroup.com/articles/better-link-labels/
- WCAG 2.2, critères 2.4.2 Page Titled (A), 2.4.4 Link Purpose (A) et 2.4.6 Headings and Labels (AA) : https://www.w3.org/TR/WCAG22/
- François Lavallée, nuance sur les règles de clarté en français (passif, longueur de phrase) : https://youtu.be/CQhHz9AW4Sg
