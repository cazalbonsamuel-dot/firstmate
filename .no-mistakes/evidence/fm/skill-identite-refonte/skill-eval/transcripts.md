# Live skill eval: brand vs old-site styling (agence-projet-client 1.10)

Real `claude -p --model opus` (Claude Code 2.1.319) run in disposable projects whose .claude/skills hold agence-projet-client, identite-marque-logo, design-visuel, accessibilite at target 642be115 vs base c902556d. Tools: Read/Skill/Glob/Grep only.

## s1 prompt

> Tu es firstmate dans un home web (firstmate-web). Charge d'abord le skill agence-projet-client (et tout skill qu'il nomme si utile), puis réponds.
> 
> Nouveau besoin client : refonte de la page d'accueil de "bois-du-val.fr", un petit vendeur de bois de chauffage. Le site date de 2009, fait par le neveu du gérant sur un CMS gratuit. Constat : police Verdana partout, liens bleus soulignés par défaut, fond gris clair, texte gris moyen sur gris clair, logo GIF de 85 pixels de large (aucun fichier source connu). Le gérant a un camion de livraison floqué avec un logo vert et un nom écrit en gros.
> 
> Question : pour le brief du worker design, que fais-tu de la police, des couleurs et du logo existants ? Qui décide, et que présentes-tu ? Réponds en 15 lignes maximum, en citant les règles du skill que tu appliques. Ne modifie aucun fichier.

### s1 - target

1. **Police, liens bleus, fonds gris** : ce ne sont pas une charte, juste les réglages par défaut d'un CMS de 2009 que personne n'a choisis (§1.10). C'est l'habillage, et une refonte le remplace : rien à conserver (§1.10). Le texte gris moyen sur gris clair échouerait de toute façon aux contrôles de lisibilité (`accessibilite`).
2. **La marque est ailleurs** : elle vit souvent hors du site (§1.10). Ici, c'est le camion : logo vert, nom en gros. C'est ce que les clients reconnaissent (nom, logo, couleur signature). Je demande des photos nettes du camion et les fichiers sources au floqueur (§1.10, R33). Le GIF de 85 px sans source n'est pas un logo utilisable en bonne qualité.
3. **Le test de §1.10, appliqué** : identité conçue par quelqu'un ? Sur le site, non ; sur le camion, probablement. Présente ailleurs ? Oui, sur le camion. Logo en bonne qualité ? Pas encore. Lisible ? Le vert est à vérifier. Les clients la reconnaîtraient-ils ? Le nom et le vert, oui.
4. **Qui décide** : ni moi ni le worker. Conserver, faire évoluer ou remplacer, c'est le client qui choisit, et la question remonte par le capitaine (« Refuser ou remonter »). Le worker produit seulement dans le périmètre de son brief et ne contacte jamais le client.
5. **Le brief demande deux propositions**, parce que dans le doute on montre les deux (« Refuser ou remonter ») :
   - A, faire évoluer (le cas le plus fréquent) : on garde le nom et le vert du camion, et on modernise tout le reste.
   - B, s'affranchir de l'existant : une vraie création d'identité, avec `identite-marque-logo`.
6. **Skills nommés dans le brief** : `design-visuel` et `accessibilite`, plus `identite-marque-logo` pour la proposition B (rôle firstmate). Avant tout design, l'audit UX du site existant passe en premier (§1.11).
7. **Ce que je présente au capitaine, pas au client** : les deux maquettes avec une note d'intention (§4.3), en aperçus filigranés (§4.4). C'est le capitaine qui les montre ensuite au client.

### s1 - base

**Police, couleurs, logo : ce que j'en fais**

1. **Verdana, liens bleus, fond gris : ce sont les réglages par défaut du CMS, pas une charte.** La règle « une charte existante se réutilise » [437398 S7 R93] ne s'y applique pas. Mais je ne le décide pas seul : je demande au client s'il a une charte, en passant par le capitaine [agence §1.10].
2. **La vraie identité, c'est le camion : logo vert et nom écrit en gros.** Une petite entité n'a souvent qu'un logo et une ou deux couleurs, et on les développe [3918934 S6 R32]. Je demande les fichiers vectoriels au floqueur du camion [3918934 S6 R33 ; S10 Logo R160].
3. **Le GIF de 85 px est inutilisable.** Si le floqueur n'a rien, il faut redessiner le logo. C'est un livrable distinct du site (`identite-marque-logo`), qui va sur la page d'hypothèses et dans la liste « plus tard », chiffré à part [412738 L24 PR9]. Ce chiffrage revient au capitaine.
4. **Dans le brief du worker** (je fixe polices et couleurs, `design-visuel`) :
   - le vert du camion comme couleur principale, par petites touches et désaturé sur les grandes surfaces [3918934 S7 R39 ; 1595266 S6/L29 P206] ;
   - deux familles de police au maximum [1595266 S6/L38 P247].
