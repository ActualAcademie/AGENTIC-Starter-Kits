# Fonctionnalités réellement implémentées

Ce document est la référence synthétique du comportement livré par les kits. Il distingue les mécanismes exécutables des règles qui restent dépendantes de l'environnement Codex ou Claude.

## Versions et distributions

| Élément | État | Preuve |
|---|---|---|
| Version actuelle | `2.0.34` | `VERSION`, `starter-kit-codex/.codex/KIT.toml`, `starter-kit-claude/.claude/KIT.toml` |

## Version 2.0.34

Le garde de démarrage limite la synchronisation à 30 secondes par défaut avec `KIT_SYNC_TIMEOUT_SECONDS` comme réglage optionnel. Après un échec ou un dépassement, le kit local est utilisé et `.sync-attempted` empêche de relancer la même synchronisation dans la session. Une nouvelle session peut retenter la mise à jour.

## Version 2.0.33

- Place les sauvegardes de synchronisation hors du dossier source du kit.
- Empêche `rsync` de recopier une sauvegarde dans sa propre source.
- Libère toujours le verrou shared après une erreur.
- Corrige la cible Claude pour éviter un dossier `.claude/.claude` imbriqué.

## Version 2.0.32

- Persiste les questions et choix interactifs dans le runtime avant affichage.
- Refuse l'écrasement d'une question en attente et les réponses vides ou invalides.
- Enregistre l'identifiant et le type de réponse pour une reprise fiable.
- Rend la résolution idempotente après interruption ou nouvelle session.

## Version 2.0.30

## Version 2.0.31

- Ajoute une matrice de récupération bornée pour les outils et le navigateur.
- Corrige immédiatement les sessions, chemins et permissions avant de changer de voie.
- Utilise connecteur, CLI/API, contrôle local ou fixture comme alternatives vérifiables.
- Isole uniquement la tâche dépendante et poursuit les tâches indépendantes sans boucle globale.
- Ajoute un test de non-régression commun à Codex et Claude.

- Le plan spécialiste vérifie le registre officiel des rôles dans les deux kits.
- Le Coordinateur ne peut jamais être présenté comme agent additionnel.
- Chaque affectation exige un identifiant réel, un thread identique à cet identifiant et un rapport attendu.
- Des tests négatifs vérifient les rôles inconnus, les threads divergents et les rapports manquants.

## Version 2.0.29

- Politique commune de continuation autonome et de classement des blocages.
- Enchaînement automatique des cartes autorisées GitHub Projects et Trello.
- Blocage humain limité aux décisions critiques, irréversibles ou sensibles.
- Test de parité Codex/Claude ajouté.

## Version 2.0.28

- Répare automatiquement un runtime absent, incomplet ou non canonique avant les contrôles de session.
- Préserve les liens symboliques `AGENTS.md` et `CLAUDE.md` au lieu de les convertir en copies locales.
- Conserve les traces de validation du kit dans le projet consommateur, jamais dans le registre partagé.
- Ajoute des scénarios Codex et Claude pour le bootstrap, la normalisation et la prévention des régressions shared.

## Version 2.0.26

- Toute demande adressée à l'utilisateur passe par l'interface interactive native ou son secours persistant.
- Les demandes libres dans le chat ne peuvent plus suspendre un Goal, demander une validation ou déclencher une reprise.

## Version 2.0.25

- Les scripts de questionnaire et de résolution ciblent toujours le runtime du projet courant lorsqu'ils sont lancés depuis un dépôt Git.
- Une interruption ou une nouvelle conversation ne perd plus une question d'initialisation persistée.

## Version 2.0.24

- Les questions obligatoires de l'initialisation utilisent l'interface interactive native lorsqu'elle est disponible.
- Les demandes sont persistées avec `pending_request_id` et ne peuvent pas être perdues entre deux messages ou conversations.
- Le secours textuel reste bloquant et passe par le même résolveur officiel.

## Version 2.0.23

- Tous les agents lisent et appliquent une politique commune de qualité, rôle, preuves, blocage et clôture.
- Le preflight refuse un agent dont le profil, le modèle, la skill ou la politique est absent ou incohérent.
- Un test de parité vérifie les dix-neuf agents Codex et Claude avant livraison.

## Version 2.0.22

- Corrige le profil et les compétences déclarés par l'agent SEO afin qu'ils soient validés par le preflight.
- Ajoute la politique SEO, GEO et E-E-A-T, les contrats et l'inventaire spécialistes dans les deux kits.
- Exige une matrice de preuve, les éléments non applicables et une revalidation rattachée au SHA ou au déploiement.
- Vérifie automatiquement la cohérence du spécialiste SEO dans les deux distributions.

## Version 2.0.21

- Ajoute l'agent SEO spécialisé en SEO technique, GEO et E-E-A-T.
- Route les demandes publiques de référencement, découvrabilité, sources, auteur et confiance.
- Exige des preuves et interdit les signaux d'autorité ou données structurées inventés.

## Version 2.0.20

