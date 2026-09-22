# Skill documentation-authoring

## Objectif

Ce Skill rend la documentation complète, vérifiable et exploitable.

## Mission

Rédiger des documents techniques complets, vérifiables et adaptés à leur lecteur.

## Procédure

1. Identifier le lecteur, la décision attendue et le niveau de détail.
2. Lire le cahier accepté, le profil projet, les décisions et les work items.
3. Séparer faits vérifiés, hypothèses, inconnues et risques.
4. Rédiger avec le template adapté.
5. Ajouter exemples, diagrammes, commandes, critères et références.
6. Rechercher les documents impactés.
7. Exécuter `bash .codex/scripts/validate-documentation.sh`.

Ne jamais inventer une commande, un endpoint, une métrique, une conformité, une licence ou une preuve. Toute incertitude devient une inconnue suivie.

## Entrées

Cahier des charges accepté, profil projet, décisions, work items et fichiers impactés.

## Vérification complémentaire

Lire les sources, rédiger ou auditer, puis exécuter le validateur documentaire.

## Sortie

Document complet ou rapport d’audit avec preuves, inconnues et risques résiduels.

## Mesures

Nombre de documents contrôlés, anomalies trouvées, corrections et limites restantes.

## Arrêt

S’arrêter si une preuve manque, si une décision métier est nécessaire ou si le document reste incohérent avec le code.
