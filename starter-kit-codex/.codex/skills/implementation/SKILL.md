# Skill implementation

## Objectif

Modifier le produit dans le périmètre approuvé et démontrer le comportement attendu.

## Quand l'utiliser

Pour frontend, backend, infrastructure, documentation technique ou tests. Utiliser les commandes déclarées dans `.codex/project-profile.toml` lorsqu'elles sont renseignées.

## Entrées requises

Work item, contrat, fichiers autorisés, dépendances, critères, niveau de risque et commandes du profil projet.

## Procédure

1. Lire le contrat et inspecter les fichiers concernés.
2. Vérifier l'état Git et préserver les changements existants.
3. Implémenter par petits changements cohérents.
4. Ajouter ou ajuster les tests qui démontrent les critères et les erreurs importantes.
5. Exécuter les contrôles proportionnés au risque.
6. Relire le diff et mettre à jour les documents affectés.
7. Rendre les commandes exactes, résultats et limites de validation.

## Contrôles

Pas de secret, de dépendance non justifiée, de refactorisation opportuniste, de modification hors périmètre ou de faux résultat de test. Une migration doit avoir un retour documenté si le risque est élevé ou critique.

## Sortie

Changements ciblés, tests pertinents, preuves reproductibles, risques résiduels et recommandation de revue.

## Mesures

Taux de tests verts, relances, défauts trouvés en audit, lignes hors périmètre et durée de reprise.

## Arrêt

Arrêter si le contrat est ambigu, si un échec identique se répète, si une dépendance est indisponible ou si le changement touche un domaine qui exige Cybersécurité.
