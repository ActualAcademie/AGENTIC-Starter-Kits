# Politique de sécurité

## Objectif

Ce dépôt fournit une gouvernance et des contrôles pour aider un agent IA à travailler de manière traçable. Il ne prétend pas rendre automatiquement un projet sûr. La sécurité dépend aussi du code produit, des dépendances, de l’infrastructure, des secrets, des réglages de déploiement et des décisions humaines.

## Ce que le kit protège

Les deux variantes appliquent les mêmes principes :

- Les secrets ne sont jamais demandés dans le cahier des charges, enregistrés dans Git, ajoutés aux issues, écrits dans les Pull Requests ou affichés dans les journaux.
- Les dossiers de gouvernance peuvent être ignorés selon le profil du projet lorsque leur contenu contient des informations internes.
- Les agents distinguent une preuve vérifiée, une hypothèse, une inconnue et un risque résiduel.
- L’agent Cybersécurité analyse les actifs, menaces, permissions, entrées, sessions, dépendances, données sensibles et contrôles réseau.
- L’Auditeur vérifie les changements avec un regard indépendant et peut refuser une livraison.
- Les contrôles de lint, tests, dépendances, secrets, scripts et sécurité doivent passer avant un push ou une fusion.
- Les actions irréversibles, les accès externes et les décisions métier sensibles restent soumis à une validation humaine.

## Données et confidentialité

Le kit ne transmet pas automatiquement le code vers un service externe. Les données envoyées à l’agent dépendent de l’outil utilisé, de sa configuration et des fichiers ouverts dans la conversation. Avant toute utilisation :

1. Retirez les mots de passe, tokens, clés privées, données de santé, données clients et informations non nécessaires.
2. Utilisez des exemples anonymisés dans le cahier des charges et les tests.
3. Vérifiez les règles de conservation et de partage de votre fournisseur d’IA.
4. N’ajoutez jamais de secret dans `project-profile.toml`, les documents de conception ou les journaux.
5. Faites valider le traitement des données par le responsable autorisé de votre organisation.

## Gestion des secrets

Utilisez les secrets du gestionnaire de votre plateforme CI ou de votre environnement de déploiement. Ajoutez les fichiers locaux sensibles au `.gitignore`. Si un secret apparaît dans un commit, un log ou une Pull Request, considérez-le comme compromis : révoquez-le, remplacez-le, recherchez son exposition dans l’historique et documentez l’incident.

## Contrôles intégrés

Le kit fournit une base de politiques de sécurité, un preflight, un contrôle avant push, un journal qualité partagé, une matrice de risques, des points de contrôle et une intégration CI. Ces contrôles sont des garde-fous. Ils ne remplacent pas un test d’intrusion, une revue juridique, une analyse de production, une configuration IAM correcte ou une validation indépendante.

## Signalement responsable

Ne publiez jamais de secret, exploit fonctionnel ou donnée sensible dans une issue publique. Ouvrez un signalement privé auprès du mainteneur du dépôt et indiquez :

- La version concernée.
- Le composant et l’environnement concernés.
- Les étapes reproductibles.
- L’impact et le niveau de risque estimé.
- Une preuve minimale sans donnée sensible.
- Une proposition de correction si elle est connue.

Le signalement est qualifié, priorisé, corrigé et validé avec une preuve observable. Une vulnérabilité critique bloque la livraison jusqu’à sa correction ou l’acceptation explicite du risque par une personne autorisée.

## Limites et responsabilité

Le kit ne garantit pas la sécurité de production, ne crée pas de secret, ne remplace pas une équipe de sécurité et ne peut pas confirmer une licence ou une conformité sans source vérifiable. Chaque projet doit adapter sa politique à son secteur, ses données, son infrastructure et ses obligations réglementaires.

## Avant la première mise en production

- Vérifier les dépendances et leurs vulnérabilités.
- Vérifier les secrets, permissions, cookies, CORS, CSRF, sessions et journaux.
- Exécuter les tests et contrôles dans un environnement représentatif.
- Réaliser une revue de sécurité indépendante.
- Documenter les risques acceptés, leur responsable et leur date de réévaluation.
- Préparer une procédure de sauvegarde, de rotation des secrets et de réponse à incident.
