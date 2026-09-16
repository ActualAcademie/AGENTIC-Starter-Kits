param(
    [Parameter(Mandatory = $true, Position = 0)]
    [ValidateSet('init-project', 'preflight', 'verify-before-push', 'run-project-checks', 'generate-github-ci', 'show-project-context', 'doctor')]
    [string]$Command,
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$bash = Get-Command bash -ErrorAction SilentlyContinue
if (-not $bash) {
    $gitBash = Join-Path $env:ProgramFiles 'Git\bin\bash.exe'
    if (Test-Path $gitBash) {
        $bash = Get-Item $gitBash
    }
}
if (-not $bash) {
    throw 'Git Bash est requis sous Windows. Installer Git for Windows puis relancer cette commande.'
}

$target = Join-Path $scriptDir "$Command.sh"
if (-not (Test-Path $target)) {
    throw "Script introuvable : $target"
}

& $bash.Source $target @Arguments
exit $LASTEXITCODE
