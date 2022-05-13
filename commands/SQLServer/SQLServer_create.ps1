################################################################
#CREATE SQL SERVER :

az sql server create `
    --admin-user $SQLAdminUser `
    --admin-password $SQLAdminPassword `
    --name $SQLServerName `
    --resource-group $RGName `
    --location $RGLocation `
    --enable-public-network $SQLEnablePublicNetwork `
    --verbose


################################################################
#CREATE FIREWALL RULES :

#allow Allow Azure services and resources to access the server we just created.
az sql server firewall-rule create `
    -g $RGName `
    -s $SQLServerName `
    -n $FirewallRuleName `
    --start-ip-address 0.0.0.0 `
    --end-ip-address 0.0.0.0 `
    --verbose


################################################################
#RETRIEVE LOCAL IP ADDRESS :

$Global:LocalPublicIP = (Invoke-WebRequest ifconfig.me/ip).Content.Trim()
"Local Public IP : " + $LocalPublicIP


################################################################
#LAST SETTINGS :

#set your computer's public Ip address to the server's firewall
az sql server firewall-rule create `
    -g $RGName `
    -s $SQLServerName `
    -n $ClientIPFirewallRuleName `
    --start-ip-address $LocalPublicIP `
    --end-ip-address $LocalPublicIP `
    --verbose

#create the database itself
az sql db create `
    --name $SQLBDName `
    --resource-group $RGName `
    --server $SQLServerName `
    --tier Basic `
    --verbose


#######################################################################
# Next step :

"Now run : starter\script\script.sql in the azure SQL console to create the tables, then run commands\StorageAccount\StorageAccount_create.ps1"




