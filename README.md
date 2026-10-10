# README: Molecular Docking Redocking Validation

## 1. Purpose

This work evaluates whether AutoDock Vina can reproduce the
experimentally observed binding pose of the ligand present in the
crystal structure **PDB 1B2Y**. This procedure is called *redocking*:
the ligand is taken from the crystal structure, docked back into the
prepared protein, and the predicted pose is compared with its original
crystal pose.

This is a technical validation of pose recovery. It does not, by itself,
prove biological activity or guarantee that the docking protocol will
predict every other ligand accurately.

## 2. Protein and ligand

-   **Protein structure:** PDB ID **1B2Y**
-   **Protein used:** Human pancreatic alpha-amylase, chain A
-   **Reference ligand:** The crystallographic carbohydrate ligand
    represented by the ligand components in the supplied structure
-   **Heavy atoms compared:** 54
-   **Docking software:** AutoDock Vina **1.2.7**
-   **Ligand preparation:** Open Babel **2.4.1**

The crystallographic ligand was used as the reference for comparison
with the top-ranked docked pose.

## 3. Docking grid box

The docking search space was defined using the following grid-box
settings. Coordinates and dimensions are in **ångströms (Å)**.

  Parameter                    X        Y        Z
  --------------------- -------- -------- --------
  Grid-box center (Å)     17.388   5.2675   46.733
  Grid-box size (Å)       26.452   22.341   18.980

The grid-box center specifies the middle of the search region, while the
dimensions specify its extent along each axis. The box was placed around
the ligand-binding region so that the ligand could explore poses within
that region.

## 4. Main docking settings

  Setting                 Value
  ----------------------- -----------------
  Docking engine          AutoDock Vina
  Vina version            1.2.7
  Exhaustiveness          16
  Maximum output modes    9
  Top-ranked pose score   −9.627 kcal/mol

The docking score is Vina's estimated scoring value for the predicted
pose. It is useful for comparing poses or ligands under consistent
conditions, but it should not be interpreted as an experimentally
measured binding affinity.

## 5. Redocking validation result

The top-ranked docked pose was compared with the crystallographic
reference ligand using a symmetry-aware heavy-atom RMSD calculation.

-   **Heavy atoms included:** 54
-   **Calculated RMSD:** **0.6532 Å** (approximately **0.653 Å**)
-   **Coordinate comparison:** The original and docked coordinates were
    compared in the same reference frame, without independently
    superimposing the ligand structures.

**Interpretation:** The RMSD is below the commonly used 2 Å benchmark
for successful redocking. This indicates that the top-ranked predicted
pose closely reproduces the experimentally observed ligand pose in this
particular test.

RMSD measures the positional difference between corresponding atoms in
two structures; a smaller value indicates a closer match. The result
supports successful pose recovery for this redocking test, but it does
not independently validate all aspects of protein preparation, ligand
preparation, scoring, or performance on other compounds.

## 6. Summary

The crystallographic ligand from PDB 1B2Y was redocked into the prepared
human pancreatic alpha-amylase structure using AutoDock Vina 1.2.7. The
top-ranked pose received a score of **−9.627 kcal/mol** and had a
symmetry-aware heavy-atom RMSD of **0.6532 Å** against the
crystallographic pose. Under the stated comparison procedure, this is
consistent with successful reproduction of the reference binding pose.

## 7. Abbreviations

-   **PDB:** Protein Data Bank, a repository of experimentally
    determined biomolecular structures.
-   **Docking:** Computational prediction of how a molecule may fit into
    a protein binding site.
-   **Redocking:** Docking a ligand from a known crystal structure back
    into that protein and comparing the predicted pose with the
    original.
-   **RMSD:** Root-mean-square deviation; a measure of positional
    differences between matched atoms.
-   **Grid box:** The three-dimensional region in which the docking
    software searches for ligand poses.
-   **kcal/mol:** Kilocalories per mole, the unit used for the docking
    score reported by AutoDock Vina.

------------------------------------------------------------------------

Prepared as a client-facing summary of the redocking validation settings
and result.
