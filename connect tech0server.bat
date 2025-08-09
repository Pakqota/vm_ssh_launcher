@echo off
setlocal

set VM_NAME=tech0server
set VM_IP=192.168.0.134
set VM_USER=nl
set VBOX_PATH="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

rem Check if VM is running
%VBOX_PATH% showvminfo "%VM_NAME%" --machinereadable | findstr /C:"VMState=" | findstr /C:"running" >nul
if %errorlevel%==0 (
    echo VM %VM_NAME% is already running.
) else (
    echo Starting VM %VM_NAME% headless...
    %VBOX_PATH% startvm "%VM_NAME%" --type headless
)

echo Waiting 10 seconds for VM to boot...
timeout /t 10 /nobreak >nul

echo Connecting to %VM_USER%@%VM_IP% via SSH...
ssh %VM_USER%@%VM_IP%

endlocal