- Force une composition indépendante avant toute refonte frontend au lieu de retoucher aveuglément l'ancien arbre.
- Exige une architecture séparée entre layouts, composants, primitives, hooks, types, données et styles selon le périmètre.
- Exige une carte de composition, un inventaire de réutilisation et une preuve visuelle finale rattachée au même SHA.
- Réserve les audits complets responsive, navigateur, accessibilité et animation à la fin du lot, à une carte dédiée ou à une demande explicite.

## Version 2.0.8

- Ajoute les modes `quick-fix`, `feature` et `audit`.
- Désactive l'audit exhaustif et la relecture indépendante par défaut pour les corrections ciblées.
- Rend la validation navigateur et responsive finale conditionnelle au mode et au périmètre.

## Version 2.0.7

- Sépare les contrôles rapides de régression des audits complets.
- Regroupe les audits lourds en fin d'implémentation, sur une carte dédiée ou sur demande explicite.
- Interdit les relectures exhaustives répétées après chaque modification.

## Version 2.0.6

- Réutilise une API GitHub accessible par `gh` avant de conclure à une indisponibilité réseau.
- Déduit la branche d intégration configurée avant de différer le contrôle de frontière Git.

## Version 2.0.5

- Distingue Docker CLI, daemon, contexte, socket et serveur réel.
- Sélectionne automatiquement `desktop-linux` sur macOS lorsqu un autre contexte est invalide.

## Version 2.0.4

- Autorise la reprise d initialisation lorsque le runtime est terminé et qu aucun Goal n est actif.

## Version 2.0.3

- Corrige l extraction du mode shared dans le diagnostic Codex.

## Version 2.0.2

- Corrige la résolution de la racine Git depuis un kit shared appelé par lien symbolique.

## Version 2.0.1

- Le diagnostic Codex affiche le mode réel du manifeste, notamment `shared`, au lieu d'un mode `external` codé en dur.

## Version 2.0.0

- Contrôles négatifs des budgets Goal exécutés pour les deux variantes.
- Audit de contexte doté d un mode strict pour bloquer les alertes critiques.
- Contrôles intégrés à la CI afin de détecter les dépassements avant livraison.

## Version 1.17.9

- Registre central des outils documenté dans `docs/policies/CENTRAL-TOOL-REGISTRY-POLICY.md`.
- Vérificateur de parité Codex/Claude exécuté par la CI.
- Détection des commandes dupliquées ou absentes dans les manifestes.

## Version 1.17.8

- Correcteur local Codex et Claude aligné sur l historique des rapports.
- Rapports résolus ou dupliqués exclus des blocages actifs.
- Erreurs GitHub conservées comme erreurs récupérables au lieu de créer des doublons.
- Outbox écrite de façon atomique et empreintes SHA-256 validées.

## Version 1.17.7

- Synchronisation shared protégée par un verrou exclusif et des phases `prepared`, `applied`, `validated` et `committed`.
- Rollback complet du kit et de `.workspace.toml` en cas d échec.
- Préservation de `AGENTS.md` et des fichiers du projet consommateur.
- Scénarios de contrôle transactionnel pour les variantes Codex et Claude.

## Version 1.17.6

- Scénario comportemental partagé Codex/Claude couvrant une initialisation répétée, la préservation d un fichier projet, le bootstrap runtime et la reprise d un Goal natif.
- Budget runtime initial borné et valide dès la première initialisation.
- Réconciliation persistante de `native_goal_status` quand un identifiant de Goal permet la reprise locale.

## Version 1.17.5

- Documentation canonique, audit de structure et archivage des rapports temporaires.

## Version 1.17.4

- Préserve le Goal natif identifié et reconstruit une prochaine action lors de la récupération runtime.

## Version 1.17.3

- Après une mise à jour distante, SessionStart signale et impose la relecture complète du contexte du kit avant toute reprise projet.

## Version 1.17.2

- Synchronisation GitHub multi-canal avec repli API après échec DNS du canal raw.
- Classification distincte entre version non vérifiable et archive non téléchargeable.

## Version 1.17.1

- Réparation automatique de `native_goal_status` manquant et compatibilité des clés de condition de blocage.

## Version 1.17.0

- Exécution consolidée des cartes avec lots spécialisés, corrections groupées, relance bornée et revalidation finale unique.

## Version 1.16.99

- Trois colonnes stables pour les gestionnaires de projet : Backlog, In progress et Done.

## Version 1.16.98

- GitHub Projects refuse les cartes terminées en Draft et convertit les éléments suivis en Issues réelles.

## Version 1.16.97

- Transition terminale autonome après preuves complètes, sans confirmation intermédiaire artificielle.
| Variante Codex | Implémentée | `starter-kit-codex/` |
| Variante Claude | Implémentée | `starter-kit-claude/` |
| Mise à jour des consommateurs | Implémentée | `sync-workspace-kit.sh` |
| Sauvegardes locales préservées | Implémentée | exclusion `backups/` de `rsync --delete` |

## Démarrage et initialisation

