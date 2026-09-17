# Orchestration Claude portable

## Objectif

Ce répertoire s'importe dans tout nouveau projet. Il adapte les contrôles à partir de `project-profile.toml` sans imposer de langage, framework, outil de suivi ou fournisseur de déploiement. Lire aussi `CONVERSATION-MODES.md`, `PROJECT-CONTEXT.md`, `PROJECT-DATA-BOUNDARY.md`, `FILE-MANIFEST.md`, `models.toml`, `MODEL-POLICY.md`, `GOVERNANCE.md`, `RISK-MATRIX.md`, `COST-AND-EVALUATION.md` et `ADAPTERS.md`.

## Cycle obligatoire

1. Recevoir et accepter le cahier des charges.
2. Poser une seule série de questions de complétude avec choix recommandés.
3. Mettre à jour `RUNTIME-STATE.md` à chaque transition et après chaque erreur.
4. Recevoir le choix Trello et initialiser le profil du projet.
5. Créer un work item.
6. Évaluer le risque.
7. Choisir rôle et Skill.
8. Implémenter dans le périmètre déclaré.
9. Auditer, vérifier et enregistrer les preuves.
10. Livrer, évaluer et archiver.

## Règles

- Claude est l'unique orchestrateur.
- Le profil du projet est la source de vérité des technologies, commandes et conventions locales.
- Une tâche active par flux, sauf tâches indépendantes sans fichiers communs.
- Le niveau de risque commande la profondeur de revue.
- Les intégrations GitHub, Trello, Docker et autres sont facultatives.
- Les fichiers de produit restent hors de `.claude/`.

## Reprise automatique

À chaque nouvelle session, lire `RUNTIME-STATE.md`, le dernier work item, le dernier commit et les rapports avant de demander quoi que ce soit. Reprendre directement l’action autorisée.

## Rapport exigé

```text
Statut: complete | blocked | needs-review
Perimetre: fichiers et limites
Travail: résumé factuel
Preuves: commandes et résultats
Risques: inconnues restantes
Suite: action recommandée
Sources: URLs consultées et décisions influencées
```
