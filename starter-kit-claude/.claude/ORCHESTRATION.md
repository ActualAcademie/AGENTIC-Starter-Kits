# Orchestration Claude portable

## Objectif

Ce répertoire s'importe dans tout nouveau projet. Il adapte les contrôles à partir de `project-profile.toml` sans imposer de langage, framework, outil de suivi ou fournisseur de déploiement. Lire aussi `CONVERSATION-MODES.md`, `PROJECT-CONTEXT.md`, `PROJECT-DATA-BOUNDARY.md`, `FILE-MANIFEST.md`, `models.toml`, `MODEL-POLICY.md`, `GOVERNANCE.md`, `RISK-MATRIX.md`, `COST-AND-EVALUATION.md` et `ADAPTERS.md`.

## Cycle obligatoire

1. Recevoir et accepter le cahier des charges.
2. Recevoir le choix Trello et initialiser le profil du projet.
3. Créer un work item.
4. Évaluer le risque.
5. Choisir rôle et Skill.
6. Implémenter dans le périmètre déclaré.
7. Auditer, vérifier et enregistrer les preuves.
8. Livrer, évaluer et archiver.

## Règles

- Claude est l'unique orchestrateur.
- Le profil du projet est la source de vérité des technologies, commandes et conventions locales.
- Une tâche active par flux, sauf tâches indépendantes sans fichiers communs.
- Le niveau de risque commande la profondeur de revue.
- Les intégrations GitHub, Trello, Docker et autres sont facultatives.
- Les fichiers de produit restent hors de `.claude/`.

## Rapport exigé

```text
Statut: complete | blocked | needs-review
Perimetre: fichiers et limites
Travail: résumé factuel
Preuves: commandes et résultats
Risques: inconnues restantes
Suite: action recommandée
```
