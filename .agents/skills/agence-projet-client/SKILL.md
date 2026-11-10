---
name: agence-projet-client
description: >-
  Load in a web (firstmate-web) home when a client need arrives (site, page, redesign, logo, content or audit), before any quote, worker brief or message to the client, and again before each presentation, approval or launch for that client.
user-invocable: false
metadata:
  internal: true
---

# agence-projet-client

Ce skill porte la relation client et le contrat de périmètre, du cadrage à la maintenance ; les méthodes de chaque domaine restent dans leur skill.

## Quand charger

- Un besoin client arrive : site, page, refonte, logo, contenu ou audit.
- Avant tout devis, brief de worker ou message au client, et avant chaque présentation, validation ou mise en ligne.
- Avant de proposer une maintenance ou de travailler le portfolio.

## Faire

### 1. Cadrer avant de produire

1. Exiger un cahier des charges écrit, « vraiment obligatoire » en contexte professionnel, et relancer s'il manque des informations [1544922 L7 n°14-15].
2. Si le client en fournit un, l'analyser d'abord et ne poser que les questions qui manquent [1544922 L17 n°19].
3. Poser les questions du plus simple au plus complexe [1544922 L17 procédure 3.3] :
   - De quoi s'agit-il, quels besoins ? Quels objectifs à court, moyen et long terme ?
   - « Si je ne devais travailler qu'une seule fois sur votre projet, que devrais-je faire ? » : par écrit, un ou deux jours pour répondre.
   - Quel élément mettre en avant ? Très souvent un appel à l'action.
   - Quels concurrents ? Quelle valeur ajoutée ?
4. Compléter : pourquoi, pour qui, quelle valeur pour les utilisateurs et pour l'entreprise, comment mesurer le succès, que peut-on réalistement faire [412738 L4 PR1].
5. Le succès est un événement mesurable (« 1 400 utilisateurs abonnés »), jamais « un site très réussi » [412738 L4 P9].
6. Un but business n'est retenu que s'il est spécifique, mesurable et atteignable ; sinon c'est une supposition dont le prestataire portera l'échec [4013140 S2 Step 01 R-17, R-18].
7. Commencer par le côté business : une proposition passe si elle mène au résultat que l'entreprise vise déjà [4013140 S2 Step 01 R-14 [préférence], R-15].
8. Identifier qui décide, finance et crée le contenu ; demander à chacun ce qui doit s'être passé trois mois après le lancement [412738 L12-L13 PR4].
9. Demander technologie en place, décisions déjà prises, règles du secteur [412738 L13 P38-P40].
10. Récupérer logo, couleurs, polices et si possible les fichiers sources [3918934 S6 Introduction R33] ; une charte existante et réelle se réutilise, sans refaire palette ni polices [437398 S7 R93, 1544922 L7 n°16].
   Les couleurs et la police d'un site ancien ne sont pas une charte : ce sont souvent des réglages par défaut que personne n'a choisis [décision du capitaine, 10 novembre 2026].
   - La marque est ce que les clients reconnaissent : nom, logo, couleur signature, ton [décision du capitaine, 10 novembre 2026].
   - La marque vit souvent hors du site (véhicule, enseigne, factures, cartes) : la chercher là aussi [décision du capitaine, 10 novembre 2026].
   - L'habillage du site (mise en page, polices, fonds, tailles) est ce qu'une refonte remplace : aucune raison de le conserver [décision du capitaine, 10 novembre 2026].
   - Avant de décider, tester : identité conçue par quelqu'un ou réglage par défaut ? Présente ailleurs que sur le site ? Logo disponible en bonne qualité ? Couleurs qui passent les contrôles de lisibilité (`accessibilite`) ? Les clients la reconnaîtraient-ils si elle changeait ? [décision du capitaine, 10 novembre 2026]
   - Trois issues [décision du capitaine, 10 novembre 2026] :
     - conserver : la charte est réelle et saine, on la reprend telle quelle ;
     - faire évoluer : on garde les repères reconnaissables et on modernise tout le reste ; cas le plus fréquent ;
     - remplacer : rien n'est récupérable ou le client veut changer ; vraie création d'identité, `identite-marque-logo`.
   - Le choix de l'issue remonte au capitaine : voir « Refuser ou remonter » [décision du capitaine, 10 novembre 2026].
