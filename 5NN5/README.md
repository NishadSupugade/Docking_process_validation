# 5NN5–NOJ Docking Protocol Validation

## 1. Overview

This repository documents a molecular docking redocking validation experiment involving protein structure **PDB ID: 5NN5** and ligand **NOJ**.

The workflow uses AutoDock Vina to redock a prepared ligand into a prepared receptor. The original crystallographic ligand coordinates are retained as the reference for evaluating the redocked pose.

## 2. Software requirements

- AutoDock Vina 1.2.7, if this matches the version used in the original run.
- Windows 10/11 for the supplied batch script.
- An RMSD calculation tool for independently verifying the redocked pose.

The AutoDock Vina executable must be installed separately.

## 3. Repository contents

| File | Description |
|---|---|
| `5NN5.pdb` | Original protein structure from the Protein Data Bank |
| `5NN5_receptor_A_prepared.pdbqt` | Prepared receptor used for docking |
| `NOJ_reference.pdb` | Reference ligand in crystallographic coordinates |
| `NOJ_prepared.pdbqt` | Prepared ligand used for docking |
| `config.txt` | Docking search-space and calculation parameters |
| `Docking_result.txt` | Recorded original docking results |
| `NOJ_redocked.pdbqt` | Original redocking output |
| `run_docking.bat` | Portable Windows rerun script |
| `README.md` | Protocol documentation |

## 4. Structure information

- **Protein PDB ID:** 5NN5
- **Ligand identifier:** NOJ
- **Reference structure:** `5NN5.pdb`
- **Reference ligand:** `NOJ_reference.pdb`
- **Prepared receptor:** `5NN5_receptor_A_prepared.pdbqt`
- **Prepared docking ligand:** `NOJ_prepared.pdbqt`

The prepared ligand is the input used for docking, while the reference ligand preserves the original crystallographic coordinates.

Structure source: https://www.rcsb.org/structure/5NN5

## 5. Docking parameters

| Parameter | Value |
|---|---|
| Scoring function | Vina |
| Grid center X | -13.651 Å |
| Grid center Y | -31.493 Å |
| Grid center Z | 96.643 Å |
| Grid size X | 20 Å |
| Grid size Y | 20 Å |
| Grid size Z | 20 Å |
| Exhaustiveness | 16 |
| Number of output modes | 9 |

These settings describe the recorded search space and docking configuration.

## 6. Recorded docking and RMSD results

The original docking output and affinity scores are documented in `Docking_result.txt`.

The reported redocking RMSD is **0.059 Å**.

This value should be interpreted according to the RMSD calculation method, atom mapping, symmetry handling, and whether coordinate superposition was applied. The RMSD value is separate from the pose-to-pose RMSD values reported by AutoDock Vina.

For independent verification, compare the appropriate docked pose against `NOJ_reference.pdb` using a documented and reproducible atom-mapping procedure.

## 7. Instructions for rerunning docking

1. Download or clone the repository.
2. Install AutoDock Vina.
3. Ensure `config.txt`, `5NN5_receptor_A_prepared.pdbqt`, and `NOJ_prepared.pdbqt` are present in the same folder as `run_docking.bat`.
4. Run `run_docking.bat`.
5. If Vina is not detected automatically, enter the executable's full path when prompted.
6. Inspect `NOJ_redocked_rerun.pdbqt` and `Docking_rerun.log`.

The rerun script writes new output files and does not overwrite the original docking output.

## 8. Scope and limitations

This repository documents a redocking experiment for the 5NN5–NOJ system. Successful redocking supports the suitability of the protocol for this particular validation setup but does not establish that the same parameters are appropriate for other protein targets.

Reproducibility depends on retaining the prepared structures, original grid settings, software version, and a documented RMSD calculation procedure.

## 9. Citation


