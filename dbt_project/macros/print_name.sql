{% macro print_name(name) %}
    {% set query %}
    select '{{ name }}' as name
  {% endset %}
    {{ log("running macro" ~ query, info = true) }}

    {% set results = run_query(query) %}
    {% if execute %}
      {% set results = results %}
      {{ log("Results from query: " ~ results) }}
  {% else %}
      {{ log("Query not executed in this context") }}
  {% endif %}

{% endmacro %}
