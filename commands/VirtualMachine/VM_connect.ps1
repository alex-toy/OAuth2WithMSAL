################################################################
#GENERATE SCRIPTS TO CONNECT TO THE VM AND DEPLOY THE APP :

#copy a basic Flask app from local machine to the VM
$scp = "scp -r ./starter " + $AdminUsername + "@" + $IP + ":/home/" + $AdminUsername
$scp


#connect to the VM with 
$ssh = "ssh " + $AdminUsername + "@" + $IP
$ssh