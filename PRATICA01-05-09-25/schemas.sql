-- sqlite3 loja.db
-- exit

-- Ativa foreign keys no inicio do script
PRAGMA foreign_keys = NO;

-- TABELA PARTICIPANTE
CREATE TABLE participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

-- TABELA EVENTO
CREATE TABLE IF NOT EXISTS evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

--TABELA INSCRICAO
CREATE TABLE IF NOT EXISTS inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento INTEGER NOT NULL,
    id_participante INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT,
    FOREIGN KEY (id_evento) REFERENCES evento(id) ON DELETE CASCADE,
    FOREIGN KEY (id_participante) REFERENCES participante(id) ON DELETE CASCADE
);

-- TABELA PAGAMENTO
CREATE TABLE IF NOT EXISTS pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_inscricao INTEGER UNIQUE NOT NULL,
    valor REAL,
    data_pagamento TEXT,
    status TEXT,
    FOREIGN KEY (id_inscricao) REFERENCES inscricao(id) ON DELETE CASCADE
);

--INSERTs

INSERT INTO participante (nome, email, telefone) VALUES
('Felipe Rodrigues Santana', 'felipe.santana@gmail.com', '(34) 991234567'),
('Junior Souto Junior', 'junior.souto@gmail.com', '(34) 987654321'),
('Mabelly Alves Leonel', 'mabelly.leonel@gmail.com', '(34) 976543210'),
('Joao Vitor Ferreira', 'joao.ferreira@gmail.com', '(34) 965432109');

INSERT INTO evento (nome, descricao, local, data) VALUES
('Seminario de Tecnologia 2025', 'Evento sobre as ultimas tendencias em tecnologia da informacao', 'Auditorio Principal - UNIPAM', '2025-10-15'),
('Workshop de Banco de Dados', 'Workshop pratico sobre modelagem e implementação de bancos de dados', 'Lab de Informatica bloco G - UNIPAM', '2025-11-20');


INSERT INTO inscricao (id_evento, id_participante, data_inscricao, status) VALUES
(1, 1, '2025-09-01', 'confirmada'),
(1, 2, '2025-09-02', 'confirmada'),
(1, 3, '2025-09-03', 'confirmada'),
(2, 1, '2025-09-04', 'confirmada'),
(2, 4, '2025-09-05', 'pendente');

INSERT INTO pagamento (id_inscricao, valor, data_pagamento, status) VALUES
(1, 150.00, '2025-09-01', 'pago'),
(2, 150.00, '2025-09-02', 'pago'),
(3, 150.00, '2025-09-03', 'pago'),
(4, 200.00, '2025-09-04', 'pago');