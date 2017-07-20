# --- Name and version information for the application. ADT logging uses these, so remember to set the version correctly.
[string]$appVendor = 'Adobe'
[string]$appName = 'Flash Player'
[string]$appVersion = '1.0.0.0'

# Installation code
Function Install {
	Execute-MSI -Action Install -Path 'install_flash_player_plugin.msi' -Transform 'Flash-Non-IE-TUT.mst'
	
	# ActiveX-msi should be installed only on pre-Win8 OS
	If ([System.Environment]::OSVersion.Version -lt (New-Object 'Version' 6,2)) {
		Execute-MSI -Action Install -Path 'install_flash_player_active_x.msi' -Transform 'Flash-IE-TUT.mst'
	}
	
	xcopy.exe "$dirfiles\mms.cfg" "c:\windows\syswow64\macromed\flash" /Y /C /Q /R /H
	xcopy.exe "$dirfiles\mms.cfg" "c:\windows\system32\macromed\flash" /Y /C /Q /R /H
	schtasks.exe /delete /tn "Adobe Flash Player Updater" /f
}

# Uninstallation code
# The first GUID is for the Flash Plugin version
Function Uninstall {
	Execute-MSI -Action Uninstall -Path '{8AA0E56A-5F80-413C-863D-67ED1E0DAC55}'
	
	# ActiveX-msi should be uninstalled only on pre-Win8 OS
	If ([System.Environment]::OSVersion.Version -lt (New-Object 'Version' 6,2)) {
		Execute-MSI -Action Uninstall -Path '{5708517C-59A3-45C6-9727-6C06C8595AFD}'
	}

	# Run Adobe's uninstaller just in case
	Execute-Process -Path 'uninstall_flash_player.exe' -Parameters '-uninstall'
}

# --- Additional settings, use if needed:

# Processes to close on installation and uninstallation. Use the same list for both by default.
[string]$installCloseApps = 'plugin-container,iexplore,firefox,chrome,opera,safari'
[string]$uninstallCloseApps = $installCloseApps
# How many days the user can postpone
# [int32]$postponeDays = 5
# Required free disk space in MB
# [int32]$installRequiredDiskSpace = 500
