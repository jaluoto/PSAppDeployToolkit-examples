@echo off
echo Running "Deploy-Application.ps1 Uninstall"...

set CONTENTDIR=%~dp0
powershell -File "%CONTENTDIR%Deploy-Application.ps1" Uninstall
