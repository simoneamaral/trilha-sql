/* Quais são os 5 produto mais caros que os sellers venderam. 
Considere apenas pedidos entregues. */

WITH tb_seller_product as (
    SELECT seller_id,
    product_id,
    count(*) as qtd_produto,
    sum(price) as receita_produto	
    FROM tb_orders as t1
    LEFT JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id
    WHERE order_status = 'delivered'
    GROUP BY seller_id, 
    product_id	
    ORDER BY seller_id
),

tb_seller_sort as (
    SELECT *,
    row_number() over ( PARTITION by seller_id ORDER BY qtd_produto DESC, receita_produto DESC) as order_qtd  
    FROM tb_seller_product
)

SELECT seller_id,
product_id,
qtd_produto
FROM tb_seller_sort
WHERE order_qtd <= 5