11. Pour un site existant, l'audit UX passe avant toute liste de souhaits et tout design [4013140 S1 R-06].
12. Planifier à rebours depuis l'échéance : tâches, durées, calendrier [1783776 Edit, série 2, L1].
13. Faire fixer dès le cadrage le niveau d'accessibilité visé : `accessibilite`.

### 2. Fixer le périmètre

1. Les exigences ne se récoltent pas : on les génère et les débat avec le client ; un preneur de commandes perd sa valeur [412738 L19-L20 P59, P61].
   Contradiction : 1544922 L7 n°14-15 fait venir le cahier des charges du client ; retenu 412738, cours dédié ; le cahier écrit reste obligatoire.
2. Distinguer ce que les gens disent vouloir, ce dont ils ont besoin, ce dont ils ignorent avoir besoin [412738 L21 P65].
3. Parler du problème et du résultat, pas de l'outil [412738 L21 P68, P70 ; 1595266 S4/L5 P47].
4. Classer chaque fonctionnalité par importance et faisabilité ; le très important et très faisable est « include or die » et reçoit l'essentiel de l'effort [412738 L6 PR2].
5. Si « tout est prioritaire », jouer « Buy a Feature » : 30 fonctionnalités au plus, prix selon la complexité, budget pour la moitié au tiers [412738 L25 PR10].
6. Ce qui n'est pas dans le document approuvé n'est pas construit [412738 L22 P73].
7. Écrire dans la proposition et le contrat une page d'hypothèses : « le périmètre et le coût supposent que... ; toute fonctionnalité au-delà sera estimée séparément » [412738 L24 PR9].
8. Tenir une liste « maintenant » et une liste « plus tard », jamais de travail sans elle [412738 L24 P79-P80].
9. Le contenu est fourni par le client ; le rédiger ou engager un rédacteur se facture en plus [437398 S7 R92].
10. Design et intégration sont deux prestations distinctes [1544922 L5 n°2].

### 3. Chiffrer et contracter

1. Ne chiffrer qu'après objectifs, type de site, public, nombre de pages, spécificités et budget, le temps estimé d'après les projets passés [3918934 S10 Freelancing R169].
2. Partir d'un taux horaire qui intègre tous les coûts, comparer au marché local, puis proposer un prix par projet [2633036 Entr P177, Pr27].
3. Le montant cité pour débuter, 250 à 300 € par jour, est [daté] : valeur à vérifier au moment du projet [3918934 S10 Freelancing R170].
4. Toujours un acompte et un contrat ; la date ne se bloque qu'après signature et paiement [2633036 Entr P176].
5. Convenir du paiement par étapes : combien, à quel moment [805992 Futur/Freelance 157].
6. Le contrat nomme : acompte et date, coût total, échéance du solde, pénalités de retard, heures en plus, parties, livrables (nombre, format), livraison, urgence et annulation, signatures [2633036 Entr Pr26].

### 4. Présenter et faire valider

1. Montrer chaque livrable à l'équipe d'abord, puis aux parties prenantes : ce qui n'y est pas ne sera pas construit [412738 L71 P240].
2. Présenter écran par écran avec tous ; sinon envoyer le lien avec quoi regarder, quoi ignorer, quels retours attendus [412738 L71 P242].
3. Joindre une note d'intention [3918934 S10 Export R148].
4. Avant paiement, aperçu avec filigrane grand, répété, à opacité réduite [1544922 L7 n°116, L43 n°118].
5. Mettre le design dans un mockup et partager un prototype par lien [1544922 L39 n°121, L42 n°119 [préférence] ; 3918934 S10 Mockup R150].
6. Obtenir la validation signée ; une idée nouvelle va « en phase deux » [412738 L71 P241].
7. La présentation client vend le concept et répond à tous les « pourquoi » [3543948 How to Present Your Work R147-R148].
8. Tout message au client : la demande d'abord, les raisons ensuite, des dates précises [1783776 Edit, L1].

### 5. Mettre en ligne et maintenir

1. Faire approuver formellement le site construit : examiné, conforme, fonctionnel, travail supplémentaire payé [412738 L185 P567].
2. Prévenir qu'il y aura des bugs [412738 L185 P568].
3. Signaler les fautes flagrantes du contenu, qui relève du client [412738 L186 P571].
4. Faire passer la liste avant lancement, chaque critère chez son propriétaire [412738 L186 PR52] : texte (`contenu-ecriture`), liens, navigateurs, favicon, URL de production, sauvegarde (`construction-web`), formulaires (`formulaires`), titres et plan XML (`seo`).
5. Mesurer les indicateurs de succès du cadrage, prévoir un plan de maintenance [412738 L185 P569].
6. Proposer un contrat de maintenance mensuel, revenu récurrent [437398 S7 The 7 Steps P1].
7. Demander une recommandation à chaque client [2633036 Entr P173].

