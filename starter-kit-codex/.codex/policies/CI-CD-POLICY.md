# Politique CI et CD

## CI par défaut

Les jobs GitHub Actions générés pour les contrôles du projet utilisent un runner auto-hébergé avec un label déclaré dans le profil du projet, lorsque celui-ci est disponible. Avant de lancer la CI, vérifier que le runner est enregistré, en ligne, autorisé pour le dépôt et équipé des outils requis. Si aucun runner auto-hébergé n'est disponible, exécuter les validations localement ou documenter le blocage ; ne pas basculer silencieusement vers un runner facturable.

La CI est générée après onboarding seulement. Elle exécute le preflight, le socle cybersécurité et les commandes déclarées dans `project-profile.toml`. Le workflow reçoit uniquement `contents: read`, limite les exécutions concurrentes et ne contient aucun secret.

## Commandes pilotées par le projet

`commands.install`, `commands.lint`, `commands.test`, `commands.build` et `commands.security` sont complétées avec les commandes réellement vérifiées pour le projet. Une commande vide est signalée comme non configurée, elle n'est jamais inventée.

## CD bloqué par défaut

Aucun déploiement n'est généré automatiquement. Avant toute automatisation CD, le projet doit définir l'environnement cible, les secrets hors dépôt, les approbations, la stratégie de migration, les vérifications après déploiement et une procédure de retour testable.

## Promotion

Une promotion exige CI verte observable, audit requis par la matrice de risque, rapport de livraison et approbation humaine lorsque le déploiement, des données sensibles ou une action irréversible sont concernés.
