# Distribution du starter kit

Le dépôt propose une seule distribution supportée : `shared`. Elle centralise le kit dans `AGENTIC_KIT_HOME` et expose des liens vers chaque projet.

## Mode shared

Le mode `shared` installe une copie versionnée du kit dans `AGENTIC_KIT_HOME` et crée dans chaque projet les liens symboliques vers cette copie. Les données locales du projet restent séparées et les mises à jour sont centralisées.

Commande recommandée :

```bash
./install.sh --kit codex --mode shared --target /chemin/vers/projet
```

Au démarrage d’une session, le synchroniseur compare la version locale et la version distante, crée une sauvegarde, puis met à jour uniquement le moteur du kit. Le cahier des charges, le profil technique, l’état du projet, les décisions, les work items et les journaux sont conservés.

## Règle de livraison

Les Pull Requests automatiques ciblent `dev` ou `develop`. La branche `main` ne doit être modifiée qu’après une promotion humaine ou une autorisation explicite.
