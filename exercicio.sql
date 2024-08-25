1. CREATE TABLE Clientes(
    Id_clientes INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50),
    telefone VARCHAR(50),
    data_cadastro DATE
);


2.CREATE TABLE Produtos (
    Id_produtos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    descricao VARCHAR(50),
    preco DECIMAL(10, 2),
    estoque INT
);


3.CREATE TABLE Pedidos(
    Id_pedidos INT PRIMARY KEY AUTO_INCREMENT,
    Id_clientes INT AUTO_INCREMENT FOREIGN KEY Id_clientes REFERENCES Clientes(Id_clientes),
    data_pedidos DATE,
    status VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Pedidos(
	Id_pedidos INT PRIMARY KEY AUTO_INCREMENT,
    Id_clientes INT,
    data_pedidos DATE,
    estado VARCHAR(50),
    FOREIGN KEY(Id_clientes) REFERENCES Clientes(Id_clientes) 
);

CREATE TABLE IF NOT EXISTS item_pedidos(
    Id_itempedidos INT PRIMARY KEY AUTO_INCREMENT,
    Id_pedidos INT,
    Id_produtos INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY(Id_pedidos) REFERENCES Pedidos(Id_pedidos),
    FOREIGN KEY(Id_produtos) REFERENCES Produtos(Id_produtos)  
);

INSERT IGNORE INTO Clientes(data_cadastro, email, Id_clientes,nome,telefone)VALUES
('2024-08-03', 'maria@example.com', 1, 'Maria', '5199999999'),
('2024-01-09', 'joao@example.com', 2, 'João', '5122222222'),
('2023-06-15', 'leo@example.com', 3, 'Leo', '5177777777'),
('2022-04-17', 'mirelle@example.com', 4, 'Mirelle', '5111111111'),
('2024-07-28', 'lucas@example.com', 5, 'Lucas', '5188888888');


INSERT IGNORE INTO Produtos(descricao, estoque, Id_produtos, nome, preco)VALUES
('caneta esferografica azul', '3500', 1, 'Caneta Bic', 1.50),
('Placas emborrachadas', '1500', 2, 'E.V.A', 7.85),
('estojo', '1500', 3, 'Estojos', 14.90),
('Cadernos capa dura', '3500', 4, 'Cadernos', 16.85),
('Mochilas cores lisas fashion', '1500', 5, 'Mochilas', 320);



INSERT IGNORE INTO Pedidos(data_pedidos, estado, Id_clientes, Id_pedidos)VALUES
('2024-08-17', 'Em rota de entrega...', 2, 1),
('2023-09-09', 'Entregue', 1, 2),
('2024-03-10', 'Entregue', 3, 3),
('2022-12-05', 'Entregue', 5, 4);


SELECT Clientes.Id_clientes, Clientes.nome, Clientes.email, Clientes.telefone, Clientes.data_cadastro
FROM Clientes
INNER JOIN Pedidos ON Clientes.Id_clientes = Pedidos.Id_clientes;


SELECT SUM(quantidade * preco_unitario)
FROM item_pedidos;

SELECT Id_produtos
FROM Produtos
WHERE estoque > 1000
ORDER BY Id_produtos DESC;


18. SELECT Clientes.Id_clientes, Clientes.nome, Pedidos.data_pedidos
FROM Clientes
INNER JOIN Pedidos ON Clientes.Id_clientes = Pedidos.Id_clientes;

19.UPDATE Produtos
SET preco = 1.00
WHERE Id_produtos = 1;


UPDATE Clientes
SET telefone = 5155555555
WHERE Id_clientes = 3;



