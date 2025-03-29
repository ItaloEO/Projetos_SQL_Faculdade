-- Criando o banco de dados 
CREATE DATABASE Empresa; 
USE Empresa;

-- Criando a tabela de Funcionários 
CREATE TABLE Funcionarios ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    data_nascimento DATE NOT NULL, 
    salario DECIMAL(10,2) NOT NULL, 
    departamento_id INT NOT NULL, 
    cargo_id INT NOT NULL, 
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id), 
    FOREIGN KEY (cargo_id) REFERENCES Cargos(id) 
);

-- Criando a tabela de Departamentos 
CREATE TABLE Departamentos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL 
    );

-- Criando a tabela de Cargos 
CREATE TABLE Cargos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    nivel VARCHAR(50) NOT NULL 
    );

-- Inserindo dados na tabela Departamentos 
INSERT INTO Departamentos (nome) VALUES ('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

-- Inserindo dados na tabela Cargos 
INSERT INTO Cargos (nome, nivel) VALUES 
('Analista', 'Pleno'), 
('Gerente', 'Sênior'), 
('Assistente', 'Júnior'), 
('Coordenador', 'Sênior'), 
('Desenvolvedor', 'Pleno');

-- Inserindo dados na tabela Funcionarios 
INSERT INTO Funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id) VALUES 
('Ana Silva', '1985-06-15', 5500.00, 1, 5), 
('Carlos Santos', '1990-03-22', 4800.00, 2, 1), 
('Bruna Costa', '1987-12-10', 6000.00, 3, 2), 
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5), 
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2), 
('Helena Martins', '1983-11-17', 5300.00, 1, 4), 
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1), 
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2), 
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);


-- comando para selecionar uma tabela
SELECT * FROM Funcionarios;

-- Comando para buscar o valor máximo de salário 
SELECT MAX(Salario) AS Maior_Salario FROM Funcionarios;

-- Comando para buscar o menor salário 
Select min(Salario) AS Menor_Salario FROM Funcionarios;

-- Comando para somar a quantidade de funcionarios
SELECT count(id) AS Quant_Funcionarios from funcionarios;

-- Filtro para funcionarios que nasceram a partir de 1990
SELECT data_nascimento FROM Funcionarios where data_nascimento >= '1990-01-01';

-- Encontrar a média salárial com duas casas decimais
Select ROUND(avg(Salario), 2) Media_Salario FROM Funcionarios;

-- Selecionar os 3 primeiros caracteres da tabela nome
SELECT substring(nome, 1, 3) FROM funcionarios;

-- Contar quantos funcionarios tem por departamento

SELECT COUNT(f.id) AS Qtd_Func, d.nome AS Departamento
FROM Funcionarios f
JOIN departamentos d ON f.departamento_id = d.id 
GROUP BY d.nome;

-- Contar quantos funcionarios existem por cargo
SELECT c.nome AS Cargo, COUNT(f.id) AS Qtd_Funcionarios
FROM Funcionarios f
JOIN Cargos c ON f.cargo_id = c.id
GROUP BY c.nome;
