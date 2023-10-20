create database bd_aula07;
\c bd_aula07
create table tbl_fornecedor (cod_fornecedor serial primary key, nome text not null, status integer, cidade text);
create table tbl_peca (cod_peca serial primary key, nome text not null, cor text, preco numeric, cidade text);
create table tbl_estoque (cod_compra serial primary key, 
						 cod_fornecedor integer references tbl_fornecedor(cod_fornecedor),
						cod_peca integer references tbl_peca(cod_peca),
						quantidade integer);
						
insert into tbl_fornecedor(nome,status,cidade) 
values ('A',30,'LONDRES'),('B',20,'PARIS'),('C',10,'PARIS'),('D',10,'LONDRES');

INSERT INTO tbl_peca(nome, cor, preco, cidade) values
('PLACA','AZUL',5,'LONDRES'),('MESA','VERMELHA',10,'PARIS'),('CADERNO','PRETA',14,'ROMA'),
('TESOURA','VERMELHA',12,'LONDRES');

INSERT INTO tbl_estoque(cod_fornecedor, cod_peca, quantidade) values
(1,1,30),(2,1,30),(3,2,10),(3,3,50);

--Listar o nome dos fornecedores(maiusculo) e das peças(minusculo) que se situam na mesma cidade, ordenado pelo nome

select upper (tbl_fornecedor.nome), lower(tbl_peca.nome)
from tbl_fornecedor,tbl_peca
where tbl_fornecedor.cidade=tbl_peca.cidade
order by tbl_fornecedor.nome asc;

--listar as cidades onde existem fornecedores (sem valores duplicados)

select distinct (cidade)
from tbl_fornecedor

--Listar o nome e a cor das peças do fornecedor com código 3, ordenado pelo nome da peça

select tbl_peca.nome,tbl_peca.cor
from tbl_peca
inner join tbl_estoque on tbl_peca.cod_peca=tbl_estoque.cod_peca
inner join tbl_fornecedor on tbl_fornecedor.cod_fornecedor=tbl_estoque.cod_fornecedor
where tbl_fornecedor.cod_fornecedor=3
ORDER BY t.nome ASC; 

--Listar o nome e a cidade dos fornecedores com mais de 10 peças.Contar só as peças de código 1.
select F.nome,F.cidade 
from tbl_fornecedor as F
inner join tbl_estoque AS E ON F.cod_fornecedor = E.cod_fornecedor
where E.cod_peca = 1; 

--Listar a quantidade total de peças com código 1, fornecidas pelos fornecedores.
select SUM(E.quantidade) 
from tbl_fornecedor as F
inner join tbl_estoque AS E ON F.cod_fornecedor = E.cod_fornecedor
where E.cod_peca = 1;

--Listar a média dos preços das peças fornecidas pelo fornecedor com código 3.
select AVG(P.preco) 
from tbl_peca AS P
full join tbl_estoque AS E ON P.cod_peca = E.cod_peca
full join tbl_fornecedor F ON F.cod_fornecedor = E.cod_fornecedor
where F.cod_fornecedor = 3;

--lista o valor da pecas mais cara e a mais barata.
select MIN(preco) as mais_barata,MAX(preco) as mais_cara 
from tbl_peca;

--listar a quantidade de peças cadastradas
select COUNT(cod_peca) as total_de_pecas 
from tbl_peca;

--listar a quantidade de cidades diferentes onde existem peças cadastradas
select(cidade) 
from tbl_fornecedor; 

-- listar a media dos precos de todas as peças, com somente 1 digito após a virgula.
select ROUND(AVG(preco),1)
 from tbl_peca AS P;



