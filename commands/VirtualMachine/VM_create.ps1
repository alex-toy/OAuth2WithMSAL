################################################################
#CREATE A VM :

az vm create `
   --resource-group $RGName `
   --name $VMName `
   --location $RGLocation `
   --image $ImageName `
   --size $Size `
   --admin-username $AdminUsername `
   --generate-ssh-keys `
   --verbose
 #  --os-disk-size-gb 63
   #--storage-sku $storageSku `


#open port 80 to allow outside traffic to our VM
az vm open-port `
    --port $Port `
    --resource-group $RGName `
    --name $VMName


# Get IP address
$file = '.\commands\VirtualMachine\ip.json'
az vm list-ip-addresses -g $RGName -n $VMName | Out-File $file

$json = Get-Content $file -Raw | ConvertFrom-Json 

#IP address :
$Global:IP = $json.virtualMachine.network.publicIpAddresses.ipAddress
"IP : " + $IP


#######################################################################
# Next step :

"Now run : commands\VirtualMachine\VM_connect.ps1 then run the generated scp and ssh commands, the deploy the flask app."









