# Installation complète des Agentic Starter Kits

Ce guide explique comment importer un kit dans un nouveau projet et démarrer une construction agentique contrôlée. Il faut choisir Codex ou Claude Code. Ne jamais importer les deux kits dans le même projet.

## 1. Préparer la machine

Installer :

- Git.
- Bash sur macOS ou Linux.
- Git for Windows avec Git Bash sur Windows.
- Python 3.11 ou plus récent.
- Ripgrep.
- Codex ou Claude Code selon le kit choisi.

Vérifier les outils :

```bash
git --version
bash --version
python3 --version
rg --version
```

Sous Windows, ouvrir Git Bash depuis la racine du projet. PowerShell peut être utilisé avec les wrappers `run.ps1` après installation de Git for Windows.

## 2. Créer ou ouvrir le projet

Créer un dossier dédié au projet, puis l’ouvrir dans un terminal :

```bash
mkdir mon-projet
cd mon-projet
git init
git switch --create develop
```

Si le projet existe déjà, ne pas supprimer ses fichiers. Importer le kit de manière non destructive et conserver les conventions existantes.

## 3. Choisir et copier un kit

Définir le chemin local du dépôt source. Adapter ce chemin à votre machine.

Pour Codex :

```bash
KIT_SOURCE="/chemin/vers/agentic-starter-kits/starter-kit-codex"
cp "$KIT_SOURCE/AGENTS.md".
cp -R "$KIT_SOURCE/.codex".
```

Pour Claude Code :

```bash
KIT_SOURCE="/chemin/vers/agentic-starter-kits/starter-kit-claude"
cp "$KIT_SOURCE/CLAUDE.md".
cp -R "$KIT_SOURCE/.claude".
```

Ne pas copier `starter-kit-codex` ou `starter-kit-claude` en tant que dossier dans le projet. Copier leur point d’entrée et leur dossier caché à la racine du projet.

## 4. Initialiser le kit

Codex :

```bash
bash .codex/scripts/init-project.sh
```

Claude Code :

```bash
bash .claude/scripts/init-project.sh
```

L’initialisation crée le profil s’il est absent, génère l’inventaire du projet et installe le hook Git pre-push. Elle ne modifie pas le code produit.

## 5. Démarrer la première conversation

Ouvrir l’outil choisi à la racine du projet.

Codex :

```bash
codex
```

Claude Code :

```bash
claude
```

Envoyer une demande projet simple, par exemple :

```text
Je veux construire une application de réservation pour des associations locales.
```

Tant que le cahier des charges n’est pas reçu et accepté, l’agent ne doit pas analyser la stack, écrire du code, créer une tâche ou lancer une orchestration.

## 6. Fournir le cahier des charges

Le cahier doit préciser au minimum :

- Le problème et la vision.
- Les utilisateurs et parties prenantes.
- Les objectifs mesurables.
- Les fonctionnalités attendues.
- Le périmètre et le hors périmètre.
- Les contraintes de délai, budget, plateformes, conformité et sécurité.
- Les critères de réussite.
- Les intégrations et données concernées.
- Les inconnues nécessitant une décision humaine.

L’agent formalise ensuite le document propre au projet :

```text
.codex/PROJECT-BRIEF.md   pour Codex
.claude/PROJECT-BRIEF.md  pour Claude Code
```

Le statut doit devenir `accepted` uniquement lorsque les informations essentielles sont présentes.

## 7. Répondre au choix Trello

Après le cahier, l’agent pose obligatoirement cette question :

```text
Veux-tu que je prépare un Trello complet avec toutes les tâches détaillées du projet ? Réponds oui ou non.
```

Répondre explicitement `oui` ou `non`.

Si la réponse est `oui`, fournir aussi, si possible, le nom du tableau et préciser si l’on veut :

- Un plan Trello versionné uniquement dans le dépôt.
- Une création ou synchronisation externe via une intégration autorisée.

Le choix est inscrit dans `project-profile.toml`. Avec `oui`, l’agent génère `docs/project-management/trello-board.md` et le complète avec les listes, cartes, descriptions, dépendances, responsables, estimations, critères, preuves, tests, sécurité, documentation, audit et livraison. Le kit ne fabrique pas de tableau externe sans intégration et autorisation disponibles.

## 8. Laisser l’agent détecter la stack

L’agent lit l’inventaire, les manifests et les fichiers de configuration. Il complète uniquement les faits vérifiables dans :

```text
.codex/project-profile.toml
.claude/project-profile.toml
```

Ce fichier contient notamment :

- Langages.
- Frameworks frontend et backend.
- Base de données et ORM.
- Runtime et gestionnaire de paquets.
- Commandes install, lint, test, build et sécurité.
- CI, déploiement, authentification et capacités.
- Choix Trello.
- Limites Gitflow et règles de livraison.

Ne pas remplir ce fichier avec une technologie supposée.

## 9. Générer et compléter la conception

Après acceptation du cahier et du choix Trello, l’agent exécute le générateur de conception.

