# Contrat de contexte projet

`project-profile.toml` est la source de vérité des technologies, commandes et conventions du projet importé.

`models.toml` est la source de vérité des modèles et niveaux de raisonnement par rôle et risque.

## Règle pour tous les agents

Avant toute proposition ou modification, lire :

1. `.codex/project-profile.toml`
2. `.codex/models.toml`
3. le work item actif
4. les fichiers directement concernés

Les agents doivent adapter leurs recommandations aux variables de `[stack]`. Ils ne doivent jamais proposer une technologie, une commande ou une convention qui contredit le profil sans documenter une décision et demander l'autorisation nécessaire.

## Variables de stack

| Variable | Usage |
|---|---|
| `stack.languages` | langages à considérer |
| `stack.package_manager` | installation et scripts |
| `stack.runtime` | environnement d'exécution |
| `stack.frontend.*` | règles client et tests visuels |
| `stack.backend.*` | API, logique serveur et tests |
| `stack.database.*` | données, ORM et migrations |
| `stack.infrastructure.*` | conteneurs, CI et déploiement |
| `stack.security.*` | identité, autorisation et secrets |

## Limite importante

Un fichier d'instructions ne réalise pas d'interpolation automatique de variables. L'effet fiable consiste à imposer la lecture du profil dans les instructions de chaque agent. Le script `show-project-context.sh` produit aussi un résumé compact, utile comme contexte de délégation. Le script `doctor.sh` distingue les outils obligatoires, les outils optionnels disponibles et les alternatives absentes avant toute commande.
