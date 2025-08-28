-- sqlite3 loja.db
-- exit

-- Ativa foreign keys no inicio do script
PRAGMA foreign_keys = NO;

-- Tabela usuario
CREATE TABLE usuario(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    senha TEXT NOT NULL
);

-- Tabela cliente
CREATE TABLE cliente(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    usuario_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);


-- Tabela produto
CREATE TABLE produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    preco REAL NOT NULL CHECK (preco >= 0)
);

-- Tabela venda
CREATE TABLE venda(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT NOT NULL,
    usuario_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE SET NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE SET NULL
);

-- Tabela venda_produto tabela associativa para N:M produto <-> venda
CREATE TABLE venda_produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario REAL NOT NULL CHECK (preco_unitario >= 0),
    -- PRIMARY KEY (venda_id, produto_id),
    FOREIGN KEY (venda_id) REFERENCES venda(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produto(id) ON DELETE CASCADE
);

-- INSERIR DADOS NA TABELA USUARIO
INSERT INTO usuario(nome, email, senha) VALUES ('Felipe', 'feliperodrigues@unipam.edu.br', 'senha123');
INSERT INTO usuario(nome, email, senha) VALUES ('Robin', 'vulgorobson@unipam.edu.br', 'senha1234');
INSERT INTO usuario(nome, email, senha) VALUES ('Mabellao', 'malboro@unipam.edu.br', 'senha12345');
INSERT INTO usuario(nome, email, senha) VALUES ('Jaovitor', 'joaoferreira@unipam.edu.br', 'senha12346');

-- INSERIR CLIENTE
INSERT INTO cliente (nome, telefone, usuario_id) VALUES ('Teste', '999999999', '1');
INSERT INTO cliente (nome, telefone, usuario_id) VALUES ('Felipe', '999999999', '2');
INSERT INTO cliente (nome, telefone, usuario_id) VALUES ('Robin', '999999999', '3');

-- INSERIR PRODUTOS
INSERT INTO produto(nome, descricao, preco) VALUES ('Arroz 5kg', 'Arroz tipo 1', '10.20');
INSERT INTO produto(nome, descricao, preco) VALUES ('Feijao 1kg', 'Feijao carioca', '7.25');
INSERT INTO produto(nome, descricao, preco) VALUES ('Acucar 2kg', 'Acucar refinado', '5.35');

--INSERIR VENDAS
INSERT INTO venda(data, usuario_id, cliente_id) VALUES ('2025-08-27', 1, 1);
INSERT INTO venda(data, usuario_id, cliente_id) VALUES ('2025-08-27', 2, 2);
INSERT INTO venda(data, usuario_id, cliente_id) VALUES ('2025-08-27', 3, 3);

--INSERIR DADOS NA TABELA DE ASSOCIAÇÃO VENDA_PRODUTO
INSERT INTO venda_produto(venda_id, produto_id, quantidade, preco_unitario) VALUES (1,1,3,10.20);
INSERT INTO venda_produto(venda_id, produto_id, quantidade, preco_unitario) VALUES (1,2,5,7.25);
INSERT INTO venda_produto(venda_id, produto_id, quantidade, preco_unitario) VALUES (2,2,1,7.25);
INSERT INTO venda_produto(venda_id, produto_id, quantidade, preco_unitario) VALUES (2,3,2,5.35);
INSERT INTO venda_produto(venda_id, produto_id, quantidade, preco_unitario) VALUES (3,1,2,7.25);