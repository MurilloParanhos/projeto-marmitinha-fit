-- =========================================
-- VALIDAÇÃO DE QUALIDADE DOS DADOS
-- Verifica inconsistências entre pedidos,
-- quantidades registradas e combos
-- =========================================

SELECT
    p.id_pedido,
    p.valor_total,
    c.nome_combo,
    c.quantidade AS quantidade_esperada,
    SUM(i.quantidade) AS quantidade_registrada,
    CASE
        WHEN p.id_combo IS NOT NULL
             AND SUM(i.quantidade) <> c.quantidade
            THEN 'INCONSISTENTE'

        WHEN p.id_combo IS NULL
             AND p.valor_total <> SUM(i.quantidade) * 23
            THEN 'INCONSISTENTE'

        ELSE 'OK'
    END AS status_validacao
FROM pedidos p
LEFT JOIN combos c
    ON p.id_combo = c.id_combo
JOIN itens_pedidos i
    ON p.id_pedido = i.id_pedido
GROUP BY
    p.id_pedido,
    p.valor_total,
    p.id_combo,
    c.nome_combo,
    c.quantidade
ORDER BY p.id_pedido;