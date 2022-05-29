"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"

################################################################
"GENERATE SCRIPTS TO CONNECT TO THE VM AND DEPLOY THE APP :"

#copy a basic Flask app from local machine to the VM
scp -rq ./${application_path} ${AdminUsername}@${IP}:/home/${AdminUsername}

"Now go in the Azure portal - Authentication - Add a platform - Web Application and paste"
"- Redirect URIs : https://${IP}:5555/getAToken"
"- Logout : https://${IP}:5555/login"

"NOW GO AND DEPLOY THE APP" 
ssh ${AdminUsername}@${IP}