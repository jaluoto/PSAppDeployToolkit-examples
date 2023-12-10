# PSAppDeployToolkit-examples
Examples how we use PowerShell App Deployment Toolkit (https://github.com/PSAppDeployToolkit) at ~~TUT~~ tuni.fi.

Our changes to upstream PSADT:
- App package specific code is separated to a new file called Deploy-Settings.ps1 to make editing easier, no need to touch Deploy-Application.ps1
- Added Install-Application.cmd and Uninstall-Application.cmd for manual installations, to enable "Right-click -> Run as administrator" and showing log on console
- Some minor GUI text edits
- Branding

