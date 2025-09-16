-- Tabela participante
CREATE TABLE participante (
id SERIAL PRIMARY KEY,
nome TEXT NOT NULL,
email TEXT NOT NULL UNIQUE,
telefone TEXT
);

-- Tabela evento
CREATE TABLE evento (
id SERIAL PRIMARY KEY,
nome TEXT NOT NULL,
descricao TEXT,
local TEXT NOT NULL,
data DATE NOT NULL
);

-- Tabela inscricao (associa Evento <-> Participante) - resolve N:M
CREATE TABLE inscricao (
id SERIAL PRIMARY KEY,
id_evento INTEGER NOT NULL REFERENCES evento(id) ON DELETE CASCADE,
id_participante INTEGER NOT NULL REFERENCES participante(id) ON DELETE CASCADE,
data_inscricao DATE,
status TEXT -- ex.: 'confirmada', 'cancelada'
);

-- Tabela pagamento (1:1 com inscricao)
CREATE TABLE pagamento (
id SERIAL PRIMARY KEY,
id_inscricao INTEGER UNIQUE REFERENCES inscricao(id) ON DELETE CASCADE,
valor NUMERIC(10,2),
data_pagamento DATE,
status TEXT -- ex.: 'pago', 'pendente'
);

INSERT INTO participante(nome, email, telefone) VALUES
('Felipe Rodrigues', 'feliperodrigues1unipam.edu.br', '349999999'),
('Malboro Desprezada', 'mabelly@unipam.edu.br', '349999991'),
('Junin Robin', 'junin@unipam.edu.br', '349999992');

INSERT INTO evento(nome, descricao, local, data) VALUES
('Semana de SI', 'Palestras e cursos de SI', 'Auditorio A', '2025-09-10'),
('Semana de Minicursos', 'Palestras PowerBI', 'Auditorio B', '2025-10-10');

INSERT INTO inscricao(id_evento, id_participante, data_inscricao, status) VALUES
(1,1, '2025-09-10', 'confirmada'),
(2,2, '2025-10-10', 'confirmada');

INSERT INTO pagamento(id_inscricao, valor, data_pagamento, status) VALUES
(1, 150.00, '2025-09-10', 'pago'),
(2, 200.00, '2025-10-10', 'pago');

SELECT * FROM inscricao p
where p.id_evento = '1'

