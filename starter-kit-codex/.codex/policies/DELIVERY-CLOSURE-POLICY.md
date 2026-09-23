# Politique de clôture et de blocage des livraisons

## Principe

Une carte ne doit jamais rester globalement `En cours` uniquement parce qu’une sous-tâche exige une décision humaine. Le Coordinateur distingue l’avancement réel, les limites techniques et les autorisations manquantes.

## États obligatoires

- `complete` : toutes les actions prévues et autorisées sont terminées avec preuves.
- `needs-review` : le travail est prêt, mais une décision humaine est requise avant une action sensible.
- `blocked` : une dépendance externe ou technique empêche réellement de poursuivre.
- `in-progress` : au moins une action autonome reste à exécuter.

Une carte est découpée en sous-tâches indépendantes lorsque certaines sont terminées et qu’une autre est sensible, risquée ou dépend d’une autorisation.

## Actions sensibles

Un rollback de production, une migration destructive, une rotation de secret, une suppression de données, une modification de permissions ou une dépense peuvent nécessiter une décision humaine. L’agent doit cependant préparer la procédure, vérifier les prérequis, tester une simulation ou un environnement non productif et documenter le plan de retour.

L’agent ne doit jamais exécuter une action irréversible ou susceptible d’interrompre la production sans autorisation explicite. Cette restriction ne justifie pas l’arrêt des tâches autonomes et réversibles.

## Definition of Done partielle

Avant de clôturer ou de suspendre une carte, le Coordinateur doit :

1. Lister les sous-tâches terminées, restantes et bloquées.
2. Relier chaque élément à une preuve réelle.
3. Décrire la limite exacte et l’autorisation manquante.
4. Poursuivre les actions autonomes restantes.
5. Mettre à jour le work item, le journal qualité, la roadmap et Trello.
6. Relire la carte et sa checklist directement depuis Trello.
7. Utiliser `needs-review` pour une décision humaine et `blocked` uniquement pour une impossibilité réelle.

Une carte ne peut être annoncée comme terminée si une action nécessaire reste non préparée. Elle peut être livrée avec une sous-tâche en attente uniquement si cette sous-tâche exige explicitement une décision humaine ou une action irréversible.
