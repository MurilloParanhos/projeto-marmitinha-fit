-- =========================================
-- VIEW - Ranking das Marmitas
-- =========================================

CREATE VIEW ranking_marmitas AS
SELECT
    m.nome,
    SUM(i.quantidade) AS total_vendido
FROM itens_pedidos i
JOIN marmitas m
ON i.id_marmita = m.id_marmita
GROUP BY m.nome;