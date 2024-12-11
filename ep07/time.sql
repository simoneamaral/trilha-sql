WITH tb_marcacao_seller as (
    SELECT t2.seller_id,
    max(t1.order_approved_at) as dt_ultima_venda,
    '2018-07-01' as dt_atual,
    
    /* Isso é o marketing quer, seller sem venda com mais de 90 dias*/
    julianday('2018-07-01') - julianday(max(t1.order_approved_at)) as dt_ult_venda,
    CASE WHEN julianday('2018-07-01') - julianday(max(t1.order_approved_at)) > 90
    THEN 1 ELSE 0
    END as flag_venda_90dias,

    /* Isso é a nossa proposta, seller sem venda a partir de sua média de tempo entre vendas*/
    t3.tempo_medio_entre_vendas,
    CASE WHEN julianday('2018-07-01') - julianday(max(t1.order_approved_at)) < t3.tempo_medio_entre_vendas
    THEN 1 ELSE 0
    END as flag_avg_tempo

FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_avg_tempo_entre_vendas_seller as t3
ON t2.seller_id = t3.seller_id

WHERE date(t1.order_approved_at) < '2018-07-01'
AND t1.order_status = 'delivered'
GROUP BY t2.seller_id

)

SELECT flag_venda_90dias,
flag_avg_tempo,
count(*)
FROM tb_marcacao_seller

GROUP BY flag_venda_90dias,
flag_avg_tempo