# Politique de validation

## Principe

La validation doit démontrer le résultat demandé et non seulement l'absence d'erreur de syntaxe. Chaque contrôle est choisi selon le risque et le profil projet. Avant toute commande, vérifier que l’outil est installé et que l’environnement permet réellement son exécution. En cas d’absence, utiliser l’alternative compatible la plus fiable et la documenter.

## Niveaux

| Risque | Contrôles minimaux |
|---|---|
| faible | diff, test ciblé ou vérification directe, audit indépendant |
| moyen | contrat, tests fonctionnels, documentation, audit |
| élevé | tests négatifs, sécurité, plan de retour, audit complet |
| critique | environnement contrôlé, plan de retour testé, sécurité, audit, décision humaine |

## Preuves acceptées

Commande et code de sortie, capture d'un test lisible, réponse API observée, rendu visuel dans un viewport contrôlé, diff relu, configuration inspectée ou rapport d'audit. Une déclaration sans résultat observable n'est pas une preuve.

## Limites

Une contrainte d'environnement, comme un réseau indisponible ou une dépendance manquante, doit être signalée comme limite. Elle ne transforme pas un contrôle non exécuté en contrôle validé.

## Régression

Après une modification importante, vérifier au minimum le comportement modifié, une erreur pertinente, la compatibilité annoncée et les zones voisines à risque. Étendre les tests seulement si le changement ou un échec le justifie.
Tout work item qui modifie une interface, un composant, un parcours ou un média frontend doit inclure une validation dans un navigateur réel ou dans un outil de navigateur effectivement contrôlé. La preuve indique le parcours, le viewport, les interactions, les états observés, les anomalies et les captures. Sans cette preuve, la Definition of Done frontend reste incomplète.
