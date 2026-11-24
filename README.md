# Agentic Starter Kits

Kit partagé d'orchestration pour Codex et Claude Code. Il transforme une demande en processus de travail traçable, avec cahier des charges, conception, agents spécialisés, tests, GitFlow, contrôles de livraison et reprise autonome.

Version actuelle : **2.0.31**.

[![Version](https://img.shields.io/badge/version-2.0.31-blue.svg)](VERSION)

La branche `dev` peut être alimentée automatiquement par les agents autorisés. La promotion vers `main` reste soumise à une demande humaine explicite.

## Ce que garantit le kit

- Le Coordinateur est le seul orchestrateur de la session.
- Chaque tâche spécialisée est confiée à l'agent compétent avant modification ou validation.
- Un spécialiste réel doit avoir un identifiant, un thread correspondant, un périmètre et un rapport attendu.
- Le Coordinateur ne peut pas se déclarer spécialiste ni remplacer silencieusement un agent disponible.
- Les agents parallèles sont créés uniquement pour des lots indépendants et leurs résultats sont intégrés par le Coordinateur.
- Une erreur récupérable déclenche immédiatement diagnostic, correction, test et reprise.
- Un outil absent est recherché dans le registre partagé avant toute installation.
- Un navigateur indisponible déclenche une récupération puis une alternative vérifiable.
- Après deux échecs identiques, la stratégie change et seule la tâche dépendante est isolée.
- Les tâches indépendantes continuent sans boucle globale ni demande artificielle de « continue ».
- `blocked` est réservé à une dépendance externe réellement inaccessible ou à une décision humaine indispensable.
- Une conclusion exige des preuves, un état runtime cohérent et une livraison vérifiée.

Le détail des fonctionnalités et des tests est disponible dans [docs/IMPLEMENTED-FEATURES.md](docs/IMPLEMENTED-FEATURES.md).

## Installation shared uniquement

Le kit est installé une seule fois dans le registre partagé `AGENTIC_KIT_HOME`. Chaque projet conserve uniquement ses liens symboliques, son contexte local, son cahier des charges et son état d'exécution.

Les anciennes installations par copie manuelle ne sont pas supportées.

### Prérequis

- macOS ou Linux.
- Git.
- Codex ou Claude Code selon l'orchestrateur choisi.
- Un projet déjà présent sur le disque.
- Aucun service payant supplémentaire n'est activé par défaut.

### Installation Codex

```bash
./install.sh --kit codex --mode shared \
  --target "/chemin/absolu/vers/mon-projet" \
  --updates off
```

### Installation Claude Code

```bash
./install.sh --kit claude --mode shared \
  --target "/chemin/absolu/vers/mon-projet" \
  --updates off
```

Le chemin cible doit exister. L'installateur demande le dossier commun des cahiers des charges lorsqu'il n'est pas fourni. Pour utiliser l'assistant interactif, lancer simplement `./install.sh`.

Le guide complet se trouve dans [docs/INSTALLATION.md](docs/INSTALLATION.md).

## Premier lancement

1. Ouvrir le projet à sa racine dans Codex ou Claude Code.
2. Envoyer le cahier des charges complet.
3. Laisser le Coordinateur charger les instructions, les politiques, les Skills, le profil, le runtime et les outils partagés.
4. Répondre aux questions de cadrage via l'interface lorsqu'une décision est réellement nécessaire.
5. Laisser l'onboarding auditer le projet existant, la structure, les outils, la documentation et le suivi configuré.
6. Laisser l'agent créer les cartes ou Issues nécessaires, avec descriptions, labels, priorités, dépendances et checklists conformes.
7. Le développement commence uniquement après la conception exigée par le périmètre.

Pour initialiser une conversation déjà ouverte, envoyer seul :

```text
Mode initialisation :
```

Le Coordinateur reprend l'état existant sans recréer le Goal, les cartes, les agents ou les changements déjà prouvés.

## Orchestration et agents

Le kit comprend six agents du noyau et dix spécialistes optionnels. Les spécialistes sont activés selon le périmètre réel, le risque et les lots indépendants.

Les agents du noyau couvrent notamment le Coordinateur, la conception, le frontend, le backend, la cybersécurité et l'audit. Les spécialistes optionnels couvrent le produit, la QA, le DevOps, la performance, la recherche UX, l'accessibilité, le SEO, la data, la documentation, la release, la conformité et le juridique selon le registre du kit.

Avant une tâche spécialisée, le plan doit être validé par `verify-specialist-plan.sh`. Le contrôle refuse un rôle absent du registre officiel, `coordinateur` comme spécialiste, un identifiant fictif, un thread différent de l'identifiant, une affectation incomplète ou des périmètres qui se chevauchent.

Pour une refonte visuelle ou un audit explicitement demandé, `frontend`, `qa` et `auditeur` sont obligatoires. Pour un correctif ciblé, seuls le spécialiste propriétaire et les contrôles directement concernés sont activés, sauf risque démontré.

## Récupération des outils et du navigateur

Avant de déclarer un outil indisponible, le Coordinateur vérifie le `PATH`, les emplacements système et utilisateur, le registre partagé, les environnements du projet, les binaires de l'IDE et les intégrations de la session.

Pour un navigateur, il vérifie et répare d'abord la session utilisateur déjà ouverte, puis utilise le connecteur équivalent, une CLI ou une API authentifiée, et enfin un contrôle local ou une fixture vérifiable. Après deux échecs identiques, la voie change obligatoirement et seule la tâche dépendante est isolée.

Un navigateur vierge ne doit pas être créé lorsqu'une session existante est contrôlable. Le navigateur généraliste peut être utilisé pour Trello, GitHub, VPS, Dokploy et les autres services autorisés. Les tâches indépendantes continuent sans boucle globale.

## Autonomie et limites

Une demande comme « fais tout », « termine », « corrige » ou « livre » autorise les étapes réversibles nécessaires jusqu'à la livraison vers `dev` : correction, tests, documentation, branche, commit, push, PR, CI, fusion et synchronisation de `dev`.

Une demande humaine reste nécessaire pour la promotion ou la fusion vers `main`, un secret ou un accès manquant, une dépense ou un service payant, une action destructive, une décision métier, juridique ou réglementaire non déductible, ou une action de production sensible non autorisée.

Le kit ne simule jamais une preuve et ne prétend pas garantir la sécurité de production à lui seul.

## GitFlow et livraison

Chaque carte, Issue ou feature utilise une branche dédiée. Les agents ne poussent jamais directement vers `dev` ou `main`.

1. Créer une branche depuis `dev`.
2. Regrouper le travail de la feature sur cette branche.
3. Effectuer les commits et contrôles nécessaires.
4. Pousser la branche et créer une seule PR vers `dev` à la fin de la carte.
5. Attendre et corriger la CI, puis fusionner vers `dev`.
6. Vérifier que le checkout local et `origin/dev` sont alignés.
7. Demander explicitement la promotion vers `main` lorsque nécessaire.
8. Supprimer les branches fusionnées localement et sur le remote.

Une PR n'est pas un journal de progression. Les corrections intermédiaires restent sur la branche de la carte.

## Suivi du projet

Le suivi est choisi explicitement dans `[tracking].mode` : `local`, `github` ou `trello`.

- `local` conserve les work items dans le dépôt.
- `github` utilise les Issues et GitHub Projects.
- `trello` utilise les cartes et checklists.

Les règles de contenu, labels, priorités, colonnes, checklists, commentaires, relecture et statut sont communes aux modes GitHub Projects et Trello. Une carte ou Issue n'est jamais créée sans description détaillée, propriétaire, périmètre, dépendances, critères d'acceptation, preuves attendues et Definition of Done.

Les statuts communs sont `Todo`, `In Progress` et `Done`. La revue et le blocage sont des métadonnées ou labels, pas des colonnes supplémentaires par défaut.

## Conception, audits et tests

Le mode `quick-fix` effectue uniquement les contrôles rapides directement nécessaires. Le mode `feature` regroupe la validation finale proportionnée. Le mode `audit` active la matrice exhaustive.

Les audits visuels, responsive, accessibilité, performance et navigateur ne sont pas relancés à chaque modification. Ils sont réalisés en une passe finale, sur une carte dédiée ou sur demande explicite.

Les contrôles locaux, les tests projet, les tests sandbox Codex et Claude, la CI et les preuves externes sont distingués. Une CI verte ne remplace pas une vérification navigateur ou une preuve de déploiement demandée.

## Runtime, hooks et continuité

Chaque projet possède un `RUNTIME-STATE.md` local. Le kit shared ne mélange jamais le runtime de deux projets ou de deux conversations.

Le runtime conserve le Goal, l'état d'exécution, l'action courante, la prochaine action, les portes ouvertes, les agents créés et les preuves. `guard-before-response.sh` refuse une conclusion si une action autonome, une preuve ou une livraison reste ouverte.

Les hooks doivent être relus et approuvés dans l'interface de l'orchestrateur avant la première action projet. Si un hook se bloque lui-même, le kit utilise la procédure de bootstrap ou de réconciliation prévue, sans supprimer le runtime ni créer un second Goal.

## Rapports du kit

Les projets consommateurs peuvent produire des rapports anonymisés dans `.kit-reports/outbox/`. Le dépôt central conserve l'historique dans `docs/audit/kit-report-history.jsonl`.

Une empreinte déjà classée `normal`, `resolved` ou `duplicate` n'est pas renvoyée. Les corrections connues peuvent être appliquées automatiquement par le correcteur central sur une branche isolée. Les cas inconnus restent en revue et ne modifient jamais `main` directement.

## Mise à jour du kit

Le kit vérifie sa version au démarrage et utilise le registre partagé. Une mise à jour détectée pendant un work item suspend le travail produit, sauvegarde le runtime, met à jour le kit par son propre GitFlow, vérifie `dev`, puis reprend la prochaine action.

L'updater est désactivé par défaut avec `--updates off`. Les modes `dispatch` et `pr` nécessitent une configuration explicite et la validation de la garde d'usage hébergé. Aucun paiement ni workflow hébergé supplémentaire n'est activé sans autorisation.

## Documentation et références

- [Installation](docs/INSTALLATION.md)
- [Fonctionnalités implémentées](docs/IMPLEMENTED-FEATURES.md)
- [Contribution et GitFlow](CONTRIBUTING.md)
- [Sécurité](SECURITY.md)
- [Versionnement](VERSIONING.md)
- [Changelog](CHANGELOG.md)
- [Historique complet](VERSION-HISTORY.md)
- [README Codex](starter-kit-codex/README.md)
- [README Claude Code](starter-kit-claude/README.md)

Toute modification du kit doit mettre à jour la documentation concernée, les tests, le changelog et le versionnement dans le même work item.
