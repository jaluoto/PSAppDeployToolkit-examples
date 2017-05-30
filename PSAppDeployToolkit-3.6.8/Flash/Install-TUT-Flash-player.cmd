@echo off
rem Install Flash

rem Content dir with "\" in the end
set CONTENTDIR=%~dp0
set WRAPPER=
set OPTION=

rem If no explorer running: install silently
tasklist | find /I "explorer.exe" > NUL
if %errorlevel% NEQ 0 (
	set OPTION=-DeployMode Silent
	goto install
)

whoami | find /I "nt authority\system" > NUL
if %errorlevel% EQU 0 (
	rem Explorer is running and this script is running as system account - use ServiceUI.exe
	set WRAPPER="%CONTENTDIR%AppDeployToolkit\ServiceUI.exe" -process:explorer.exe
)

:install
rem Run installation
%WRAPPER% "%CONTENTDIR%Deploy-Application.exe" %OPTION%
if %errorlevel% GEQ 60000 (
	rem Errorlevel 60000 or greater - Window timed out / user clicked "Not now" / Other toolkit error
	exit /b %errorlevel%
)

exit /b 0
