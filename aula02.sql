create database bd_sistema_bancario;

create table fornecedor (nome varchar);
create table cliente (NOME VARCHAR);
create table pagamento (nome real);
create table filiais (nome varchar);
create table funcionarios (nome varchar);

select * from fornecedor,cliente,pagamento,filiais,funcionarios,
 numero_conta,
 agencia,
emprestimo;

create table numero_conta(numero integer);
create table agencia(numero integer);
create table emprestimo(valor real);

alter table cliente 
add cidade_cliente varchar;
alter table cliente 
rename table cliente to tbl_cliente;
alter table cliente 
add   idade integer;
alter table cliente 
add cpf integer;



alter table cliente 
add endereco_cliente varchar;

alter table numero_conta
add nome_agencia varchar;
alter table numero_conta
add saldo real;

alter table emprestimo
add numero_emprestimo integer;
alter table emprestimo
add nome_agencia integer;
alter table emprestimo
add valor real;

alter table agencia
add numero_emprestimo integer;
alter table agencia
add nome_agencia integer;
alter table agencia
add valor real;

drop table filiais,fornecedor, funcionarios;
drop table pagamento;
create schema flavio;