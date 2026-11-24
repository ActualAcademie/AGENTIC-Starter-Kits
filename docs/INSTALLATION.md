# Installer et utiliser Agentic Starter Kits

Ce guide décrit l'installation officielle des kits Codex et Claude Code.

L'installation est exclusivement `shared`. Le socle versionné est installé une seule fois dans le registre partagé de la machine. Chaque projet reçoit des liens symboliques et conserve son propre contexte, son cahier des charges, son runtime et ses work items.

## Prérequis

- macOS ou Linux avec Bash et Git.
- Python 3.11 ou plus récent.
- Codex ou Claude Code installé selon le kit choisi.
- Un dossier de projet existant.
- Le dépôt Agentic Starter Kits cloné localement.

Les services externes ne sont pas nécessaires pour l'installation. GitHub, GitHub Projects, Trello, Docker et les services de déploiement ne sont utilisés que si le projet les choisit ensuite.

## Registre partagé

Par défaut, le registre est créé ici :

```text
~/.local/share/agentic-starter-kits/kits/
```

Pour choisir un autre emplacement commun à la machine :

```bash
export AGENTIC_KIT_HOME="$HOME/Documents/agentic-kit-shared/kits"
```

Le registre doit être accessible par tous les projets de cet utilisateur. Chaque utilisateur ou machine peut avoir son propre registre. Le projet conserve ses dépendances applicatives dans ses fichiers habituels (`package.json`, `pyproject.toml`, etc.).

## Installer le kit source

```bash
git clone https://github.com/Krapaud-Labs/AGENTIC-Starter-Kits.git
cd AGENTIC-Starter-Kits
```

## Installer Codex

```bash
bash install.sh \
  --kit codex \
  --mode shared \
  --target "/chemin/absolu/vers/mon-projet" \
  --briefs-root "$HOME/Documents/Projets/Cahier-des-Charges" \
  --updates off
```

## Installer Claude Code

```bash
bash install.sh \
  --kit claude \
  --mode shared \
  --target "/chemin/absolu/vers/mon-projet" \
  --briefs-root "$HOME/Documents/Projets/Cahier-des-Charges" \
  --updates off
```

L'installation interactive est également disponible :

```bash
bash install.sh
```

Elle demande l'orchestrateur, le projet cible et le dossier commun des cahiers. `shared` est le seul mode accepté. Il ne faut pas copier manuellement `AGENTS.md`, `CLAUDE.md`, `.codex` ou `.claude`.

## Ce qui est installé dans le projet

- `AGENTS.md` ou `CLAUDE.md` pointe vers le registre partagé.
- `.codex` ou `.claude` pointe vers la version partagée des politiques, scripts, agents et Skills.
- `.workspace.toml` enregistre l'orchestrateur, la version, le mode et les chemins.
- Le contexte local conserve le cahier, le profil, le runtime, les work items, les décisions et les rapports.
- `.gitignore` protège les fichiers internes et les états locaux du kit.

L'installation est non destructive. Elle ne remplace pas le code produit ni les documents de contexte existants.

## Cahiers des charges

Le dossier commun est demandé en mode interactif. En mode non interactif, il est défini par `--briefs-root` ou utilise :

```text
~/Documents/Projets/Cahier-des-Charges/
```

Chaque projet possède son sous-dossier :

```text
Documents/Projets/Cahier-des-Charges/nom-du-projet/cahier-des-charges.md
```

Un cahier existant est conservé. Un modèle est créé seulement s'il est absent. Le cahier accepté du MVP ne doit pas être modifié rétroactivement pour intégrer une demande post-MVP.

## Projet déjà existant

Après vérification de `git status`, réinstaller le kit partagé sans réinitialiser le projet :

```bash
bash install.sh \
  --kit codex \
  --mode shared \
  --target "/chemin/absolu/vers/projet-existant" \
  --force \
  --updates off
```

Remplacer `codex` par `claude` si nécessaire. Ouvrir ensuite une nouvelle conversation à la racine du projet et envoyer :

```text
Mode initialisation. Utilise le kit shared installé dans ce projet. Vérifie la version du kit, les instructions, les politiques, les agents, les Skills, le cahier des charges externe, le profil, le runtime et Git. Préserve les changements existants, ne réinitialise rien et ne recrée pas les Goals, work items ou suivis déjà présents. Termine l'initialisation complète avant de commencer le développement.
```

## Vérifier l'installation

Dans le projet :

```bash
cat .workspace.toml
readlink AGENTS.md 2>/dev/null || readlink CLAUDE.md
```

Codex :

```bash
test -f .codex/KIT.toml
bash .codex/scripts/doctor.sh
```

Claude :

```bash
test -f .claude/KIT.toml
bash .claude/scripts/doctor.sh
```

La version de `.workspace.toml`, du lien et du `KIT.toml` partagé doit être identique.

## Mettre à jour le kit

```bash
git pull --ff-only origin main
bash install.sh --kit codex --mode shared --target "/chemin/absolu/vers/mon-projet" --updates off
```

Répéter pour chaque projet à mettre à jour. Les fichiers locaux de contexte sont conservés. Après une mise à jour, redémarrer la conversation afin que le Coordinateur relise les instructions et politiques de la nouvelle version avant de reprendre un Goal.

Pour Claude, remplacer `codex` par `claude`.

## Mises à jour automatiques

`--updates off` est le choix par défaut et recommandé pour éviter tout usage hébergé ou toute facturation inattendue. `--updates dispatch` ajoute un workflow manuel. `--updates pr` ajoute un workflow planifié qui ouvre une PR. Ces modes sont soumis à la garde de visibilité et d'usage GitHub Actions. Un workflow existant n'est ni supprimé ni écrasé automatiquement.

Le kit n'active aucun service payant sans approbation explicite. Pour un dépôt privé, ne pas supposer que GitHub Actions est gratuit.

## Git et livraison

Les changements d'installation concernent généralement `.workspace.toml`, `.gitignore` et éventuellement un workflow. Ils suivent le GitFlow du projet : branche dédiée, commit, push, PR vers `dev`, puis promotion vers `main` après demande humaine. Ne forcez jamais les fichiers internes `.codex` ou `.claude` dans Git.

## Dépannage

Si le kit semble installé plusieurs fois, vérifier `readlink`, `.workspace.toml` et `AGENTIC_KIT_HOME`, puis réinstaller en `shared` avec `--force` après sauvegarde. Si la nouvelle version n'est pas visible, fermer et rouvrir la conversation. Si un outil est absent, le kit cherche d'abord dans le registre partagé et propose son installation via l'interface prévue. Ne supprimez pas `RUNTIME-STATE.md` et ne créez pas de second Goal pour réparer un blocage.
