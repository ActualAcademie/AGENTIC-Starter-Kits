# Distributions du starter kit

Le dépôt propose deux modes d’installation. Le noyau des règles reste commun, mais la présence du kit dans le dépôt projet dépend du mode choisi.

## Choisir le bon mode

| Mode | Fichiers du kit dans Git | Mise à jour | Recommandation |
| --- | --- | --- | --- |
| Native | Oui, selon les règles du dépôt. | Pull Request du socle universel. | Utilisateur qui veut inspecter le kit dans son projet. |
| External | Non, seuls le manifeste et le workflow sont suivis. | Pull Request du manifeste, puis synchronisation locale. | Utilisateur qui ne veut aucune trace du kit dans le dépôt distant. |

Les deux modes utilisent le même noyau de gouvernance, de sécurité, de validation, de versionnement et d’initialisation. Ils ne doivent pas être installés simultanément dans un même projet.

## Mode native

Le mode `native` installe le point d’entrée, le dossier d’orchestration et le workflow dans le projet. Il fournit l’expérience la plus directe avec Codex ou Claude. Les mises à jour universelles peuvent être examinées dans une Pull Request du projet.

## Mode external

Le mode `external` installe le kit localement, mais le projet ne publie pas `.codex/`, `.claude/`, `AGENTS.md` ou `CLAUDE.md`. Seuls `.workspace.toml`, `.gitignore` et le workflow de mise à jour sont suivis par Git.

Au démarrage d’une session, le synchroniseur compare la version locale et la version distante, crée une sauvegarde, puis met à jour uniquement le moteur du kit. Le cahier des charges, le profil technique, l’état du projet, les décisions, les work items et les journaux sont conservés.

## Règle de livraison

Les Pull Requests automatiques ciblent `dev` ou `develop`. La branche `main` ne doit être modifiée qu’après une promotion humaine ou une autorisation explicite.
