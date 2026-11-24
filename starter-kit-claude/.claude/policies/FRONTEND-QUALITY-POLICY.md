# Politique frontend premium et maintenable

Cette politique s'applique à toute création, correction ou refonte d'interface.

## Responsabilité

L'agent `frontend` est responsable de l'implémentation visuelle et de l'architecture frontend. Le Coordinateur ne remplace pas cet agent. QA et l'Auditeur interviennent dans la passe finale prévue, pas à chaque modification.

## Refonte sur base propre

Quand la demande contient refonte, redesign, nouvelle direction artistique ou reconstruction, l'agent doit commencer par une composition indépendante. Il ne modifie pas aveuglément l'ancien arbre de composants.

Avant le code, il produit une carte de composition avec les pages, layouts, composants, hooks, données, tokens et responsabilités. L'ancien code sert de référence fonctionnelle et de source de migration, mais n'est pas la structure cible.

La nouvelle composition doit être implémentée dans une frontière claire et vérifiable. L'ancien arbre reste intact tant que la parité fonctionnelle n'est pas démontrée, puis les fichiers devenus inutiles sont supprimés avec une preuve de recherche des références. Aucune suppression destructive n'est faite sans preuve.

## Architecture obligatoire

Séparer autant que le périmètre le justifie les layouts, pages ou containers, composants de présentation, primitives de design system, hooks, types, données et styles. Chaque module doit avoir une responsabilité lisible et une API de props explicite.

Éviter les composants monolithiques, les fichiers qui mélangent rendu, état, accès aux données et styles, les duplications de markup, les styles ad hoc et les constantes dispersées. Un fichier dépassant environ 250 lignes ou contenant plusieurs domaines d'état doit être justifié ou découpé avant livraison.

Avant d'ajouter un composant, rechercher les composants et tokens réutilisables. Toute duplication conservée doit être justifiée dans le work item. Les variantes doivent être exprimées par des props ou des tokens cohérents, pas par des copies presque identiques.

## Qualité premium

Le résultat doit avoir une hiérarchie, une composition et une personnalité visuelle réellement perceptibles. Un simple changement de couleur, de marge ou de texte dans l'ancien écran ne constitue pas une refonte complète. La direction artistique, les références, les anti-références, les tokens, les états et les médias sont documentés avant l'implémentation.

Les états loading, vide, erreur, succès, focus, désactivé et tactile sont conçus avec les mêmes composants. Les images, icônes et animations respectent la marque, l'accessibilité, la provenance et les performances.

## Cadence efficace

En mode `quick-fix`, exécuter seulement les contrôles directement concernés. En mode `feature`, terminer le lot cohérent d'implémentation avant de lancer la revue responsive, navigateur, accessibilité ou animation exhaustive. Ces audits sont réservés à la fin du lot, à une carte d'audit ou à une demande explicite.

QA et l'Auditeur ne relancent pas une analyse complète après chaque micro-correction. Ils relisent le même SHA final, dans une passe groupée, avec les mêmes écrans, données, viewports et états.

## Preuves de livraison

Le rapport frontend doit contenir la carte de composition, l'inventaire de réutilisation, les fichiers créés ou découpés, les tests ciblés, les limites et la preuve visuelle finale. Une refonte inclut une comparaison avant/après réellement observable et liste les différences perceptibles.

La livraison est refusée si l'agent a seulement retouché l'ancien écran malgré une demande de refonte, si le composant principal reste monolithique sans justification, si le rendu reste générique ou si la preuve visuelle ne correspond pas au SHA livré.
