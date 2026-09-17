# Agentic Starter Kits

Agentic Starter Kits est un système portable de gouvernance et d orchestration pour construire des projets logiciels avec une IA, en utilisant Codex ou Claude Code comme interface de travail. Le dépôt fournit deux kits indépendants et exportables : `starter-kit-codex` pour Codex et `starter-kit-claude` pour Claude Code.

Le kit ne remplace pas le développeur ou le responsable du produit. Il impose un cadre qui transforme une demande en projet traçable : cahier des charges, profil technologique, conception détaillée, tâches, implémentation, sécurité, tests, audit, corrections, livraison et amélioration continue.

## Ce que le projet propose

Le système fournit :

- une porte obligatoire de démarrage qui refuse toute construction sans cahier des charges accepté ;
- une détection contrôlée des technologies, commandes, capacités et conventions existantes ;
- une conception de niveau Concepteur Développeur d Applications avec vision, acteurs, objectifs, user stories, règles métier, parcours, diagrammes Mermaid, architecture, données, contrats, sécurité, roadmap et décisions ;
- six rôles spécialisés coordonnés par un Agent Coordinateur ;
- un journal qualité partagé pour les bugs, vulnérabilités, régressions, défauts de conception et corrections ;
- un choix explicite de création d un plan Trello complet après le cahier des charges ;
- des modèles de raisonnement et de coût adaptés au risque ;
- des contrôles lint, tests, sécurité, conception, Gitflow et qualité avant push ;
- une compatibilité macOS, Linux et Windows via Bash, Git Bash et PowerShell ;
- un versionnement SemVer, un changelog et des tags Git de release ;
- une CI GitHub qui valide les kits eux-mêmes.

## Les deux kits

| Kit | Point d entrée | Configuration | Usage |
| --- | --- | --- | --- |
| Codex | `AGENTS.md` | `.codex/` | orchestration native Codex |
| Claude Code | `CLAUDE.md` | `.claude/` | sous-agents et Skills natifs Claude Code |

Choisir un seul kit par projet. Ils ne doivent pas être copiés simultanément dans le même dépôt.

## Les agents

| Agent | Responsabilité principale | Livrables attendus |
| --- | --- | --- |
| Coordinateur | pilote le cycle, le périmètre, les dépendances, les budgets et les preuves | plan, work items, décisions, état de livraison, journal synchronisé |
| Concepteur | transforme le besoin en conception exploitable | architecture, contrats, stories, parcours, données, décisions et diagrammes |
| Frontend | construit interface, accessibilité et validations client | code ciblé, tests client, preuve visuelle si nécessaire, documentation mise à jour |
| Backend | construit API, données, logique métier et observabilité | code serveur, contrats, tests, migrations et plan de retour si nécessaire |
| Cybersécurité | recherche menaces, vulnérabilités et défauts de contrôle | risques qualifiés, preuves, recommandations, journal qualité et décision d escalade |
| Auditeur | vérifie indépendamment critères, code, tests, conception et documentation | matrice de preuves, anomalies, identifiants du journal et décision de revue |

Aucun agent ne s auto-approuve. Le Coordinateur orchestre, mais l Auditeur conserve son indépendance. Cybersécurité peut bloquer un risque critique.

## Les Skills

Les Skills sont les procédures réutilisables du kit :

- `project-intake` : réception et acceptation du cahier des charges ;
- `project-onboarding` : détection de stack et adaptation du profil ;
- `conception` : production et maintenance du dossier de conception ;
- `coordination` : découpage en work items et orchestration ;
- `trello-planning` : génération d un tableau Trello détaillé si choisi ;
- `implementation` : modification contrôlée du produit ;
- `security-audit` : analyse des menaces et contrôles ;
- `quality-audit` : revue indépendante et preuves ;
- `quality-journal` : registre commun des anomalies et corrections ;
- `delivery` : préparation de la livraison et respect du Gitflow ;
- `cost-optimization` : amélioration continue du coût et de la performance.

## Cycle de fonctionnement

1. L utilisateur ouvre une session à la racine du projet.
2. L agent demande obligatoirement le cahier des charges.
3. L agent formalise le cahier et attend une base suffisante avant de continuer.
4. L agent demande explicitement si un Trello complet doit être préparé.
5. L agent détecte les technologies et complète `project-profile.toml`.
6. Le Concepteur génère puis complète la conception détaillée dans `docs/`.
7. Le Coordinateur crée les work items et assigne les rôles.
8. Les agents développent sur des branches dédiées avec des commits atomiques.
9. Les agents enregistrent bugs, failles et corrections dans le journal qualité commun.
10. Les tests, lint, sécurité, conception et audit sont vérifiés.
11. Une Pull Request promeut la feature vers `develop`, puis une release promeut `develop` vers `main`.
12. La release met à jour SemVer, changelog et tag Git annoté.

## Documentation d installation

Le tutoriel complet, unique et pas à pas se trouve dans [INSTALLATION.md](INSTALLATION.md). Il couvre les prérequis, la copie, l initialisation, la conversation de cadrage, le choix Trello, la configuration des technologies, la conception, les vérifications, le premier work item et le démarrage agentique.

Guides spécialisés :

- [README Codex](starter-kit-codex/README.md)
- [README Claude Code](starter-kit-claude/README.md)

## Gouvernance et preuves

Le dossier importé contient les politiques de contexte, risque, sécurité, CI/CD, Gitflow, validation, incidents, coût et livraison. Le profil `project-profile.toml` stocke les technologies et commandes propres au projet. Les inconnues restent explicites et ne sont jamais inventées.

Le journal `docs/quality/quality-journal.md` est créé dans le projet cible. Il constitue le registre de référence pour les anomalies. Une correction reste `fixed` jusqu à une vérification indépendante qui la fait passer à `verified`.

## Gitflow et versionnement

Chaque feature, correctif ou changement documentaire possède sa branche. Les commits suivent `type(scope): description`. Un commit ne mélange pas plusieurs intentions et ne dépasse pas les limites par défaut de 75 fichiers et 1200 lignes modifiées.

Les releases suivent [VERSIONING.md](VERSIONING.md). La version publiée actuelle du dépôt est dans [VERSION](VERSION), et les changements sont recensés dans [CHANGELOG.md](CHANGELOG.md).

## Validation du dépôt

La CI vérifie les deux kits, leurs imports temporaires, les portes de cahier des charges, conception et Trello, les scripts Bash, les wrappers PowerShell, les versions SemVer et les règles de format. Les avertissements de plateforme fournis par GitHub Actions ne valent pas échec de validation.

## Limites

Le kit orchestre les décisions et les preuves, mais ne devine pas un besoin métier, ne fournit pas de secrets, ne simule pas un test, ne crée pas automatiquement une ressource externe sans autorisation et ne remplace pas les validations humaines requises pour les décisions critiques.
