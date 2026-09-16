# Politique de modèles Claude

`.claude/models.toml` est la source de vérité de sélection des modèles. Le Coordinateur résout un profil de modèle avant chaque délégation avec `resolve-agent-model.sh`.

## Principes

- `opus` traite orchestration, conception, risques critiques et décisions complexes.
- `sonnet` traite implémentation, tests, revue et sécurité courante avec un bon équilibre qualité et coût.
- Les tâches faibles restent sur `sonnet` avec effort `low`, sauf si un modèle plus économique est explicitement disponible et validé dans l'environnement Claude utilisé.
- L'effort monte avec le risque : `low`, `medium`, puis `high`. Claude adapte aussi sa profondeur de raisonnement à la complexité.
- Opus n'est pas utilisé pour une tâche simple lorsque Sonnet suffit.
- Le fallback est utilisé seulement si le modèle primaire n'est pas disponible dans l'environnement Claude configuré.

## Choix par rôle

| Rôle | Profil normal | Risque élevé | Risque critique |
|---|---|---|---|
| Coordinateur | Opus high | Sonnet high | Opus high |
| Concepteur | Opus high | Sonnet high | Opus high |
| Frontend | Sonnet medium | Sonnet high | Opus high |
| Backend | Sonnet medium | Sonnet high | Opus high |
| Cybersécurité | Sonnet high | Sonnet high | Opus high |
| Auditeur | Sonnet high | Sonnet high | Opus high |

Sonnet low est réservé aux tâches sans effet direct sur le produit ou la sécurité.

Toute modification de `models.toml` nécessite une évaluation avant et après, conformément à `COST-AND-EVALUATION.md`.
