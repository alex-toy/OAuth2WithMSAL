################################################################
#Create the block blob storage account :

az storage account create `
    --resource-group $RGName `
    --name $SAName `
    --location $SALocation 
    #--kind $SAKind `
    #--sku $SASKU


################################################################
#Create the container :

az storage container create `
 --account-name $SAName `
 --name $SCName `
 --auth-mode $SCAuthMode `
 --public-access $SCPublicAccess


#######################################################################
# Next step :

"Now run : commands\StorageAccount\StorageAccount_keys.ps1"