### 6. Positionner l'agence

1. Le portfolio est « une nécessité » : petite sélection, domaines variés, avec contexte [3918934 S10 Passer à l'action R166].
2. Trois études de cas, le meilleur travail d'emblée, celui qu'on veut être payé pour faire ; chacune montre le processus et les raisons des choix [2401332 S10·L43 P138, P140, P141].
3. Obtenir la permission du client avant de montrer sa marque [3543948 Portfolio Case Study Introduction R159].
4. Commencer petit [1544922 L54 n°141], puis se spécialiser et viser des clients récurrents [805992 Futur/Freelance 158 [préférence]].
5. Le travail gratuit sert seulement à s'exercer et au portfolio, de préférence pour une association [2401332 S10·L43 P142, 1544922 L47 n°134] ; dans un projet client, aucun travail gratuit qu'on regrettera [2633036 Entr P179].

## Refuser ou remonter

**Capitaine** [autorité firstmate] :
- prix, devis, remise, contrat, acompte, validation signée ;
- tout message, présentation ou livrable au client, tout engagement envers un tiers ;
- ajout de périmètre, travail gratuit, dépense ;
- affichage des prix, où le cours hésite [2633036 Entr P170 [préférence]], et usage d'un client dans le portfolio ;
- toute question réglementaire ou juridique [412738 L13 P39] ;
- conserver, faire évoluer ou remplacer l'identité existante (point 1.10) : ce choix appartient au client, ni firstmate ni le worker ne le tranchent ; dans le doute, montrer une proposition qui fait évoluer l'existant et une qui s'en affranchit [décision du capitaine, 10 novembre 2026].

**Firstmate** [autorité firstmate] : questions, ordre et relances ; skills de domaine nommés dans chaque brief ; listes et page d'hypothèses ; réception de chaque livrable contre le périmètre signé.

**Worker** [autorité firstmate] : produit dans le périmètre écrit de son brief, signale tout travail hors liste au lieu de le faire, ne contacte jamais le client.

Refus nets du cours :
- Pas de création sans cahier des charges écrit [1544922 L7 n°14-15] ni sans acompte [1544922 L7 n°117, 2633036 Entr P176].
- Pas d'aperçu en haute qualité avant paiement [1544922 L7 n°116] ; jamais de fichier source envoyé, des aperçus exportés [3918934 S10 Export R149].
- « Nous n'avons pas de concurrence » est toujours faux : exiger les cinq principaux concurrents [412738 L12-L13 P32, PR5], méthode dans `ux-recherche-tests` ; pour le formateur, c'est « le signal pour partir » [P42 [préférence]].
- Le silence vaut accord : même une petite inquiétude se dit [412738 L23 P76, L35 P97].
- Tout travail hors de la liste signée est chiffré à part [412738 L24 PR9, L185 P567] ; « Je pensais que... » en fin de développement signale un périmètre mal fixé [412738 L23 P75].

## Références

Cours sources :
- 412738 « UX & Web Design Master Course » : L4-L25, L35, L71, L185-L186.
- 1544922 cours de web design en français : L5, L7, L17, L39-L54.
- 3918934 « Fondamentaux du webdesign » : S6, S10.
- 1595266 « Design Rules » : S4/L5.
- 4013140 « The Simple Way to Conduct a UX Audit » : S1, S2.
- 437398 « Build Responsive Real-World Websites » : S7.
- 805992 « Développement web » : Futur/Freelance.
- 2633036 « Photography Masterclass » : Entr.
- 1783776 « Writing in Plain Language » : Edit.
- 2401332 « Logo Design Mastery » : S10·L43.
- 3543948 « The Branding Masterclass » : How to Present Your Work, Portfolio.

Frontières :
- Audit, recherche et analyse concurrentielle : `ux-recherche-tests` ; arborescence et wireframes : `architecture-information`.
- Questionnaire et concepts de logo, kit de marque : `identite-marque-logo` ; client local et avis : `seo-local-fiche-google`.
- Niveau d'accessibilité et statut légal : `accessibilite` ; promesses SEO : `seo` ; budget photo : `photographie-web`.
- Critères techniques avant lancement et argumentaire de vente : le skill de chaque domaine.
