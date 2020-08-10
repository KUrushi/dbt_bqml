{% macro get_top_three(column_name) %}
{% for i in range(0, 3) %}
    {{column_name}}[OFFSET({{i}})] AS {{column_name}}_{{i+1}},
{% endfor %}
{% endmacro %}