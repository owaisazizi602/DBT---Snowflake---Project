select *
from {{source("owais resources","USERS")}}
where sales > 1000;
