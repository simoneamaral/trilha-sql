/* Qual o valor total de receita gerada porcada estado? 
Considere a base completa, com apenas pedidos entregues. */

SELECT t3.customer_state,
sum(t1.price) as receita,
sum(t1.price) /  count(DISTINCT t2.customer_id) as media_receita_cliente,
count(DISTINCT t1.order_id) as qtd_pedidos
FROM tb_order_items as t1
LEFT JOIN tb_orders as t2
ON t1.order_id = t2.order_id
LEFT JOIN tb_customers as t3
ON t3.customer_id = t2.customer_id
WHERE t2.order_status = 'delivered'
GROUP BY t3.customer_state
ORDER BY sum(t1.price) DESC

