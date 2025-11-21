select *
from {{source("owais resources","Payment_Modes")}}

select 
sum (case when PAYMENT_MODE='upi' then SALES END) as UPI_SALES
,sum (case when PAYMENT_MODE='cash' then SALES END) as CASH_SALES
,sum (case when PAYMENT_MODE='dc' then SALES END) as DC_SALES
,sum (case when PAYMENT_MODE='cvoucher' then SALES END) as CVOUCHER_SALES
from 
{{source("owais resources","Payment_Modes")}}



{% set payment_mode=['upi','cash','dc','cvoucher'] %}
select 
{% for i in payment_mode %}
{{i}}
{% endfor %}
from {{source("owais resources","Payment_Modes")}}



{% set payment_modes=dbt_utils.get_column_values(source("owais resources",'PAYMENT_MODES'),'PAYMENT_MODES') %} 
{{PAYMENT_MODES}}
SELECT
{% for i in payment_modes %}
SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i}}_sales,
{% endfor %}
FROM {{source("owais resources","Payment_Mode")}}




{% set payment_modes=dbt_utils.get_column_values(source("owais resources",'PAYMENT_MODES'),'PAYMENT_MODES') %} 
{{PAYMENT_MODES}}
SELECT
{% for i in payment_modes %}
SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i}}_sales {%- if not loop-last -%},{% endif %}
{% endfor %}
FROM {{source("owais resources","Payment_Mode")}}

---upper case



{% set payment_modes=dbt_utils.get_column_values(source("owais resources",'PAYMENT_MODES'),'PAYMENT_MODES') %} 
{{PAYMENT_MODES}}
SELECT
{% for i in payment_modes %}
SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i}}_sales {%- if not loop-last -%},{% endif %}
{% endfor %}
FROM {{source("owais resources","Payment_Mode")}}

----Adding comma in different wa-----


{% set payment_modes=dbt_utils.get_column_values(source("owais resources",'PAYMENT_MODES'),'PAYMENT_MODES') %} 
{{PAYMENT_MODES}}
SELECT
{% for i in payment_modes %}
SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i}}_sales
{% if loop.index < loop.length %},{% endif %}
{% endfor %}
FROM {{source("owais resources","Payment_Mode")}}