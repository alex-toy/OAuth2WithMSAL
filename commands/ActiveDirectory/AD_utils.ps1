function Show-AllAccountTenantIds {
    $ids = az account tenant list | ConvertFrom-Json | ForEach-Object { $_.tenantId }
    return $ids
}

function Show-AllAccountIds {
    $names = az account tenant list | ConvertFrom-Json | ForEach-Object { $_.id}
    return $names
}

Function New-AppRegistration {
    param([String]$AppRegistrationName, [String]$SubscritionId)
    $credentials = az ad sp create-for-rbac `
        --name $AppRegistrationName `
        --role Contributor `
        --scopes="/subscriptions/${SubscritionId}" `
        --query "{ client_id: appId, client_secret: password, tenant_id: tenant }" | ConvertFrom-Json 
    return $credentials
}

Function Remove-AllAppRegistrations {
    $app_registrations = az ad app list --all | ConvertFrom-Json | ForEach-Object { $_.appId }
    $app_registrations | ForEach-Object {az ad app delete --id $_}
}

function Show-AllAccounts {
    param( [String]$MicrosoftAccountEmail)
    az account list `
        --query "[?user.name=='${MicrosoftAccountEmail}'].{Name:name, ID:id, Default:isDefault}" `
        --output Table
}