# App information
[String]$appVendor = 'App vendor'
[String]$appName = 'App name'
[String]$appVersion = 'App version'

Function Install {
	Execute-Process -Path 'example_setup.exe' -Parameters '/example'
}

Function Uninstall {
	Execute-Process -Path 'example_uninstall.exe' -Parameters '/example'
}

Function Repair {
	Execute-Process -Path 'example_repair.exe' -Parameters '/example'
}

# Additional settings - use if needed:

# Processes that should be closed during installation
[String]$installCloseApps = 'list of process names (without .exe extension)'
# Processes that should be closed during uninstallation and repair. By default, same than during installation.
[String]$uninstallCloseApps = $installCloseApps
# How many days postponing is allowed
# [int32]$postponeDays = 5
# Required free disk space in MB
# [int32]$installRequiredDiskSpace = 500

# Optional info
[String]$appArch = '' 
[String]$appLang = 'EN'
[String]$appRevision = '01'
[String]$appScriptVersion = '1.0.0'
[String]$appScriptDate = 'XX/XX/20XX'
[String]$appScriptAuthor = '<author name>'
