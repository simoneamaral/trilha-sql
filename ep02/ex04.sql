/* Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria.
Considere apenas objetos que tenham a descrição maior que 100. 
Exiba apenas categorias com tamanho médio de descrição do objeto maior que 500 caracteres.*/

SELECT product_category_name,
avg(product_name_lenght) as tamanho_nome_medio,
max(product_name_lenght) as tamanho_nome_max,
min(product_name_lenght) as tamanho_nome_min
FROM tb_products
WHERE product_description_lenght > 100 
GROUP BY product_category_name
HAVING avg(product_description_lenght)  > 500
ORDER BY min(product_name_lenght) DESC, 
max(product_name_lenght) DESC