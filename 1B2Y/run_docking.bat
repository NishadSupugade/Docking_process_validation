
@echo off
setlocal

set "VINA=C:\Users\Nishad\Downloads\vina_1.2.7_win.exe"
set "RECEPTOR=02_Receptor\receptor_vina.pdbqt"
set "LIGAND=03_Ligand\ligand_OB_prepared.pdbqt"
set "OUTPUT=03_Ligand\docked_test.pdbqt"

"%VINA%" --receptor "%RECEPTOR%" --ligand "%LIGAND%" ^
 --config config.txt ^
 --out "%OUTPUT%"

if errorlevel 1 (
    echo Docking failed. Check file paths and settings.
    pause
    exit /b 1
)

echo Docking completed successfully.
pause
