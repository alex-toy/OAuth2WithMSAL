################################################################
# resource Group :

#southcentralus centralus francecentral
$Global:RGLocation = "francecentral"
"resource Group Location : " + $RGLocation

$Global:RGName = "flask-app-rg"
"Resource Group Name : " + $RGName



################################################################
# Active Directory :

$Global:DisplayName = "alexeiapplication"
"Display Name : " + $DisplayName



################################################################
# VM :

$Global:VMName = "flask-linux-vm"
"VM name : " + $VMName

$Global:ImageName = "UbuntuLTS"
"Image name : " + $ImageName

$Global:Size = "Standard_B1s"
"Size : " + $Size

$Global:AdminUsername = "alexadmin"
"Admin user name : " + $AdminUsername

$Global:Port = "80"
"Port : " + $Port

$Global:storageSku = "Standard_HDD"
"storageSku : "  + $storageSku



################################################################
# Secret key :

$Global:SSHKeyName = "mySSHKey"
"Secret key name : "  + $SSHKeyName

$Global:SAKey = "SAKey"
"Storage Account key name : "  + $SAKey



################################################################
# SQL database :

$Global:SQLAdminUser = "alexadmin"
"SQL admin user : "  + $SQLAdminUser

$Global:SQLAdminPassword = "p@ssword1234"
"SQL Admin password : " + $SQLAdminPassword

$Global:SQLServerName = "flask-sql-server"
"SQL server name : " + $SQLServerName

$Global:SQLLocation = "francecentral"
"SQL Location : " + $SQLLocation

$Global:SQLEnablePublicNetwork = "true"
"SQL enable public network : " + $SQLEnablePublicNetwork

$Global:SQLBDName = "flask-db"
"DB name : " + $SQLBDName

$Global:FirewallRuleName = "azureaccess"
"Firewall Rule Name : " + $FirewallRuleName

$Global:ClientIPFirewallRuleName = "clientip"
"ClientIP Firewall Rule Name : " + $ClientIPFirewallRuleName

$Global:Tier = "Basic"
"Tier : " + $Tier



################################################################
# Storage Account :

$Global:SAName = "flaskstorageaccount"
"Storage Account name : " + $SAName

#southcentralus centralus francecentral
$Global:SALocation = $RGLocation
"Storage Account Location : " + $SALocation

$Global:SAKind = "BlockBlobStorage"
"Storage Account kind : " + $SAKind

$Global:SASKU = "Standard_LRS"
"Storage Account SKU : " + $SASKU

$Global:SCName = "flask-images"
"Storage container name : " + $SCName

$Global:SCAuthMode = "login"
"Storage container auth mode : " + $SCAuthMode

$Global:SCPublicAccess = "container"
"Storage container public access : " + $SCPublicAccess


#######################################################################
# Set config file :

$file = ".\commands\Configs\var.cfg"

(Get-Content -Path $file) | ForEach-Object { $_ = $_.split("=")[0]; $_ } | Set-Content -Path $file

(Get-Content -Path $file) | ForEach-Object { $rep = 'SQL_SERVER=' + $SQLServerName; $_ -Replace 'SQL_SERVER', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'SQL_DATABASE=' + $SQLBDName; $_ -Replace 'SQL_DATABASE', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'SQL_USER_NAME=' + $SQLAdminUser; $_ -Replace 'SQL_USER_NAME', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'SQL_PASSWORD=' + $SQLAdminPassword; $_ -Replace 'SQL_PASSWORD', $rep } | Set-Content -Path $file

(Get-Content -Path $file) | ForEach-Object { $rep = 'BLOB_ACCOUNT=' + $SAName; $_ -Replace 'BLOB_ACCOUNT', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'BLOB_CONTAINER=' + $SCName; $_ -Replace 'BLOB_CONTAINER', $rep } | Set-Content -Path $file


#######################################################################
# Next step :

"Now run : commands\ResourceGroup\ResourceGroup_create.ps1"