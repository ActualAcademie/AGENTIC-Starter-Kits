# Politique de recherche actualisée

## Objectif

Les agents vérifient sur Internet les informations susceptibles d'être obsolètes, réglementées, sensibles ou dépendantes d'une version. Cette recherche est obligatoire lorsque la réponse doit être exacte à la date d'exécution.

## Déclencheurs obligatoires

Une recherche externe est obligatoire pour :

- Les lois, normes, réglementations, obligations contractuelles et exigences de conformité.
- La cybersécurité, les vulnérabilités, les avis éditeurs, les versions corrigées et les bonnes pratiques actuelles.
- Les modèles, API, bibliothèques, frameworks, SDK, systèmes d'exploitation, outils CI/CD et commandes susceptibles d'avoir changé.
- Les tarifs, quotas, limites, licences, conditions d'utilisation, compatibilités et calendriers de support.
- Les recommandations d'architecture ou de technologie qui engagent du temps, de l'argent ou une dette durable.
- Les services externes, intégrations, formats, protocoles et comportements de plateformes.
- Toute affirmation dont la date de validité ne peut pas être garantie par le dépôt local.

La recherche n'est pas nécessaire pour une transformation purement locale, une lecture de code fournie par le projet ou une décision déjà documentée par une source officielle encore valide. En cas de doute, rechercher.

## Méthode et traçabilité

1. Formuler la question exacte et préciser la date de vérification.
2. Consulter en priorité la source primaire : documentation officielle, avis de sécurité éditeur, texte réglementaire, spécification ou dépôt officiel.
3. Recouper avec une source secondaire si nécessaire et vérifier version, date, périmètre et conditions.
4. Signaler les contradictions et ne jamais confondre une source externe avec une preuve d'exécution locale.
5. Inscrire dans le work item et le rapport l'URL complète, le titre, l'organisme, la date, la version ou date de validité, le fait retenu, la décision influencée et les limites.

## Routage par agent

- Coordinateur : choix externes, temporels, budgétaires ou de périmètre.
- Concepteur : architecture, standards et compatibilités.
- Backend et Frontend : API, frameworks, bibliothèques, versions et breaking changes.
- Cybersécurité : CVE, avis éditeurs, durcissement et versions corrigées.
- DevOps : images, runners, actions CI, outils de déploiement et versions supportées.
- Conformité : textes légaux, normes, licences, conservation et confidentialité.
- Performance : benchmarks, limites et recommandations de mesure.
- Documentation : liens, versions, commandes et références.

Le Coordinateur regroupe les recherches pour limiter le coût, réutilise les résultats encore valides et ne transmet jamais de secret ou de donnée personnelle non anonymisée à un service externe. La recherche ne remplace ni les tests ni les audits locaux.

## Format minimal dans un rapport

```text
Recherche externe: oui | non
Question: ...
Sources: URL, organisme, version ou date
Consultées le: AAAA-MM-JJ
Fait retenu: ...
Décision influencée: ...
Limites: ...
```
