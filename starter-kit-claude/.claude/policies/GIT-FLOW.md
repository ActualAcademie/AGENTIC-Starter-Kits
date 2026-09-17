# Git Flow universel

## Branches obligatoires

La branche d intégration est définie dans `project-profile.toml`, habituellement `develop`. Toute modification produit commence sur une branche dédiée : `feature/<id>-<sujet>`, `fix/<id>-<sujet>`, `hotfix/<id>-<sujet>`, `chore/<id>-<sujet>`, `docs/<id>-<sujet>`, `refactor/<id>-<sujet>` ou `test/<id>-<sujet>`.

Ne jamais développer, committer ou pousser directement vers `main`, `master` ou la branche d intégration. La promotion vers ces branches passe par une Pull Request validée. Une branche ne porte qu un objectif cohérent et un seul work item actif.

## Commits atomiques

Un commit correspond à une intention vérifiable : une étape de conception, une migration, une modification fonctionnelle, des tests, une documentation liée ou une correction ciblée. Il contient le minimum de fichiers nécessaire, un message `type(scope): description` et des contrôles adaptés.

Les limites par défaut sont `75` fichiers et `1200` lignes modifiées par commit. Elles sont configurables dans `[delivery]` de `project-profile.toml` seulement après décision explicite et documentée. Un commit massif de code métier est interdit. Un lockfile ou artefact généré incompressible peut dépasser la limite uniquement dans un commit séparé, sans code métier, avec un message conventionnel et une justification dans le work item. L agent isole automatiquement ce commit et ne demande pas une autorisation pour une limite technique connue.

## Promotion

Une branche ne passe vers l intégration qu avec work item, conception à jour, tests proportionnés, preflight vert, preuves, audit indépendant et rapport sécurité lorsque la matrice l exige. `main` reçoit seulement des livraisons validées. Ne pas réécrire l historique des branches protégées.

## Contrôle automatisé

`verify-before-push.sh` bloque le push direct vers une branche protégée, les noms de branche non conformes et les commits dépassant les limites déclarées. Ne jamais contourner ce contrôle avec `--no-verify`.

## État inconnu

Si Git est indisponible, le Coordinateur peut préparer le travail et les preuves locales, mais ne doit pas prétendre avoir créé une branche, une Pull Request ou une fusion.
