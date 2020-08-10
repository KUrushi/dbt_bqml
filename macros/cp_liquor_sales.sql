-- confiを設定してもmacFitro上でcreate句は自動で追加されないので、手動でやる必要がある
{% macro cp_liquor_data() %}
CREATE TABLE IF NOT EXISTS {{target.schema}}.sales AS
SELECT 
 * 
FROM {{var("bq_public_path")}}
{% endmacro %}
