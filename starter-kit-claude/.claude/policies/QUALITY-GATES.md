# Portes de qualité

| Porte | Requise pour | Preuve |
|---|---|---|
| Profil projet | toute tâche | `project-profile.toml` complété |
| Work item | toute modification | brief et critères |
| Tests ciblés | faible et supérieur | commande et résultat |
| Socle cybersécurité | toute livraison | `security-baseline.sh` |
| Conception | moyen et supérieur | contrat ou décision |
| Cybersécurité | élevé et critique | rapport de risque |
| CI | capacité `ci` activée | workflow et résultat observable |
| CD | capacité `deployment` activée | plan explicite, retour et approbation |
| Audit indépendant | toute livraison | matrice de preuves |
| Plan de retour | élevé et critique | procédure testable |
| Approbation humaine | critique | décision enregistrée |

Une porte non satisfaite bloque la promotion, sauf exception explicitement décidée avec propriétaire et date de révision.
