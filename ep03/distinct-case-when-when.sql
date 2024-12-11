-- Lista das categorias por ordem alfabética.
/* 

 CASE WHEN -> CASO QUANDO
 THEN -> ENTÃO

CASE INICIA
END FIM 

*/

SELECT 
DISTINCT CASE WHEN product_category_name IS NULL THEN 'outros'
WHEN product_category_name = 'alimentos' 
OR product_category_name = 'alimentos_bebidas' THEN 'alimentos'
WHEN product_category_name in('artes', 'artes_e_artesanato') THEN 'artes'
WHEN product_category_name  LIKE "%artigos%" THEN 'artigos'
ELSE product_category_name 
END as categoria
FROM tb_products 
ORDER BY categoria