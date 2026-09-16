# Agentic Starter Kits

Deux kits portables pour démarrer un projet avec une orchestration IA structurée : un pour Codex, un pour Claude Code. Choisir un seul kit par projet. Ils couvrent le cadrage obligatoire, la conception, l'implémentation, la sécurité, l'audit, la maîtrise des coûts et le Gitflow.

| Outil utilisé dans le projet | Kit à importer | Point d'entrée |
| --- | --- | --- |
| Codex | `starter-kit-codex/` | `AGENTS.md` et `.codex/` |
| Claude Code | `starter-kit-claude/` | `CLAUDE.md` et `.claude/` |

## Avant de commencer

1. Créer ou ouvrir le dossier du nouveau projet.
2. Installer Git et l'outil choisi, Codex ou Claude Code.
3. Préparer un cahier des charges. Il doit au minimum présenter le besoin, les utilisateurs, les objectifs, le périmètre, les contraintes, les critères de réussite et le hors périmètre.
4. Ne pas importer les deux kits dans le même projet. Ils ont des conventions d'agents et de configuration différentes.

## Installation Codex

Depuis la racine du nouveau projet, définir le chemin de ce dépôt puis copier le point d'entrée et la configuration cachée :

```bash
KIT_SOURCE="/chemin/vers/Agentic-Project/starter-kit-codex"
cp "$KIT_SOURCE/AGENTS.md" .
cp -R "$KIT_SOURCE/.codex" .
bash .codex/scripts/init-project.sh
```

Ouvrir ensuite Codex dans ce dossier et formuler une demande projet normale. Tant que le cahier des charges n'a pas été fourni, Codex doit exclusivement le demander. Après l'avoir reçu, il crée le brief, détecte les technologies, complète le profil et prépare l'orchestration.

Guide complet : [starter-kit-codex/README.md](starter-kit-codex/README.md).

## Installation Claude Code

Depuis la racine du nouveau projet, définir le chemin de ce dépôt puis copier le point d'entrée et la configuration cachée :

```bash
KIT_SOURCE="/chemin/vers/Agentic-Project/starter-kit-claude"
cp "$KIT_SOURCE/CLAUDE.md" .
cp -R "$KIT_SOURCE/.claude" .
bash .claude/scripts/init-project.sh
claude
```

Dans le nouveau chat Claude, formuler une demande projet normale. Claude doit demander le cahier des charges avant toute analyse, choix technique ou modification. Une fois ce cahier fourni, il adapte le profil du projet puis peut commencer le travail.

Guide complet : [starter-kit-claude/README.md](starter-kit-claude/README.md).

## Après le cahier des charges

L'agent met à jour deux fichiers propres au projet :

- `PROJECT-BRIEF.md` : le cahier des charges formalisé et accepté.
- `project-profile.toml` : les technologies réellement détectées ou explicitement choisies, les commandes et les capacités du projet.

Exécuter le contrôle avant une revue ou une livraison :

```bash
# Codex
bash .codex/scripts/preflight.sh

# Claude Code
bash .claude/scripts/preflight.sh
```

Le contrôle réussit seulement après acceptation du cahier et complétion du profil technique.

## Ce que contient chaque kit

- Les six rôles : Coordinateur, Concepteur, Frontend, Backend, Cybersécurité et Auditeur.
- Des Skills réutilisables pour le cadrage, l'onboarding, la conception, l'implémentation, l'audit, la sécurité, la livraison et l'optimisation du coût.
- Une gouvernance détaillée, une matrice de risque, des règles de validation et un Gitflow professionnel.
- Des modèles de work items, décisions, rapports et évaluations.
- Des scripts d'initialisation, de contrôle, de résolution des modèles et de préparation CI.

Les dossiers de production de décisions, métriques, rapports, archives et modèles CI contiennent un `.gitkeep`. Ils sont donc conservés par Git même avant leur première utilisation.

## Limites volontaires

Le kit donne un cadre et des contrôles. Il ne valide jamais seul une exigence non démontrée, ne choisit pas une technologie sans information suffisante et ne remplace pas l'approbation humaine exigée par le risque, la sécurité ou le processus de livraison.
