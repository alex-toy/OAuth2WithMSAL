Function Set-Client-Configuration {
    param([String]$var_file)

    (Get-Content -Path $var_file) | ForEach-Object { 
        if($_.split("=")[0] -like 'CLIENT_*') {
            $new = $_.split("=")[0]; $new
        } else {
            $_
        }
    } | Set-Content -Path $var_file

    (Get-Content -Path $var_file) | ForEach-Object { 
        $rep = 'CLIENT_SECRET=' + $credentials.client_secret; $_ -Replace 'CLIENT_SECRET', $rep 
    } | Set-Content -Path $var_file
    
    (Get-Content -Path $var_file) | ForEach-Object { 
        $rep = 'CLIENT_ID=' + $credentials.client_id; $_ -Replace 'CLIENT_ID', $rep 
    } | Set-Content -Path $var_file
    
    (Get-Content -Path $var_file) | ForEach-Object { 
        $rep = 'CLIENT_REDIRECT_PATH=' + $redirect_path; $_ -Replace 'CLIENT_REDIRECT_PATH', $rep 
    } | Set-Content -Path $var_file
}