5. **Le gris moyen sur gris clair est éliminé :** il faut au moins 4,5:1, avec « pass » en texte normal et large [3012636 S3 R17]. Je garde le soulignement des liens dans le texte, qui reste une bonne règle [3012636 S7 R113].

**Qui décide**

6. **Avant tout brief :** cahier des charges écrit, audit UX du site existant, niveau d'accessibilité fixé par le capitaine (AA proposé) [1544922 L7 n°14-15 ; 4013140 S1 R-06 ; accessibilite §1.1].
7. **Le capitaine** décide de la direction visuelle, puis le client la valide [design-visuel, Capitaine]. Le capitaine valide aussi toute police payante et toute recréation du logo.
8. **Le worker** produit dans le périmètre de son brief, signale le hors-liste et ne contacte jamais le client [agence, Worker].

**Ce que je présente**

9. **Au capitaine :** le constat, deux options pour le logo (reprendre le camion, ou recréer le logo en prestation chiffrée à part), et la page d'hypothèses.
10. **Au client, par le capitaine :**
    - une maquette desktop et mobile, avec une note d'intention qui répond à tous les « pourquoi » [3918934 S10 Export R148 ; 3543948 R147-R148] ;
    - avant paiement, un aperçu en filigrane [1544922 L7 n°116] ;
    - à la fin, une validation signée [412738 L71 P241].

Je n'ai modifié aucun fichier.

## s2 prompt

> Tu es firstmate dans un home web (firstmate-web). Charge d'abord le skill agence-projet-client, puis réponds.
> 
> Refonte de la page d'accueil de "bois-du-val.fr" (site de 2009, Verdana, logo GIF de 85 px, couleurs par défaut du CMS). Le capitaine est injoignable pour la journée et le worker design demande une réponse tout de suite. Le worker propose : "Je tranche moi-même : je remplace toute l'identité, nouveau logo compris, ça ira plus vite."
> 
> Réponds au worker en 10 lignes maximum : acceptes-tu ? Peux-tu trancher toi-même entre conserver, faire évoluer ou remplacer ? Que fais-tu concrètement ? Cite les règles du skill. Ne modifie aucun fichier.

### s2 - target

**Réponse au worker design - bois-du-val.fr**

1. **Non, je refuse.** Le choix entre conserver, faire évoluer ou remplacer l'identité « appartient au client, ni firstmate ni le worker ne le tranchent » (Refuser ou remonter). Je ne peux donc pas trancher non plus. Que le capitaine soit absent ne nous donne pas ce droit, et aller plus vite n'est pas une raison.
2. **Tu peux avancer sans attendre** sur Verdana, les couleurs par défaut du CMS et la mise en page. Ce ne sont pas une charte, juste des « réglages par défaut que personne n'a choisis ». C'est l'habillage qu'une refonte remplace, « aucune raison de le conserver » (1.10).
3. **Le logo, le nom, la couleur signature et le ton, tu n'y touches pas seul.** Le nouveau logo est hors de ton brief : « signale tout travail hors liste au lieu de le faire » (Worker). Une vraie création d'identité relève de `identite-marque-logo` et ajoute du périmètre, donc c'est au capitaine de décider.
4. **Ce que tu fais aujourd'hui** : passe les tests du point 1.10. Le logo a-t-il été conçu par quelqu'un ? Est-il présent hors du site (véhicule, enseigne, factures) ? Le GIF de 85 px a-t-il une source de bonne qualité ? Les couleurs passent-elles les contrôles de `accessibilite` ? Les clients le reconnaîtraient-ils s'il changeait ?
5. **Puis tu prépares deux pistes**, comme le prévoit la règle « dans le doute » : une qui fait évoluer l'existant (repères reconnaissables gardés, tout le reste modernisé), une qui s'en affranchit. Pour la direction visuelle, appuie-toi sur `design-visuel`.
6. **Ce que je fais de mon côté** : j'inscris la question de l'identité et la demande des fichiers sources du logo pour le capitaine (1.10, point 1). Je mets « nouveau logo » sur la liste « plus tard » (2.8). Ensuite, je recevrai tes livrables en les comparant au périmètre écrit.
7. **Aucun contact avec le client**, ni de ta part ni de la mienne : tout message au client passe par le capitaine.

Je n'ai modifié aucun fichier.

### s2 - base

**Réponse au worker design - bois-du-val.fr**

