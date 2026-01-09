param(
    [string]$repo
)

$prs = @(gh pr list -R "$repo" -S "dependabot" --json number --jq '.[].number')


foreach ($pr in $prs){
    Write-Host "Processing pr: $pr"
    gh pr comment -R "$repo" "$pr" --body '@dependabot recreate'
}
