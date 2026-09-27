# Politique zéro dépense

Le kit fonctionne en mode gratuit par défaut.

- Ne jamais activer, acheter, essayer ou configurer un service payant, une API facturée, un runner supérieur, une extension payante, un quota supplémentaire ou un moyen de paiement sans accord explicite de l'utilisateur.
- Utiliser en priorité les outils locaux, open source, gratuits et les runners GitHub Actions standards inclus dans le quota applicable.
- Les workflows générés utilisent uniquement `ubuntu-latest` et ne configurent aucun budget, paiement ou dépense automatique.
- Si un quota gratuit est épuisé ou si une CI est bloquée par la facturation, arrêter l'action externe, expliquer le blocage et proposer une validation locale gratuite. Ne jamais contourner le blocage en activant la facturation.
- Pour les contrôles nécessitant GitHub Actions, utiliser en priorité un runner auto-hébergé avec un label explicite du projet. GitHub indique que les runners auto-hébergés sont gratuits avec Actions, mais le propriétaire reste responsable du coût, de la maintenance, des mises à jour et de la sécurité de la machine. Ne jamais créer une ressource cloud payante pour remplacer ce runner sans accord explicite.
- Toute dépense éventuelle nécessite une décision humaine explicite et documentée avant l'action.
- Si un outil gratuit nécessaire aux tests ou validations est absent, l'agent peut l'installer provisoirement dans l'environnement de travail, exécuter les contrôles, journaliser la version et le résultat, puis supprimer l'installation temporaire si elle n'est pas requise par le projet. Ne pas modifier durablement les dépendances du projet sans justification et validation du périmètre.
