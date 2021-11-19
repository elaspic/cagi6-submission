# CAGI6 community assessment

- [ELASPIC3 — ELASPIC2 but with AlphaFold 😛](#elaspic3--elaspic2-but-with-alphafold-)
  - [Compare feature importances of structural methods](#compare-feature-importances-of-structural-methods)
    - [With humsavar](#with-humsavar)
    - [Do not weigh probable and likely mutations differently](#do-not-weigh-probable-and-likely-mutations-differently)
    - [Set `metric="binary_logloss"` and `is_unbalance=True`](#set-metricbinary_logloss-and-is_unbalancetrue)
- [Individual challenges](#individual-challenges)
  - [CAM](#cam)
  - [MAPK1](#mapk1)
  - [MAPK3](#mapk3)
  - [MTHFR](#mthfr)
  - [HMBS](#hmbs)
  - [Sherloc](#sherloc)
- [References](#references)

## ELASPIC3 — ELASPIC2 but with AlphaFold 😛

We trained multiple models using different sets of features.

<details>
<summary><b>Description of models that were trained</b></summary>

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

| code       | features              | machine           |
| ---------- | --------------------- | ----------------- |
| `a7b1c747` | `base - rosetta - ps` | Graham (44 cores) |

</details>

### Compare feature importances of structural methods

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

## Individual challenges

### CAM

Overview: <http://genomeinterpretation.org/cagi6-cam.html>.

Our submission: <https://www.synapse.org/#!Synapse:syn26145788/files/>.

<details>
<summary><b>Relevant notebooks</b></summary>

| Name                                | Description                                                    |
| ----------------------------------- | -------------------------------------------------------------- |
| 🗒 [`40_cagi6_cam_submission.ipynb`] | Load the CAM dataset, generate features, and make predictions. |

[`40_cagi6_cam_submission.ipynb`]: notebooks/40_cagi6_cam_submission.ipynb

</details>

<details>
<summary><b>Submission files</b></summary>

| Filename                     | Description                                                                                                 |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `strokach_modelnumber_1.tsv` | Predictions made using ELASPIC2 [1].                                                                        |
| `strokach_modelnumber_2.tsv` | Predictions made using ProteinSolver [2].                                                                   |
| `strokach_modelnumber_3.tsv` | Predictions made using ProtBert [3].                                                                        |
| `strokach_modelnumber_4.tsv` | Predictions made using Rosetta's cartesian_ddg protocol [4].                                                |
| `strokach_modelnumber_5.tsv` | Predictions made using ELASPIC3 [`7f9826be`] with AlphaFold [5] features for wildtype protein .             |
| `strokach_modelnumber_6.tsv` | Predictions made using ELASPIC3 [`900500fe`] with AlphaFold [5] features for wildtype and mutant proteins . |

</details>

### MAPK1

Overview: <http://genomeinterpretation.org/cagi6-mapk1.html>.

Our submission: <https://www.synapse.org/#!Synapse:syn26145783/files/>.

<details>
<summary><b>Relevant notebooks</b></summary>

| Name                                  | Description                                                      |
| ------------------------------------- | ---------------------------------------------------------------- |
| 🗒 [`40_cagi6_mapk1_submission.ipynb`] | Load the MAPk1 dataset, generate features, and make predictions. |

[`40_cagi6_mapk1_submission.ipynb`]: notebooks/40_cagi6_mapk1_submission.ipynb

</details>

<details>
<summary><b>Submission files</b></summary>

| Filename                     | Description                                                                                                 |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `strokach_modelnumber_1.tsv` | Predictions made using ELASPIC2 [1].                                                                        |
| `strokach_modelnumber_2.tsv` | Predictions made using ProteinSolver [2].                                                                   |
| `strokach_modelnumber_3.tsv` | Predictions made using ProtBert [3].                                                                        |
| `strokach_modelnumber_4.tsv` | Predictions made using Rosetta's cartesian_ddg protocol [4].                                                |
| `strokach_modelnumber_5.tsv` | Predictions made using ELASPIC3 [`7f9826be`] with AlphaFold [5] features for wildtype protein .             |
| `strokach_modelnumber_6.tsv` | Predictions made using ELASPIC3 [`900500fe`] with AlphaFold [5] features for wildtype and mutant proteins . |

</details>

### MAPK3

Overview: <http://genomeinterpretation.org/cagi6-mapk3.html>.

Our submission: <https://www.synapse.org/#!Synapse:syn26145778/files/>.

<details>
<summary><b>Relevant notebooks</b></summary>

| Name                                  | Description                                                      |
| ------------------------------------- | ---------------------------------------------------------------- |
| 🗒 [`40_cagi6_mapk3_submission.ipynb`] | Load the MAPk3 dataset, generate features, and make predictions. |

[`40_cagi6_mapk3_submission.ipynb`]: notebooks/40_cagi6_mapk3_submission.ipynb

</details>

<details>
<summary><b>Submission files</b></summary>

| Filename                     | Description                                                                                                 |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `strokach_modelnumber_1.tsv` | Predictions made using ELASPIC2 [1].                                                                        |
| `strokach_modelnumber_2.tsv` | Predictions made using ProteinSolver [2].                                                                   |
| `strokach_modelnumber_3.tsv` | Predictions made using ProtBert [3].                                                                        |
| `strokach_modelnumber_4.tsv` | Predictions made using Rosetta's cartesian_ddg protocol [4].                                                |
| `strokach_modelnumber_5.tsv` | Predictions made using ELASPIC3 [`7f9826be`] with AlphaFold [5] features for wildtype protein .             |
| `strokach_modelnumber_6.tsv` | Predictions made using ELASPIC3 [`900500fe`] with AlphaFold [5] features for wildtype and mutant proteins . |

</details>

### MTHFR

Overview: <http://genomeinterpretation.org/cagi6-mthfr.html>.

Our submission: <https://www.synapse.org/#!Synapse:syn25891794/files/>.

<details>
<summary><b>Relevant notebooks</b></summary>

| Name                                  | Description                                                      |
| ------------------------------------- | ---------------------------------------------------------------- |
| 🗒 [`35_cagi_mthfr_predictions.ipynb`] | Load the MTHFR dataset, generate features, and make predictions. |
| 🗒 [`40_cagi6_mthfr_submission.ipynb`] | Prepare submission for the CAGI6 challenge.                      |

[`35_cagi_mthfr_predictions.ipynb`]: notebooks/35_cagi_mthfr_predictions.ipynb
[`40_cagi6_mthfr_submission.ipynb`]: notebooks/40_cagi6_mthfr_submission.ipynb

</details>

<details>
<summary><b>Submission files</b></summary>

| Filenames                                                                                                                                        | Description                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- |
| `ostrokach_cataWT_model_1.tsv` <br /> `ostrokach_cataAV_model_1.tsv` <br /> `ostrokach_reguWT_model_1.tsv` <br /> `ostrokach_reguAV_model_1.tsv` | Predictions were made using ELASPIC2 [1] and were adjusted to match the target distribution.      |
| `ostrokach_cataWT_model_2.tsv` <br /> `ostrokach_cataAV_model_2.tsv` <br /> `ostrokach_reguWT_model_2.tsv` <br /> `ostrokach_reguAV_model_2.tsv` | Predictions were made using ProteinSolver [2] and were adjusted to match the target distribution. |
| `ostrokach_cataWT_model_3.tsv` <br /> `ostrokach_cataAV_model_3.tsv` <br /> `ostrokach_reguWT_model_3.tsv` <br /> `ostrokach_reguAV_model_3.tsv` | Predictions were made using ProtBert [3] and were adjusted to match the target distribution.      |
| `ostrokach_cataWT_model_4.tsv` <br /> `ostrokach_cataAV_model_4.tsv` <br /> `ostrokach_reguWT_model_4.tsv` <br /> `ostrokach_reguAV_model_4.tsv` | Predictions were made using ELASPIC2 [1] without any subsequent adjustment.                       |
| `ostrokach_cataWT_model_5.tsv` <br /> `ostrokach_cataAV_model_5.tsv` <br /> `ostrokach_reguWT_model_5.tsv` <br /> `ostrokach_reguAV_model_5.tsv` | Predictions were made using ProteinSolver [2] without any subsequent adjustment.                  |
| `ostrokach_cataWT_model_6.tsv` <br /> `ostrokach_cataAV_model_6.tsv` <br /> `ostrokach_reguWT_model_6.tsv` <br /> `ostrokach_reguAV_model_6.tsv` | Predictions were made using ProtBert [3] without any subsequent adjustment.                       |

</details>

### HMBS

Overview: <http://genomeinterpretation.org/cagi6-hmbs.html>.

Our submission: <https://www.synapse.org/#!Synapse:syn26159218/files/>.

<details>
<summary><b>Relevant notebooks</b></summary>

| Name                                 | Description                                 |
| ------------------------------------ | ------------------------------------------- |
| 🗒 [`30_cagi6_hmbs.ipynb`]            | Load the HMBS dataset.                      |
| 🗒 [`35_cagi6_hmbs_alphafold.ipynb`]  | Generate AlphaFold2 features.               |
| 🗒 [`35_cagi6_hmbs_el2.ipynb`]        | Generate ELASPIC2 scores and features.      |
| 🗒 [`35_cagi6_hmbs_rosetta.ipynb`]    | Generate Rosetta scores and features.       |
| 🗒 [`40_cagi6_hmbs_submission.ipynb`] | Prepare submission for the CAGI6 challenge. |

[`30_cagi6_hmbs.ipynb`]: notebooks/30_cagi6_hmbs.ipynb
[`35_cagi6_hmbs_alphafold.ipynb`]: notebooks/35_cagi6_hmbs_alphafold.ipynb
[`35_cagi6_hmbs_el2.ipynb`]: notebooks/35_cagi6_hmbs_el2.ipynb
[`35_cagi6_hmbs_rosetta.ipynb`]: notebooks/35_cagi6_hmbs_rosetta.ipynb
[`35_cagi6_sherloc_el2.ipynb`]: notebooks/35_cagi6_sherloc_el2.ipynb
[`40_cagi6_hmbs_submission.ipynb`]: notebooks/40_cagi6_hmbs_submission.ipynb

</details>

<details>
<summary><b>Submission files</b></summary>

| Filename                     | Description                                                                                     |
| ---------------------------- | ----------------------------------------------------------------------------------------------- |
| `strokach_modelnumber_1.tsv` | Predictions made using ELASPIC2 [1].                                                            |
| `strokach_modelnumber_2.tsv` | Predictions made using ProteinSolver [2].                                                       |
| `strokach_modelnumber_3.tsv` | Predictions made using ProtBert [3].                                                            |
| `strokach_modelnumber_4.tsv` | Predictions made using Rosetta's cartesian_ddg protocol [4].                                    |
| `strokach_modelnumber_5.tsv` | Predictions made using ELASPIC3 [`7f9826be`] with AlphaFold [5] features for wildtype protein . |

</details>

### Sherloc

For the Sherloc clinical classification challenge, we trained new models using both the provided training data and the mutations listed in the UniProt [humsavar.txt](https://www.uniprot.org/docs/humsavar.txt) file.

Overview: <http://genomeinterpretation.org/cagi6-invitae.html>.

Our submission: <https://www.synapse.org/#!Synapse:syn26272013/files/>.

<details>
<summary><b>Relevant notebooks</b></summary>

| Name                                         | Description                                                                           |
| -------------------------------------------- | ------------------------------------------------------------------------------------- |
| 🗒 [`30_cagi6_sherloc.ipynb`]                 | Load the Sherloc dataset.                                                             |
| 🗒 [`30_humsavar.ipynb`]                      | Load the humsavar dataset.                                                            |
| 🗒 [`31_run_alphafold_wt.ipynb`]              | Generate AlphaFold embeddings.                                                        |
| 🗒 [`31_run_msa_analysis.ipynb`]              | Generate basic MSA features.                                                          |
| 🗒 [`31_run_protbert.ipynb`]                  | Generate ProtBert features.                                                           |
| 🗒 [`31_run_proteinsolver.ipynb`]             | Generate ProteinSolver features.                                                      |
| 🗒 [`31_run_rosetta_ddg.ipynb`]               | Generate Rosetta features.                                                            |
| 🗒 [`32_process_alphafold.ipynb`]             | Process AlphaFold embeddings into features.                                           |
| 🗒 [`37_cagi6_sherloc_combine_results.ipynb`] | Combine features generated using all methods for the Sherloc dataset.                 |
| 🗒 [`37_humsavar_combine_results.ipynb`]      | Combine features generated using all methods for the humsavar dataset.                |
| 🗒 [`38_cagi6_sherloc_train_model.ipynb`]     | Train a machine learning model using Sherloc + humsavar data.                         |
| 🗒 [`39_cagi6_sherloc_finetune_model.ipynb`]  | Finetune the trained machine learning model and perform feature elimination.          |
| 🗒 [`40_cagi6_sherloc_submission.ipynb`]      | Make predictions for the test dataset and prepare submission for the CAGI6 challenge. |

[`30_cagi6_sherloc.ipynb`]: notebooks/30_cagi6_sherloc.ipynb
[`30_humsavar.ipynb`]: notebooks/30_humsavar.ipynb
[`31_run_alphafold_wt.ipynb`]: notebooks/31_run_alphafold_wt.ipynb
[`31_run_msa_analysis.ipynb`]: notebooks/31_run_msa_analysis.ipynb
[`31_run_protbert.ipynb`]: notebooks/31_run_protbert.ipynb
[`31_run_proteinsolver.ipynb`]: notebooks/31_run_proteinsolver.ipynb
[`31_run_rosetta_ddg.ipynb`]: notebooks/31_run_rosetta_ddg.ipynb
[`32_process_alphafold.ipynb`]: notebooks/32_process_alphafold.ipynb
[`37_cagi6_sherloc_combine_results.ipynb`]: notebooks/37_cagi6_sherloc_combine_results.ipynb
[`37_humsavar_combine_results.ipynb`]: notebooks/37_humsavar_combine_results.ipynb
[`38_cagi6_sherloc_train_model.ipynb`]: notebooks/38_cagi6_sherloc_train_model.ipynb
[`39_cagi6_sherloc_finetune_model.ipynb`]: notebooks/39_cagi6_sherloc_finetune_model.ipynb
[`40_cagi6_sherloc_submission.ipynb`]: notebooks/40_cagi6_sherloc_submission.ipynb

</details>

<details>
<summary><b>Submission files</b></summary>

</details>

## References

- [1] Strokach et al. (2021). _ELASPIC2 (EL2): Combining Contextualized Language Models and Graph Neural Networks to Predict Effects of Mutations._ https://doi.org/10.1016/j.jmb.2021.166810
- [2] Strokach et al. (2020). _Fast and Flexible Protein Design Using Deep Graph Neural Networks._ https://doi.org/10.1016/j.cels.2020.08.016
- [3] Elnaggar et al. (2020). _ProtTrans: Towards Cracking the Language of Life’s Code Through Self-Supervised Deep Learning and High Performance Computing._ https://doi.org/10.1101/2020.07.12.199554
- [4] Park et al. (2016). _Simultaneous Optimization of Biomolecular Energy Functions on Features from Small Molecules and Macromolecules._ https://doi.org/10.1021/acs.jctc.6b00819
- [5] Jumper et al. (2021). _Highly accurate protein structure prediction with AlphaFold._ https://doi.org/10.1038/s41586-021-03819-2
