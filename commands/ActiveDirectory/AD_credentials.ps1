"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"

. commands\ActiveDirectory\AD_utils.ps1
. commands\Configs\SetConfigFile.ps1


$Global:subscription_id = (az account show --query "{ subscription_id: id }" `
                                    | ConvertFrom-Json).subscription_id


$Global:credentials = New-AppRegistration `
    -AppRegistrationName "alexeiapp" `
    -SubscritionId $subscription_id 


#######################################################################
"Set config file :"

Set-Client-Configuration -var_file $var_path



