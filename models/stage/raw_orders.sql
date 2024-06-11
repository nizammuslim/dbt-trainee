SELECT
o.*
  ,c.*
  ,p.*
  ,(O.ORDER_SELLING_PRICE -O.ORDER_COST_PRICE) AS ORDER_PROFIT
 FROM 
     {{ ref('orders') }} AS O
 left join
     {{ ref('CUSTOMER') }} AS C
     ON C.CUSTOMER_ID=O.CUSTOMER_ID
LEFT JOIN 
        {{ ref('PRODUCTS') }} AS P
    ON P.PRODUCT_ID=O.PRODUCT_ID

    {{
        config(
            materialized='table'
        )
    }}
    