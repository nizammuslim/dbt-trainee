SELECT
o.*
  ,p.*
  ,(O.ORDER_SELLING_PRICE -O.ORDER_COST_PRICE) AS ORDER_PROFIT
 FROM 
     {{ ref('orders') }} AS O
      cross join
     {{ ref('PRODUCTS') }} AS P
     ON P.PRODUCT_ID=O.PRODUCT_ID
    
