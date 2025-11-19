select *
from {{source("owais resources","USERS")}}



{% set list_of_countries=dbt_utils.get_column_values(source("owais resources","USERS"),'Country') %}
{{list_of_countries}}