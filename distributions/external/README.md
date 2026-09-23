# Distribution externe

## Objectif

La distribution `external` conserve le kit localement hors du suivi Git du projet. Elle est recommandée lorsque le dépôt distant ne doit contenir aucune copie du kit d’orchestration.

## Fichiers suivis par Git

- `.workspace.toml`, qui contient l’orchestrateur, la version et la source.
- `.github/workflows/update-workspace-kit.yml`, qui détecte les nouvelles versions.
- `.gitignore`, qui protège les fichiers locaux du kit.

Les dossiers `.codex/` et `.claude/`, ainsi que `AGENTS.md` et `CLAUDE.md`, restent locaux et ignorés.

## Mise à jour

Le workflow ouvre une Pull Request pour mettre à jour `.workspace.toml`. Après fusion, le synchroniseur local s’exécute au démarrage d’une session. Il télécharge la version indiquée, crée une sauvegarde et met à jour uniquement les fichiers universels du kit.

Une mise à jour manuelle reste possible :

```bash
./install.sh --kit codex --mode external --target /chemin/vers/projet --force
```

## Données protégées

La synchronisation ne remplace jamais `PROJECT-BRIEF.md`, `project-profile.toml`, `RUNTIME-STATE.md`, les décisions, les work items, les rapports ou les métriques. En cas d’échec réseau, la version locale est conservée et l’agent signale l’erreur.

## GitFlow

Les Pull Requests automatiques ciblent `dev` ou `develop`. La branche `main` ne doit jamais être modifiée automatiquement.
