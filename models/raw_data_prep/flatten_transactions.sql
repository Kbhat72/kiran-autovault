
SELECT
    TRSACTION:CUSTOMER_ID::STRING AS CUSTOMER_ID,
    TRSACTION:DATE_OF_SESSION::TIMESTAMP_NTZ AS SESSION_DATE,
    VALUE:PRODUCT_ID::STRING AS PRODUCT_ID,
    VALUE:PRICE::NUMBER AS PRICE,
    'ALL_TRANSACTIONS' AS RECORD_SOURCE,
    TO_TIMESTAMP_NTZ(CURRENT_TIMESTAMP) AS LOAD_DATE
 
  FROM
   {{source('AV', 'TRANSACTIONS')}}, LATERAL FLATTEN(INPUT => TRSACTION:PRODUCTS_VIEWED)

