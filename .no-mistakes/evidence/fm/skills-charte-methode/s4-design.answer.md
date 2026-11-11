Outils appelés : Skill({"skill": "design-visuel"}), Skill({"skill": "construction-web"}), Skill({"skill": "accessibilite"})

Capitaine, voici les verdicts, tirés du seul texte des trois skills. `design-visuel` ne numérote pas ses règles et le bloc défilement de `construction-web` non plus : je cite alors la section et la puce. `accessibilite` est cité par section et numéro.

| Cas | Verdict | Règle |
|---|---|---|
| a | CONFORME | `design-visuel` §2, Charte de l'agence, « Chaque site est différent », 4e puce : tout sombre ou tout clair se redécide à chaque projet. |
| b | NON CONFORME si rien d'autre ne fait respirer la page | `design-visuel` §2, Charte, puce « Du souffle » : une page tout entière sombre fatigue. |
| c | NON CONFORME | `design-visuel` §2, Charte, « Ce qui rend un site mauvais », 7e puce, et puce « Le premier écran » : un vrai bouton bien visible. |
| d | NON CONFORME | `design-visuel` §2, Charte, « Ce qui rend un site mauvais », 7e puce, et puce « Le premier écran » : sans devenir un bloc écrasant. |
| e | NON CONFORME | `design-visuel` §3, Composants et boutons, puce « Aucune carte à contour et ombre ». |
| f | NON CONFORME | `construction-web` §2, bloc « Défilement écran par écran », 2e puce : `scroll-snap` natif, jamais de détournement de la molette en JavaScript. |
| g | NON CONFORME | `accessibilite` §3, Mouvement, règle 3, et `construction-web` §2, bloc défilement, 5e puce : pas d'arrêt pour qui demande le mouvement réduit. |
| h | NON CONFORME | `construction-web` §2, bloc défilement, 3e et 4e puces : aucune hauteur forcée plus petite que le contenu. |
| i | NON CONFORME | `design-visuel` §2, Charte, « Ce qui rend un site mauvais », 9e puce : épuré veut dire peu de mots et des écrans pleins. |
| j | NON CONFORME | `design-visuel` §2, Charte, puce « Moderne n'est pas à la mode ». |
| k | La décision du capitaine l'emporte, donc NON CONFORME | `design-visuel`, « Faire », préambule, et §3, Composants et boutons, puce « Aucune carte à contour et ombre ». |

Précisions là où le verdict ne tient pas en une ligne :

- **a.** La condition est que ce ton soit décidé pour ce client et que l'ambiance reste franche : la Charte écarte « une ambiance timide, du beige par prudence » (« Ce qui rend un site mauvais », 5e puce).
- **b.** Les écrans plus clairs ne sont qu'un exemple (« par exemple »), et la façon de donner du souffle se décide à chaque projet. Leur absence seule ne condamne donc pas la maquette ; c'est l'absence de tout souffle qui la condamne.
- **c.** S'ajoute §3, Composants et boutons, 1re puce : un bouton ressemble à un bouton.
- **d.** L'image et le titre doivent dominer le premier écran. S'ajoute §3, Couleur à l'écran : en grande surface, une couleur vive se désature.
- **e.** La Charte classe aussi les boîtes parmi les défauts (« Ce qui rend un site mauvais », 3e puce), et le contrôle de réception exige « aucune boîte à contour ou ombre » (§6, 1re puce).
- **g.** Le `scroll-snap` est bien le bon mécanisme ; la faute est de le conserver pour ce visiteur.
- **h.** Un écran plus haut que la fenêtre se parcourt librement, sans retirer l'arrêt aux autres écrans. S'ajoute `accessibilite` §4, Agrandissement, règle 1 : rien ne se coupe.
- **i.** S'ajoutent la 1re des trois choses du moderne (« l'image d'abord ») et le défaut « des images pauvres » (1re puce).
- **j.** S'ajoutent les Refus nets de `design-visuel` (« cool » n'est jamais une justification ; pas de décoration qui ne communique rien) et `accessibilite` §3, Mouvement, règles 2 et 3.
- **k.** Le préambule dit qu'une décision du capitaine passe avant une règle de cours, qui reste citée. Les ombres légères et rares [437398 S5 R64] ne sont plus que l'« autre position », les boîtes ayant été l'un des pires défauts à l'essai.