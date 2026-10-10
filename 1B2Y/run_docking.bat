
@echo off
setlocal

title 1B2Y Docking Validation

set "ROOT=%~dp0"
set "VINA_EXE=%~1"

REM 1. Check an optional executable path passed as an argument
REM 2. Check the VINA_EXE environment variable
if not defined VINA_EXE if defined VINA set "VINA_EXE=%VINA%"

REM 3. Check for Vina in the repository directory
if not defined VINA_EXE if exist "%ROOT%vina.exe" set "VINA_EXE=%ROOT%vina.exe"
if not defined VINA_EXE if exist "%ROOT%vina_1.2.7_win.exe" set "VINA_EXE=%ROOT%vina_1.2.7_win.exe"

REM 4. Check Windows PATH
if not defined VINA_EXE (
    where vina.exe >nul 2>&1
    if not errorlevel 1 set "VINA_EXE=vina.exe"
)

if not defined VINA_EXE (
    where vina >nul 2>&1
    if not errorlevel 1 set "VINA_EXE=vina"
)

REM 5. Ask for the executable location if not found
if not defined VINA_EXE (
    echo AutoDock Vina was not found automatically.
    echo Enter the full path to the Vina executable.
    set /p "VINA_EXE=Vina executable path: "
)

if not defined VINA_EXE (
    echo ERROR: No Vina executable specified.
    pause
    exit /b 1
)

REM Verify that the executable can run
echo Checking AutoDock Vina...
"%VINA_EXE%" --version
if errorlevel 1 (
    echo ERROR: Vina could not run. Check the executable path.
    pause
    exit /b 1
)

REM Verify required input files
for %%F in (
    "config.txt"
    "receptor_vina.pdbqt"
    "ligand_OB_prepared.pdbqt"
) do (
    if not exist "%ROOT%%%~F" (
        echo ERROR: Missing required input file: %%~F
        pause
        exit /b 1
    )
)

echo.
echo Starting 1B2Y redocking...
echo Receptor: receptor_vina.pdbqt
echo Ligand: ligand_OB_prepared.pdbqt
echo Configuration: config.txt
echo.

"%VINA_EXE%" ^
 --receptor "%ROOT%receptor_vina.pdbqt" ^
 --ligand "%ROOT%ligand_OB_prepared.pdbqt" ^
 --config "%ROOT%config.txt" ^
 --out "%ROOT%docked_test.pdbqt" ^
 --log "%ROOT%docking_log.txt"

if errorlevel 1 (
    echo.
    echo ERROR: Docking failed. Check the console output and log.
    pause
    exit /b 1
)

echo.
echo Docking completed.
echo Output: docked_test.pdbqt
echo Log: docking_log.txt
pause
