# Versionnement du dépôt

## Convention

Le dépôt suit Semantic Versioning : `MAJOR.MINOR.PATCH`.

- `MAJOR` augmente lors d’une rupture de compatibilité ou d’une refonte qui invalide un contrat existant.
- `MINOR` augmente lors d’un ajout compatible.
- `PATCH` augmente uniquement lors d’un correctif compatible du kit qui modifie un comportement consommé par les projets utilisateurs.

La version courante est dans `VERSION`. Elle est toujours accompagnée d’une entrée dans `CHANGELOG.md` et d’un tag Git annoté `vX.Y.Z` sur `main`.

## Cycle d’un changement

1. Créer une branche dédiée depuis `develop`.
2. Déclarer dans la Pull Request l’impact produit : `major`, `minor`, `patch` ou `aucune`. Utiliser `aucune` lorsque le changement ne modifie pas ce que reçoit ou exécute un projet importateur.
3. Utiliser un commit conventionnel : `feat`, `fix`, `docs`, `test`, `refactor`, `perf`, `security` ou `chore`.
4. Ajouter une entrée dans `CHANGELOG.md`, section `Non publié`, pour tout changement important. Indiquer séparément les changements internes qui ne sont pas destinés à provoquer une release.
5. Fusionner la feature dans `develop` par Pull Request validée.
6. Pour une release, choisir le niveau SemVer, déplacer les entrées vers une section datée, mettre à jour `VERSION`, les versions `kit_version`, le README et les notes de Pull Request, puis ouvrir une Pull Request `develop` vers `main` avec la version dans son titre.
7. Après fusion dans `main`, créer un tag annoté correspondant exactement à `VERSION` et publier les notes de release.

## Contrat de Pull Request

Toute Pull Request doit indiquer sa version cible ou `aucune` dans son titre ou sa description. Une Pull Request qui modifie le comportement importé, les agents, les Skills, les politiques exécutées, la sécurité fournie ou un contrat public doit avoir une entrée dans `CHANGELOG.md`. Une modification purement interne peut utiliser `aucune`. Une release doit présenter la même version dans `VERSION`, `README.md`, les manifestes `KIT.toml`, le changelog, le titre de Pull Request et le tag Git.

Le Coordinateur refuse une livraison si ces références sont incohérentes. Il ne demande pas une version différente pour chaque commit d’une même fonctionnalité, mais chaque fonctionnalité doit être rattachée à une release identifiable.

## Règles d intégrité

Un tag de release ne doit jamais être déplacé. Une version publiée ne doit jamais être réutilisée. Toute correction postérieure qui affecte le kit importé augmente la version PATCH. Une correction interne est rattachée à la prochaine release fonctionnelle et ne crée pas de version artificielle. Une modification fonctionnelle non versionnée dans `main` est une anomalie de processus.

La version de chaque kit importable dans `KIT.toml` doit être identique à la version racine dans `VERSION`. Le README principal doit afficher cette version. Toute promotion vers `main` doit contenir ces références, une entrée datée du changelog et un tag Git correspondant.

Les commits individuels ne reçoivent pas tous un tag : le commit conserve la nature du changement et la release fournit le jalon consommable. Le lien’est assuré par le changelog et la Pull Request.
