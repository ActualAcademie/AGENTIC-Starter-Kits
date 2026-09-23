# Distributions du starter kit

Le dépôt propose deux modes d’installation. Le noyau des règles reste commun, mais la présence du kit dans le dépôt projet dépend du mode choisi.

## Mode natif

Le mode `native` installe le point d’entrée et le dossier d’orchestration dans le projet. Il fournit l’expérience la plus directe avec Codex ou Claude et permet les mises à jour par Pull Request du socle universel.

## Mode externe

Le mode `external` installe le kit hors du dépôt projet et utilise `.workspace.toml` comme manifeste minimal. Le projet ne publie pas le contenu de `.codex/`, `.claude/`, `AGENTS.md` ou `CLAUDE.md`. Le kit est chargé localement par le lanceur correspondant.

Les deux modes utilisent le même noyau de gouvernance, de sécurité, de validation et de versionnement. Ils ne doivent pas être installés simultanément dans un même projet.


Dans le mode `external`, le synchroniseur local vérifie la dernière version au démarrage de l agent, crée une sauvegarde et met à jour uniquement le moteur du kit. Le cahier des charges et l état du projet restent protégés.
