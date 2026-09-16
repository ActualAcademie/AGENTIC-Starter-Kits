# Matrice de risque

## Évaluation

Noter impact utilisateur, exposition externe, sensibilité des données, irréversibilité, complexité et incertitude. Chaque axe vaut 0 à 3. Le score aide le Coordinateur, mais un déclencheur automatique peut toujours augmenter le niveau.

| Niveau | Score indicatif | Déclencheur | Rôles requis | Contrôles |
|---|---:|---|---|---|
| faible | 0 à 3 | changement isolé et réversible | spécialiste, Auditeur | diff et test ciblé |
| moyen | 4 à 7 | composant ou logique interne | Concepteur, spécialiste, Auditeur | contrat et tests |
| élevé | 8 à 12 | API, donnée, dépendance, permission | Concepteur, spécialiste, Cybersécurité, Auditeur | menace, tests élargis, retour |
| critique | 13 à 18 | authentification, paiement, production, données sensibles | tous | validation humaine avant irréversibilité |

## Déclencheurs automatiques

Le risque est au moins élevé si la tâche touche identité, autorisation, secrets, données personnelles, production, paiement, dépendance critique, migration ou contrat public. Le risque est critique si une erreur peut exposer durablement des données, permettre une prise de contrôle ou rendre le retour impossible.

## Ajustement

Une inconnue majeure augmente le niveau d'un cran. Une preuve solide peut réduire une incertitude, mais ne retire pas un déclencheur automatique. La sécurité prime sur le coût et le délai.

## Sortie attendue

Le work item indique niveau, raisons, rôles requis, contrôles, plan de retour et décision humaine requise ou non.
