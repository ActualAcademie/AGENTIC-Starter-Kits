# Frontière entre noyau et données projet

## Noyau immuable du kit

Les fichiers de règles, Skills, agents, modèles, prompts, scripts, politiques et modèles de documents sont génériques. Ils ne doivent contenir ni nom de client, ni technologie réelle, ni secret, ni décision propre au projet cible.

## Données créées ou complétées pour un projet

| Fichier ou dossier | Auteur | But |
|---|---|---|
| `PROJECT-BRIEF.md` | Coordinateur après réception du cahier | besoin métier et périmètre |
| `project-profile.toml` | project-onboarding | technologies, commandes et conventions détectées |
| `project-inventory.md` | init-project | état initial factuel du dépôt |
| `work-items/` | Coordinateur | demandes, preuves et état d'avancement |
| `decisions/` | Concepteur ou Coordinateur | décisions propres au projet |
| `reports/` | Auditeur ou Coordinateur | livraisons et audits |
| `evaluations/evaluation.csv` | Coordinateur | mesures réelles de coût et qualité |

## Règle de modification

Une donnée projet peut évoluer à la suite d'une preuve ou d'une décision. Le noyau ne change que pour améliorer le kit, après évaluation sur des cas comparables. Ne jamais adapter silencieusement le noyau à un seul projet.

## Portabilité

Pour exporter une nouvelle version du kit, copier uniquement `AGENTS.md` et `.claude/` sans les données projet listées ci-dessus. Le projet cible repart alors avec des modèles vierges, sans fuite de contexte ni de données.
