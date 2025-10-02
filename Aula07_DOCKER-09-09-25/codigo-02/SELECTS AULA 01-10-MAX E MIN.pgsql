SELECT * FROM vendas_itens2


SELECT
    venda_id,
    ROUND(SUM(quantidade * valor_unitario)::numeric,2) AS total_vendas
FROM 
    vendas_itens2
GROUP BY venda_id
ORDER BY total_vendas;


-- VENDA COM TOTAL VENDAS
SELECT ROUND(AVG(total_vendas)::numeric,2) AS media_total_vendas
FROM 
    (SELECT
        venda_id,
        ROUND(sum(quantidade * valor_unitario)::numeric,2) AS total_vendas
    FROM vendas_itens2
GROUP BY venda_id) AS total_vendas;


--VENDA MINIMA E MAXIMA
SELECT 
    ROUND(AVG(total_vendas)::numeric, 2) AS media_total_vendas,
    ROUND(MIN(total_vendas)::numeric, 2) AS minimo_vendas,
    ROUND(MAX(total_vendas)::numeric, 2) AS maximo_vendas
FROM (
    SELECT
        venda_id,
        ROUND(SUM(quantidade * valor_unitario)::numeric, 2) AS total_vendas
    FROM vendas_itens2
    GROUP BY venda_id) AS vendas_totais;


--VENDA MINIMA E MAXIMA COM OS IDS DAS VENDAS
SELECT venda_id, total_vendas
FROM (SELECT
        venda_id,
        ROUND(SUM(quantidade * valor_unitario),2) AS total_vendas
    FROM
    vendas_itens2
GROUP BY venda_id) vendas_totais
WHERE total_vendas = (
    SELECT MIN(total_vendas)
    FROM (SELECT
            venda_id,
            ROUND(SUM(quantidade * valor_unitario)::numeric,2) AS total_vendas
    FROM vendas_itens2
    GROUP BY venda_id) AS venda_minima
);


SELECT
    unidade,
    ROUND(SUM(valor_unitario * quantidade) / SUM(quantidade)::numeric,2) AS valor_medio_por_unidade
FROM
    vendas_itens2
GROUP BY
    unidade;

