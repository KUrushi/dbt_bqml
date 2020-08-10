{% macro train_dnn() %}
CREATE MODEL IF NOT EXISTS{{target.schema}}.dnn_regressor
OPTIONS(
    MODEL_TYPE = "DNN_REGRESSOR",
    BATCH_SIZE=128,
    ACTIVATION_FN="SELU",
    DROPOUT=0.1,
    HIDDEN_UNITS = [128, 64, 32, 16],
    EARLY_STOP=TRUE,
    INPUT_LABEL_COLS=["monthly_revenues"]
)
AS 
SELECT *
FROM {{ref("datasets")}}
{% endmacro %}