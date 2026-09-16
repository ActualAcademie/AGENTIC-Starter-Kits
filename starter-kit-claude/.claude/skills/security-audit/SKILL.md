---
name: security-audit
description: Analyse les risques de sécurité et exige des contrôles proportionnés avant fusion ou livraison.
---

# Skill security-audit

## Objectif

Détecter, qualifier et réduire les risques exploitables avant livraison.

## Quand l'utiliser

Obligatoire pour risque élevé ou critique, et dès qu'une tâche touche identité, permissions, données sensibles, intégration externe, dépendance, production ou déploiement.

## Entrées requises

Work item, diff ou conception, profil projet, matrice de risque, architecture concernée et configuration non secrète.

## Checklist

Vérifier secrets, entrées non fiables, authentification, autorisation métier, exposition de données, dépendances, injections, uploads, logs, erreurs, sessions, CORS, CSRF, permissions et configuration de production.

## Procédure

1. Identifier actifs, frontières de confiance et utilisateurs malveillants plausibles.
2. Associer chaque risque à un scénario concret, un impact et une preuve.
3. Vérifier les contrôles déjà présents, puis proposer le correctif minimal.
4. Revoir le correctif et les tests négatifs lorsque celui-ci est appliqué.
5. Classer le risque résiduel et son propriétaire.

## Sortie

Rapport avec gravité, scénario, impact, preuve, recommandation, propriétaire, échéance et statut. Un risque critique bloque la livraison. Une acceptation de risque exige une décision humaine documentée.

## Mesures

Risques ouverts par gravité, temps de correction, faux positifs, régressions de sécurité et exceptions acceptées.

## Arrêt

Arrêter et escalader immédiatement en cas de secret exposé, accès non autorisé plausible, fuite de données ou risque critique non maîtrisé.
