{% snapshot scd_table %}

{{
       config(
         target_schema='random',
         strategy='check',
         unique_key='ID', --column name
         check_cols=['First_Name','Last_Name'], ---column name

        ) 



}}



select *
from{{source()}}

{% endsnapshot %}