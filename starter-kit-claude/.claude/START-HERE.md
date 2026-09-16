# Démarrage premium

## Import

Copier `AGENTS.md` et `.claude/` à la racine du projet cible. Ne pas écraser un `AGENTS.md` existant sans fusionner ses règles locales.

## Initialisation

1. Ouvrir Claude dans le projet importé.
2. Donner le cahier des charges quand Claude le demande.
3. Laisser Claude créer `.claude/PROJECT-BRIEF.md`, puis lancer l'initialisation et le Skill `project-onboarding`.
4. Vérifier le contexte détecté avec `bash .claude/scripts/show-project-context.sh`.
5. Vérifier le modèle du rôle avec `bash .claude/scripts/resolve-agent-model.sh coordinateur`.
6. Vérifier `bash .claude/scripts/preflight.sh`.
7. Créer la première tâche avec `bash .claude/scripts/new-work-item.sh AAAA-MM-JJ-sujet`.

## Avant une livraison

1. Vérifier le work item, les preuves et les risques.
2. Exécuter `bash .claude/scripts/run-project-checks.sh`.
3. Exécuter le preflight.
4. Demander l'audit requis par la matrice de risque.

## CI facultative

Après confirmation des commandes dans le profil, exécuter `bash .claude/scripts/generate-github-ci.sh`. Ce script crée un workflow dans le projet cible et ne remplace jamais un workflow existant.
