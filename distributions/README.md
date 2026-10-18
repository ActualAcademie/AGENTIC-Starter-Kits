# Distribution du starter kit

Depuis la version 1.16.52, une seule distribution est supportée : `shared`. Les pages `native` et `external` sont conservées comme historique de migration et ne doivent plus être utilisées pour une nouvelle installation.

Le dépôt propose deux modes d’installation. Le noyau des règles reste commun, mais la présence du kit dans le dépôt projet dépend du mode choisi.

## Choisir le bon mode

| Mode | Fichiers du kit dans Git | Mise à jour | Recommandation |
| --- | --- | --- | --- |
| Native | Oui, selon les règles du dépôt. | Pull Request du socle universel. | Utilisateur qui veut inspecter le kit dans son projet. |
| External | Non, seuls le manifeste et le workflow sont suivis. | Pull Request du manifeste, puis synchronisation locale. | Utilisateur qui ne veut aucune trace du kit dans le dépôt distant. |

Les deux modes utilisent le même noyau de gouvernance, de sécurité, de validation, de versionnement et d’initialisation. Ils ne doivent pas être installés simultanément dans un même projet.

## Mode shared

Le mode `shared` installe une copie versionnée du kit dans `AGENTIC_KIT_HOME` et crée dans chaque projet les liens symboliques vers cette copie. Les données locales du projet restent séparées et les mises à jour sont centralisées.

Commande recommandée :

```bash
./install.sh --kit codex --mode shared --target /chemin/vers/projet
```

## Anciens modes

Les anciens modes `native` et `external` ne sont plus acceptés par l’installateur. Les projets existants doivent être migrés en mode `shared`.


Au démarrage d’une session, le synchroniseur compare la version locale et la version distante, crée une sauvegarde, puis met à jour uniquement le moteur du kit. Le cahier des charges, le profil technique, l’état du projet, les décisions, les work items et les journaux sont conservés.

## Règle de livraison

Les Pull Requests automatiques ciblent `dev` ou `develop`. La branche `main` ne doit être modifiée qu’après une promotion humaine ou une autorisation explicite.
