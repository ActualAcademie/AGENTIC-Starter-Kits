# Distribution externe

Cette distribution conserve le kit hors du dépôt projet.

Le projet utilise le manifeste discret `.workspace.toml` et le workflow `update-workspace-kit.yml`. Le contenu des dossiers `.codex/` ou `.claude/`, les fichiers d’entrée et les données de contexte ne sont pas publiés dans le dépôt projet.

Les mises à jour sont détectées par le workflow, qui ouvre une Pull Request uniquement pour `.workspace.toml`. Après fusion, le synchroniseur local est exécuté au démarrage de l agent. Il télécharge la version indiquée, sauvegarde le kit local et préserve intégralement les données du projet. Une exécution manuelle avec `--force` reste disponible comme solution de secours.

La mise à jour ne remplace jamais `PROJECT-BRIEF.md`, `project-profile.toml`, `RUNTIME-STATE.md`, les décisions, les work items, les rapports ou les métriques. Une copie de sauvegarde est créée avant chaque remplacement du moteur du kit.
