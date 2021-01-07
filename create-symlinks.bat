@echo off
setlocal

set user=maku77
set current_dir=%~dp0
set data_dir=%~1

REM Exit if not admin
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ERROR: Need to run as Administrator
    exit /b
)

REM Check if the data dir is specified
if "%data_dir%"=="" (
    echo Usage: %~n0 MT_DATA_DIR
    echo You can check the path by pressing CTRL+SHIFT+D in MetaTrader platform
    exit /b
)

REM Create symbolic links
cd /d %data_dir%
mklink /d MQL5\Experts\%user% %current_dir%MQL5\Experts\%user%
mklink /d MQL5\Images\%user% %current_dir%MQL5\Images\%user%
mklink /d MQL5\Include\%user% %current_dir%MQL5\Include\%user%
mklink /d MQL5\Indicators\%user% %current_dir%MQL5\Indicators\%user%
mklink /d MQL5\Libraries\%user% %current_dir%MQL5\Libraries\%user%
mklink /d MQL5\Scripts\%user% %current_dir%MQL5\Scripts\%user%

