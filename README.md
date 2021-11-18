# CAGI6 submission

- [CAGI6 submission](#cagi6-submission)
  - [HMBS](#hmbs)
  - [](#)
  - [](#1)
  - [Sherloc clinical classification](#sherloc-clinical-classification)
    - [Compare feature importances of structural methods](#compare-feature-importances-of-structural-methods)
    - [With humsavar](#with-humsavar)
    - [Do not weigh probable and likely mutations differently](#do-not-weigh-probable-and-likely-mutations-differently)
    - [Set `metric="binary_logloss"` and `is_unbalance=True`](#set-metric%22binarylogloss%22-and-isunbalancetrue)
- [Submission for CAGI6—CAM challenge](#submission-for-cagi6cam-challenge)
  - [Overview](#overview)
  - [References](#references)

## Submissions

### MTHFR

**Relevant notebooks:**

| Notebook | Description |
| -------- | ----------- |
|          |             |

### CAM

| Notebook                          | Description |
| --------------------------------- | ----------- |
| [`40_cagi6_cam_submission.ipynb`] |             |

### MAPK1

| Notebook | Description |
| -------- | ----------- |
|          |             |

### MAPK3

| Notebook | Description |
| -------- | ----------- |
|          |             |

### HMBS

| Notebook                           | Description |
| ---------------------------------- | ----------- |
| [`30_cagi6_hmbs.ipynb`]            |             |
| [`35_cagi6_hmbs_alphafold.ipynb`]  |             |
| [`35_cagi6_hmbs_el2.ipynb`]        |             |
| [`35_cagi6_hmbs_rosetta.ipynb`]    |             |
| [`35_cagi6_sherloc_el2.ipynb`]     |             |
| [`40_cagi6_hmbs_submission.ipynb`] |             |

[`30_cagi6_hmbs.ipynb`]: notebooks/30_cagi6_hmbs.ipynb
[`40_cagi6_hmbs_submission.ipynb`]: notebooks/40_cagi6_hmbs_submission.ipynb

### Sherloc clinical classification

| Notebook                                   | Description                                                                  |
| ------------------------------------------ | ---------------------------------------------------------------------------- |
| [`30_cagi6_sherloc.ipynb`]                 | Load the CAGI6 Sherloc dataset.                                              |
| [`30_humsavar.ipynb`]                      | Load the humsavar dataset.                                                   |
| [`31_run_alphafold_wt.ipynb`]              | Generate AlphaFold features.                                                 |
| [`31_run_msa_analysis.ipynb`]              | Generate basic MSA features.                                                 |
| [`31_run_protbert.ipynb`]                  | Generate ProtBert features.                                                  |
| [`31_run_proteinsolver.ipynb`]             | Generate ProteinSolver features.                                             |
| [`31_run_rosetta_ddg.ipynb`]               | Generate Rosetta features.                                                   |
| [`37_cagi6_sherloc_combine_results.ipynb`] | Combine features generated using all methods for the Sherloc dataset.        |
| [`37_humsavar_combine_results.ipynb`]      | Combine features generated using all methods for the humsavar dataset.       |
| [`38_cagi6_sherloc_train_model.ipynb`]     | Train a machine learning model using Sherloc + humsavar data.                |
| [`39_cagi6_sherloc_finetune_model.ipynb`]  | Finetune the trained machine learning model and perform feature elimination. |
| [`40_cagi6_sherloc_submission.ipynb`]      | Make predictions for the test dataset.                                       |

[`30_cagi6_sherloc.ipynb`]: notebooks/30_cagi6_sherloc.ipynb
[`30_humsavar.ipynb`]: notebooks/30_humsavar.ipynb
[`31_run_alphafold_wt.ipynb`]: notebooks/31_run_alphafold_wt.ipynb
[`31_run_msa_analysis.ipynb`]: notebooks/31_run_msa_analysis.ipynb
[`31_run_protbert.ipynb`]: notebooks/31_run_protbert.ipynb
[`31_run_proteinsolver.ipynb`]: notebooks/31_run_proteinsolver.ipynb
[`31_run_rosetta_ddg.ipynb`]: notebooks/31_run_rosetta_ddg.ipynb
[`37_cagi6_sherloc_combine_results.ipynb`]: notebooks/37_cagi6_sherloc_combine_results.ipynb
[`37_humsavar_combine_results.ipynb`]: notebooks/37_humsavar_combine_results.ipynb
[`38_cagi6_sherloc_train_model.ipynb`]: notebooks/38_cagi6_sherloc_train_model.ipynb
[`39_cagi6_sherloc_finetune_model.ipynb`]: notebooks/39_cagi6_sherloc_finetune_model.ipynb
[`40_cagi6_sherloc_submission.ipynb`]: notebooks/40_cagi6_sherloc_submission.ipynb

CAGI6-Sherloc-clinical-classification strokach10/15/2021
CAGI6-MAPK3 strokach10/01/2021
CAGI6-MAPK1 strokach10/01/2021
CAGI6-CAM strokach10/01/2021
CAGI6-HMBS strokach10/01/2021
CAGI6-MTHFR ostrokach09/30/2021
az_dream_2015

| code        | features                                   | machine           |
| ----------- | ------------------------------------------ | ----------------- |
| `7f9826be`† | `base` + `AFwt`                            | Graham (44 cores) |
| `fd28687b`  | `base` + `AFwt`                            | Beluga (30 cores) |
| `900500fe`† | `base` + `AFwt` + `AFmut`                  | Beluga (30 cores) |
| `be3bdad5`  | `base` + `AFwt` + `AFmut`                  | Graham (44 cores) |
| `6999e5aa`  | `base` + `EL2` + `AFwt`                    | Graham (44 cores) |
| `4df6fd79`  | `base` + `EL2` + `AFwt` + `AFmut` [no opt] | Graham (44 cores) |
| `0d59c727`  | `base`                                     | Beluga (30 cores) |
| `eabf01fe`  | `base - rosetta`                           | Graham (44 cores) |

| `a7b1c747` | `base - rosetta - ps` | Graham (44 cores) |

#### Compare feature importances of structural methods

| code       | features                                                           | machine           |
| ---------- | ------------------------------------------------------------------ | ----------------- |
| `6d02ae59` | `proteinsolver-protbert-rosetta_ddg-alphafold_wt`                  | Graham (44 cores) |
| `b2d0dfb9` | `proteinsolver-protbert-rosetta_ddg-alphafold_wt-alphafold_change` | Graham (44 cores) |
| `1855e7a4` | `proteinsolver`                                                    | Graham (44 cores) |
| `a6b35daa` | `protbert`                                                         | Graham (44 cores) |
| `2cf623ec` | `rosetta_ddg`                                                      | Graham (44 cores) |
| `bfda8ca8` | `alphafold_wt`                                                     | Graham (44 cores) |
| `b93fddbb` | `alphafold_change`                                                 | Graham (44 cores) |

#### With humsavar

- `f6be01c3`

#### Do not weigh probable and likely mutations differently

- `678e7e39` | `base` + `AFwt` (no weights)
- `c8fef37f` | `base` + `AFwt+mut` (no weights)

#### Set `metric="binary_logloss"` and `is_unbalance=True`

Did not work out well (weird feature elimination curves and lower accuracy in the end)

- `3d9abe70` | `base` + `AFwt` (binary_logloss + is_unbalance)
- `38af39b4` `13edb1b7` [`base` + `AFwt` + `AFmut` (binary_logloss + is_unbalance) ]

# Submission for CAGI6—CAM challenge

## Overview

- `strokach_modelnumber_1.tsv` → Predictions made using ELASPIC2 [1].
- `strokach_modelnumber_2.tsv` → Predictions made using ProteinSolver [2].
- `strokach_modelnumber_3.tsv` → Predictions made using ProtBert [3].
- `strokach_modelnumber_4.tsv` → Predictions made using Rosetta's cartesian_ddg protocol [4].
- `strokach_modelnumber_5.tsv` → Predictions made using ELASPIC2 [5] with AlphaFold features for wildtype protein.
- `strokach_modelnumber_6.tsv` → Predictions made using ELASPIC2 [5] with AlphaFold features for wildtype and mutant proteins.

## References

- [1] Strokach et al. (2021). _ELASPIC2 (EL2): Combining Contextualized Language Models and Graph Neural Networks to Predict Effects of Mutations._ https://doi.org/10.1016/j.jmb.2021.166810
- [2] Strokach et al. (2020). _Fast and Flexible Protein Design Using Deep Graph Neural Networks._ https://doi.org/10.1016/j.cels.2020.08.016
- [3] Elnaggar et al. (2020). _ProtTrans: Towards Cracking the Language of Life’s Code Through Self-Supervised Deep Learning and High Performance Computing._ https://doi.org/10.1101/2020.07.12.199554
- [4] Park et al. (2016). _Simultaneous Optimization of Biomolecular Energy Functions on Features from Small Molecules and Macromolecules._ https://doi.org/10.1021/acs.jctc.6b00819
- [5] Jumper et al. (2021). _Highly accurate protein structure prediction with AlphaFold._ https://doi.org/10.1038/s41586-021-03819-2
