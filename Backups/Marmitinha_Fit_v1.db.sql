PRAGMA foreign_keys = ON;

-- =========================================
-- CRIAÇÃO DAS TABELAS
-- =========================================

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY
);

CREATE TABLE marmitas (
    id_marmita INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco REAL NOT NULL
);

CREATE TABLE combos (
    id_combo INTEGER PRIMARY KEY,
    nome_combo TEXT NOT NULL,
    quantidade INTEGER NOT NULL,
    preco REAL NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    data_pedido TEXT NOT NULL,
    id_combo INTEGER,
    valor_total REAL NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_combo)
        REFERENCES combos(id_combo)
);

CREATE TABLE itens_pedidos (
    id_item INTEGER PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    id_marmita INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,

    FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    FOREIGN KEY (id_marmita)
        REFERENCES marmitas(id_marmita)
);

-- =========================================
-- CLIENTES
-- =========================================

INSERT INTO clientes (id_cliente)
VALUES
(1), (2), (3), (4), (5),
(6), (7), (8), (9), (10),
(11), (12), (13), (14), (15);

-- =========================================
-- MARMITAS
-- =========================================

INSERT INTO marmitas (id_marmita, nome, preco)
VALUES
(1, 'Frango grelhado', 23.00),
(2, 'Frango xadrez', 23.00),
(3, 'Fricasse de frango', 23.00),
(4, 'Escondidinho de carne ou frango', 23.00),
(5, 'Picadinho de carne com batata e cebola', 23.00),
(6, 'Panqueca de carne ou frango', 23.00),
(7, 'Iscas de pernil acebolado', 23.00),
(8, 'Carne moida com batata', 23.00),
(9, 'File de frango a milanesa', 23.00),
(10, 'Espaguete a bolonhesa', 23.00);

-- =========================================
-- COMBOS
-- =========================================

INSERT INTO combos (id_combo, nome_combo, quantidade, preco)
VALUES
(1, 'Combo 10 unidades', 10, 218.00),
(2, 'Combo 20 unidades', 20, 437.00),
(3, 'Combo 30 unidades', 30, 655.00);

-- =========================================
-- PEDIDOS
-- =========================================

INSERT INTO pedidos (
    id_pedido,
    id_cliente,
    data_pedido,
    id_combo,
    valor_total
)
VALUES
(1, 1, '2026-08-05', 1, 218.00),
(2, 2, '2026-08-05', NULL, 115.00),
(3, 3, '2026-08-05', NULL, 460.00),
(4, 4, '2026-08-05', 2, 437.00),
(5, 5, '2026-08-05', NULL, 138.00),
(6, 6, '2026-08-05', NULL, 161.00),
(7, 7, '2026-08-06', 1, 218.00),
(8, 8, '2026-08-06', NULL, 161.00),
(9, 9, '2026-08-07', NULL, 138.00),
(10, 10, '2026-08-07', 2, 437.00),
(11, 11, '2026-08-08', NULL, 184.00),
(12, 12, '2026-08-08', 1, 218.00),
(13, 13, '2026-08-09', NULL, 115.00),
(14, 14, '2026-08-09', NULL, 207.00),
(15, 15, '2026-08-10', 3, 655.00);

-- =========================================
-- ITENS DOS PEDIDOS
-- =========================================

INSERT INTO itens_pedidos (
    id_item,
    id_pedido,
    id_marmita,
    quantidade
)
VALUES
(1, 1, 1, 10),
(2, 2, 2, 5),
(3, 3, 3, 20),
(4, 4, 8, 4),
(5, 5, 5, 6),
(6, 6, 10, 7),

(7, 1, 6, 3),
(8, 1, 8, 2),
(9, 2, 4, 2),
(10, 3, 9, 10),
(11, 4, 5, 6),
(12, 4, 7, 6),
(13, 5, 6, 2),
(14, 6, 1, 3),

(15, 7, 1, 4),
(16, 7, 6, 3),
(17, 7, 8, 3),

(18, 8, 2, 4),
(19, 8, 4, 3),

(20, 9, 3, 3),
(21, 9, 10, 3),

(22, 10, 5, 8),
(23, 10, 7, 6),
(24, 10, 9, 6),

(25, 11, 1, 3),
(26, 11, 3, 3),
(27, 11, 6, 2),

(28, 12, 2, 5),
(29, 12, 8, 5),

(30, 13, 4, 2),
(31, 13, 9, 3),

(32, 14, 5, 4),
(33, 14, 7, 3),
(34, 14, 10, 2),

(35, 15, 1, 10),
(36, 15, 3, 8),
(37, 15, 6, 6),
(38, 15, 8, 6);

-- =========================================
-- VIEW: RANKING DAS MARMITAS
-- =========================================

CREATE VIEW ranking_marmitas AS
SELECT
    m.nome,
    SUM(i.quantidade) AS total_vendido
FROM itens_pedidos i
JOIN marmitas m
    ON i.id_marmita = m.id_marmita
GROUP BY m.nome;