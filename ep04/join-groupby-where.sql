-- Considerando as vendas de 2017 e pedidos entregues
-- Qual a receita de cada categoria de produto?
-- E o total de vendas?
-- Em unidades e em pedidos?


/*SELECT * FROM tb_products -- tabela de produtos */

/*SELECT * from tb_orders -- tabela de vendas */

SELECT t2.product_category_name,
sum(t1.price) as receita,
count(*) as total_itens_vendidos,
count(DISTINCT t1.order_id) as qtd_pedidos
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id
LEFT JOIN tb_orders as t3
ON t3.order_id = t1.order_id
WHERE t3.order_status = 'delivered'
AND strftime('%Y',t3.order_approved_at) = '2017' 
GROUP BY t2.product_category_name
ORDER BY sum(t1.price) DESC
LIMIT 10

