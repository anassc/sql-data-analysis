import sqlite3

conexao = sqlite3.connect("banco_sql")
cursor = conexao.cursor()

#1-Crie uma tabela chamada "alunos" com os seguintes campos: id (inteiro), nome (texto), idade (inteiro) e curso (texto).
#cursor.execute('CREATE TABLE alunos (Id INT, nome VARCHAR(50), idade INT, curso VARCHAR(100))')

#2-Insira pelo menos 5 registros de alunos na tabela que você criou no exercício anterior.

"""
cursor.execute('INSERT INTO alunos (Id, nome , idade ,curso) VALUES(1, "Ana", 23, "Medicina")')
cursor.execute('INSERT INTO alunos (Id, nome , idade ,curso) VALUES(2, "Matheus", 30, "Pedagogia")')
cursor.execute('INSERT INTO alunos (Id, nome , idade ,curso) VALUES(3, "José", 18, "Engenharia")')
cursor.execute('INSERT INTO alunos (Id, nome , idade ,curso) VALUES(4, "Leonardo", 21, "Literatura")')
cursor.execute('INSERT INTO alunos (Id, nome , idade ,curso) VALUES(5, "Ronaldo", 40, "Engenharia")')
"""

#a) Selecionar todos os registros da tabela "alunos".
all_alunos = cursor.execute('SELECT * FROM alunos')
for alunos in all_alunos:
    print (alunos)
#b) Selecionar o nome e a idade dos alunos com mais de 20 anos.
cursor.execute('SELECT nome, idade FROM alunos Where idade >20')
for alunos in all_alunos:
    print (alunos)
#c) Selecionar os alunos do curso de "Engenharia" em ordem alfabética.
filter_eng = cursor.execute('SELECT nome, curso FROM alunos Where curso ="Engenharia"   ORDER BY nome')
for alunos in filter_eng:
    print (alunos)
#d) Contar o número total de alunos na tabela
total_alunos = cursor.execute('SELECT * FROM alunos')
index = 0
for alunos in total_alunos:
    index = index +1
print(index)

#4. Atualização e Remoção
#a) Atualize a idade de um aluno específico na tabela.
update_data=cursor.execute('UPDATE  alunos SET curso = "Geografia" WHERE id = 1')
print(update_data.rowcount)# linhas afetadas pelo codigo

#b) Remova um aluno pelo seu ID.
cursor.execute(' DELETE FROM alunos Where id = 1 ')

#5. Criar uma Tabela e Inserir Dados
#Crie uma tabela chamada "clientes" com os campos: id (chave primária), nome (texto), idade (inteiro) e saldo (float). 
#cursor.execute('CREATE TABLE clientes (id INT PRIMARY KEY, nome VARCHAR(100), idade INT, saldo FLOAT) ')

#Insira alguns registros de clientes na tabela.
"""cursor.execute('INSERT INTO clientes (id , nome , idade , saldo) VALUES(1,"Fernanda",24,100)')
cursor.execute('INSERT INTO clientes (id , nome , idade , saldo) VALUES(2,"MARCOS",60,30000)')
cursor.execute('INSERT INTO clientes (id , nome , idade , saldo) VALUES(3,"Roberta",33,5000)')
cursor.execute('INSERT INTO clientes (id , nome , idade , saldo) VALUES(4,"MICA",42,750)')
"""
#6. Consultas e Funções Agregadas
#Escreva consultas SQL para realizar as seguintes tarefas:
#a) Selecione o nome e a idade dos clientes com idade superior a 30 anos.
clientes_30anos = cursor.execute('SELECT nome, idade FROM clientes WHERE idade>30')
for cliente in clientes_30anos:
    print(cliente)

#b) Calcule o saldo médio dos clientes.
saldo_medio = cursor.execute('SELECT AVG(saldo) saldo_medio FROM clientes')
for cliente in saldo_medio:
    print(cliente)
"""""
saldo_medio = cursor.execute('SELECT saldo FROM clientes')
saldo_total = 0
index = 0  # Definindo o contador do índice
for cliente in saldo_medio:
    saldo_total += cliente[0]  # Adicionando o saldo do cliente ao saldo total
    index += 1  # Incrementando o contador de índice
saldo_final_medio = saldo_total / index  # Calculando o saldo final médio
print(saldo_final_medio)
"""

#c) Encontre o cliente com o saldo máximo.
saldo= cursor.execute('SELECT nome, MAX(saldo) AS saldo_max from clientes')
for cliente in saldo:
    print(cliente)

#d) Conte quantos clientes têm saldo acima de 1000.
clientes_saldo1000 = cursor.execute('SELECT COUNT(saldo) FROM clientes WHERE saldo>1000')
for cliente in clientes_saldo1000:
    print(cliente)

"""clientes_saldo1000 = cursor.execute('SELECT nome, saldo FROM clientes WHERE saldo>1000')
index=0
for cliente in clientes_saldo1000:
    index =index + 1
print(index)
"""
#7. Atualização e Remoção com Condições
#a) Atualize o saldo de um cliente específico.

#b) Remova um cliente pelo seu ID.


"""8. Junção de Tabelas
Crie uma segunda tabela chamada "compras" com os campos: id
(chave primária), cliente_id (chave estrangeira referenciando o id
da tabela "clientes"), produto (texto) e valor (real). Insira algumas
compras associadas a clientes existentes na tabela "clientes".
Escreva uma consulta para exibir o nome do cliente, o produto e o
valor de cada compra.
"""


cursor.execute("CREATE TABLE compras(id INT NOT NULL PRIMARY KEY,cliente_id INT,produto VARCHAR(100),valor FLOAT, FOREIGN KEY (cliente_id) REFERENCES cliente(id))")
cursor.execute('INSERT INTO compras (id, cliente_id, produto, valor) VALUES (1, 2, "sapato", 100)')
cursor.execute('INSERT INTO compras (id, cliente_id, produto, valor) VALUES (2, 1, "bota", 55.90)')
cursor.execute('INSERT INTO compras (id, cliente_id, produto, valor) VALUES (3, 3, "tv", 10000)')



resultados=cursor.execute("SELECT nome,produto,valor FROM compras INNER JOIN clientes ON compras.cliente_id = clientes.id")


for  linha in resultados:
    print(linha)


conexao.commit()
conexao.close
