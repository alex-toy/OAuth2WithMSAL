################################################################
# Variables :

#southcentralus centralus francecentral
$Global:RGName = "flask-app-rg"
$Global:RGLocation = "francecentral"
$Global:application_path = "app"
$Global:var_path = "${application_path}\var.cfg"
$Global:redirect_path = "/getAToken"

# Active Directory :
$Global:DisplayName = "alexeiapplication"



#######################################################################
# Next step :

az group create --name $RGName --location $RGLocation

."commands\ActiveDirectory\AD_credentials.ps1"

."commands\VirtualMachine\VM_create.ps1"

."commands\VirtualMachine\VM_connect.ps1"

