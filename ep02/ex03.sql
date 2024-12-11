/* Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria.
Considere apenas objetos que tenham a descrição maior ou igual a 100. */

SELECT product_category_name,
avg(product_name_lenght) as tamanho_medio_nome,
max(product_name_lenght) as tamanho_max_nome,
min(product_name_lenght) as tamanho_min_nome
FROM tb_products
WHERE product_description_lenght >= 100
GROUP BY product_category_name
