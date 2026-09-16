# Contribuer

## Flux de branches

Créer une branche depuis `develop` avec un préfixe `feature/`, `fix/`, `security/`, `docs/` ou `chore/`. Ne jamais pousser directement sur `main`. La promotion passe par une Pull Request vers `develop`, puis une Pull Request de release vers `main`.

## Commits

Un commit contient une intention vérifiable. Utiliser le format `type(scope): description`, avec les types `feat`, `fix`, `docs`, `test`, `refactor`, `perf`, `security` ou `chore`.

## Validation obligatoire

Avant une Pull Request, exécuter les contrôles du kit choisi, documenter les résultats et signaler toute limite.

```bash
# Codex
bash .codex/scripts/verify-before-push.sh

# Claude Code
bash .claude/scripts/verify-before-push.sh
```

Un projet sans code applicatif peut ne pas avoir de commandes lint ou test. Un projet avec frontend ou backend doit les déclarer et les exécuter.

## Revue

L'auteur ne s'auto-approuve pas. Les changements à risque élevé ou critique exigent le rapport cybersécurité et l'audit prévus par le kit.
