-- 1 - Fazer consulta de qual admin cadastrou qual paciente (em casos de dados inconsistentes cadastrados): 
SELECT t1.login AS login_administrador, t2.* FROM administrador AS t1 JOIN
paciente AS t2 ON t1.id = t2.id_administrador;

-- 2 - Fazer consulta de qual admin cadastrou qual médico (em casos de dados inconsistentes cadastrados): 
SELECT t1.login AS login_administrador, t2.* FROM administrador AS t1 JOIN
medico AS t2 ON t1.id = t2.id_administrador;

-- 3 - Selecionar o prontuário completo junto com o nome do paciente e nome do médico.
SELECT t1.nome AS nome_paciente, t2.* FROM paciente AS t1 JOIN prontuario AS
t2 ON t1.id = t2.id_paciente;

-- 4 - Relacionar CNPJ da unidade de saúde utilizada por determinadopaciente:
SELECT t2.nome AS nome_paciente, t3.cnpj AS cnpj_unidade_saude FROM
paciente_utiliza_unidade AS t1 JOIN paciente AS t2 ON t1.id_paciente = t2.id JOIN
unidade_saude AS t3 ON t1.id_unidade = t3.id;

-- 5 - Relacionar CNPJ da unidade que promoveu determinada consulta de acordo com a data:
SELECT t2.data_consulta, t3.cnpj AS cnpj_unidade_saude FROM
unidade_promove_consulta AS t1 JOIN consulta AS t2 ON t1.id_consulta = t2.id
JOIN unidade_saude AS t3 ON t1.id_unidade_saude = t3.id ORDER BY
t2.data_consulta DESC;

-- 6 - Selecionar todos os médicos com cargo “Dermatologista” e as datas que fizeram consulta. 
Select * FROM medico Where cargo="Dermatologista";

-- 7 - Selecionar os endereços de pacientes ordenados em ordem decrescente de CEP (Nome e cpf, e todas as colunas de endereço)
SELECT DISTINCT cep FROM endereco ORDER BY cep DESC;

-- 8 - Listar todas as consultas agendadas para um determinado paciente.
SELECT c.id, c.data_consulta, m.nome AS nome_medico FROM consulta c
INNER JOIN medico m ON c.id_medico = m.id WHERE c.id_paciente = (SELECT id
FROM paciente WHERE nome = 'Vanessa');

-- 9 - Listar todos os pacientes que são portadores de doença transmissível. 
SELECT p.nome, p.cpf FROM paciente p INNER JOIN prontuario pt ON p.id =
pt.id_paciente WHERE pt.portador_doenca_transmissivel = 'sim';

-- 10 - Encontrar a quantidade de consultas realizadas por cada médico. 
SELECT m.id, m.nome, COUNT(c.id) AS total_consultas FROM medico m LEFT
JOIN consulta c ON m.id = c.id_medico GROUP BY m.id, m.nome;

-- 11 - Obter os pacientes que possui deficiência e que estão com a pressão arterial maior que 12. 
SELECT t1.* FROM prontuario AS t1 JOIN consulta AS t2 ON t2.id_paciente =
t1.id_paciente JOIN medico AS t3 ON t3.id = t2.id_medico WHERE
portador_deficiencia = 'sim' AND pressao_arterial > 12 ORDER BY t2.data_consulta
DESC;
