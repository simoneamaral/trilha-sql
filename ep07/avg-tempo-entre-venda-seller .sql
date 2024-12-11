-- Tempo medio entre vendas dos sellers. Considere apenas pedidos entregues.
DROP TABLE IF EXISTS tb_avg_tempo_entre_vendas_seller;
CREATE TABLE tb_avg_tempo_entre_vendas_seller as 
WITH tb_seller_order as (
    SELECT t1.order_id,
    date(t1.order_approved_at) as data_venda,
    t2.seller_id
    FROM tb_orders as t1
    LEFT JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id
    WHERE order_status = 'delivered'
),

tb_seller_order_sort as (
    SELECT *,
    row_number() OVER (PARTITION BY seller_id, data_venda) as date_seller_order
    from tb_seller_order
),

tb_seller_lag_data as (
    SELECT order_id,
    seller_id,
    data_venda,
    lag(data_venda) OVER (PARTITION BY seller_id ORDER BY data_venda) as lag_data_venda 
    FROM tb_seller_order_sort
    WHERE date_seller_order = 1
),

tb_tempo_vendas_seller as (
    SELECT seller_id,
    julianday(data_venda) - julianday(lag_data_venda) as diff_dias
    FROM tb_seller_lag_data
    WHERE lag_data_venda IS NOT NULL
)

SELECT seller_id,
avg(diff_dias) as tempo_medio_entre_vendas
FROM tb_tempo_vendas_seller
GROUP BY seller_id;

