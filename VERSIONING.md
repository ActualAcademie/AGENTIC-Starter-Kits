# Versionnement du dépôt

## Convention

Le dépôt suit Semantic Versioning : `MAJOR.MINOR.PATCH`.

- `MAJOR` augmente lors d une rupture de compatibilité ou d une refonte qui invalide un contrat existant.
- `MINOR` augmente lors d un ajout compatible.
- `PATCH` augmente lors d un correctif compatible, d une amélioration interne ou d une correction documentaire sans rupture.

La version courante est dans `VERSION`. Elle est toujours accompagnée d une entrée dans `CHANGELOG.md` et d un tag Git annoté `vX.Y.Z` sur `main`.

## Cycle d un changement

1. Créer une branche dédiée depuis `develop`.
2. Utiliser un commit conventionnel : `feat`, `fix`, `docs`, `test`, `refactor`, `perf`, `security` ou `chore`.
3. Ajouter une entrée dans `CHANGELOG.md`, section `Non publié`, pour tout changement visible, correctif, faille, comportement ou contrat modifié.
4. Fusionner la feature dans `develop` par Pull Request validée.
5. Pour une release, choisir le niveau SemVer, déplacer les entrées vers une section datée, mettre à jour `VERSION`, puis ouvrir une Pull Request `develop` vers `main`.
6. Après fusion dans `main`, créer un tag annoté correspondant exactement à `VERSION` et publier les notes de release.

## Règles d intégrité

Un tag de release ne doit jamais être déplacé. Une version publiée ne doit jamais être réutilisée. Toute correction postérieure augmente la version PATCH. Une modification non versionnée dans `main` est une anomalie de processus et doit être corrigée par une release PATCH.

Les commits individuels ne reçoivent pas tous un tag : le commit conserve la nature du changement et la release fournit le jalon consommable. Le lien est assuré par le changelog et la Pull Request.
