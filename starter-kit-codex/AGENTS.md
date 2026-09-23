# Point d'entrée Codex

## Modes de conversation

Si le message utilisateur commence par `Mode initialisation :`, suspendre le flux courant et exécuter la procédure d’initialisation complète, même dans une conversation déjà ouverte. Relire `AGENTS.md`, `.codex/START-HERE.md`, `.codex/CONVERSATION-MODES.md`, `.codex/PROJECT-BRIEF.md`, `.codex/project-profile.toml` et `.codex/RUNTIME-STATE.md` s’ils existent. Vérifier le statut du cahier des charges. S’il est absent ou `pending`, appliquer uniquement `project-intake` et demander le cahier sans analyser la stack, créer de work item ou modifier le produit. Ne reprendre l’orchestration qu’après acceptation du cahier et validation de la phase de complétude.

Si le message utilisateur commence par `Mode général :`, répondre à sa demande sans lire, analyser ou modifier le projet. Ne pas demander de cahier des charges dans ce mode.

Si le message utilisateur commence par `Mode maintenance :`, traiter uniquement l'entretien explicitement demandé du kit ou du projet. Ne pas commencer la construction du produit sans cahier des charges accepté.

## Porte obligatoire de démarrage pour le mode projet

En l'absence de mode général ou maintenance, si `.codex/PROJECT-BRIEF.md` est absent ou possède le statut `pending`, appliquer uniquement `.codex/skills/project-intake/SKILL.md`.

Demander à l'utilisateur : `Envoie-moi le cahier des charges du projet. Je ne démarre aucune analyse, choix technique, modification ou orchestration avant sa réception.`

Après réception du cahier dans le chat, demander explicitement si l’utilisateur veut un Trello complet et attendre sa réponse oui ou non. Cette question fait partie de la série de cadrage et doit proposer le meilleur choix recommandé avec sa justification. Enregistrer cette décision dans `project-profile.toml` avant de continuer. Si la réponse est oui, vérifier la disponibilité du plugin Trello. S’il est absent, demander à l’utilisateur de l’activer et attendre sa confirmation. Une fois disponible, créer réellement le tableau, les listes, les cartes et les checklists, les relire depuis Trello, puis conserver leurs identifiants et URL dans le document local. Ne jamais déclarer la synchronisation réussie sans cette relecture.

Après réception du cahier dans le chat, le formaliser dans `.codex/PROJECT-BRIEF.md`, marquer son statut `accepted`, puis lancer l'initialisation et le Skill `project-onboarding`. Avant toute implémentation, exécuter `bash .codex/scripts/initialize-project-design.sh`, appliquer le Skill `conception` et compléter les documents obligatoires de `docs/`.

## Après acceptation du cahier

Lire `.codex/ORCHESTRATION.md`, `.codex/PROJECT-CONTEXT.md`, `.codex/project-profile.toml` et `.codex/models.toml` avant toute action. Résoudre le modèle du rôle et du risque avec `.codex/scripts/resolve-agent-model.sh`.

Après réception du cahier, annoncer qu’une phase de questions de complétude va suivre. Analyser toutes les informations manquantes et poser une seule série structurée de questions. Pour chaque question, proposer des choix concrets, indiquer le choix recommandé par l’agent avec sa justification et accepter une réponse personnalisée. Ne commencer aucune implémentation avant les réponses ou la validation explicite des hypothèses restantes. Après cette phase, fonctionner en mode autonome : regrouper les décisions non bloquantes dans des ADR réversibles, choisir une baseline cohérente et poursuivre. En cas d’erreur corrigeable, diagnostiquer, se renseigner dans les sources officielles et sur internet si nécessaire, corriger, retester et poursuivre sans arrêter la conversation. Ne solliciter l’utilisateur que pour un blocage réel : décision métier, action irréversible, accès externe, secret, dépense, réglementation ou risque critique. Documenter chaque tentative et ne jamais simuler une validation. Ne jamais utiliser de tiret cadratin. Avant chaque contrôle, vérifier que l’outil est disponible et choisir automatiquement une alternative documentée si nécessaire. Ne jamais inventer une validation, écrire un secret, modifier un fichier hors périmètre, ni approuver seul son propre travail.

Une CI en cours doit être suivie jusqu’à son résultat. Une dette historique détectée dans le périmètre est corrigée par lots, et une dette hors périmètre reçoit un work item sans interrompre les tâches indépendantes. Les corrections non majeures et réversibles de dépendances sont exécutées, testées et documentées sans demander « Continue ».

## Versionnement produit

Pour chaque changement, utiliser un commit conventionnel et déclarer dans la Pull Request son impact produit : `major`, `minor`, `patch` ou `aucune`. Une nouvelle version est réservée à une évolution du kit réellement consommée par les projets importateurs. Les corrections internes de CI, de workflow, de dépôt, de métadonnées, de documentation interne et d’outillage restent dans le changelog sans incrément artificiel. Une release met à jour `VERSION`, `kit_version`, le README, le changelog et le titre de Pull Request, puis reçoit un tag après fusion dans `main`. Lire `VERSIONING.md`.

## README obligatoire

Chaque ajout, correction, agent, Skill, politique, commande, changement de comportement ou modification de configuration doit mettre à jour le README concerné dans le même work item. Le README doit expliquer le changement, son usage, ses prérequis, ses limites et son impact sur l’orchestration. Une livraison est incomplète si la documentation publique ne reflète pas le comportement réel.

## Avant tout push GitHub

L'agent responsable exécute `bash .codex/scripts/verify-before-push.sh` et rend ses résultats. Un échec bloque le push. Ne jamais contourner le hook avec `--no-verify`.

## Installation Git obligatoire

Après l’installation du kit, vérifier que `.github/workflows/update-agentic-starter-kit.yml` existe et n’est pas ignoré. Avant le premier commit, l’ajouter explicitement avec `.gitignore` et `AGENTS.md`, puis vérifier son suivi avec `git ls-files --error-unmatch .github/workflows/update-agentic-starter-kit.yml`. Le workflow doit être présent dans la première branche publiée. Ne jamais le supprimer, le placer dans `.gitignore` ou le pousser directement vers `main`.
