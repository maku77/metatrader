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
set DIRS=Experts,Images,Include,Indicators,Libraries,Scripts
cd /d %data_dir%
FOR %%A IN (%DIRS%) DO (
    mklink /d MQL5\%%A\%user% %current_dir%MQL5\%%A\%user%
)

