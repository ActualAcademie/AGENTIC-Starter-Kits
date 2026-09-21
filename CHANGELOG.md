# Changelog

Ce projet suit le versionnement sémantique. Les changements publiés sont regroupés par version et classés en ajouts, corrections, sécurité, changements incompatibles et dépréciations.

## Non publié

- Ajoute la création et la mise à jour idempotente du gitignore lors de l’installation.

- Corrige la navigation du sélecteur de dossiers avec choix explicite du dossier courant et retour au parent.

- Ajoute un sélecteur de dossier avec navigation fzf et un fallback Bash sans dépendance obligatoire.

- Améliore l’installateur avec un assistant terminal coloré, des choix guidés et un résumé avant installation.

- Verrouille les Pull Requests automatiques sur dev ou develop et interdit toute promotion automatique vers main.

- Ajout du choix d’activation des mises à jour automatiques lors de l’initialisation Codex ou Claude.

- Complète la politique de sécurité et ajoute un résumé rassurant dans le README principal.

- Réorganisation du README principal pour présenter l’installation et le démarrage avant les détails avancés.

- Suppression du doublon de version dans le README principal et clarification complète de l’installation et des mises à jour automatiques.

- Ajout d’un installateur qui sélectionne automatiquement Codex ou Claude et installe uniquement la variante nécessaire.

- Ajout ou correction : inscrire ici chaque changement visible avant la release.
- Ajout du synchroniseur non destructif et du workflow de Pull Request automatique pour propager les mises à jour du kit dans les projets utilisateurs.

## 1.0.19 - 2026-09-21

### Corrections

- Renforcement de l’autonomie continue pendant l’attente et la reprise des CI.
- Ajout de la règle de traitement par lots des dettes historiques du périmètre.
- Clarification des corrections réversibles qui ne nécessitent pas de demander « Continue ».

## 1.0.7 - 2026-09-21

### Corrections

- Ajout d’un lint Markdown explicite et bloquant pour supprimer les avertissements jaunes avant fusion.
- Ajout de la configuration `.markdownlint.json` adaptée aux README, aux frontmatters Claude et aux tableaux du kit.

## 1.0.6 - 2026-09-21

### Ajouts

- Ajout d’un contrôle CI qui exige les trois README publics pour les changements du kit.
- Ajout d’un contrôle de cohérence entre `VERSION`, `KIT.toml`, les README et le changelog.
- Ajout de l’affichage du tag de version sur les README.

## 1.0.5 - 2026-09-21

### Corrections

- Correction des formulations des README afin d’indiquer explicitement les 16 agents disponibles.

## 1.0.4 - 2026-09-21

### Documentation

- Mise à jour du README principal et des README Codex et Claude avec l’inventaire fonctionnel réel, la gouvernance des spécialistes, les checkpoints, le suivi des coûts et le mode Trello `time-gated`.

## 1.0.3 - 2026-09-21

### Corrections

- Synchronisation des versions affichées dans les README internes des deux kits.
- Ajout des profils de modèles Claude pour les dix agents spécialistes optionnels.

## 1.0.2 - 2026-09-21

### Corrections

- Correction du niveau de titre dans la gouvernance publique du kit Claude.

## 1.0.1 - 2026-09-21

### Ajouts

- Ajout du mode `time-gated` pour suspendre uniquement les cartes Trello dépendantes d’une échéance.
- Ajout de l’obligation de mise à jour détaillée du README pour chaque changement livré.

### Corrections

- Le Coordinateur doit lire la gouvernance des spécialistes avant toute délégation et justifier leur activation.

## 1.0.0 - 2026-09-21

### Ajouts

- Ajout de dix agents spécialistes optionnels pour le produit, la QA, le DevOps, la performance, la recherche UX, l’accessibilité, les données, la documentation, les releases et la conformité.
- Ajout de la gouvernance d’activation et de supervision des agents spécialistes.
- Ajout du suivi interne des coûts et du routage des modèles par risque.

### Corrections

- Le Coordinateur lit désormais la gouvernance des spécialistes avant toute délégation.
- Le preflight accepte les agents optionnels tout en conservant les six agents du noyau obligatoires.

## 0.1.0 - 2026-09-17

### Ajouts

- Première version publiée des starter kits Codex et Claude Code.
- Gouvernance, Gitflow, conception, journal qualité, contrôles CI et option Trello.
