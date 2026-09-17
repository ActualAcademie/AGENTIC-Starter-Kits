---
name: trello-planning
description: Construit un tableau Trello détaillé à partir du cahier, de la conception et des audits après accord utilisateur.
---

# Skill trello-planning

## Objectif

Transformer le cahier des charges, la conception et les résultats d audit en un tableau Trello complet, détaillé et synchronisable.

## Quand l utiliser

Uniquement après une réponse utilisateur positive au choix Trello et après acceptation du cahier des charges. Le tableau complet versionné est toujours créé dans `docs/project-management/trello-board.md`. Sa création externe est effectuée si une intégration Trello autorisée est disponible, sinon le fichier reste prêt à synchroniser. Ne jamais prétendre qu une synchronisation externe a réussi sans preuve.

## Entrées

Cahier, dossier `docs/`, profil, roadmap, journal qualité, work items, contraintes, réponse Trello et liste validée des membres avec leur rôle.

## Procédure

1. Vérifier que chaque membre possède un nom et un rôle confirmé dans `tracking.trello_members`. Si la liste est vide ou ambiguë, arrêter et demander les informations manquantes.
2. Décomposer chaque objectif et user story en petites features logiques, indépendantes autant que possible et livrables sur une branche dédiée. Une carte ne doit pas regrouper plusieurs features sans lien.
3. Ajouter les cartes de conception, développement frontend ou backend, données, tests, sécurité, documentation, CI, audit et livraison lorsque pertinentes.
4. Découper chaque carte pour qu elle corresponde à une branche et à des commits atomiques.
5. Renseigner pour chaque carte ID, liste, feature, description détaillée, périmètre inclus et exclu, dépendances, critères d acceptation, preuve, responsable, estimation, priorité et risques.
6. Ajouter à chaque carte une checklist explicite : conception à jour, code, tests, sécurité, accessibilité si applicable, documentation, revue, preuve et Definition of Done.
7. Ajouter les cartes de correction pour chaque entrée ouverte du journal qualité.
8. Produire `docs/project-management/trello-board.md` avant toute synchronisation externe.
9. Si une intégration Trello autorisée existe, créer ou mettre à jour le tableau sans supprimer une carte existante et rendre compte des identifiants externes.
10. Synchroniser le statut Trello avec les work items, la roadmap et le journal qualité à chaque livraison.

## Sortie

Un tableau complet ou un plan versionné prêt à importer, sans tâche implicite, avec traçabilité cahier, code, tests et audit.

## Mesures

Stories couvertes, cartes sans critères, cartes bloquées, tâches orphelines, écarts entre le tableau et le dépôt, délai de mise à jour et tâches reprises.

## Arrêt

Arrêter si la réponse utilisateur est absente, si le périmètre est ambigu, si une carte critique manque de responsable ou si l intégration externe n est pas autorisée.
