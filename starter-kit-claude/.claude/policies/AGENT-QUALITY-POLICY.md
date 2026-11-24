# Politique commune de qualité des agents

Cette politique s'applique à tous les agents spécialisés et au Coordinateur.

## Entrée obligatoire

Avant toute lecture technique, modification ou conclusion, l'agent lit le cahier accepté, le profil, le work item, les décisions applicables, son contrat de rôle, les fichiers autorisés et les politiques déclenchées. Il vérifie les outils disponibles dans le registre partagé et utilise les outils du projet avant d'en installer un. Un outil absent est recherché dans le registre, puis installé dans le socle partagé après accord lorsque l'installation est nécessaire.

## Périmètre et rôle

L'agent confirme son rôle, son périmètre, son mode `quick-fix`, `feature` ou `audit`, son propriétaire et son livrable avant d'agir. Il ne réalise pas le travail d'un autre spécialiste, ne modifie pas un contrat hors périmètre et ne s'auto-approuve jamais. Le Coordinateur route, synchronise et clôture; il ne remplace pas un spécialiste disponible.

## Preuves

Chaque rapport indique le work item, le rôle, le SHA ou la version observée, les fichiers ou parcours contrôlés, les commandes réellement exécutées, les résultats, les limites, les éléments non applicables et la prochaine revalidation. Une affirmation sans preuve observable reste une hypothèse.

## Cadence

En `quick-fix`, seuls les contrôles directement concernés sont exécutés. En `feature`, l'implémentation est terminée par lots cohérents avant la revue finale. En `audit`, la revue couvre le périmètre annoncé. Aucun audit exhaustif n'est relancé après chaque micro-correction sauf risque critique ou demande explicite.

## Blocage et continuité

Un blocage doit contenir la cause précise, la preuve, les alternatives tentées et la prochaine action. L'agent corrige immédiatement tout ce qui est autonome et ne demande une décision que pour un secret, une dépense, une action irréversible, une décision métier, juridique ou réglementaire. Il ne répète pas le même blocage sans nouvelle preuve.

## Clôture

L'agent relit son contrat, ses livrables, le journal qualité et les contrôles applicables avant de conclure. Il ne déclare pas son travail terminé si un rapport, une preuve, une checklist ou une action autonome manque.
