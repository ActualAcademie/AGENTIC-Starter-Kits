# Skill project-onboarding

## Objectif

Adapter le kit à un nouveau projet avant toute modification du produit.

## Quand l'utiliser

Après acceptation du cahier des charges, après un changement majeur de stack ou si le profil est incomplet.

## Entrées

`.codex/PROJECT-BRIEF.md` accepté, `.codex/project-inventory.md`, `.codex/RISK-MATRIX.md`, état Git, manifests, documentation, scripts, CI existante et demande utilisateur.

## Procédure

1. Lire l'inventaire et les fichiers de projet pertinents.
2. Identifier langage, framework, gestionnaire de paquets, tests, build, CI, données, authentification, déploiement et conventions Git.
3. Si un choix technique n’est pas détectable, proposer une baseline cohérente avec le cahier, la documenter comme décision réversible et poursuivre sans demander une confirmation pour chaque outil. Demander uniquement les décisions métier, irréversibles, réglementaires, financières ou bloquantes.
5. Compléter `[stack]` dans `project-profile.toml` avec uniquement les technologies réellement détectées.
5. Compléter le reste du profil avec les commandes et conventions vérifiées.
6. Définir les commandes de validation réellement disponibles.
7. Conserver les conventions existantes, y compris la branche d'intégration.
8. Créer une décision locale si une convention est absente ou contradictoire.
9. Si `tracking.trello_choice = "enabled"`, appliquer le Skill `trello-planning` et compléter `docs/project-management/trello-board.md` avec toutes les cartes détaillées avant l implémentation.
10. Exécuter `bash .codex/scripts/initialize-project-design.sh`, puis appliquer le Skill `conception` pour compléter `docs/` avant toute implémentation.

## Sortie

Profil complété, résumé des faits confirmés, inconnues restantes et recommandations de Skills actifs.

## Contrôles

Chaque valeur renseignée doit être reliée à un fichier, une commande ou un résultat observable. Les champs inconnus restent inconnus, sans inférence.

## Mesures

Nombre de conventions détectées, inconnues restantes, temps d'initialisation et corrections ultérieures du profil.

## Arrêt

Ne pas deviner une commande, un environnement de production, une branche ou une politique de sécurité. Demander une décision si l'information ne peut pas être établie.
