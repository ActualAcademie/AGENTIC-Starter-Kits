# Distribution native

## Objectif

La distribution `native` installe le kit directement dans le projet cible. Elle convient lorsque l’équipe accepte de conserver les fichiers d’orchestration dans le workspace et souhaite pouvoir les examiner dans Git.

## Contenu installé

- Le point d’entrée `AGENTS.md` ou `CLAUDE.md`.
- Le dossier `.codex/` ou `.claude/`.
- Le workflow de mise à jour du starter kit.
- Les règles d’ignorance des données de contexte propres au projet.

## Utilisation

Depuis le dépôt du starter kit :

```bash
./install.sh --kit codex --mode native --target /chemin/vers/projet
```

Pour Claude :

```bash
./install.sh --kit claude --mode native --target /chemin/vers/projet
```

## Versionnement et sécurité

Le socle universel peut être suivi par Git, mais le cahier des charges, le profil technique et l’état d’exécution restent des données locales ignorées. Les Pull Requests automatiques ciblent `dev` ou `develop`. La promotion vers `main` reste manuelle.
