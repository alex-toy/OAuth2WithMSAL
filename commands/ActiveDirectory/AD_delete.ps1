
$app_registrations = az ad app list --all | ConvertFrom-Json | ForEach-Object { $_.appId }
$app_registrations | ForEach-Object {az ad app delete --id $_}