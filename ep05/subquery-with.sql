-- Receita por estado do seller, por produto das 3 categorias mais vendidas.

/* WITH tb_best_categoria as (
    SELECT t2.product_category_name
    FROM tb_order_items as t1
    LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id
    GROUP BY t2.product_category_name
    ORDER BY count(*) DESC
    LIMIT 3
)

SELECT 
t1.product_id,
t2.seller_state,
t3.product_category_name,
sum(t1.price) as receita_total
FROM tb_order_items as t1
LEFT JOIN tb_sellers as t2
ON t1.seller_id = t2.seller_id
LEFT JOIN tb_products as t3
ON t1.product_id = t3.product_id
INNER JOIN tb_best_categoria as t4
ON t3.product_category_name = t4.product_category_name


GROUP BY t1.product_id,
t2.seller_state,
t3.product_category_name */


WITH tb_best_categoria as (
    SELECT t2.product_category_name
    FROM tb_order_items as t1
    LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id
    GROUP BY t2.product_category_name
    ORDER BY count(*) DESC
    LIMIT 3
),

tb_vendas as (
SELECT * FROM tb_orders as t1
WHERE t1.order_status = 'delivered'
),

tb_receita_por_estado as (
SELECT t1.product_id,
t2.seller_state,
t3.product_category_name,
sum(t1.price) as receita_total
FROM tb_order_items as t1
LEFT JOIN tb_sellers as t2
ON t1.seller_id = t2.seller_id
LEFT JOIN tb_products as t3
ON t1.product_id = t3.product_id
INNER JOIN tb_vendas as t4
ON t1.order_id = t4.order_id

GROUP BY t1.product_id,
t2.seller_state,
t3.product_category_name
)

SELECT * FROM tb_receita_por_estado as t1
INNER JOIN tb_best_categoria as t2
ON t1.product_category_name = t2.product_category_name