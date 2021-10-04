| code        | features                                   | machine           |
| ----------- | ------------------------------------------ | ----------------- |
| `7f9826be`† | `base` + `AFwt`                            | Graham (44 cores) |
| `900500fe`† | `base` + `AFwt` + `AFmut`                  | Beluga (30 cores) |
| `fd28687b`  | `base` + `AFwt`                            | Beluga (30 cores) |
| `be3bdad5`  | `base` + `AFwt` + `AFmut`                  | Graham (44 cores) |
| `6999e5aa`  | `base` + `EL2` + `AFwt`                    | Graham (44 cores) |
| `4df6fd79`  | `base` + `EL2` + `AFwt` + `AFmut` [no opt] | Graham (44 cores) |

 | `0d59c727` | `base` | Beluga (30 cores) |
| `eabf01fe` | `base - rosetta` | Graham (44 cores) |
| `a7b1c747` | `base - rosetta - af` | Graham (44 cores) |

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
