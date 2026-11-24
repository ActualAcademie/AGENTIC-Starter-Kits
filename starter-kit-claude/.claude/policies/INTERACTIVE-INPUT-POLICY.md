# Politique d'interaction utilisateur structurée

## Règle générale

Toute demande adressée à l'utilisateur par n'importe quel agent doit être présentée avec l'interface interactive structurée de l'orchestrateur, et non comme un simple paragraphe dans le chat. Cela inclut les questions d'initialisation, décisions métier, choix d'outil, accès, blocages, validations, informations manquantes et demandes de reprise. Chaque demande possède un identifiant stable, une réponse obligatoire, deux ou trois choix explicites dont un choix recommandé lorsque c'est pertinent, un libellé et une option de réponse personnalisée.

L'orchestrateur doit appeler son API d'interaction native lorsque celle-ci est disponible. L'interface doit empêcher la poursuite avant la réponse ou permettre une réponse personnalisée clairement associée à la demande. Aucun agent ne doit demander une décision dans un message libre, une phrase isolée ou une instruction qui oblige l'utilisateur à répondre « continue ». Le Coordinateur ne doit pas lancer l'onboarding, écrire les décisions, débloquer une porte ou clôturer un work item avant la réception de la réponse.

## Persistance et reprise

Avant d'afficher l'interface, créer ou mettre à jour `RUNTIME-STATE.md` avec `execution_status=waiting-for-user`, `session_status=waiting-for-user`, `pending_request_id`, `pending_turn_id`, `required_action_status=pending` et `next_action=resume-after-user-response`. Enregistrer la question et les choix dans le work item ou le manifeste de session sans secret ni donnée sensible.

Après la réponse, l'orchestrateur doit valider l'identifiant, enregistrer la valeur choisie et passer par le résolveur officiel. Il relit ensuite le runtime avant de reprendre automatiquement `next_action`. Une réponse libre non rattachée à un identifiant ne suffit pas.

## Perte d'interface ou interruption

Si l'interface interactive n'est pas disponible, le Coordinateur doit afficher un questionnaire de secours unique et persistant, appeler `request-user-input.sh`, puis attendre. Il ne doit jamais continuer silencieusement, demander à l'utilisateur de dire « continue », ni recréer une question déjà en attente. Une nouvelle conversation relit la demande existante au lieu de la perdre.

## Contrôles

Une question en attente interdit toute modification produit, choix technique, création de carte, délégation ou clôture non liée à sa résolution. Le hook autorise uniquement le résolveur officiel et les commandes de récupération nécessaires. Toute question posée pendant l'intake doit apparaître dans le rapport d'initialisation avec sa réponse, son statut et sa preuve.
