# Politique des budgets Goal, retries, agents et métriques

Cette politique réduit les appels inutiles sans remplacer l'état natif du Goal.

## Budgets

Chaque Goal doit avoir un plafond explicite de durée, d'étapes et de tokens. Les valeurs par défaut sont 30 minutes, 40 étapes et 50 000 tokens. Aucune valeur illimitée n'est admise.

## Retries

Une opération utilise au maximum deux reprises après la tentative initiale. Une reprise est réservée aux erreurs transitoires identifiables, utilise une temporisation bornée et ne s'applique pas aux erreurs de validation, d'autorisation ou de configuration.

## Agents

Chaque appel d'agent possède un livrable, un périmètre, un budget et une preuve. Les appels sont plafonnés à trois par Goal, reprises comprises. La délégation récursive est interdite par défaut et les résultats valides sont réutilisés.

## Métriques

Les métriques locales peuvent enregistrer l'identifiant non sensible du Goal, les dates, étapes, tokens disponibles, agents, retries et résultat. Elles excluent les prompts, sorties complètes, secrets et données personnelles. Une donnée indisponible reste inconnue et ne vaut jamais zéro. Les métriques ne prouvent jamais à elles seules l'état natif ou la réussite.

## Contrôle

Avant une action, vérifier le budget restant. Après une action, enregistrer la preuve et les compteurs. En cas de dépassement, conserver l'état et la prochaine action sans boucle automatique.
