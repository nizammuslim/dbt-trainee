SELECT
    o.order_id ,
    o.order_date ,
    o.ship_date ,
    o.ship_mode ,
    o.customer_id ,
     o.product_id,
     p.category,
     p.product_id,
     p.product_name,
     p.subcategory,
   (O.ORDER_SELLING_PRICE -O.ORDER_COST_PRICE) AS ORDER_PROFIT
     FROM 
     {{ ref('orders') }} AS O
      cross join
     {{ ref('PRODUCTS') }} AS P
     ON P.PRODUCT_ID=O.PRODUCT_ID
    
