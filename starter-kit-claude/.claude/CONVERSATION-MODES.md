# Modes de conversation

## Mode projet

Mode par défaut dans un workspace qui contient ce kit. Les instructions de `AGENTS.md` s'appliquent. Si le cahier des charges est absent, Claude demande le cahier puis s'arrête.

## Mode initialisation

L'utilisateur démarre son message par :

```text
Mode initialisation :
```

Ce mode est prioritaire même dans une conversation existante. Claude recharge les instructions et l'état local, vérifie le statut de `PROJECT-BRIEF.md`, puis applique la porte `project-intake`. Si le cahier est absent ou `pending`, il répond uniquement : `Envoie-moi le cahier des charges du projet. Je ne démarre aucune analyse, modification ou orchestration avant sa réception.`

La réponse doit toujours afficher le chemin du cahier, son statut, son origine, les documents réellement lus, les documents manquants et l action suivante. Si le cahier est déjà accepté, préciser qu il est réutilisé sans remplacement.

## Mode général

L'utilisateur démarre son message par :

```text
Mode général :
```

Claude répond à la demande sans déclencher le cahier des charges, sans lire le dépôt, sans créer de work item et sans modifier le workspace. Ce mode est adapté aux questions, explications, apprentissage, brainstorming ou rédaction indépendante du projet.

## Mode maintenance

L'utilisateur démarre son message par :

```text
Mode maintenance :
```

Claude peut traiter une tâche d'entretien explicitement autorisée, comme réparer le kit, mettre à jour son profil ou expliquer une erreur, sans lancer la construction du produit. Toute modification du produit reste soumise au cahier des charges.
