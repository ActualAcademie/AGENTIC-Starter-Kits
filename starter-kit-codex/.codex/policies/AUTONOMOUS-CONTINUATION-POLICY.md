# Politique de continuation autonome

## Principe

Une demande autorisée jusqu'à la livraison garde le Goal actif et enchaîne les actions autonomes jusqu'à la Definition of Done. Le Coordinateur ne demande pas à l'utilisateur de dire « continue », « fais la suivante » ou une formulation équivalente lorsque `next_action` est connue et autorisée.

## Classification obligatoire d'un blocage

Avant de déclarer `blocked` ou `needs-review`, le Coordinateur classe le symptôme :

- `recoverable-local` : erreur de script, état incohérent, verrou périmé, outil absent, mauvais chemin, branche locale, test ou documentation. Corriger immédiatement.
- `specialist-solvable` : travail relevant d'un agent disponible. Créer ou reprendre l'agent spécialisé, enregistrer son identifiant et attendre son rapport dans le même Goal.
- `alternative-solvable` : action réalisable par une autre voie gratuite ou réversible. Utiliser le connecteur, le CLI, le navigateur déjà ouvert, un environnement local, une fixture, un runner local ou une simulation autorisée.
- `out-of-scope` : découverte non prévue par le cahier, le périmètre ou les critères. Retirer cette exigence du flux actif, la documenter hors périmètre et poursuivre.
- `critical-human` : secret, dépense, suppression irréversible, migration destructive, permission sensible, acceptation d'un risque critique, décision métier ou juridique indispensable. Préparer toutes les actions réversibles et demander une seule décision structurée.

Seul `critical-human` peut suspendre l'action concernée. Un blocage technique non critique ne peut jamais suspendre le Goal global si une tâche indépendante reste possible.

## Boucle de récupération

Pour chaque échec, le runtime enregistre symptôme, cause, action, preuve, résultat et prochaine alternative. Le Coordinateur exécute dans le même cycle :

1. diagnostic ciblé ;
2. correction locale ou spécialiste compétent ;
3. alternative sûre si nécessaire ;
4. test et relecture ;
5. mise à jour du tracker ;
6. sélection de la prochaine action.

Deux échecs identiques imposent un changement d'approche concret. Une troisième répétition sans nouvelle action est interdite. Le Goal ne passe à `blocked` qu'après preuve des alternatives tentées et absence de toute tâche indépendante.

## Enchaînement des cartes

Lorsque l'autorisation porte sur un lot, le MVP, le Post-MVP ou la livraison continue, la clôture vérifiée d'une carte déclenche la relecture du gestionnaire sélectionné et le démarrage de la première carte éligible dans l'ordre numérique et des dépendances. La carte suivante est déplacée dans son statut de travail, son Goal et son work item sont créés ou repris, puis sa première action est exécutée dans le même cycle.

La règle s'applique à GitHub Projects comme à Trello. Une demande explicitement limitée à une seule carte reste limitée à cette carte.

## Spécialistes

Avant chaque carte et à chaque reprise, comparer les tâches ouvertes au registre des agents. Toute tâche attribuable à un spécialiste est déléguée avec identifiant réel, périmètre, fichiers autorisés, livrable et preuve. Le Coordinateur ne réalise pas lui-même cette tâche lorsque l'agent est disponible. Si plusieurs lots sont indépendants, plusieurs agents sont créés ou activés dans le même cycle.

## Seuil d'arrêt légitime

Un arrêt est valide seulement si le rapport indique la catégorie, la preuve du blocage, les alternatives exécutées, les tâches indépendantes terminées, l'événement attendu et la prochaine action. Une simple absence de connecteur, de CLI, de Docker, de credential QA ou de cible distante ne suffit pas : le kit doit rechercher les autres voies et préparer une alternative locale avant l'escalade.
