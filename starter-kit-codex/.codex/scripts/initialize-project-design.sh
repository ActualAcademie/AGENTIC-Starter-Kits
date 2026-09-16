#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
root="$(git -C "$config/.." rev-parse --show-toplevel 2>/dev/null || (cd "$config/.." && pwd))"
docs="$root/docs"

write_if_missing() {
  local path="$1"
  [ -e "$path" ] && return 0
  mkdir -p "$(dirname "$path")"
  cat > "$path"
}

write_if_missing "$docs/README.md" <<'DOC'
# Dossier de conception du projet

## Statut

[[A_COMPLETER: indiquer `draft`, `review`, `approved` ou `updated`, avec date et responsable.]]

## Rôle

Ce dossier est la source de vérité entre le besoin métier, la conception et le code. Il doit permettre à un développeur, un testeur, un auditeur ou un nouveau membre de comprendre le projet sans déduire des règles implicites.

## Règles de qualité

- Toute affirmation distingue fait vérifié, hypothèse, décision et élément à valider.
- Toute user story possède des critères testables et une priorité.
- Toute interface, donnée sensible, permission, dépendance externe et erreur significative est documentée.
- Chaque diagramme est en Mermaid ou possède une source éditable versionnée.
- Toute évolution modifie, dans le même work item, le code, les tests et les documents touchés.
- Un document non applicable indique `Non applicable` avec une justification contextualisée.

## Index et traçabilité

| Artefact | Finalité | Référence de code ou test | Dernière mise à jour |
| --- | --- | --- | --- |
| Vision et périmètre | besoin, acteurs, limites | [[A_COMPLETER]] | [[A_COMPLETER]] |
| User stories | comportements attendus | [[A_COMPLETER]] | [[A_COMPLETER]] |
| Parcours | étapes et erreurs utilisateur | [[A_COMPLETER]] | [[A_COMPLETER]] |
| Architecture | composants et flux | [[A_COMPLETER]] | [[A_COMPLETER]] |
| Données | entités, règles, rétention | [[A_COMPLETER]] | [[A_COMPLETER]] |
| Contrats | API, événements, interfaces | [[A_COMPLETER]] | [[A_COMPLETER]] |
| Sécurité | menaces et protections | [[A_COMPLETER]] | [[A_COMPLETER]] |
| Roadmap et décisions | plan et arbitrages | [[A_COMPLETER]] | [[A_COMPLETER]] |
DOC

write_if_missing "$docs/product/vision-and-scope.md" <<'DOC'
# Vision, objectifs et périmètre

## Contexte et problème

[[A_COMPLETER: décrire le problème observé, ses conséquences, la situation actuelle et la valeur recherchée.]]

## Parties prenantes et utilisateurs

| Acteur | Besoin | Fréquence | Niveau d accès | Attente de réussite |
| --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Objectifs mesurables

| Objectif | Indicateur | Valeur cible | Méthode de mesure | Horizon |
| --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Périmètre de la première version

[[A_COMPLETER: lister les capacités incluses, leurs limites et les dépendances nécessaires.]]

## Hors périmètre et hypothèses

[[A_COMPLETER: lister explicitement ce qui ne sera pas réalisé et les hypothèses à confirmer.]]

## Contraintes et critères de réussite

[[A_COMPLETER: budget, délai, plateformes, accessibilité, performance, conformité, intégrations et définition de terminé.]]
DOC

write_if_missing "$docs/product/user-stories.md" <<'DOC'
# User stories, règles métier et critères d acceptation

## Convention

Chaque story suit la forme : En tant que `<acteur>`, je veux `<action>`, afin de `<valeur>`. Les critères couvrent le succès, les validations, les erreurs, les permissions et les cas limites.

## Backlog priorisé

| ID | Priorité | User story | Règles métier | Critères d acceptation vérifiables | Tests ou preuve | Statut |
| --- | --- | --- | --- | --- | --- | --- |
| US-001 | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Scénarios d erreur et cas limites

| Référence | Situation | Comportement attendu | Message ou retour | Test associé |
| --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Exigences non fonctionnelles liées

[[A_COMPLETER: accessibilité, performance, sécurité, confidentialité, compatibilité et disponibilité liées aux stories.]]
DOC

write_if_missing "$docs/product/user-flows.md" <<'DOC'
# Parcours utilisateur

## Inventaire des parcours

| ID | Déclencheur | Acteur | Résultat attendu | Échecs et reprises | Stories liées |
| --- | --- | --- | --- | --- | --- |
| FLOW-001 | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Diagramme des parcours critiques

```mermaid
flowchart TD
    A[Arrivée utilisateur] --> B{Condition à documenter}
    B -->|Succès| C[Résultat attendu]
    B -->|Erreur| D[Message, reprise ou support]
```

[[A_COMPLETER: remplacer le diagramme générique par les parcours réels ou indiquer Non applicable avec justification.]]

## Détails par parcours

### FLOW-001

