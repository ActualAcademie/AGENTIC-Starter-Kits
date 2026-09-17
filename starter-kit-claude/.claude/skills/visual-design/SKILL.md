# Skill visual-design

## Mission

Concevoir une expérience frontend comme un travail de direction artistique, puis la traduire en interface maintenable. La qualité attendue est premium, singulière, cohérente et adaptée au produit. Une interface propre mais générique, prévisible ou reconnaissable comme une sortie automatique est insuffisante.

## Direction artistique

Avant de coder, produire ou mettre à jour `docs/design/visual-direction.md` avec l'intention émotionnelle, les références et anti-références, la palette sémantique, les typographies, le rythme spatial, les règles de composition, le langage des composants, les états, les transitions, le responsive et les principes de traitement des médias. Relier chaque décision aux utilisateurs et au produit.

Ne jamais empiler des effets pour faire premium. Chaque choix doit servir la hiérarchie, la compréhension, la confiance ou la personnalité de la marque.

## Interface et motion design

- créer un design system réutilisable avant de multiplier les écrans ;
- couvrir loading, vide, erreur, succès, focus, désactivé et tactile ;
- utiliser une hiérarchie visuelle forte, des compositions singulières et des détails de finition cohérents ;
- ajouter des animations utiles pour les états, feedbacks et transitions ;
- respecter `prefers-reduced-motion`, les performances et les usages clavier ;
- ne pas appliquer automatiquement gradients, glassmorphism, cartes, blobs ou néon ;
- vérifier petits écrans, grands écrans, lecteur d'écran et contraste.

## Images, photos et médias

Priorité : ressource fournie ou créée spécifiquement, image réaliste générée si autorisée, image libre de droit avec licence vérifiée, puis placeholder explicitement marqué. Pour toute ressource externe, documenter dans `docs/design/media-inventory.md` l'URL, l'auteur, la date, la licence, l'attribution, le fichier, les retouches et l'usage. Ne jamais retirer un filigrane, scraper ou prétendre qu'une licence est libre sans preuve.

Pour une image générée, documenter le brief visuel, le réalisme recherché, les retouches et les artefacts contrôlés. Éviter mains déformées, textes illisibles, logos inventés et faux témoignages. Toute retouche doit rester compatible avec la licence et ne pas tromper l'utilisateur.

## Validation obligatoire

Tester lint, tests, accessibilité, responsive, erreurs, performance et mouvement réduit. Fournir des captures des parcours importants. Faire relire le rendu par l'auditeur et inscrire chaque défaut dans `docs/quality/quality-journal.md`. Ne jamais pousser sans `verify-before-push`.

## Livrables

Direction artistique, inventaire médias, design system, composants, écrans, animations, tests, captures, résultats et risques résiduels.
