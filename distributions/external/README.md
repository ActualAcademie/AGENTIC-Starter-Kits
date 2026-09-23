# Distribution externe

Cette distribution conserve le kit hors du dépôt projet.

Le projet utilise le manifeste discret `.workspace.toml` et le workflow `update-workspace-kit.yml`. Le contenu des dossiers `.codex/` ou `.claude/`, les fichiers d’entrée et les données de contexte ne sont pas publiés dans le dépôt projet.

Les mises à jour sont détectées par le workflow, qui ouvre une Pull Request uniquement pour `.workspace.toml`. Après fusion, réexécuter l’installateur externe avec `--force` pour synchroniser localement le kit correspondant à la nouvelle version.
