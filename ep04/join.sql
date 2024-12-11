-- Qual a receita de cada categoria de produto?
-- E o total de vendas?
-- Em unidades e em pedidos?

/*SELECT * FROM tb_products -- tabela de produtos */

/*SELECT * from tb_orders -- tabela de vendas */

SELECT t1.order_id, t1.order_item_id, t1.product_id, t1.price,
 t2.product_category_name FROM tb_order_items as t1
LEFT JOIN tb_products as t2
on t1.product_id = t2.product_id