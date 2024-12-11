/* Qual o valor total de receita gerada por sellers de cada estado? 
Considere a base completa, com apenas pedidos entregues. */ 

SELECT t3.seller_state,
sum(t1.price) as receita,
sum(t1.price) / count(DISTINCT t1.seller_id) as media_por_seller,
count(DISTINCT t1.seller_id) as qtd_seller
FROM tb_order_items as t1
LEFT JOIN tb_orders as t2
ON t1.order_id = t2.order_id
LEFT JOIN tb_sellers as t3
ON t3.seller_id = t1.seller_id
WHERE t2.order_status = 'delivered'
GROUP BY t3.seller_state
ORDER BY sum(t1.price) DESC