param(
    [string]$Root = "."
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$rootPath = Resolve-Path -LiteralPath $Root
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$skillPath = Split-Path -Parent $scriptPath
$templatePath = Join-Path $skillPath "templates"

$dirs = @(
    "00_problem",
    "01_data/raw",
    "01_data/processed",
    "02_src",
    "03_results/figures",
    "03_results/tables",
    "04_paper",
    "05_support",
    "06_management"
)

foreach ($dir in $dirs) {
    $path = Join-Path $rootPath $dir
    if (-not (Test-Path -LiteralPath $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
    }
}

function Copy-Template {
    param(
        [string]$Template,
        [string]$Target
    )

    $sourcePath = Join-Path $templatePath $Template
    $targetPath = Join-Path $rootPath $Target

    if (-not (Test-Path -LiteralPath $sourcePath)) {
        throw "Missing template: $sourcePath"
    }

    if (-not (Test-Path -LiteralPath $targetPath)) {
        $content = Get-Content -LiteralPath $sourcePath -Encoding UTF8 -Raw
        Set-Content -LiteralPath $targetPath -Value $content -Encoding UTF8
    }
}

$templates = @(
    @("PROJECT_STATE.md", "06_management/PROJECT_STATE.md"),
    @("HANDOFF.md", "06_management/HANDOFF.md"),
    @("decision_log.md", "06_management/decision_log.md"),
    @("experiment_log.csv", "06_management/experiment_log.csv"),
    @("risk_list.md", "06_management/risk_list.md"),
    @("checklists.md", "06_management/checklists.md"),
    @("PHASE_REVIEW.md", "06_management/PHASE_REVIEW.md"),
    @("MODEL_ISSUE_REPORT.md", "06_management/MODEL_ISSUE_REPORT.md"),
    @("research_notes.md", "00_problem/research_notes.md"),
    @("problem_decomposition.md", "00_problem/problem_decomposition.md"),
    @("model_options.md", "00_problem/model_options.md"),
    @("paper_draft.md", "04_paper/paper_draft.md"),
    @("problem_README.md", "00_problem/README.md"),
    @("src_README.md", "02_src/README.md"),
    @("paper_README.md", "04_paper/README.md"),
    @("support_README.md", "05_support/README.md")
)

foreach ($pair in $templates) {
    Copy-Template -Template $pair[0] -Target $pair[1]
}

Write-Host "EECup project skeleton is ready: $rootPath"
