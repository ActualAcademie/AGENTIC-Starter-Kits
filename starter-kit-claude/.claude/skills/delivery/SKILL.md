---
name: delivery
description: Prépare une livraison propre avec validation, documentation, Gitflow et rapport de décision.
---

# Skill delivery

## Objectif

Préparer une livraison Git propre, lisible, réversible et conforme aux conventions du projet.

## Entrées requises

Work item accepté, profil projet, état Git, rapport Auditeur, rapport Cybersécurité si requis et preuves de tests.

## Procédure

1. Vérifier branche cible, statut Git et changements hors périmètre.
2. Vérifier commits atomiques, message cohérent et documentation affectée.
3. Lancer le preflight et les contrôles du profil projet.
4. Préparer la revue avec objectif, critères, preuves, risques et plan de retour.
5. Respecter le Git Flow existant et les protections de branche.

## Contrôles

Ne jamais affirmer qu'une CI, une Pull Request ou un déploiement est vert sans résultat observable. Ne jamais fusionner dans `main` sans les autorisations et portes nécessaires.

## Sortie

Résumé de livraison, commandes, résultats, risques résiduels, décision de promotion et prochaine étape.

## Mesures

Temps de revue, échecs CI, retours de Pull Request, retours arrière et défauts après livraison.

## Arrêt

Arrêter si les contrôles échouent, si un rapport requis est absent, si la branche est incorrecte ou si une décision humaine de livraison est nécessaire.
