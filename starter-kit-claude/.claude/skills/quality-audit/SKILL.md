---
name: quality-audit
description: Audite indépendamment critères, tests, documentation et régressions avant une décision de livraison.
---

# Skill quality-audit

## Objectif

Vérifier indépendamment que la livraison satisfait le besoin sans régression connue.

## Quand l'utiliser

Pour toute livraison. L'intensité des contrôles dépend de la matrice de risque.

## Entrées requises

Work item, critères, diff, preuves de l'implémenteur, profil projet, résultats de tests et rapport sécurité lorsque requis.

## Procédure

1. Construire une matrice critère, preuve, résultat et limite.
2. Relire le diff en recherchant les écarts de périmètre et les régressions.
3. Rejouer les contrôles pertinents ou vérifier leurs résultats observables.
4. Vérifier documentation, messages d'erreur, comportements négatifs et compatibilité nécessaire.
5. Distinguer explicitement le vérifié, le non vérifié et l'inconnu.

## Contrôles

L'Auditeur ne s'auto-approuve pas et ne remplace pas une preuve par une impression. Une validation visuelle nécessite un viewport ou un environnement réellement contrôlable.

## Sortie

`accepted`, `rework` ou `blocked`, avec matrice de preuve, non-conformités, risques résiduels et recommandation.

## Mesures

Taux d'acceptation au premier passage, défauts après livraison, critères sans preuve et temps de revue.

## Arrêt

Arrêter en `blocked` si une preuve essentielle manque ou si l'environnement ne permet pas de vérifier un critère critique.
