{% snapshot scd_table %}
{{
       config(
         target_schema='random',
         strategy='check',
         unique_key='ID', 
         check_cols=['First_Name','Last_Name'], 

        ) 
}}


{% endsnapshot %}
