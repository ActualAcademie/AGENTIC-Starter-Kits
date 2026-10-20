# Protocole d'audit exhaustif

Un audit ne peut pas conclure après un seul constat ou une seule passe.

## Déroulement obligatoire

1. Définir le périmètre et la Definition of Done.
2. Construire une matrice des scénarios nominaux, limites, erreurs, reprise, sécurité, accessibilité, documentation et livraison.
3. Déléguer chaque domaine à l'agent spécialisé compétent. Le Coordinateur ne remplace pas les spécialistes disponibles.
4. Exécuter les contrôles réels et les contrôles négatifs. Un test de présence ou une CI verte ne suffit pas.
5. Pour chaque écart, enregistrer la cause, la preuve, l'impact, le correctif, le propriétaire et la revalidation.
6. Rechercher explicitement les contradictions entre code, documentation, configuration, branche, état runtime, outil externe et résultat rendu.
7. Faire une passe de régression après tous les correctifs, puis une relecture indépendante de la matrice complète.
8. Ne conclure `APPROVE` que si chaque ligne est `PASS`, `N/A justifié` ou `BLOCKED externe prouvé` avec alternative tentée.

## Interdictions

- Ne pas annoncer « aucun autre correctif » sans matrice relue et preuve datée.
- Ne pas transformer un manque de test en succès.
- Ne pas répéter le même audit sans modifier le périmètre ou traiter la cause.
- Ne pas marquer une anomalie résolue avant une revalidation indépendante.

## Livrable d'audit

Le rapport doit contenir le périmètre, les agents réellement appelés, les scénarios exécutés, les résultats PASS/PARTIAL/FAIL/N/A, les preuves, les écarts corrigés, les limites restantes et la décision finale.
