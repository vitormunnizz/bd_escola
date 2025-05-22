use escola;

-- Tabela de Alunos
CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    nascimento DATE NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY (id_aluno)
);


-- Tabela de Turmas
CREATE TABLE turma (
    id_turma INT AUTO_INCREMENT NOT NULL,
    nome_turma VARCHAR(100) NOT NULL,
    ano VARCHAR(4) NOT NULL,
    PRIMARY KEY (id_turma)
);

-- Tabela de Relacionamento Turma e Aluno
CREATE TABLE turma_aluno (
    id_turma_aluno INT AUTO_INCREMENT NOT NULL,
    id_turma INT NOT NULL,
    id_aluno INT NOT NULL,
    PRIMARY KEY (id_turma_aluno),
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

-- Tabela de Professores
CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY (id_professor)
);

-- Tabela de Formações
CREATE TABLE formacao (
    id_formacao INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_formacao)
);

-- Tabela de Relacionamento Professores e Formações
CREATE TABLE professores_formacoes (
    id_professores_formacoes INT AUTO_INCREMENT NOT NULL,
    id_formacao INT NOT NULL,
    id_professor INT NOT NULL,
    PRIMARY KEY (id_professores_formacoes),
    FOREIGN KEY (id_formacao) REFERENCES formacao(id_formacao),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- Tabela de Disciplinas
CREATE TABLE disciplina (
    id_disciplina INT AUTO_INCREMENT NOT NULL,
    nome_disciplina VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_disciplina)
);

-- Tabela para vincular Turma, Disciplina e Professor
CREATE TABLE turma_disciplinas (
    id_turma_disciplina INT AUTO_INCREMENT NOT NULL,
    id_turma INT NOT NULL,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    PRIMARY KEY (id_turma_disciplina),
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- Tabela de Notas dos Alunos por Disciplina e Bimestre
CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT NOT NULL,
    id_aluno INT NOT NULL,
    id_turma_disciplina INT NOT NULL,
    bimestre INT NOT NULL CHECK (bimestre BETWEEN 1 AND 4),
    nota DECIMAL(5,2) NOT NULL CHECK (nota BETWEEN 0 AND 10),
    PRIMARY KEY (id_nota),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_turma_disciplina) REFERENCES turma_disciplinas(id_turma_disciplina)
);