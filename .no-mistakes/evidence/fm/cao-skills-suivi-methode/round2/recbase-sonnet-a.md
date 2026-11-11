TOOL: {"command": "cd /private/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/cao; F=/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/fiche-mutee.json; python3 - <<EOF\nimport json\nf=json.load(open(\"$F\"))\nprint(json.dumps({k:f[k] for k in f if k in(\"unit\",\"commit\",\"
TOOL: {"command": "python3 -c '\nimport json\nf=json.load(open(\"/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/fiche-mutee.json\"))\nprint(list(f.keys()))\nfor k in (\"unit\",\"commit\",\"maturity\",\"open_points\",\"limits\"):\n    print(k, json.dumps(f.get(k),indent=1,ensure_ascii=Fals
TOOL: {"file_path": "/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/fiche-mutee.json"}
TOOL: {"pattern": "\"limits\"|\"maturity\"|\"lifecycle_status\"|\"definition\"", "path": "/private/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/cao/method/cases/inclinometre-jimny-boitier/manifest.json", "output_mode": "content", "-n": true}
TOOL: {"file_path": "/private/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/cao/method/cases/inclinometre-jimny-boitier/manifest.json", "offset": 3000, "limit": 60}
TOOL: {"command": "which freecadcmd; git -C /private/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/cao log --oneline -3 --all"}
TOOL: {"pattern": "native_maturity_unestablished|definition_encore_incomplete|definition_scope", "path": "/private/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/cao/method", "output_mode": "content", "glob": "*.{py,md}", "-n": true, "head_limit": 30}
TOOL: {"command": "which freecadcmd; shasum -a 256 /private/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/cao/method/cases/inclinometre-jimny-boitier/manifest.json"}
TOOL: {"file_path": "/private/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-lab.ivSOOg/cao/method/check_method.py", "offset": 700, "limit": 40}

RESULT:
Le contrôleur donne `observed: non_etabli` alors que la fiche revendique `cao_numerique_verifiee`, donc je refuse la remise sur la maturité.

**Constats**
- **Écart de maturité.** `maturity.claimed` vaut `["cao_numerique_verifiee"]` (manifeste `lifecycle_status` et fiche `results.maturite.revendiquee`). La sortie du `summary` donne `observed: non_etabli`, avec `native_proofs: []` et l'erreur `native_maturity_unestablished` (`ok: false`). C'est un motif de refus de l'étape 4 : `observed` est sous un niveau revendiqué.
- **Fiche contredite.** Elle note pour `summary` « conforme, controles_reussis, maturité revendiquée et observée cao_numerique_verifiee ». La sortie de réception dit le contraire. La fiche affirme aussi une `observed` que le contrôleur ne confirme pas.
- **Empreinte du manifeste.** Le `manifest_sha256` du `summary` de réception est `76bf6582…`. La fiche, dans `delivered_files`, donne `547682cd…` pour le même manifeste. Je n'ai pas pu recalculer le sha moi-même (le shell a demandé une approbation). Si ces deux empreintes décrivent bien le même fichier, la copie contrôlée n'est pas celle que la fiche décrit.
- **Cause probable.** `native_maturity_unestablished` apparaît quand les preuves natives ne sont pas vérifiées sur les artefacts livrés. Si `freecadcmd` manque dans la copie de réception, le skill dit de ne pas accepter de maturité. Je ne l'ai pas vérifié non plus. Si la fiche a raison, il faut relancer `delivery` puis `summary` dans une copie avec `freecadcmd` et la bonne empreinte de manifeste.
- **Définitions ouvertes.** Les `limits[]` du manifeste déclarent bien les définitions encore ouvertes : cotes du module écran, angle de vision, zone de pose sur la planche, prise micro-USB de la Nano. Cela correspond à `definition_encore_incomplete` et `open_items: ["definition_scope"]`. En revanche, les `open_points` de la fiche ne citent que l'impression, les essais, le profil PETG et les suivis du lot méthode. Ils omettent ces définitions ouvertes, ce qui est un écart secondaire.

**Suite**
- Renvoyer au worker par `fm-send` le point exact : `native_maturity_unestablished`, `observed: non_etabli` contre `claimed: cao_numerique_verifiee`, l'écart de `manifest_sha256`, et les définitions ouvertes absentes des `open_points`.
- Ne pas requalifier la maturité ni baisser la revendication à sa place. Seul le worker peut la ramener à ce que le contrôleur observe, s'il ne peut pas établir les preuves natives.
- Je n'ai modifié aucun fichier.

VERDICT : refuser - maturité observée `non_etabli` (`native_maturity_unestablished`, aucune preuve native) sous la revendication `cao_numerique_verifiee`, fiche contradictoire avec le contrôleur et empreinte du manifeste différente de celle de la fiche.