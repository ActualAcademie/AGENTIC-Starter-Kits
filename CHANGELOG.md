## 1.1.8 - 2026-09-23

### Corrections

- Ajoute une validation pre-push dédiée au mode external.
- Évite les contrôles de profil et les artefacts générés incompatibles avec un kit local ignoré.
- Conserve la détection des secrets, du suivi Git interdit et des workflows invalides.

## 1.1.7 - 2026-09-23

### Corrections

- Rend le rapport de cadrage obligatoire comme première réponse du mode initialisation.
- Interdit les résumés de configuration avant la vérification explicite du cahier des charges.
- Distingue strictement les statuts absent, pending et accepted.

## 1.1.6 - 2026-09-23

### Améliorations

- Rend l origine et le statut du cahier des charges explicites à chaque initialisation.
- Signale les fichiers réellement lus, les fichiers manquants et l action suivante.
- Interdit de présenter un cahier existant comme reçu dans le chat sans preuve.

## 1.1.5 - 2026-09-23

### Corrections

- Corrige la mise à jour forcée d un kit déjà installé.
- Préserve les données projet tout en actualisant réellement KIT.toml et les fichiers universels.

## 1.1.4 - 2026-09-23

### Améliorations

- Remplace la navigation de dossiers par un sélecteur clavier sans dépendance obligatoire.
- Sépare clairement l entrée dans un dossier et la sélection du projet.
- Ajoute le retour parent avec Backspace ou la flèche gauche.

## 1.1.3 - 2026-09-23

### Ajouts

- Ajoute la synchronisation locale automatique du kit externe.
- Protège le cahier des charges, l état projet, les décisions et les work items lors des mises à jour.
- Crée une sauvegarde avant chaque remplacement du moteur du kit.

# Changelog
## 1.1.2 - 2026-09-23

### Corrections

- Ajoute le mode initialisation utilisable dans une conversation déjà ouverte.
- Rend la porte du cahier des charges explicitement relançable sans redémarrer la session.

## 1.1.2 - 2026-09-23

### Corrections

- Améliore l’assistant interactif de sélection du mode.
- Corrige les exemples manuels d’installation Codex et Claude.
- Clarifie les parcours native et external dans les README.

## 1.1.2 - 2026-09-23

### Ajouts

- Ajoute les distributions `native` et `external`.
- Ajoute le manifeste `.workspace.toml` et le workflow de mise à jour externe.
- Conserve les fichiers d’orchestration localement sans les publier dans le dépôt projet en mode external.

## 1.1.2 - 2026-09-23

### Corrections

- Corrige le workflow de mise à jour pour récupérer son script officiel malgré l’ignorance de `.codex/` et `.claude/`.
- Rend la détection et la mise à jour automatique utilisables dans les projets importateurs.

## 1.1.2 - 2026-09-23

### Corrections

- Renforce la synchronisation Trello après chaque livraison et la relecture des checklists.
- Distingue les tâches terminées, les décisions humaines requises et les blocages réels.
- Rend la validation navigateur obligatoire pour les changements frontend.
- Ajoute le routage universel des demandes hors cahier des charges initial.

## 1.1.2 - 2026-09-22

- Corrige la condition de secret du workflow de publication GitHub.

## 1.1.2 - 2026-09-22

- Fixe le déclenchement et la publication idempotente des Releases GitHub.
- Maintient la synchronisation documentaire et le contrôle de version.


Ce projet suit le versionnement sémantique. Les changements publiés sont regroupés par version et classés en ajouts, corrections, sécurité, changements incompatibles et dépréciations.

## Non publié

- Clarifie que les versions reflètent les évolutions consommées du kit et non chaque maintenance interne.

- Corrige le déclencheur de tags et rend la publication Release idempotente.

- Corrige les permissions du workflow Release et documente le secret nécessaire à la mise à jour About.

- Ajoute la publication automatique des Releases et la mise à jour de la section About après un tag sur main.

- Ajoute le contrat documentaire premium, les Skills de rédaction et d’audit et la validation automatique des documents.

- Supprime les contextes GitHub Actions optionnels non déclarés et détecte automatiquement dev ou develop.

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

## 1.1.2 - 2026-09-21

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
