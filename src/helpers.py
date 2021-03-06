import json

import lightgbm as lgb
import numpy as np
import pandas as pd


def load_features(notebook_dir, unique_id):
    with notebook_dir.joinpath(
        "38_cagi6_sherloc_train_model", unique_id, "scalar-features.json"
    ).open("rb") as fin:
        scalar_features = json.load(fin)

    with notebook_dir.joinpath(
        "38_cagi6_sherloc_train_model", unique_id, "vector-features.json"
    ).open("rb") as fin:
        vector_features = json.load(fin)

    return scalar_features, vector_features


def load_features_to_exclude(notebook_dir, unique_id, model_type):
    if model_type == "initial":
        features_to_exclude = None
    elif model_type == "optimized":
        with notebook_dir.joinpath(
            "39_cagi6_sherloc_finetune_model",
            unique_id,
            "best-features-to-exclude.json",
        ).open("rt") as fin:
            features_to_exclude = json.load(fin)
    else:
        raise ValueError(f"Incorrect model type: {model_type!r}.")

    return features_to_exclude


def load_best_parameters(notebook_dir, unique_id, model_type):
    if model_type == "initial":
        with notebook_dir.joinpath(
            "38_cagi6_sherloc_train_model", unique_id, "best-parameters-starting.json"
        ).open("rb") as fin:
            best_parameters = json.load(fin)
    elif model_type == "optimized":
        with notebook_dir.joinpath(
            "39_cagi6_sherloc_finetune_model", unique_id, "best-parameters.json"
        ).open("rt") as fin:
            best_parameters = json.load(fin)
    else:
        raise ValueError(f"Incorrect model type: {model_type!r}.")

    return best_parameters


def load_best_models(notebook_dir, unique_id, model_type):
    if model_type == "initial":
        model_filename_template = str(
            notebook_dir.joinpath(
                "38_cagi6_sherloc_train_model",
                unique_id,
                "model-starting-{model_idx}.txt",
            )
        )
    elif model_type == "optimized":
        model_filename_template = str(
            notebook_dir.joinpath(
                "39_cagi6_sherloc_finetune_model",
                unique_id,
                "best-model-{model_idx}.txt",
            )
        )
    else:
        raise ValueError(f"Incorrect model type: {model_type!r}.")

    models = [
        lgb.Booster(model_file=model_filename_template.format(model_idx=model_idx))
        for model_idx in range(6)
    ]
    assert len(models) == 6

    return models


def expand_arrays(input_df, vector_features):
    row = next(input_df[vector_features].itertuples(index=False))._asdict()

    expanded_vector_dfs = []
    column_group_map = {}
    expanded_vector_features = []
    for column, data in row.items():
        new_columns = [f"{column}_{i}" for i in range(len(data))]
        expanded_vector_features += new_columns
        column_group_map |= {nc: column for nc in new_columns}
        new_df = pd.DataFrame(np.vstack(input_df[column].values), columns=new_columns)
        expanded_vector_dfs.append(new_df)

    remaining_features = [c for c in input_df if c not in vector_features]

    return (
        pd.concat([input_df[remaining_features].reset_index(drop=True)] + expanded_vector_dfs, axis=1),
        column_group_map,
        expanded_vector_features,
    )