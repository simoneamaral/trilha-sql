/* Qual o peso médio dos produtos vendidos por sellers de cada estado? 
Considere apenas o ano de 2017 e pedidos entregues. */

SELECT t3.seller_state,
avg(t1.product_weight_g) as peso_medio
FROM tb_products as t1
LEFT JOIN tb_order_items as t2
ON t1.product_id = t2.product_id
LEFT JOIN tb_sellers as t3
ON t2.seller_id = t3.seller_id
LEFT JOIN tb_orders as t4
ON t4.order_id = t2.order_id
WHERE t4.order_status = 'delivered'
AND strftime('%Y',t4.order_approved_at) = '2017'
GROUP BY t3.seller_state
ORDER BY avg(t1.product_weight_g) DESC