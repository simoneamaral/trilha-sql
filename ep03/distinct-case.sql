-- Lista das categorias por ordem alfabética.
/* 

 CASE WHEN -> CASO QUANDO
 THEN -> ENTÃO

CASE INICIA
END FIM 

*/

SELECT 
DISTINCT CASE WHEN product_category_name IS NULL THEN 'outros'
ELSE product_category_name END as categoria
FROM tb_products 
/* WHERE product_category_name is not null */
ORDER BY categoria