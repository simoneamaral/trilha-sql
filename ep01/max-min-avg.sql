SELECT product_category_name,
count(*) as qtd_produtos,
max(product_weight_g) as maior_peso,
min(product_weight_g) as menor_peso,
avg(product_weight_g) as media_peso 
FROM tb_products
WHERE product_category_name is NOT NULL
AND product_category_name != 'alimentos'
AND product_category_name <> 'alimentos_bebidas'
GROUP BY product_category_name