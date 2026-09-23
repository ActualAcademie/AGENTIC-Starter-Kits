# Politique universelle de routage des demandes

Cette politique s’applique à toute demande reçue après l’acceptation du cahier des charges, y compris lorsque le projet est déjà déclaré terminé.

## Qualification obligatoire

Le Coordinateur ne transmet jamais une demande directement à un agent sans la qualifier. Il identifie le résultat attendu, le périmètre, le risque, les contraintes, les fichiers concernés, les dépendances, les preuves attendues et la Definition of Done.

Une demande hors cahier des charges devient une évolution tracée du périmètre vivant. Le cahier initial reste historique et ne doit pas être réécrit pour masquer l’ajout.

## Routage par domaine

| Signal principal | Agent responsable | Agents associés possibles |
| --- | --- | --- |
| Vision, besoin, priorités ou règles métier | Produit | Concepteur, Coordinateur |
| Architecture, modèle de données ou choix structurant | Concepteur | Backend, Frontend, Cybersécurité, Auditeur |
| Interface, parcours, responsive, animation ou accessibilité | Frontend | Concepteur, UX Research, Accessibilité, QA |
| API, logique métier, données ou intégration | Backend | Concepteur, Cybersécurité, QA, Data |
| Menace, vulnérabilité, secret, permission ou conformité | Cybersécurité | Backend, Frontend, DevOps, Auditeur, Conformité |
| Tests, régression ou qualité de livraison | QA | Agent technique concerné, Auditeur |
| Pipeline, déploiement, conteneurs ou observabilité | DevOps | Backend, Cybersécurité, Performance |
| Performance, coût ou capacité | Performance | Backend, Frontend, DevOps, Coordinateur |
| Documentation technique ou utilisateur | Documentation | Concepteur, agent technique concerné |
| Version, migration, release ou publication | Release | Auditeur, Documentation, Coordinateur |
| Demande transverse ou ambiguë | Coordinateur | Concepteur, Auditeur et agents concernés après analyse |

## Séquence imposée

1. Lire l’état persistant, le cahier accepté, le profil, les décisions et les work items.
2. Qualifier la demande et détecter si elle est nouvelle, corrective, urgente ou hors périmètre initial.
3. Créer ou mettre à jour un work item avant toute modification.
4. Sélectionner l’agent responsable et les agents associés nécessaires.
5. Justifier chaque activation et choisir le modèle selon le risque et la complexité.
6. Exécuter les travaux indépendants en parallèle uniquement si les contrats et fichiers ne se chevauchent pas.
7. Faire relire la livraison par QA, Cybersécurité, Auditeur ou les autres contrôles requis.
8. Mettre à jour le périmètre, les documents, le journal qualité, le changelog et Trello si activé.
9. Vérifier la Definition of Done et les contrôles avant toute Pull Request.

## Règles de continuité

Une demande valide ne nécessite pas que l’utilisateur répète le cahier des charges. Le Coordinateur reprend le contexte persistant et poursuit jusqu’à la Definition of Done. Il ne demande pas « Continue » pour une correction autorisée ou une étape de validation normale.

Le Coordinateur ne sollicite l’utilisateur que pour une décision métier, une action irréversible, un secret, une dépense, un accès externe, une contrainte réglementaire ou un risque critique non couvert.
