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
on t1.product_id = t2.product_id
GROUP BY t2.product_category_name
ORDER BY sum(t1.price) DESC
LIMIT 10

/*
SELECT t2.product_category_name,
sum(t1.price) as receita,
count(*) as total_itens_vendidos,
count(DISTINCT t1.order_id) as qtd_pedidos,
round(count(*) / cast(count(DISTINCT t1.order_id) as float), 2) as avg_item_por_pedido
FROM tb_order_items as t1
LEFT JOIN tb_products as t2
on t1.product_id = t2.product_id
GROUP BY t2.product_category_name
ORDER BY count(*) / cast(count(DISTINCT t1.order_id) as float) DESC
LIMIT 10
*/