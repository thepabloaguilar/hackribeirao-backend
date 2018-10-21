CREATE TABLE student_user(
    id                  SERIAL,
    name                VARCHAR,
    password            VARCHAR,
    birth_date          DATE,
    gender              VARCHAR,
    ra                  VARCHAR,
    telephone_number    VARCHAR,
    email               VARCHAR,
    mother_name         VARCHAR,
    father_name         VARCHAR,
    image_url           VARCHAR,
    CONSTRAINT pk_users PRIMARY KEY(id)
);

CREATE TABLE professor_user(
    id                  SERIAL,
    name                VARCHAR,
    password            VARCHAR,
    email               VARCHAR,
    subjects            VARCHAR,
    image_url           VARCHAR,
    CONSTRAINT pk_professor_user PRIMARY KEY(id)
);

CREATE TABLE question_type(
    id          SERIAL,
    type        VARCHAR,
    CONSTRAINT pk_question_type PRIMARY KEY(id)
);

CREATE TABLE question(
    id                  SERIAL,
    question_type_id    INTEGER,
    question            VARCHAR,
    options             VARCHAR,
    field_type          VARCHAR,
    CONSTRAINT pk_question PRIMARY KEY(id),
    CONSTRAINT fk_question_question_type FOREIGN KEY(question_type_id) REFERENCES question_type(id)
);

CREATE TABLE answer(
    id              SERIAL,
    student_id      INTEGER,
    question_id     INTEGER,
    answer          VARCHAR,
    CONSTRAINT pk_answer PRIMARY KEY(id),
    CONSTRAINT fk_answer_student_id FOREIGN KEY(student_id) REFERENCES student_user(id),
    CONSTRAINT fk_answer_question_id FOREIGN KEY(question_id) REFERENCES question(id)
);

CREATE TABLE project(
    id              SERIAL,
    professor_id    INTEGER,
    name            VARCHAR,
    description     VARCHAR,
    CONSTRAINT pk_project PRIMARY KEY(id),
    CONSTRAINT fk_project_professor_id FOREIGN KEY(professor_id) REFERENCES professor_user(id)
);

INSERT INTO student_user(name, password, birth_date, gender, ra, telephone_number, email, mother_name, father_name)
VALUES('Test User', '$pbkdf2-sha256$29000$5rx3jtF6L4XwXotRyjnHeA$VGe3DfEnws5tQudpkhg60DVNz1MccfVMPul0y5aXPxU', '2018-01-01', 'M', '123456', '987654321', 'teste3@teste.com.br', 'Teste Mae', 'Teste Pai');

INSERT INTO professor_user(name, password, email, subjects)
VALUES('Test Professor User', '$pbkdf2-sha256$29000$5rx3jtF6L4XwXotRyjnHeA$VGe3DfEnws5tQudpkhg60DVNz1MccfVMPul0y5aXPxU', 'teste3@teste.com.br', 'Subject1, Subject2');

INSERT INTO question_type(type) VALUES('classroom');
INSERT INTO question_type(type) VALUES('entertainment');
INSERT INTO question_type(type) VALUES('school_problems');
INSERT INTO question_type(type) VALUES('integration');

INSERT INTO question(question_type_id, question, options, field_type)
VALUES(1, 'Você está satisfeito com a forma que os professores dão a aula?', 'Sim Não', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(1, 'Qual é a matéria que você mais gosta na escola?', 'Português Matemática Quimica História Física Geografia Educação_Física Filosofia Sociologia Biologia Educação_Artística', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(1, 'Qual é a matéria que você mais tem dificuldade?', 'Português Matemática Quimica História Física Geografia Educação_Física Filosofia Sociologia Biologia Educação_Artística', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(1, 'Qual é a matéria que você mais tem facilidade?', 'Português Matemática Quimica História Física Geografia Educação_Física Filosofia Sociologia Biologia Educação_Artística', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(1, 'Você tem alguma sugestão de melhoria para dentro da sala de aula?', NULL, 'text');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(2, 'Você está satisfeito com a forma de entretenimento que a sua escola promove?', 'Sim Não', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(2, 'Você gostaria de ter mais:', 'Viagens Atividades_Esportivas Gincanas', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(2, 'O que você menos gostaria de ter:', 'Viagens Atividades_Esportivas Gincanas', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(2, 'Você tem alguma sugestão de entretenimento para sua escola?', NULL, 'text');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(3, 'Você acredita que sua escola tem problemas de ensino?', 'Sim Não', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(3, 'Quais dos itens abaixo você acredita ser  maior problema de ensino?', 'Metodo_de_ensino', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(3, 'Você acredita que o problema da sua escola é o Método de ensino?', 'Sim Não', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(3, 'Você acredita que o problema da sua escola é Falta de recursos?', 'Sim Não', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(3, 'Indique o que na sua opinião pode ser o maior problema da sua escola?', NULL, 'text');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(4, 'Você consegue perceber projetos na sua escola relacionado a Integração de alunos?', 'Sim Não', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(4, 'Você consegue perceber projetos na sua escola relacionado a Integração da comunidade na sua escola?', 'Sim Não', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(4, 'Você consegue perceber projetos na sua escola relacionado a Integração da sua sala para com outras salas?', 'Sim Não', 'single');
INSERT INTO question(question_type_id, question, options, field_type)
VALUES(4, 'Você tem sugestão de algum projeto de integração na sua escola? Qual?', NULL, 'text');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 1, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 1, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 1, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 1, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 1, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 1, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 1, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 1, 'Sim');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Português');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Português');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Sociologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Sociologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Sociologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Matemática');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'História');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'História');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'História');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'História');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 2, 'Filosofia');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Geografia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Filosofia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 3, 'Física');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Sociologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Sociologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Sociologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Sociologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Quimica');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Quimica');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Quimica');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Quimica');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Quimica');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Física');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Biologia');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 4, 'Biologia');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 6, 'Não');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 7, 'Gincanas');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Viagens');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 8, 'Gincanas');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 10, 'Sim');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 11, 'Metodo_de_ensino');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 12, 'Não');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 13, 'Sim');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 15, 'Sim');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 16, 'Sim');

INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Não');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');
INSERT INTO answer(student_id, question_id, answer) VALUES(1, 17, 'Sim');