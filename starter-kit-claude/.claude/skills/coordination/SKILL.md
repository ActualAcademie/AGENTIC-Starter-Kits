---
name: coordination
description: Décompose un objectif accepté, coordonne les rôles et clôture avec des preuves vérifiables.
---

# Skill coordination

## Objectif

Transformer une demande en livraison vérifiable, avec un seul responsable du plan et des dépendances explicites.

## Quand l'utiliser

Pour toute demande qui modifie le produit, ses documents, sa configuration ou sa livraison. Ne pas l'utiliser pour une question purement explicative sans changement attendu.

## Entrées requises

Demande, critères d'acceptation, `.claude/project-profile.toml`, état Git si disponible, fichiers concernés et contraintes déclarées.

## Procédure

1. Créer un work item avec résultat, hors périmètre, critères et budget.
2. En mode `autonomous-after-brief`, regrouper les choix non bloquants en décisions réversibles dans un ADR et continuer sans interrompre l’utilisateur. Ne poser qu’une demande consolidée pour les blocages réels.
3. Évaluer le risque avec `.claude/RISK-MATRIX.md`.
4. Décomposer le résultat en tâches atomiques qui indiquent rôle, Skill, dépendances, fichiers autorisés et preuves.
5. Ne paralléliser que les tâches sans contrat ni fichier commun.
6. Transmettre le contexte minimal utile, jamais le dépôt entier par défaut.
7. Collecter les rapports, preuves et risques résiduels.
8. Demander l'audit requis, puis clôturer ou faire reprendre le travail.

## Contrôles

Chaque tâche doit avoir un propriétaire, un risque, un périmètre, une règle d'arrêt et une preuve attendue. Toute dérive de budget, de portée ou de sécurité impose une escalade.

## Sortie

Plan de travail, état des dépendances, décision de clôture et évaluation enregistrée.

## Mesures

Tours, contexte transmis, relances, durée, défauts après audit et tâches reprises.

## Arrêt

Arrêter si le besoin devient ambigu, si une décision métier ou irréversible est nécessaire, si le budget est dépassé ou si une dépendance externe manque.
