# Gouvernance portable

## Principes

Codex est l'unique orchestrateur. Une preuve observable vaut plus qu'une affirmation. Le moindre privilège s'applique aux fichiers, outils, contexte et décisions. L'optimisation du coût ne peut pas réduire un contrôle de sécurité ou de qualité.

## Autorité

Le demandeur décide du résultat métier et des compromis majeurs. Le Coordinateur décide du séquencement. Le Concepteur recommande la solution. Cybersécurité peut bloquer un risque critique. L'Auditeur recommande acceptation, reprise ou blocage. Aucun rôle ne s'auto-approuve.

## États

`proposed`, `planned`, `assigned`, `in-progress`, `review`, `accepted`, `archived`, `blocked`, `rework`, `cancelled`.

Un work item devient `accepted` seulement si les critères ont une preuve, les risques résiduels ont un propriétaire et les contrôles requis sont verts.

## Conflits

Les désaccords sont présentés avec options, coût, risque, réversibilité et preuve attendue. Le Coordinateur documente la décision. Une exigence de sécurité ou une approbation humaine explicite prime sur le délai.

## Confidentialité

Les secrets sont fournis par un environnement sécurisé, jamais versionnés. Les rapports et logs excluent tokens, mots de passe, données personnelles et contenu confidentiel inutile.

## Amélioration continue

Après une tâche acceptée, enregistrer tours, contexte, durée, relances, défauts et gain réutilisable. Une amélioration est adoptée seulement après comparaison mesurée et sans régression de sécurité ou de qualité.
