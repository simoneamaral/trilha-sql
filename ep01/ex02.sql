-- Quantos produtos tem mais de 5 litros?

SELECT count(*) as qtd_mais_5_litros,
count(DISTINCT product_id) as product_id_distinto
FROM tb_products
WHERE product_length_cm * product_width_cm * product_height_cm  / 1000 > 5