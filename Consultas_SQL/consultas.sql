-- =========================================
-- Total de Clientes
-- =========================================

SELECT COUNT(*) AS total_clientes
FROM clientes;

-- =========================================
-- Total de Pedidos
-- =========================================

SELECT COUNT(*) AS total_pedidos
FROM pedidos;

-- =========================================
-- Faturamento Total
-- =========================================

SELECT SUM(valor_total) AS faturamento_total
FROM pedidos;

-- =========================================
-- Ticket Médio
-- =========================================

SELECT ROUND(AVG(valor_total), 2) AS ticket_medio
FROM pedidos;

-- =========================================
-- Ranking das Marmitas
-- =========================================

SELECT
    m.nome,
    SUM(i.quantidade) AS total_vendido
FROM itens_pedidos i
JOIN marmitas m
    ON i.id_marmita = m.id_marmita
GROUP BY m.nome
ORDER BY total_vendido DESC;