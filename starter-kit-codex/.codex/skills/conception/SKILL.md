# Skill conception

## Objectif

Produire et maintenir un dossier de conception détaillé, exploitable par une équipe de développement, de test, de sécurité et de livraison. Le dossier traduit le cahier des charges en règles vérifiables, sans inventer de besoins métier.

## Quand l utiliser

Obligatoire juste après acceptation du cahier des charges et avant toute implémentation. Obligatoire de nouveau quand changent le périmètre, les stories, les données, l architecture, une interface, les permissions, le déploiement ou un risque significatif.

## Entrées

Cahier accepté, profil technique, inventaire existant, contraintes, critères d acceptation, matrice de risque, work item et décisions déjà enregistrées.

## Procédure

1. Exécuter `initialize-project-design.sh` sans écraser les documents existants.
2. Lire tous les éléments du cahier et distinguer faits, hypothèses, inconnues et décisions nécessaires.
3. Compléter `docs/product/vision-and-scope.md` avec acteurs, problème, objectifs mesurables, périmètre, hors périmètre et contraintes.
4. Écrire des user stories priorisées avec règles métier, critères observables, erreurs, permissions, cas limites et référence de test.
5. Décrire les parcours nominaux, erreurs, annulations et reprises. Ajouter des diagrammes Mermaid pour les parcours à décision multiple.
6. Décrire architecture, responsabilités, flux, dépendances, résilience, observabilité et exigences non fonctionnelles. Ajouter un diagramme de contexte réel.
7. Décrire modèle de données, classification, relations, invariants, rétention, migrations, restauration et diagramme de données lorsque pertinent.
8. Décrire les contrats API, événements ou interfaces partagées avec validation, réponses, erreurs, autorisations, compatibilité et versionnement.
9. Réaliser la conception de sécurité : actifs, menaces, contrôles, identité, permissions, secrets, détection et risque résiduel.
10. Construire une roadmap incrémentale, un plan de validation et rollback, puis inscrire les arbitrages dans le journal de décisions.
11. Remplacer tous les marqueurs `[[A_COMPLETER]]`. Écrire `Non applicable` avec justification au lieu de laisser une section vide.
12. Relier chaque document au work item, aux tests ou aux fichiers concernés et demander une relecture de sécurité ou métier lorsque le risque le requiert.

## Sortie

Un dossier `docs/` complet, cohérent et traçable. Un développeur externe doit pouvoir comprendre ce qui est attendu, comment le construire, comment le tester, quels risques éviter et quels changements restent hors périmètre.

## Mesures

Stories avec critères testables, documents sans marqueur, décisions tracées, écarts détectés en audit, changements de périmètre, couverture des flux critiques et corrections après revue.

## Arrêt

Arrêter et demander une décision humaine si le cahier reste ambigu, si une règle métier, une conformité, un coût, une donnée sensible ou une action irréversible ne peut pas être justifiée.
