# Politique de qualité documentaire

Toute documentation créée ou modifiée par un agent doit être exploitable par une personne qui ne connaît pas encore le projet. Chaque document technique pertinent contient le statut, la version, la date de mise à jour, le responsable, le contexte, le périmètre, les faits vérifiés, les hypothèses, les inconnues, les décisions, les alternatives rejetées, les dépendances, les risques, les exemples et les critères de validation.

L’agent écrit pour le lecteur ciblé, explique le jargon, remplace les formulations vagues par une décision ou une question suivie, et ne présente jamais une hypothèse comme un fait. Les diagrammes ont une source éditable et restent cohérents avec le texte et le code.

Le Concepteur crée la structure, les agents spécialistes complètent leur domaine et l’Auditeur attribue `accepted`, `rework` ou `blocked`. Une livraison est incomplète si un document obligatoire manque, contient `[[A_COMPLETER]]`, décrit une technologie absente du profil, référence un endpoint non vérifié, contient un lien cassé ou n’explique pas les risques résiduels.

## Synchronisation obligatoire avec le produit

À chaque travail, l'agent compare le code et la configuration aux README, à la documentation technique, au cahier des charges, au profil technologique, aux décisions, aux diagrammes, aux work items, au journal qualité, au changelog et aux preuves concernés. Il met à jour dans le même work item chaque document impacté, même si la modification est mineure.

Avant de déclarer une tâche terminée, il vérifie qu'aucun document ne décrit un comportement supprimé, une technologie obsolète, une commande incorrecte, un endpoint inexistant, un statut ancien ou une checklist non synchronisée. Si Trello est activé, la carte, sa description et sa checklist doivent également correspondre au code réellement livré.

Une documentation non mise à jour est une anomalie de livraison, pas une tâche optionnelle. L'Auditeur peut retourner `rework` tant que la cohérence code, projet, documents et preuves n'est pas démontrée.
