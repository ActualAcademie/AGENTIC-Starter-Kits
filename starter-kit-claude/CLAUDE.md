# Point d'entrée Claude

@.claude/ORCHESTRATION.md
@.claude/PROJECT-CONTEXT.md
@.claude/CONVERSATION-MODES.md
@.claude/MODEL-POLICY.md

## Modes de conversation

Si le message utilisateur commence par `Mode général :`, répondre à sa demande sans lire, analyser ou modifier le projet. Ne pas demander de cahier des charges dans ce mode.

Si le message utilisateur commence par `Mode maintenance :`, traiter uniquement l'entretien explicitement demandé du kit ou du projet. Ne pas commencer la construction du produit sans cahier des charges accepté.

## Porte obligatoire de démarrage pour le mode projet

En l'absence de mode général ou maintenance, si `.claude/PROJECT-BRIEF.md` est absent ou possède le statut `pending`, appliquer uniquement `.claude/skills/project-intake/SKILL.md`.

Demander à l'utilisateur : `Envoie-moi le cahier des charges du projet. Je ne démarre aucune analyse, choix technique, modification ou orchestration avant sa réception.`

Après réception du cahier dans le chat, demander explicitement si l’utilisateur veut un Trello complet et attendre sa réponse oui ou non. Enregistrer cette décision dans `project-profile.toml` avant de continuer. Si la réponse est oui, vérifier la disponibilité du plugin Trello. S’il est absent, demander à l’utilisateur de l’activer et attendre sa confirmation. Une fois disponible, créer réellement le tableau, les listes, les cartes et les checklists, les relire depuis Trello, puis conserver leurs identifiants et URL dans le document local. Ne jamais déclarer la synchronisation réussie sans cette relecture.

Après réception du cahier dans le chat, le formaliser dans `.claude/PROJECT-BRIEF.md`, marquer son statut `accepted`, puis lancer l'initialisation et le Skill `project-onboarding`. Avant toute implémentation, exécuter `bash .claude/scripts/initialize-project-design.sh`, appliquer le Skill `conception` et compléter les documents obligatoires de `docs/`.

## Après acceptation du cahier

Lire `.claude/project-profile.toml` et `.claude/models.toml` avant toute action. Résoudre le modèle du rôle et du risque avec `.claude/scripts/resolve-agent-model.sh`. Utiliser les sous-agents de `.claude/agents/` seulement pour des flux indépendants, avec contexte isolé ou expertise distincte.

Ne jamais utiliser de tiret cadratin. Ne jamais inventer une validation, écrire un secret, modifier un fichier hors périmètre, ni approuver seul son propre travail.

## Versionnement obligatoire

Pour chaque ajout, correctif, changement de sécurité ou modification documentaire, utiliser un commit conventionnel et mettre à jour `CHANGELOG.md` dans la section `Non publié`. Ne jamais modifier `VERSION` pour un commit isolé. Les releases changent `VERSION`, datent le changelog et reçoivent un tag `vX.Y.Z` après fusion dans `main`. Lire `VERSIONING.md`.

## Avant tout push GitHub

L'agent responsable exécute `bash .claude/scripts/verify-before-push.sh` et rend ses résultats. Un échec bloque le push. Ne jamais contourner le hook avec `--no-verify`.
