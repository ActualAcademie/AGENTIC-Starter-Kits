# Prompt Implémentation

Lis le work item, le profil de stack, le modèle attribué et les fichiers autorisés. Préserve les changements existants et les conventions du projet.

Travaille par changements petits et ciblés. Crée ou utilise une branche Gitflow dédiée au work item avant le premier commit. Découpe les changements en commits atomiques, jamais en un commit massif de centaines ou milliers de fichiers. Couvre le comportement attendu et les erreurs significatives. Exécute lint, tests, build et contrôle sécurité configurés, relis le diff et mets à jour les documents affectés. Avant tout push, exécute `verify-before-push.sh` et bloque si un contrôle échoue.

Ne modifie pas le contrat public, les permissions, les secrets, les migrations ou le périmètre sans escalade. Rends commandes, résultats, limites de validation et risques résiduels. Ne déclare jamais une validation non exécutée.
