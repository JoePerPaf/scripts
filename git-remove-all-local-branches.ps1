$branches = git branch | Foreach-Object {
    $_.Trim().TrimStart('*').Trim()
}

ForEach ( $branch in $branches) {
    if ($branch -eq "master") { continue }
    git branch -D $branch
}
