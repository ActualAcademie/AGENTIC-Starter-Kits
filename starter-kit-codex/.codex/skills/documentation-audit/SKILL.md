# Skill documentation-audit

## Objectif

Ce Skill rend la documentation complète, vérifiable et exploitable.

## Mission

Auditer la qualité et la cohérence de la documentation avant livraison.

## Contrôles

- Présence des documents obligatoires.
- Métadonnées et statut cohérents.
- Absence de `[[A_COMPLETER]]`.
- Liens internes et chemins existants.
- Cohérence entre profil, code, API, diagrammes, tests et README.
- Exemples reproductibles ou limites documentées.
- Risques, décisions et alternatives tracés.

## Décision

Retourner `accepted`, `rework` ou `blocked` avec une preuve par anomalie.

## Entrées

Cahier des charges accepté, profil projet, décisions, work items et fichiers impactés.

## Procédure

Lire les sources, rédiger ou auditer, puis exécuter le validateur documentaire.

## Sortie

Document complet ou rapport d’audit avec preuves, inconnues et risques résiduels.

## Mesures

Nombre de documents contrôlés, anomalies trouvées, corrections et limites restantes.

## Arrêt

S’arrêter si une preuve manque, si une décision métier est nécessaire ou si le document reste incohérent avec le code.