- `AGENTS.md` ou `CLAUDE.md` est installé et contrôlé par version.
- Le contrat agentic vérifie les politiques, le runtime et les garde-fous exécutables.
- `.gitignore` est préparé avant les autres mutations de l'installation.
- Les outils sont recherchés dans plusieurs emplacements avant toute conclusion d'indisponibilité.
- Les outils gratuits manquants peuvent être installés provisoirement pour les validations.
- L'initialisation demande la revue des hooks avant tout travail produit.
- Les données projet, les décisions, les work items, les rapports et le runtime sont conservés pendant les mises à jour.

## Orchestration et Goals

- Le rôle principal est le Coordinateur.
- Un Goal natif doit être créé ou repris avant une action, avec fallback local explicitement identifié si l'API native est indisponible.
- Un work item et un état runtime persistent les actions, preuves, obligations et prochaines actions.
- Une tâche spécialisée exige un agent réel, un identifiant, un périmètre et un livrable vérifiable.
- Les lots indépendants sont parallélisés lorsque plusieurs agents sont disponibles.
- Le Coordinateur ne remplace pas un spécialiste disponible.
- Les états `running`, `waiting-ci`, `blocked`, `needs-review` et `complete` sont contrôlés avant réponse.
- Une clôture reste interdite tant que la prochaine action, les preuves, la checklist et la livraison ne sont pas vérifiées.

## Hooks de cycle de vie

| Hook | Fonction | Niveau |
|---|---|---|
| `SessionStart` | recharge version, runtime, Goal et consignes | contexte automatique |
| `PreToolUse` | bloque les écritures sans Goal ou état valide | blocage exécutable |
| `PermissionRequest` | refuse curl, wget, http et httpie vers les endpoints OpenAI et Anthropic couverts, les commandes de push détectées vers les branches protégées et les commandes destructives; une mention seule dans une commande locale est permise | blocage exécutable |
| `PostToolUse` | journalise outil et identifiant de preuve | traçabilité |
| `SubagentStart` | enregistre l'identifiant et le type du sous-agent | traçabilité |
| `SubagentStop` | demande la vérification du livrable indépendant | contrôle |
| `Stop` | appelle le garde avant réponse et continue si la livraison est incomplète | continuité |

Les hooks locaux doivent être relus et approuvés dans Codex avec `/hooks` après chaque installation ou modification. Le dépôt ne peut pas s'auto-approuver auprès du runtime. Le filtre PermissionRequest analyse le texte de la commande et ne peut pas certifier qu’un script arbitraire ou obfusqué ne déclenchera pas un appel externe.

## Facturation et outils externes

- Le mode par défaut utilise l'authentification abonnement de Codex ou Claude.
- Les noms exportés correspondant aux familles conventionnelles de credentials API, jetons d’accès et configurations d’authentification cloud bloquent l’initialisation sans autorisation explicite, même si leur valeur est vide. La garde compare les noms sans déréférencer les valeurs; les noms arbitraires restent hors de sa portée et les motifs larges peuvent bloquer des configurations non facturables.
- Les Agents API, Agents SDK, gateways et fournisseurs cloud sont hors périmètre abonnement par défaut.
- GitHub Actions, Trello, navigateur, Docker et autres services restent soumis à leur disponibilité et à leurs propres quotas.
- Une intégration non disponible ne doit jamais être déclarée comme exécutée.

## GitFlow et livraison

- Une branche dédiée est utilisée pour chaque work item.
- Les commits sont atomiques et contrôlés avant push.
- Une PR prématurée est refusée tant que la carte et sa checklist ne sont pas terminées.
- La branche d'intégration doit être relue après fusion.
- La promotion vers `main` reste soumise à une demande humaine explicite après la CI et la documentation du kit.
- La version, le changelog, l'historique et les README sont mis à jour pour les changements consommés.

## Trello

- Le connecteur lecture-écriture est prioritaire.
- Le navigateur complète uniquement les fonctions absentes ou instables du connecteur.
- Les listes, cartes, labels nommés, descriptions et checklists sont relus après écriture.
- Les cartes sont numérotées, ordonnées et liées à leurs dépendances.
- Une carte demandée directement ne reçoit pas de confirmation redondante.
- Les commentaires sont rédigés en français et relus après publication.
- Une absence de connecteur ne constitue jamais une preuve de synchronisation distante.

## Couverture de tests

- Tests de versions, documentation et cohérence de gouvernance.
- Tests des portes exécutables et de l'état runtime.
- Tests d'initialisation Codex et Claude en dépôts Git temporaires.
- Scénarios sandbox pour Goals, délégation, Trello, séquencement et reprise.
- Simulations d'adaptateurs GitFlow, navigateur, Trello et agents.
- Validation JSON et syntaxique de tous les hooks.
- CI Linux pour les contrôles principaux et PowerShell Core multiplateforme.

Les adaptateurs Trello, navigateur et agents natifs ne sont pas simulés comme des intégrations réelles dans la sandbox. Cette limite est volontairement signalée au lieu d'être présentée comme une réussite.
