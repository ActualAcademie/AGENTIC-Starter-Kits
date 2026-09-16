# Compatibilité plateformes

## macOS et Linux

Utiliser un terminal Bash avec Git et Python 3.11 ou supérieur. Les commandes documentées en `.sh` fonctionnent directement.

## Windows

Installer Git for Windows et Python 3.11 ou supérieur. Utiliser PowerShell avec `scripts/run.ps1`, qui localise Git Bash, ou ouvrir Git Bash et utiliser les commandes `.sh` habituelles.

Exemples PowerShell :

```powershell
& .\.codex\scripts\run.ps1 init-project
& .\.codex\scripts\run.ps1 preflight
& .\.codex\scripts\run.ps1 verify-before-push
```

## Détection

`platform.sh` affiche la plateforme détectée. `python.sh` utilise `python3`, puis `python`, puis `py -3`. Ne pas coder de chemin absolu propre à une machine dans le profil projet.
