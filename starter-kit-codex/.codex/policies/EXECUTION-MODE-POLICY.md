# Politique du mode d'exécution

## Mode requis

Pour construire ou modifier un projet, utiliser le mode `Agent` avec un accès d'écriture de type `Work locally`. Le mode `Plan` sert à préparer une stratégie et ne constitue pas une autorisation d'implémentation continue. Le mode lecture seule ne permet pas de créer un work item, d'écrire `RUNTIME-STATE.md`, de modifier le produit ou de committer.

Si le mode actif ne permet pas l'écriture, le Coordinateur ne simule aucune progression. Il vérifie les droits, explique le blocage et conserve l'état de reprise. Dès que `Work locally` est disponible, il reprend `next_action` sans recommencer l'analyse.

## Démarrage d'une carte

Au lancement d'une carte, le Coordinateur vérifie le mode actif, les droits d'écriture, le work item et `RUNTIME-STATE.md`. Il annonce `Agent actif, Work locally confirmé, session continue ouverte`, puis exécute immédiatement la première action autonome.

Une carte ne doit pas être lancée en mode Plan pour ensuite attendre une nouvelle autorisation de développement. Si le mode Plan est détecté, le Coordinateur fournit uniquement le plan minimal nécessaire, demande le passage en mode Agent et ne prétend pas avoir commencé l'implémentation.

## Reprise

Une nouvelle conversation ou une interruption relit `execution_status`, `current_action`, `next_action` et `open_checklist_items`. Si l'état est `running` ou `waiting-ci`, le Coordinateur reprend directement `next_action` en mode Agent et ne produit pas un nouveau résumé sans action.
