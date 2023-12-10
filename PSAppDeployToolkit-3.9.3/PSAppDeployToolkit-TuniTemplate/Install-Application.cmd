@echo off
echo Running "Deploy-Application.ps1"...

set CONTENTDIR=%~dp0
powershell -File "%CONTENTDIR%Deploy-Application.ps1"
