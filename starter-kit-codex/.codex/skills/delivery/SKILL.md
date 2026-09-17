# Skill delivery

## Objectif

Préparer une livraison Git propre, lisible, réversible et conforme aux conventions du projet.

## Entrées requises

Work item accepté, profil projet, état Git, rapport Auditeur, rapport Cybersécurité si requis et preuves de tests.

## Procédure

1. Vérifier branche cible, version `VERSION`, entrée `CHANGELOG.md` et statut Git. statut Git et changements hors périmètre.
2. Vérifier que la branche est dédiée au work item, que les commits sont atomiques, sous les limites déclarées et que la documentation est affectée. Refuser tout commit massif ou mélange de features.
3. Vérifier que le commit ou la release respecte `VERSIONING.md` et que `CHANGELOG.md` recense le changement.
4. Lancer le preflight et les contrôles du profil projet.
5. Préparer la revue avec objectif, critères, preuves, risques et plan de retour.
6. Respecter le Git Flow existant et les protections de branche.

## Contrôles

Ne jamais affirmer qu'une CI, une Pull Request ou un déploiement est vert sans résultat observable. Ne jamais fusionner dans `main` sans les autorisations et portes nécessaires.

## Sortie

Résumé de livraison, commandes, résultats, risques résiduels, décision de promotion et prochaine étape.

## Mesures

Temps de revue, échecs CI, retours de Pull Request, retours arrière et défauts après livraison.

## Arrêt

Arrêter si les contrôles échouent, si un rapport requis est absent, si la branche est incorrecte ou si une décision humaine de livraison est nécessaire.
