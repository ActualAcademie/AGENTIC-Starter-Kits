---
name: project-onboarding
description: Détecte les technologies après acceptation du cahier et met à jour le profil de projet sans rien inventer.
---

# Skill project-onboarding

## Objectif

Adapter le kit à un nouveau projet avant toute modification du produit.

## Quand l'utiliser

Après acceptation du cahier des charges, après un changement majeur de stack ou si le profil est incomplet.

## Entrées

`.claude/PROJECT-BRIEF.md` accepté, `.claude/project-inventory.md`, `.claude/RISK-MATRIX.md`, état Git, manifests, documentation, scripts, CI existante et demande utilisateur.

## Procédure

1. Lire l'inventaire et les fichiers de projet pertinents.
3. Identifier langage, framework, gestionnaire de paquets, tests, build, CI, données, authentification, déploiement et conventions Git.
4. Si un choix technique n’est pas détectable, proposer une baseline cohérente avec le cahier, la documenter comme décision réversible et poursuivre sans demander une confirmation pour chaque outil. Demander uniquement les décisions métier, irréversibles, réglementaires, financières ou bloquantes.
6. Compléter `[stack]` dans `project-profile.toml` avec uniquement les technologies réellement détectées.
6. Compléter le reste du profil avec les commandes et conventions vérifiées.
7. Définir les commandes de validation réellement disponibles.
8. Conserver les conventions existantes, y compris la branche d'intégration.
9. Créer une décision locale si une convention est absente ou contradictoire.
10. Si `tracking.trello_choice = "enabled"`, appliquer le Skill `trello-planning` et compléter `docs/project-management/trello-board.md` avec toutes les cartes détaillées avant l implémentation.
11. Si le projet contient déjà du code, des fonctionnalités ou un historique de livraison, considérer l'initialisation comme une reprise de projet existant. Après le choix Trello, effectuer un audit complet et minutieux de la conception, du périmètre, de l'architecture, des données, de la sécurité, du code, des tests, de l'accessibilité, de l'UX, de la documentation, de la CI, de l'exploitation et des risques. Transformer chaque correction, dette, incohérence ou amélioration identifiée en carte Trello distincte, ordonnée par dépendances et classée MVP ou Post-MVP. Ne reprendre le développement qu'après la création et la relecture de toutes les cartes d'audit.
11. Exécuter `bash .claude/scripts/initialize-project-design.sh`, puis appliquer le Skill `conception` pour compléter `docs/` avant toute implémentation.

## Sortie

Profil complété, résumé des faits confirmés, inconnues restantes et recommandations de Skills actifs.

## Contrôles

Chaque valeur renseignée doit être reliée à un fichier, une commande ou un résultat observable. Les champs inconnus restent inconnus, sans inférence.

## Mesures

Nombre de conventions détectées, inconnues restantes, temps d'initialisation et corrections ultérieures du profil.

## Arrêt

Ne pas deviner une commande, un environnement de production, une branche ou une politique de sécurité. Demander une décision si l'information ne peut pas être établie.
