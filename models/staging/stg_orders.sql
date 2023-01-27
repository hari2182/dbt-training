select 
--from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice-o.ordercostprice as orderprofit,
--from raw customer
c.customername,
c.segment,
c.customerid,
c.country,
---from product
p.category,
p.productid,
p.productname,
p.subcategory,
{{ markup('ordersellingprice','ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid

{{limit_data_in_dev('orderdate')}}