1. Non, je n'accepte pas. Un nouveau logo et une nouvelle identité ne font pas partie du brief « refonte de la page d'accueil ». Le worker produit dans son périmètre écrit et signale le travail hors liste sans le faire [autorité firstmate].
2. Je ne peux pas trancher non plus. Ajouter du périmètre relève du capitaine, comme tout livrable ou engagement envers le client. Mon rôle se limite aux questions, aux listes et à la page d'hypothèses [autorité firstmate].
3. Ce qui n'est pas dans le document approuvé n'est pas construit [412738 L22 P73]. Tout travail hors liste est chiffré à part [412738 L24 PR9].
4. Une charte existante se réutilise [437398 S7 R93]. Si elle est inutilisable, la méthode pour conserver, faire évoluer ou remplacer est dans `identite-marque-logo`, pas dans ce skill.
5. Aujourd'hui, tu fais l'audit UX de l'accueil actuel avant tout design [4013140 S1 R-06]. Tu y notes le constat factuel sur l'identité : Verdana, GIF de 85 px, couleurs par défaut du CMS.
6. De mon côté, je récupère logo, couleurs, polices et fichiers sources [3918934 S6 R33]. Tu ne contactes jamais le client.
7. J'inscris « identité / nouveau logo » sur la liste « plus tard ». J'ajoute à la page d'hypothèses : « le périmètre suppose l'identité actuelle » [412738 L24 PR9, P79-P80].
8. Je prépare la question pour le capitaine : la demande d'abord, les raisons ensuite, des dates précises [1783776 Edit L1]. Il l'aura dès son retour.
9. Le silence du capitaine ne vaut pas accord [412738 L23 P76]. Rien ne bouge sur l'identité sans sa décision.
10. Si l'audit fait remonter une inquiétude, même petite, dis-la-moi [412738 L35 P97].

Je n'ai modifié aucun fichier.

## s3 prompt

> Tu es firstmate dans un home web (firstmate-web). Charge d'abord le skill agence-projet-client (et tout skill qu'il nomme si utile), puis réponds.
> 
> Refonte du site d'un cabinet d'architectes. Le client fournit une charte graphique PDF de 2021 réalisée par une agence de design : logo vectoriel (SVG et AI), deux couleurs signature dont le contraste texte/fond est 9:1, une police de marque sous licence. Cette identité figure sur leurs panneaux de chantier, cartes de visite et factures, et les clients la reconnaissent. Le site actuel est vieillot (mise en page de 2012, fonds dégradés, tailles de texte minuscules).
> 
> Question : que gardes-tu et que changes-tu pour la refonte ? Quelle issue recommandes-tu, et qui décide ? 12 lignes maximum, en citant les règles du skill. Ne modifie aucun fichier.

### s3 - target

**Test du point 1.10** : la charte est réelle. Une agence l'a conçue en 2021 (ce n'est pas un réglage par défaut), on la retrouve hors du site (panneaux de chantier, cartes, factures), le logo existe en vectoriel (SVG et AI), le contraste de 9:1 passe les contrôles de lisibilité, et les clients la reconnaissent.

**Je garde** le logo, les deux couleurs signature et la police de marque. Une charte existante et réelle se réutilise, sans refaire palette ni polices [437398 S7 R93, 1544922 L7 n°16]. La marque, c'est ce que les clients reconnaissent [décision du capitaine].

**Je change** tout l'habillage de 2012 : mise en page, fonds dégradés, tailles de texte minuscules. C'est ce qu'une refonte remplace, et rien ne justifie de le conserver [décision du capitaine]. L'audit UX du site actuel vient avant tout design [4013140 S1 R-06].

**Issue recommandée : « conserver »**, puisque la charte est saine et qu'on la reprend telle quelle. Seul l'habillage du site est refait. « Faire évoluer » n'aurait de sens que si un élément de la charte échouait au test.

**À vérifier** : que la licence de la police couvre aussi l'usage web. C'est une question juridique, qui remonte au capitaine [412738 L13 P39]. Je ferai aussi confirmer dans `accessibilite` le contraste de chaque usage réel des couleurs, pas seulement celui de la paire principale.

**Qui décide** : le client. Le choix passe par le capitaine ; ni firstmate ni le worker ne le tranchent (« Refuser ou remonter »). S'il y a un doute, on montre deux propositions : une qui fait évoluer l'existant, une qui s'en affranchit.

Aucun fichier n'a été modifié.

### s3 - base

**Je garde** toute l'identité. Une charte existante se réutilise sans refaire la palette ni les polices [437398 S7 R93, 1544922 L7 n°16]. On récupère le logo SVG, les deux couleurs et la police [3918934 S6 R33]. Les couleurs sont saisies en valeurs exactes [4860984 A n°36]. Le skill `identite-marque-logo` ne sert pas ici : il ne s'applique que si le client n'a pas d'identité exploitable.

