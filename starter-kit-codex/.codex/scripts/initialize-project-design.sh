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
# Documentation de conception

Ce dossier est la source de vérité du produit. Le Coordinateur crée et maintient le plan, le Concepteur maintient les contrats et l'architecture, les agents Frontend et Backend maintiennent les parcours et interfaces concernés, l'agent Cybersécurité maintient la conception de sécurité et l'Auditeur contrôle les écarts code documentation.

Un document non applicable doit le dire explicitement et justifier pourquoi. Toute modification qui change le produit, les données, les interfaces, les permissions, le déploiement ou le périmètre met à jour les documents concernés dans le même work item.
DOC
write_if_missing "$docs/product/vision-and-scope.md" <<'DOC'
# Vision et périmètre

## Problème

À compléter après acceptation du cahier des charges.

## Utilisateurs et résultats attendus

À compléter après acceptation du cahier des charges.

## Périmètre et hors périmètre

À compléter après acceptation du cahier des charges.
DOC
write_if_missing "$docs/product/user-stories.md" <<'DOC'
# User stories et critères d'acceptation

Chaque story utilise le format : En tant que, je veux, afin de. Les critères sont testables et reliés aux tests ou à une preuve observable.

## Stories priorisées

À compléter après acceptation du cahier des charges.
DOC
write_if_missing "$docs/product/user-flows.md" <<'DOC'
# Parcours utilisateur

Décrire les chemins nominal, erreur, annulation et reprise. Ajouter un diagramme Mermaid lorsque le parcours comporte plusieurs décisions.

## Parcours

À compléter après acceptation du cahier des charges.
DOC
write_if_missing "$docs/design/architecture.md" <<'DOC'
# Architecture

Décrire composants, responsabilités, frontières, dépendances externes, flux principaux, contraintes et observabilité. Ajouter un diagramme Mermaid ou justifier son absence.

## Architecture cible

À compléter après acceptation du cahier des charges.
DOC
write_if_missing "$docs/design/data-model.md" <<'DOC'
# Modèle de données

Décrire entités, relations, propriétés sensibles, rétention, migrations et intégrité. Indiquer Non applicable avec justification si le projet ne stocke aucune donnée.

## Modèle

À compléter après acceptation du cahier des charges.
DOC
write_if_missing "$docs/design/api-contracts.md" <<'DOC'
# Contrats d interface

Décrire API, événements, interfaces utilisateur partagées, authentification, erreurs, versions et compatibilité. Indiquer Non applicable avec justification si nécessaire.

## Contrats

À compléter après acceptation du cahier des charges.
DOC
write_if_missing "$docs/design/security-design.md" <<'DOC'
# Conception de sécurité

Décrire actifs, acteurs, authentification, autorisation, secrets, menaces, mesures et risques résiduels. Les secrets ne sont jamais inscrits ici.

## Analyse

À compléter après acceptation du cahier des charges.
DOC
write_if_missing "$docs/delivery/roadmap.md" <<'DOC'
# Roadmap

Découper en incréments livrables avec dépendances, critères de sortie et risques. Mettre à jour la roadmap à chaque changement de périmètre.

## Incréments

À compléter après acceptation du cahier des charges.
DOC
write_if_missing "$docs/delivery/decision-log.md" <<'DOC'
# Journal des décisions

| Date | Décision | Contexte | Conséquence | Propriétaire |
| --- | --- | --- | --- | --- |
DOC
write_if_missing "$docs/diagrams/README.md" <<'DOC'
# Diagrammes

Conserver ici les diagrammes Mermaid ou les sources éditables. Chaque diagramme indique son objectif, sa date de mise à jour et le document qui le référence.
DOC

echo "Documentation de conception initialisée dans $docs"
