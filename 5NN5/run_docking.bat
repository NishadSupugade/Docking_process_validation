@echo off
setlocal
title 5NN5 - NOJ Docking Validation

set "ROOT=%~dp0"
set "VINA_EXE=%~1"

if not defined VINA_EXE if defined VINA set "VINA_EXE=%VINA%"

if not defined VINA_EXE if exist "%ROOT%vina.exe" set "VINA_EXE=%ROOT%vina.exe"
if not defined VINA_EXE if exist "%ROOT%vina_1.2.7_win.exe" set "VINA_EXE=%ROOT%vina_1.2.7_win.exe"

if not defined VINA_EXE (
    where vina.exe >nul 2>&1
    if not errorlevel 1 set "VINA_EXE=vina.exe"
)

if not defined VINA_EXE (
    echo AutoDock Vina was not detected.
    set /p "VINA_EXE=Enter the full path to the Vina executable: "
)

if not defined VINA_EXE (
    echo ERROR: No Vina executable specified.
    pause
    exit /b 1
)

"%VINA_EXE%" --version
if errorlevel 1 (
    echo ERROR: Unable to run AutoDock Vina.
    pause
    exit /b 1
)

for %%F in (
    "config.txt"
    "5NN5_receptor_A_prepared.pdbqt"
    "NOJ_prepared.pdbqt"
) do (
    if not exist "%ROOT%%%~F" (
        echo ERROR: Missing required file %%~F
        pause
        exit /b 1
    )
)

echo.
echo Starting 5NN5-NOJ redocking...

"%VINA_EXE%" ^
 --receptor "%ROOT%5NN5_receptor_A_prepared.pdbqt" ^
 --ligand "%ROOT%NOJ_prepared.pdbqt" ^
 --config "%ROOT%config.txt" ^
 --out "%ROOT%NOJ_redocked_rerun.pdbqt" ^
 --log "%ROOT%Docking_rerun.log"

if errorlevel 1 (
    echo ERROR: Docking failed. Check the configuration and inputs.
    pause
    exit /b 1
)

echo.
echo Docking completed successfully.
echo Output: NOJ_redocked_rerun.pdbqt
echo Log: Docking_rerun.log
pause
