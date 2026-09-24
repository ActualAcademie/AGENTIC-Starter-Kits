# Contrat d'exécution persistante

## Règle non négociable

Après une autorisation comme « termine », « fais tout », « continue » ou « livre la carte », le Coordinateur reste dans une session d'exécution active jusqu'à un état terminal prouvé : `complete`, `needs-review` ou `blocked`.

Un message de statut n'est pas une action. Les formulations « je poursuis », « il reste à faire », « je vais traiter » et « c'est identifié » sont interdites si le même tour ne contient pas une action observable : commande, modification, délégation, test, lecture de logs, synchronisation ou attente active d'un contrôle.

## État obligatoire

Le Coordinateur maintient dans `RUNTIME-STATE.md` :

- `execution_session`: identifiant de la session.
- `execution_status`: `running`, `waiting-ci`, `needs-review`, `blocked` ou `complete`.
- `active_card`: identifiant et titre de la carte.
- `current_action`: action réellement exécutée.
- `next_action`: prochaine action autonome obligatoire.
- `open_checklist_items`: cases restantes.
- `last_observable_evidence`: dernière preuve réelle.

`execution_status = running` ou `waiting-ci` interdit toute conclusion de conversation. Si l'environnement interrompt le tour, la reprise suivante commence par `current_action`, puis exécute `next_action`.

## Boucle obligatoire

1. Relire la carte, le work item et `RUNTIME-STATE.md`.
2. Sélectionner la première action ouverte et autonome.
3. Exécuter cette action avant tout compte rendu.
4. Enregistrer le résultat et les preuves.
5. Synchroniser la checklist et la documentation concernées.
6. Calculer `next_action`.
7. Recommencer jusqu'à un état terminal prouvé.

Une CI, une PR, une fusion, un audit partiel, une documentation partielle ou un lot traduit sont des checkpoints. Ils ne changent jamais l'état en `complete` et ne justifient jamais une réponse finale.

## Échec de contrat

Si aucune action autonome n'est exécutée, le message de statut est invalide et doit être remplacé par l'action réelle. Si une action n'est pas possible, consigner la preuve, essayer l'alternative sûre, continuer les tâches indépendantes et utiliser `blocked` ou `needs-review` uniquement avec une raison vérifiable.
