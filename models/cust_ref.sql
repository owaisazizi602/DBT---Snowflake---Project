select *, '{{invocation_id}}' as invocation_id
from {{ref("cust_mazeralized_ephemeral")}}