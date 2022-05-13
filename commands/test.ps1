$cfg_file = ".\commands\Configs\var.cfg"

# (Get-Content -Path $cfg_file) | ForEach-Object { $_ = $_.split("=")[0]; $_ } | Set-Content -Path $cfg_file


$BLOB_STORAGE_KEY = "yugiuogihihmjlkljkmlklm"

(Get-Content -Path $cfg_file) | ForEach-Object { 
    $old = If ($_.split("=")[1]) {'BLOB_STORAGE_KEY=' + $_.split("=")[1]} Else {'BLOB_STORAGE_KEY'}
    $new = 'BLOB_STORAGE_KEY=' + $BLOB_STORAGE_KEY
    $_ -Replace $old, $new 
} | Set-Content -Path $cfg_file



