# Adaptateurs

Le kit fonctionne sans service externe. Les intégrations sont activées seulement après détection et confirmation dans `project-profile.toml`. Le work item local reste la preuve minimale quand un adaptateur est indisponible.

| Mode | Source de suivi | Utilisation | Écriture autorisée après |
|---|---|---|---|
| local | `.codex/work-items/` | défaut universel | aucune dépendance externe |
| github | issues, Pull Requests et CI | livraison Git | lecture de l'objet ciblé |
| trello | carte, checklist et état | organisation visuelle | lecture de carte et checklist |
| autre | contrat documenté par le projet | intégration spécifique | validation du contrat |

## Règles

Lire l'objet externe avant écriture. Renvoyer l'identifiant, URL, résultat et limite dans le work item. Ne jamais enregistrer un token, mot de passe ou identifiant secret dans le dépôt.

## Dégradation contrôlée

Si l'adaptateur échoue, conserver le travail et les preuves dans le work item local. Ne pas simuler une mise à jour externe ou une CI verte sans résultat observable.