Codex :

```bash
bash .codex/scripts/initialize-project-design.sh
```

Claude Code :

```bash
bash .claude/scripts/initialize-project-design.sh
```

Le Concepteur remplace tous les marqueurs de modèle dans `docs/` et produit une conception exploitable de niveau CDA : vision, acteurs, objectifs, user stories, règles métier, critères, erreurs, parcours, diagrammes Mermaid, architecture, données, contrats, sécurité, roadmap, rollback et décisions.

Aucun document ne doit rester générique. Un document non applicable doit contenir une justification précise. Le preflight bloque tant qu’un marqueur `[[A_COMPLETER]]` reste présent.

## 10. Vérifier l’onboarding

Codex :

```bash
bash .codex/scripts/preflight.sh
```

Claude Code :

```bash
bash .claude/scripts/preflight.sh
```

Le résultat attendu est `Preflight OK`. Un échec est intentionnel lorsqu’il manque le cahier, le choix Trello, le profil, la conception ou une preuve obligatoire.

## 11. Créer un premier work item

Demander à l’agent de créer une tâche atomique avec :

- Objectif.
- Hors périmètre.
- Critères d’acceptation.
- Rôle responsable.
- Fichiers’autorisés.
- Dépendances.
- Niveau de risque.
- Budget et règle d’arrêt.
- Preuve attendue.
- Documents de conception à mettre à jour.

Chaque feature doit avoir une branche dédiée :

```bash
git switch --create feature/US-001-reservation
```

## 12. Autoriser l’exécution complète

Une fois le cahier accepté, écrire par exemple :

```text
Fais tout pour ce work item jusqu’à sa Definition of Done.
```

Le Coordinateur enchaîne les étapes autorisées, corrige les erreurs récupérables, relance les contrôles et documente les décisions. Il ne demande pas une validation intermédiaire pour chaque commande. Une question n’est posée que lorsqu’une décision métier, un secret, une permission externe ou une action irréversible est réellement nécessaire.

## 13. Suivre et optimiser le coût

Le suivi est destiné au Coordinateur. Après une délégation, enregistrer les volumes si l’intégration ne les fournit pas automatiquement :

```bash
bash .codex/scripts/cost-tracker.sh record --agent backend --model gpt-5.6-terra --input 12000 --output 3000 --work-item US-001 --feature reservation
bash .codex/scripts/cost-tracker.sh report
```

Avec Claude, remplacer `.codex` par `.claude`. Le registre JSONL permet de comparer les agents, modèles, fonctionnalités, relances et volumes. Le profil peut définir un budget de tokens et des tarifs optionnels. Aucun montant ne doit être déduit si les tarifs ne sont pas configurés.

## 14. Finaliser une livraison

Avant le commit, le rôle responsable lance les validations du projet. Avant le push, le hook et `verify-before-push.sh` vérifient le preflight, la sécurité, le lint, les tests, le build, les documents et les limites du diff. L’Auditeur rend une décision indépendante. La Pull Request doit expliquer le résultat, les preuves, les risques résiduels et les migrations éventuelles.

Les commits doivent rester atomiques. Ne jamais créer un commit de centaines ou milliers de fichiers pour plusieurs fonctionnalités.

## 12. Utiliser le journal qualité

Le journal est créé ici :

```text
docs/quality/quality-journal.md
```

Tous les agents d’audit ou de correction l’utilisent. Chaque anomalie doit avoir un identifiant, une source, une catégorie, une gravité, un impact, une preuve, un responsable, une correction et un statut. Une correction passe par `fixed`, puis `verified` après une vérification indépendante.

## 13. Valider avant chaque push

Codex :

```bash
bash .codex/scripts/verify-before-push.sh
```

Claude Code :

```bash
bash .claude/scripts/verify-before-push.sh
```

La commande vérifie la branche, les commits atomiques, le preflight, la sécurité, le lint, les tests, le build et les commandes configurées. Ne jamais utiliser `git push --no-verify`.

## 14. Générer la CI du projet

Après l’onboarding, si le projet ne possède pas déjà une CI :

```bash
# Codex
bash .codex/scripts/generate-github-ci.sh

# Claude Code
bash .claude/scripts/generate-github-ci.sh
```

Le générateur refuse d’écraser un workflow existant. Relire les commandes, configurer les secrets dans GitHub et faire vérifier le déploiement par Cybersécurité.

## 15. GitFlow de livraison

Le flux est :

```text
feature ou fix -> Pull Request -> develop -> Pull Request de release -> main -> tag vX.Y.Z
```

Avant promotion, exiger les preuves du Coordinateur, de l’agent responsable, de Cybersécurité lorsque nécessaire et de l’Auditeur. Le changement visible est inscrit dans `CHANGELOG.md`.

## 16. Modes qui évitent le faux démarrage

Pour une question générale :

```text
Mode général : explique-moi la différence entre REST et GraphQL.
```

Pour entretenir le kit sans construire le produit :

