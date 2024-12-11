SELECT seller_state, 
count(*) as qtd_sellers
FROM tb_sellers
WHERE seller_state IN ('SP','RJ', 'PR')
GROUP BY seller_state
HAVING count(*) > 200