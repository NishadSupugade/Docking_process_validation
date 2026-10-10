# Molecular Docking Protocol Validation

## Overview

This repository contains files, configurations, docking outputs, and documentation for molecular docking protocol validation through redocking of crystallographic ligands into their corresponding prepared protein receptors.

The purpose is to document the workflow, preserve the input and output files, and facilitate independent reproduction of the docking experiments using AutoDock Vina.

## Objectives

- Document the preparation and redocking workflow.
- Preserve original protein structures and reference ligand coordinates.
- Provide prepared receptor and ligand files used in the recorded experiments.
- Maintain docking configurations and output poses.
- Document the reported redocking RMSD results.
- Enable users to rerun the docking calculations using the supplied scripts and instructions.

## Validation systems

| Protein PDB ID | Ligand | Best recorded affinity | Reported RMSD | Documentation |
|---|---|---:|---:|---|
| 1B2Y | Reference ligand used in the validation | -9.627 kcal/mol | 0.653 Å | [1B2Y validation](1B2Y/README.md) |
| 5NN5 | NOJ | Refer to `Docking_result.txt` | 0.059 Å | [5NN5 validation](5NN5/README.md) |

**Note:** RMSD values are reported from the respective validation calculations. Their interpretation depends on the reference structure, atom correspondence, and calculation method. Vina's pose-to-pose RMSD values are not equivalent to crystallographic redocking RMSD.

## Repository structure

```text
Molecular-Docking-Validation/
├── README.md
├── 1B2Y/
│   ├── README.md
│   ├── 1B2Y.pdb
│   ├── receptor_vina.pdbqt
│   ├── ligand_reference.pdb
│   ├── ligand_prepared.pdbqt
│   ├── ligand_OB_prepared.pdbqt
│   ├── config.txt
│   ├── docked_test.pdbqt
│   ├── Docking_result.txt
│   └── run_docking.bat
└── 5NN5/
    ├── README.md
    ├── 5NN5.pdb
    ├── 5NN5_receptor_A_prepared.pdbqt
    ├── NOJ_reference.pdb
    ├── NOJ_prepared.pdbqt
    ├── config.txt
    ├── Docking_result.txt
    ├── NOJ_redocked.pdbqt
    └── run_docking.bat
```

The listing represents the intended organization. Include each filename only if it is present in the corresponding GitHub folder.

## Software requirements

- AutoDock Vina for molecular docking.
- Prepared receptor and ligand structures in PDBQT format.
- Windows operating system for the supplied `.bat` scripts.
- An appropriate RMSD calculation tool or script for independent redocking validation.

Refer to each target-specific README for its docking settings, inputs, and rerun instructions.

## Reproducing the experiments

1. Clone or download this repository.
2. Open the folder for the target of interest.
3. Read the corresponding `README.md`.
4. Install a compatible AutoDock Vina version.
5. Check the configuration file and required input filenames.
6. Run the provided Windows batch script.
7. Inspect the generated docking poses and log files.
8. Compare the new results with the recorded results and, where applicable, independently verify the redocking RMSD.

Re-running docking may produce different poses or scores depending on software versions, random seeds, and execution settings.

## Scientific interpretation

Docking scores are computational estimates and should not be interpreted as direct measurements of binding affinity or biological activity.

Redocking RMSD evaluates the agreement between a predicted pose and a reference pose only when the structures are compared using an appropriate atom-mapping procedure. A low RMSD in a single validation system does not establish universal suitability of the protocol for unrelated targets.

## Data sources and citations

Protein structures should be cited using their respective entries in the RCSB Protein Data Bank:

- [PDB 1B2Y](https://www.rcsb.org/structure/1B2Y)
- [PDB 5NN5](https://www.rcsb.org/structure/5NN5)

Please cite AutoDock Vina and any additional preparation or validation tools used in subsequent research.

## Reproducibility and limitations

This repository provides the files and documentation required to reproduce the documented docking calculations, subject to the availability of compatible software and the completeness of the supplied inputs.

The repository should not be interpreted as experimental confirmation of ligand binding or biological efficacy.
