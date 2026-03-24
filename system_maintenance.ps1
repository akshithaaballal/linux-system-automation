Write-Host "==== System Check Starting ===="

Write-Host "`nSystem Info:"
Get-ComputerInfo | Select OSName, OSVersion

Write-Host "`nWindows Update Service:"
Get-Service wuauserv

Write-Host "`nDisk Space:"
Get-PSDrive -PSProvider FileSystem

Write-Host "`nMemory:"
Get-CimInstance Win32_OperatingSystem | 
Select TotalVisibleMemorySize, FreePhysicalMemory

Write-Host "`nTop Processes:"
Get-Process | Sort CPU -Descending | Select -First 5

Write-Host "`nOpen Ports:"
netstat -ano

Write-Host "`nDone."