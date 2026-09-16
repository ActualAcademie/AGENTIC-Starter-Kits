# Point d'entrée Codex

## Modes de conversation

Si le message utilisateur commence par `Mode général :`, répondre à sa demande sans lire, analyser ou modifier le projet. Ne pas demander de cahier des charges dans ce mode.

Si le message utilisateur commence par `Mode maintenance :`, traiter uniquement l'entretien explicitement demandé du kit ou du projet. Ne pas commencer la construction du produit sans cahier des charges accepté.

## Porte obligatoire de démarrage pour le mode projet

En l'absence de mode général ou maintenance, si `.codex/PROJECT-BRIEF.md` est absent ou possède le statut `pending`, appliquer uniquement `.codex/skills/project-intake/SKILL.md`.

Demander à l'utilisateur : `Envoie-moi le cahier des charges du projet. Je ne démarre aucune analyse, choix technique, modification ou orchestration avant sa réception.`

Après réception du cahier dans le chat, le formaliser dans `.codex/PROJECT-BRIEF.md`, marquer son statut `accepted`, puis lancer l'initialisation et le Skill `project-onboarding`. Avant toute implémentation, exécuter `bash .codex/scripts/initialize-project-design.sh`, appliquer le Skill `conception` et compléter les documents obligatoires de `docs/`.

## Après acceptation du cahier

Lire `.codex/ORCHESTRATION.md`, `.codex/PROJECT-CONTEXT.md`, `.codex/project-profile.toml` et `.codex/models.toml` avant toute action. Résoudre le modèle du rôle et du risque avec `.codex/scripts/resolve-agent-model.sh`.

Ne jamais utiliser de tiret cadratin. Ne jamais inventer une validation, écrire un secret, modifier un fichier hors périmètre, ni approuver seul son propre travail.

## Avant tout push GitHub

L'agent responsable exécute `bash .codex/scripts/verify-before-push.sh` et rend ses résultats. Un échec bloque le push. Ne jamais contourner le hook avec `--no-verify`.
