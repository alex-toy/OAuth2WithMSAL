"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
# VM configuration :

$Global:VMName = "flask-linux-vm"
$Global:ImageName = "UbuntuLTS"
# Standard_B1ls Standard_L8s_v2 Standard_B1s
$Global:Size = "Standard_L8s_v2" #linux machine??
$Global:AdminUsername = "alexadmin"
$Global:Port = "80"
$Global:storageSku = "Standard_HDD"


################################################################
"CREATE A VM :"

az vm create `
  --resource-group $RGName `
  --name $VMName `
  --location $RGLocation `
  --image $ImageName `
  --size $Size `
  --admin-username $AdminUsername `
  --generate-ssh-keys `
  --custom-data commands\VirtualMachine\init.sh `
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






