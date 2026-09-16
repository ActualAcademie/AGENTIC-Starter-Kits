# Socle cybersécurité

## Portée permanente

Le socle cybersécurité s'applique à tout projet importateur, indépendamment de sa stack. Il complète les contrôles propres aux technologies détectées et ne les remplace pas.

## Contrôles minimums

- Aucun secret, fichier d'environnement réel ou clé privée ne doit être versionné.
- Les fichiers `.env` versionnés sont refusés, sauf fichiers de modèle explicitement nommés `.env.example`, `.env.sample` ou `.env.template`.
- Toute capacité d'authentification exige une méthode déclarée dans `stack.security.authentication` et une méthode d'autorisation déclarée dans `stack.security.authorization`.
- Une commande de contrôle automatisé peut être déclarée dans `commands.security`. Son absence est explicitement signalée, jamais dissimulée.
- Les tâches à risque élevé ou critique exigent le Skill `security-audit`, un rapport de risque et la décision humaine prévue par la matrice.

## Ce que le socle ne prétend pas faire

Il ne remplace ni une analyse de code propre au langage, ni un scan de dépendances, ni un test d'intrusion, ni une revue humaine. Ces contrôles sont ajoutés dans `commands.security` après onboarding selon la stack réelle.

## Preuve attendue

La livraison joint le résultat de `security-baseline.sh`, les contrôles spécifiques exécutés, les risques résiduels et toute exception acceptée.
