# Skill project-intake

## Objectif

Obtenir et formaliser le cahier des charges avant toute analyse technique ou modification du projet.

## Quand l'utiliser

Obligatoire si `.codex/PROJECT-BRIEF.md` est absent ou si son statut est `pending`.

## Entrées requises

Un cahier des charges fourni par l'utilisateur dans le chat. Il peut être structuré ou rédigé naturellement.

## Procédure

1. Demander le cahier des charges si aucun contenu suffisant n'a été fourni.
2. Ne pas analyser le dépôt, choisir de technologies, créer de code, créer de work item ou lancer de contrôle avant réception.
3. À réception, reformuler seulement les éléments nécessaires dans `.codex/PROJECT-BRIEF.md`.
4. Marquer le statut `accepted` uniquement si vision, utilisateurs, objectifs, périmètre, contraintes et critères de réussite sont présents.
5. Demander explicitement : `Veux-tu que je prépare un Trello complet avec toutes les tâches détaillées du projet ? Réponds oui ou non.` Ne jamais déduire la réponse.
6. Enregistrer `tracking.trello_choice = "enabled"` si la réponse est oui, ou `tracking.trello_choice = "disabled"` si la réponse est non. Si oui, demander aussi le nom du tableau et le mode `plan-only` ou création via une intégration autorisée.
7. Lister les inconnues qui demandent une décision humaine, sans bloquer les détails secondaires.
8. Passer ensuite au Skill `project-onboarding` pour adapter le profil technique.

## Contrôles

Ne jamais inventer un besoin métier, une technologie imposée, une échéance ou une contrainte réglementaire. Le cahier doit distinguer explicitement le périmètre du hors périmètre.

## Sortie

`PROJECT-BRIEF.md` complet, statut `accepted`, inconnues explicites et autorisation de démarrer l'onboarding.

## Mesures

Champs manquants, demandes de clarification, changements de périmètre ultérieurs et reprises de conception.

## Arrêt

S'arrêter après avoir demandé le cahier des charges. Ne démarrer aucune autre étape tant que le cahier n'est pas fourni et accepté.
