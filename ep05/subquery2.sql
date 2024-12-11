-- Receita por estado do seller, por produto das 3 categorias mais vendidas.

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
LEFT JOIN (
    SELECT t2.product_category_name,
    1 as flag_categoria
    FROM tb_order_items as t1
    LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id
    GROUP BY t2.product_category_name
    ORDER BY count(*) DESC
    LIMIT 3
) as t4
ON t3.product_category_name = t4.product_category_name
WHERE t4.flag_categoria = 1

GROUP BY t1.product_id,
t2.seller_state,
t3.product_category_name

