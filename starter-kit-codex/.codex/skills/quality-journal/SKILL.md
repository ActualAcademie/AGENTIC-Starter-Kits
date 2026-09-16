# Skill quality-journal

## Objectif

Maintenir un registre unique des bugs, vulnérabilités, défauts de conception, régressions, écarts de documentation et corrections du projet.

## Quand l utiliser

À chaque audit de code, sécurité, tests, architecture, performance, accessibilité, documentation ou livraison. À chaque découverte d une anomalie et à chaque correction vérifiée.

## Entrées

`docs/quality/quality-journal.md`, work item, diff, résultats de tests, preuves d audit, conception et rapport spécialisé concerné.

## Procédure

1. Lire le journal avant l audit pour retrouver les anomalies ouvertes, récurrentes et déjà corrigées.
2. Rechercher un doublon avant de créer un identifiant.
3. Ajouter une entrée immédiatement pour toute anomalie observée, même si elle semble mineure.
4. Renseigner catégorie, gravité justifiée, composant, impact, reproduction, preuve, responsable et work item.
5. Lier la correction à un commit ou une tâche et ne jamais marquer `verified` sans preuve indépendante.
6. Après correction, ajouter tests de non régression, commande exécutée, résultat et date de vérification.
7. Mettre à jour les documents de conception concernés si la cause ou la correction change le comportement attendu.
8. Signaler au Coordinateur toute anomalie critique, récurrente, non attribuée ou dépassant le périmètre.

## Sortie

Une entrée unique, traçable et à jour dans `docs/quality/quality-journal.md`, avec statut et preuve cohérents. Les rapports d audit référencent l identifiant du journal.

## Mesures

Anomalies ouvertes par gravité, délai de correction, taux de vérification indépendante, récurrences, faux positifs, défauts après livraison et entrées sans propriétaire.

## Arrêt

Bloquer la livraison si une anomalie critique reste ouverte, si une preuve manque, si une correction n est pas vérifiée ou si le journal est incohérent avec les rapports et le code.
