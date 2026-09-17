# Politique d autonomie et de récupération

## Principe

Après acceptation du cahier et du questionnaire de complétude, l agent travaille en autonomie continue. Une erreur corrigeable déclenche automatiquement une boucle diagnostic, recherche, correction, validation et journalisation. L agent ne clôt pas la conversation avec une simple description d échec.

## Boucle obligatoire

1. Capturer le message complet, la commande, le code de sortie et le contexte.
2. Classer l erreur : code, dépendance, configuration, environnement, contrat, sécurité ou décision manquante.
3. Consulter d abord le dépôt, les logs et les documents officiels de la technologie concernée.
4. Rechercher sur internet si l information peut avoir changé ou si la documentation locale ne suffit pas. Privilégier les sources officielles et conserver les URLs consultées dans le work item ou l ADR.
5. Choisir la correction la plus sûre et la plus petite, puis l appliquer.
6. Rejouer le contrôle échoué et les tests de non-régression pertinents.
7. Répéter dans une limite documentée. Chaque tentative doit produire un résultat observable.
8. Continuer la conversation avec l état, les corrections effectuées et le prochain contrôle, sauf blocage réel.

## Autonomie autorisée

L agent peut choisir seul une dépendance compatible, une commande de test, une correction locale, une configuration réversible, une baseline technique documentée ou une stratégie de diagnostic. Il doit créer un ADR pour les choix structurants.

## Blocages réels

Une demande humaine reste nécessaire uniquement pour une décision métier, une action irréversible ou destructive, un accès externe, un secret, une dépense, une obligation réglementaire, un risque critique ou une ambiguïté qui change le produit. Dans ce cas, regrouper les questions et proposer un choix recommandé.

## Interdictions

Ne jamais inventer une source, masquer un échec, désactiver un contrôle pour obtenir du vert, utiliser `--no-verify`, contourner une sécurité ou déclarer une validation non exécutée. Une recherche internet informe une décision, mais ne remplace pas un test local.
