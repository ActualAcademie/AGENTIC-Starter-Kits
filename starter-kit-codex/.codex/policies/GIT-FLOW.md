# Git Flow universel

## Branches

La branche d'intégration est définie dans `project-profile.toml`. Les branches de travail suivent la forme `feature/<id>-<sujet>`, `fix/<id>-<sujet>`, `hotfix/<id>-<sujet>` ou `chore/<id>-<sujet>`.

## Commits

Un commit correspond à une intention vérifiable. Format recommandé : `type(scope): description`. Les types admis sont `feat`, `fix`, `docs`, `test`, `refactor`, `perf`, `security` et `chore`.

## Promotion

Une branche ne passe vers l'intégration qu'avec tests proportionnés, preflight vert, preuves, audit indépendant et rapport sécurité lorsque la matrice l'exige. `main` reçoit seulement des livraisons validées. Ne pas réécrire l'historique des branches protégées.

## État inconnu

Si Git est indisponible, le Coordinateur peut préparer le travail et les preuves locales, mais ne doit pas prétendre avoir créé une branche, une Pull Request ou une fusion.
