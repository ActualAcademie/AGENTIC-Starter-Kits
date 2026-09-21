# Politique d autonomie et de récupération

## Principe

Après acceptation du cahier et du questionnaire de complétude, l agent travaille en autonomie continue. Une instruction explicite comme « fais tout », « vas-y jusqu’au bout » ou « livre la fonctionnalité » vaut autorisation continue pour le work item courant jusqu’à sa Definition of Done. Une erreur corrigeable déclenche automatiquement une boucle diagnostic, recherche, correction, validation et journalisation. L agent ne clôt pas la conversation avec une simple description d échec.

## Boucle obligatoire

1. Capturer le message complet, la commande, le code de sortie et le contexte.
2. Classer l erreur : code, dépendance, configuration, environnement, contrat, sécurité ou décision manquante.
3. Consulter d abord le dépôt, les logs et les documents officiels de la technologie concernée.
4. Rechercher sur internet si l information peut avoir changé ou si la documentation locale ne suffit pas. Privilégier les sources officielles et conserver les URLs consultées dans le work item ou l ADR.
5. Choisir la correction la plus sûre et la plus petite, puis l appliquer.
6. Rejouer le contrôle échoué et les tests de non-régression pertinents.
7. Répéter dans une limite documentée. Chaque tentative doit produire un résultat observable.
8. Continuer la conversation avec l’état, les corrections effectuées et le prochain contrôle, sauf blocage réel. Ne pas demander à l’utilisateur d’écrire « Continue » ou une approbation intermédiaire pour une étape déjà autorisée par le cahier et le work item.
9. Si la correction est partielle, poursuivre immédiatement avec l’étape suivante compatible, tout en consignant la limite résiduelle. Une erreur d’environnement ne doit pas interrompre les parties indépendantes du projet.

## CI et dette historique

Une CI en cours n’est jamais une conclusion. L’agent attend le résultat, relit les logs, corrige le premier échec, republie si nécessaire et relance les contrôles jusqu’à réussite, limite documentée ou blocage réel. Une dette historique détectée dans la zone du work item est traitée par petits lots jusqu’à la Definition of Done. Une dette hors périmètre reçoit un work item documenté et le travail indépendant continue.

## Corrections réversibles

Une correction de dépendance non majeure, un formatage, un lint, un test ou une configuration locale réversible est autorisé dans le work item courant. L’agent sauvegarde le diff, applique la correction, vérifie les changements de lockfile et relance les contrôles. Il ne demande pas « Continue » ni une approbation intermédiaire. Une demande de permission système peut encore être affichée par l’environnement d’exécution, mais elle ne doit pas être présentée comme un blocage métier.

## Autonomie autorisée

L agent peut choisir seul une dépendance compatible, une commande de test, une correction locale, une configuration réversible, une baseline technique documentée ou une stratégie de diagnostic. Il doit créer un ADR pour les choix structurants.

## Blocages réels

Une demande humaine reste nécessaire uniquement pour une décision métier, une action irréversible ou destructive, un accès externe, un secret, une dépense, une obligation réglementaire, un risque critique ou une ambiguïté qui change le produit. Dans ce cas, regrouper les questions et proposer un choix recommandé.

## Interdictions

Ne jamais inventer une source, masquer un échec, désactiver un contrôle pour obtenir du vert, utiliser `--no-verify`, contourner une sécurité ou déclarer une validation non exécutée. Une recherche internet informe une décision, mais ne remplace pas un test local. Une commande non supportée doit être remplacée par l’alternative officielle compatible avec l’environnement, puis vérifiée. Les modifications existantes hors périmètre doivent être préservées et signalées, jamais écrasées.
