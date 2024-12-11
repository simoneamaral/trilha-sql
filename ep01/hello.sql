/*
SELECT *
FROM tb_sellers
LIMIT 5

SELECT seller_city, seller_state 
FROM tb_sellers

SELECT *  FROM tb_sellers 
WHERE seller_state = 'MG'

SELECT product_id, product_photos_qty, product_category_name 
FROM tb_products WHERE (product_category_name = 'bebes'
AND product_photos_qty > 1) 
OR (product_category_name = 'brinquedos'
AND product_photos_qty > 5)

SELECT product_id, product_category_name 
FROM tb_products
WHERE product_category_name = 'artes'*/

PRAGMA table_info(tb_products)


