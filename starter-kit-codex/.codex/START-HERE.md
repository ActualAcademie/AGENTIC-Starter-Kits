# Démarrage premium

## Import

Copier `AGENTS.md` et `.codex/` à la racine du projet cible. Ne pas écraser un `AGENTS.md` existant sans fusionner ses règles locales.

## Initialisation

1. Ouvrir Codex dans le projet importé.
2. Donner le cahier des charges quand Codex le demande.
3. Laisser Codex créer `.codex/PROJECT-BRIEF.md`, puis lancer l'initialisation et le Skill `project-onboarding`.
4. Vérifier le contexte détecté avec `bash .codex/scripts/show-project-context.sh`.
5. Vérifier le modèle du rôle avec `bash .codex/scripts/resolve-agent-model.sh coordinateur`.
6. Vérifier `bash .codex/scripts/preflight.sh`.
7. Créer la première tâche avec `bash .codex/scripts/new-work-item.sh AAAA-MM-JJ-sujet`.

## Avant une livraison

1. Vérifier le work item, les preuves et les risques.
2. Exécuter `bash .codex/scripts/run-project-checks.sh`.
3. Exécuter le preflight.
4. Demander l'audit requis par la matrice de risque.

## CI facultative

Après confirmation des commandes dans le profil, exécuter `bash .codex/scripts/generate-github-ci.sh`. Ce script crée un workflow dans le projet cible et ne remplace jamais un workflow existant.