- Préconditions : [[A_COMPLETER]]
- Étapes nominales : [[A_COMPLETER]]
- Validations et erreurs : [[A_COMPLETER]]
- Annulation, reprise et persistance : [[A_COMPLETER]]
- Critères de sortie : [[A_COMPLETER]]
DOC

write_if_missing "$docs/design/architecture.md" <<'DOC'
# Architecture technique

## Décisions et contraintes structurantes

[[A_COMPLETER: technologies retenues, motifs, alternatives écartées, contraintes existantes et conséquences.]]

## Composants et responsabilités

| Composant | Responsabilité | Entrées | Sorties | Dépendances | Observabilité |
| --- | --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Diagramme de contexte et conteneurs

```mermaid
flowchart LR
    U[Utilisateur ou système externe] --> A[Application]
    A --> D[(Données)]
    A --> X[Système externe]
```

[[A_COMPLETER: remplacer par le diagramme réel, nommer les flux et les responsabilités.]]

## Flux critiques et résilience

[[A_COMPLETER: décrire synchronisme, asynchronisme, timeouts, retries, idempotence, dégradations, journalisation et alertes.]]

## Qualité technique

[[A_COMPLETER: sécurité, performance, scalabilité, disponibilité, accessibilité, dette technique et stratégie de tests.]]
DOC

write_if_missing "$docs/design/data-model.md" <<'DOC'
# Modèle de données

## Classification et cycle de vie

| Donnée ou entité | Sensibilité | Source | Usage | Rétention | Suppression | Responsable |
| --- | --- | --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Entités, attributs et règles

| Entité | Attributs clés | Identifiant | Relations | Contraintes et invariants |
| --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Diagramme de données

```mermaid
erDiagram
    ENTITY_A ||--o{ ENTITY_B : relation
```

[[A_COMPLETER: remplacer par les entités réelles ou indiquer Non applicable avec justification.]]

## Migrations, intégrité et sauvegarde

[[A_COMPLETER: décrire stratégie de migration, validation, rollback, sauvegarde et restauration.]]
DOC

write_if_missing "$docs/design/api-contracts.md" <<'DOC'
# Contrats d interfaces

## Conventions communes

[[A_COMPLETER: versionnement, authentification, encodage, pagination, erreurs, idempotence, limites et compatibilité.]]

## API, événements et interfaces partagées

| ID | Consommateur | Opération ou événement | Entrée validée | Sortie ou erreur | Autorisation | Tests |
| --- | --- | --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Exemple de contrat critique

```json
{
  "[[A_COMPLETER: champ]]": "[[A_COMPLETER: valeur ou type]]"
}
```

## Compatibilité et dépréciation

[[A_COMPLETER: clients affectés, stratégie de version, période de compatibilité, migration et retrait.]]
DOC

write_if_missing "$docs/design/security-design.md" <<'DOC'
# Conception de sécurité

## Périmètre et actifs à protéger

| Actif | Propriétaire | Sensibilité | Menace principale | Protection | Preuve |
| --- | --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Authentification, autorisation et secrets

[[A_COMPLETER: identité, sessions ou tokens, rôles, permissions, moindre privilège, rotation et stockage hors dépôt.]]

## Analyse de menaces

| Menace | Vecteur | Impact | Probabilité | Mesure préventive | Détection | Risque résiduel |
| --- | --- | --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Exigences de sécurité vérifiables

[[A_COMPLETER: validation des entrées, protections réseau, journalisation, dépendances, chiffrement, sauvegardes et tests sécurité.]]
DOC

write_if_missing "$docs/delivery/roadmap.md" <<'DOC'
# Roadmap et plan de livraison

## Incréments

| Incrément | Objectif | Stories incluses | Dépendances | Risques | Critères de sortie | État |
| --- | --- | --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |

## Plan de validation et retour

[[A_COMPLETER: environnements, tests, approbations, déploiement, monitoring, rollback et communication.]]

## Écarts de périmètre

[[A_COMPLETER: décisions de report, dette assumée et raison.]]
DOC

write_if_missing "$docs/delivery/decision-log.md" <<'DOC'
# Journal des décisions

| ID | Date | Décision | Contexte et options | Conséquence | Propriétaire | Révision |
| --- | --- | --- | --- | --- | --- | --- |
| ADR-001 | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |
DOC

write_if_missing "$docs/diagrams/README.md" <<'DOC'
# Diagrammes

Conserver ici les sources Mermaid ou éditables. Chaque diagramme est référencé depuis un document de conception, possède un objectif, une date, un propriétaire et une légende. Ne jamais déposer seulement une image sans source modifiable.

| Fichier | Type | Objectif | Document référent | Statut |
| --- | --- | --- | --- | --- |
| [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] | [[A_COMPLETER]] |
DOC

echo "Documentation de conception initialisée dans $docs. Remplacer tous les marqueurs [[A_COMPLETER]] par une conception issue du cahier des charges avant le preflight."