```text
Mode maintenance : vérifie les Skills et les contrôles du kit.
```

Sans préfixe, la conversation est considérée comme une demande projet et la porte cahier des charges s’applique.

## 17. Diagnostic

Codex :

```bash
bash .codex/scripts/doctor.sh
.\.codex\scripts\run.ps1 doctor
```

Claude Code :

```bash
bash .claude/scripts/doctor.sh
.\.claude\scripts\run.ps1 doctor
```

Sous Windows, utiliser PowerShell pour les wrappers `run.ps1`. Sous macOS et Linux, utiliser Bash. En cas de désaccord entre documentation, code et profil, l’agent arrête l’action et documente l’inconnue.

## Installation débutant

1. Ouvrez un terminal dans le dépôt du starter kit.
2. Exécutez `./install.sh --kit codex --target /chemin/du/projet` ou remplacez `codex` par `claude`.
3. Ouvrez le projet dans Codex ou Claude.
4. Complétez le profil projet demandé par l’agent.
5. Dans GitHub, activez Actions. Les futures mises à jour arriveront automatiquement par Pull Request.

Pour remplacer un kit existant, utilisez `--force` uniquement après avoir sauvegardé vos personnalisations.

## Parcours recommandé pour un débutant

Cette procédure est la seule nécessaire pour installer le kit et recevoir ses mises à jour.

### Étape 1. Installer les prérequis

Installez Git et créez le projet à construire. Le projet peut être vide ou déjà versionné.

- macOS : installez Git avec Xcode Command Line Tools.
- Windows : installez Git Bash ou utilisez PowerShell avec Git.
- Linux : installez Git avec le gestionnaire de paquets de votre distribution.

### Étape 2. Télécharger le dépôt du kit

Dans un terminal, exécutez :

```bash
git clone https://github.com/krapaud/AGENTIC-Starter-Kits.git
cd AGENTIC-Starter-Kits
```

### Étape 3. Installer une seule variante

Pour un projet Codex :

```bash
./install.sh --kit codex --target /chemin/absolu/vers/mon-projet
```

Pour un projet Claude :

```bash
./install.sh --kit claude --target /chemin/absolu/vers/mon-projet
```

Remplacez le chemin par celui de votre projet. L’installateur copie directement les fichiers à la racine du projet. Il ne faut pas déplacer `starter-kit-codex` ou `starter-kit-claude` manuellement.

### Étape 4. Vérifier l’installation

Dans le projet, vérifiez la présence de l’une des structures suivantes :

```text
Codex : AGENTS.md, .codex/, .github/workflows/update-agentic-starter-kit.yml.
Claude : CLAUDE.md, .claude/, .github/workflows/update-agentic-starter-kit.yml.
```

N’installez jamais Codex et Claude ensemble dans le même projet.

### Étape 5. Activer les mises à jour

Publiez le projet sur GitHub, ouvrez l’onglet `Actions` et activez les workflows si GitHub le demande. Le workflow est ensuite exécuté chaque lundi et peut être lancé immédiatement avec `Run workflow`.

Il compare le projet avec la branche `main` du dépôt officiel, lance les contrôles, puis ouvre une Pull Request nommée `chore/update-agentic-kit`. Il ne modifie jamais directement `main`.

### Étape 6. Accepter une mise à jour

1. Ouvrez la Pull Request automatique.
2. Lisez la liste des fichiers modifiés.
3. Vérifiez que votre profil projet et vos documents métier sont conservés.
4. Attendez que la CI soit entièrement verte.
5. Fusionnez la Pull Request selon le GitFlow de votre projet.

Le kit conserve automatiquement les personnalisations suivantes : `project-profile.toml`, `RUNTIME-STATE.md`, les décisions, les travaux, les rapports, les métriques et les journaux.

### Mise à jour manuelle de secours

Si les Actions GitHub sont désactivées, lancez le synchroniseur depuis la racine du projet :

```bash
git remote add upstream https://github.com/krapaud/AGENTIC-Starter-Kits.git
bash .codex/scripts/update-starter-kit.sh --remote upstream --ref main --branch chore/update-agentic-kit
```

Avec Claude, remplacez `.codex` par `.claude`. Cette procédure crée une branche et ne remplace pas les données propres au projet.

## Choix des mises à jour à l’initialisation

Lors de l’exécution de `init-project.sh`, le kit demande si les mises à jour automatiques doivent être activées.

- Répondez `O` pour installer le workflow qui ouvre automatiquement une Pull Request.
- Répondez `N` pour ne pas installer ce workflow.
- Utilisez `--updates pr` pour activer directement le mode Pull Request.
- Utilisez `--updates off` pour désactiver explicitement les mises à jour.

Le choix recommandé est `O`. L’agent peut alors détecter une nouvelle version, créer la branche de mise à jour, synchroniser les fichiers universels, préserver les données du projet, lancer les contrôles et ouvrir la Pull Request. Il ne modifie jamais directement `main`.
