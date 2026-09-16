# Skill conception

## Objectif

Définir une solution simple, cohérente et réversible avant une modification moyenne, élevée ou critique.

## Quand l'utiliser

Obligatoire lorsque le contrat, les données, l'architecture, l'API, les permissions ou le déploiement changent. Facultatif pour un correctif local à risque faible.

## Entrées requises

Brief, profil projet, système existant, critères d'acceptation, contraintes de compatibilité et matrice de risque.

## Procédure

1. Décrire le problème et les utilisateurs affectés.
2. Identifier les contrats entrants, sortants et les erreurs attendues.
3. Étudier les données, dépendances, observabilité, performance et sécurité utiles.
4. Comparer au moins l'option minimale et une alternative lorsque la décision est significative.
5. Décrire réversibilité, migration et plan de retour si nécessaire.
6. Définir des critères testables, puis créer les tâches spécialisées.

## Contrôles

Ne pas confondre hypothèse et fait vérifié. Ne pas modifier le produit avant que le contrat soit suffisamment clair. Ne pas imposer un choix métier non autorisé.

## Sortie

Contrat technique, options, recommandation, risques, critères et décision documentée si le choix est durable.

## Mesures

Décisions reprises, défauts de conception détectés en audit, changements de périmètre et migrations annulées.

## Arrêt

Arrêter pour décision humaine si une option engage de la conformité, des coûts importants, des données sensibles ou une action irréversible.
