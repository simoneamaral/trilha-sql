/*

COALESCE -> substitui nulo por 'outros'
COALESCE -> em uma lista pega o primeiro valor não nulo

*/

SELECT DISTINCT coalesce(product_category_name, 'outros') as categoria

FROM tb_products 

ORDER BY categoria