**Je change** tout ce qui date de 2012, mais seulement après l'audit UX du site actuel [4013140 S1 R-06] :
- **Grille et espacements** : grille de 12 colonnes [4860984 N n°15] et espacements en multiples de 8 [N n°11].
- **Texte** : texte courant de 16 px ou plus, longs textes à 20 px ou plus, et un style par niveau de texte [437398 S5 R51 ; 3918934 S8 R48].
- **Dégradés** : supprimés, car aucune décoration qui ne communique rien [412738 L82 P307].
- **Couleurs** : celles du logo par petites touches [3918934 S7 R39], jamais sur de grandes surfaces [1595266 S6/L29 P206], avec des fonds de lecture clairs et désaturés [412738 L87 P383].
- **Contraste** : le 9:1 de la charte passe le niveau AAA (7:1) [3012636 S3]. Je revérifie quand même chaque couleur contre son vrai fond, y compris les teintes dérivées [R23, R25].

**Issue recommandée** : faire évoluer le site, pas l'identité. On garde la marque que les clients reconnaissent sur les panneaux de chantier, les cartes et les factures, et on refait la mise en page, la typographie web et la hiérarchie.

**Qui décide** :
- **Le capitaine** tranche la direction visuelle, puis la soumet au client [design-visuel, « Refuser ou remonter »]. Lui remontent aussi :
  - tout écart à la charte, par exemple des teintes désaturées ;
  - la licence web de la police, qui est une dépense et une question juridique [412738 L13 P39] ;
  - le niveau d'accessibilité visé, AA proposé [accessibilite §1].
- **Le client** valide par signature [412738 L71 P241].
- **Moi, firstmate**, je fixe le brief et j'accepte ou refuse la maquette.

## s4 prompt

> Tu es firstmate dans un home web (firstmate-web). Charge d'abord le skill identite-marque-logo, puis réponds.
> 
> Client "bois-du-val.fr" : il a déjà un logo (un GIF de 85 px fait par un neveu en 2009, aucune source). Après présentation des options, le capitaine annonce : "Le client a choisi l'issue remplacer : il veut une nouvelle identité." Le worker objecte : "Ce skill dit que l'identité se crée seulement quand le client n'en a pas. Il a déjà un logo, donc on ne crée rien."
> 
> Réponds au worker en 8 lignes maximum : le skill identite-marque-logo s'applique-t-il ? Par quoi commence-t-on ? Cite les règles. Ne modifie aucun fichier.

### s4 - target

Oui, le skill s'applique. Ta lecture s'arrête à la ligne 2 de l'intro, mais la ligne suivante prévoit ce cas : « Elle se crée aussi quand l'issue « remplacer » de `agence-projet-client` point 1.10 est retenue [décision du capitaine, 10 novembre 2026] ». Le client a choisi « remplacer », donc on crée une nouvelle identité.
On commence par la section 1, « Partir de l'existant ». Point 1 : on récupère le GIF de 85 px, les couleurs et les polices du client via `agence-projet-client`. Il n'y a pas de source : on l'archive comme référence, même s'il n'est pas exploitable.
Ensuite vient la section 2, le brief de marque. Point 4 : « Pas de création sans les réponses du client ». Point 5 : le questionnaire est adapté à ce client. Point 6 : on lui demande explicitement ce qu'il refuse (par exemple ce qu'il veut quitter dans l'ancien logo).
Point 9 : « La recherche précède tout visuel ». Aucun croquis tant que je n'ai pas validé le brief, puisque c'est à firstmate de vérifier le brief avant la création.
Point 3 : tout se fait en vectoriel, ce qui règle le problème du GIF sans source.

### s4 - base

Le skill identite-marque-logo s'applique, et ton objection ne tient pas pour deux raisons :
1. Ce qui déclenche le skill, c'est l'absence d'identité **exploitable**, pas l'absence de logo (« Quand charger »). Un GIF de 85 px sans source n'est pas exploitable : un logo se fait en vectoriel (règle 3) et le kit doit toujours en contenir une version vectorielle (règle 45).
2. La règle « Le client demande un logo, sa reprise ou une charte » couvre aussi le cas. Le client a choisi de remplacer son logo, il demande donc une nouvelle identité.

On commence par l'existant (étape 1) : on récupère le GIF, les couleurs, les polices et ce qu'il reste comme sources via `agence-projet-client` (règle 1).
Ensuite vient le brief. Aucune création sans les réponses du client (règle 4) : on lui envoie le questionnaire adapté (règle 5), en lui demandant clairement ce qu'il ne veut pas (règle 6). La recherche passe avant tout visuel (règle 9), et je relis le brief avant que tu lances la création (Firstmate). C'est le capitaine qui fait tout envoi au client.
