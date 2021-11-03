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
