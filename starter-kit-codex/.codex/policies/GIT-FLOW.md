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

## Pull Requests automatiques

Toute Pull Request créée automatiquement par le starter kit cible exclusivement `develop` ou `dev`. Le workflow refuse toute autre branche cible, notamment `main`. Une promotion vers `main` doit être réalisée par un humain ou demandée explicitement par l’utilisateur dans la conversation, avec une justification et des contrôles verts.
## Pull Request par carte

Une carte Trello correspond par défaut à une branche de travail et à une seule Pull Request finale. Les commits restent atomiques et peuvent couvrir plusieurs étapes de la checklist, mais l'agent ne crée pas de PR pour chaque contrôle, sous-tâche, correction ou document. Si une PR existe déjà pour la carte, il la met à jour jusqu'à la Definition of Done. Une PR intermédiaire exige une demande explicite de l'utilisateur ou une justification critique documentée.
