---
name: trello-planning
description: Construit un tableau Trello détaillé à partir du cahier, de la conception et des audits après accord utilisateur.
---

# Skill trello-planning

## Objectif

Transformer le cahier des charges, la conception et les résultats d audit en un tableau Trello complet, détaillé et synchronisable.

## Quand l utiliser

Uniquement après une réponse utilisateur positive au choix Trello et après acceptation du cahier des charges. Le tableau complet versionné est toujours créé dans `docs/project-management/trello-board.md`. Après une réponse `oui`, l agent passe par les états `pending_activation`, `syncing`, `verified` ou `blocked`. Il doit créer réellement le tableau sur Trello avec l intégration connectée. Il ne doit jamais s arrêter au fichier local si l intégration est disponible. Si l intégration est absente, il demande son activation, attend la confirmation de l utilisateur et reprend. Si elle reste indisponible, il signale explicitement le blocage et fournit le fichier prêt à synchroniser.

## Entrées

Cahier, dossier `docs/`, profil, roadmap, journal qualité, work items, contraintes, réponse Trello et liste validée des membres avec leur rôle.

## Procédure

1. Vérifier que chaque membre possède un nom et un rôle confirmé dans `tracking.trello_members`. Si la liste est vide ou ambiguë, arrêter et demander les informations manquantes.
2. Décomposer chaque objectif et user story en petites features logiques, indépendantes autant que possible et livrables sur une branche dédiée. Une carte ne doit pas regrouper plusieurs features sans lien.
3. Ajouter les cartes de conception, développement frontend ou backend, données, tests, sécurité, documentation, CI, audit et livraison lorsque pertinentes.
4. Découper chaque carte pour qu elle corresponde à une branche et à des commits atomiques.
5. Renseigner pour chaque carte ID, liste, feature, description détaillée, périmètre inclus et exclu, dépendances, critères d acceptation, preuve, responsable, estimation, priorité et risques.
6. Ajouter à chaque carte une checklist explicite : conception à jour, code, tests, sécurité, accessibilité si applicable, documentation, revue, preuve et Definition of Done.
7. Ajouter les cartes de correction pour chaque entrée ouverte du journal qualité.
8. Produire `docs/project-management/trello-board.md` avant toute synchronisation externe.
9. Lire `tracking.trello_board_id` et `tracking.trello_sync_status`. Si un identifiant existe, reprendre le tableau existant. Sinon, rechercher un tableau de même nom avant toute création afin d’éviter un doublon.
10. Si les outils Trello sont absents, enregistrer `pending_activation`, demander à l’utilisateur d’activer le plugin et ne pas annoncer de synchronisation.
11. Avec l’intégration Trello disponible, passer à `syncing`, rechercher le workspace cible, créer ou reprendre le tableau avec une visibilité adaptée, puis créer les listes manquantes dans l’ordre défini.
12. Créer ou reprendre chaque carte par son identifiant stable ou son titre préfixé, sans doublon, dans sa liste avec son titre, sa description complète, ses critères, dépendances, responsable et Definition of Done. dans sa liste avec son titre, sa description complète, ses critères, dépendances, responsable et Definition of Done. Créer la checklist et chacun de ses items dans Trello.
13. Relire le tableau, les listes, les cartes et les checklists depuis Trello. Conserver les identifiants et URLs dans `docs/project-management/trello-board.md`, puis passer `trello_sync_status` à `verified` uniquement si le tableau, les listes, les cartes, les checklists et les membres attendus sont relus avec succès.
14. Synchroniser le statut Trello avec les work items, la roadmap et le journal qualité à chaque livraison.

## Échéances et pauses contrôlées

Une date limite Trello ne suspend jamais tout le projet par défaut. Si une carte ne peut commencer avant sa date, la marquer `time-gated`, enregistrer la date ISO, la raison, les dépendances et la prochaine action dans le work item et `RUNTIME-STATE.md`. Suspendre uniquement cette carte et ses dépendances directes. Continuer les cartes indépendantes autorisées.

À la date prévue, reprendre la carte au prochain checkpoint, relire son état Trello et vérifier que la condition d’entrée est toujours vraie. Ne pas poller inutilement ni inventer un réveil automatique que l’environnement ne fournit pas. Une échéance dépassée déclenche une réévaluation, pas un contournement de contrôle.

## Sortie

Un tableau réellement créé et vérifié sur Trello, ou un blocage externe documenté avec le tableau local complet, sans tâche implicite, avec traçabilité cahier, code, tests et audit.

## Mesures

Stories couvertes, cartes sans critères, cartes bloquées, tâches orphelines, écarts entre le tableau et le dépôt, délai de mise à jour et tâches reprises.

## Arrêt

Arrêter si la réponse utilisateur est absente, si le périmètre est ambigu, si une carte critique manque de responsable ou si l intégration externe n est pas autorisée.
