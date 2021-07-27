-- Borrar base de datos
DROP DATABASE blog;

--Crear base de datos llamada 'blog'
CREATE DATABASE blog;

--Entrar a la base de datos
\c blog;

-- Crear tablas de usuario, comentario y post
CREATE TABLE usuario(
    id INT UNIQUE PRIMARY KEY,
    email VARCHAR(80)
);

CREATE TABLE post(
    id INT UNIQUE PRIMARY KEY,
    usuario_id INT,
    titulo VARCHAR(80),
    fecha DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE comentario(
    id INT UNIQUE PRIMARY KEY,
    post_id INT,
    usuario_id INT,
    texto VARCHAR(70),
    fecha DATE,
    FOREIGN KEY (post_id) REFERENCES post(id),
    FOREIGN KEY (usuario_id) REFERENCES post(id)
);

-- Insertar los registros
--tabla USUARIO
INSERT INTO Usuario VALUES (1, 'usuario01@hotmail.com');
INSERT INTO Usuario VALUES (2, 'usuario02@gmail.com');
INSERT INTO Usuario VALUES (3, 'usuario03@gmail.com');
INSERT INTO Usuario VALUES (4, 'usuario04@hotmail.com');
INSERT INTO Usuario VALUES (5, 'usuario05@yahoo.com');
INSERT INTO Usuario VALUES (6, 'usuario06@hotmail.com');
INSERT INTO Usuario VALUES (7, 'usuario07@yahoo.com');
INSERT INTO Usuario VALUES (8, 'usuario08@yahoo.com');
INSERT INTO Usuario VALUES (9, 'usuario09@yahoo.com');

--tabla POST
INSERT INTO Post VALUES (1, 1, 'Post 1: Esto es malo', '2020-06-29');
INSERT INTO Post VALUES (2, 5, 'Post 2: Esto es malo', '2020-06-20');
INSERT INTO Post VALUES (3, 1, 'Post 3: Esto es excelente', '2020-05-30');
INSERT INTO Post VALUES (4, 9, 'Post 4: Esto es bueno', '2020-05-09');
INSERT INTO Post VALUES (5, 7, 'Post 5: Esto es bueno', '2020-07-10');
INSERT INTO Post VALUES (6, 5, 'Post 6: Esto es excelente', '2020-07-18');
INSERT INTO Post VALUES (7, 8, 'Post 7: Esto es excelente', '2020-07-07');
INSERT INTO Post VALUES (8, 5, 'Post 8: Esto es excelente', '2020-05-14');
INSERT INTO Post VALUES (9, 2, 'Post 9: Esto es bueno', '2020-05-08');
INSERT INTO Post VALUES (10, 6, 'Post 10: Esto es bueno', '2020-06-02');
INSERT INTO Post VALUES (11, 4, 'Post 11: Esto es bueno', '2020-05-05');
INSERT INTO Post VALUES (12, 9, 'Post 12: Esto es malo', '2020-07-23');
INSERT INTO Post VALUES (13, 5, 'Post 13: Esto es excelente', '2020-05-30');
INSERT INTO Post VALUES (14, 8, 'Post 14: Esto es excelente', '2020-05-01');
INSERT INTO Post VALUES (15, 7, 'Post 15: Esto es malo', '2020-06-17');

--tabla COMENTARIO
INSERT INTO Comentario VALUES (1, 3, 6, 'Este es el comentario 1', '2020-07-08');
INSERT INTO Comentario VALUES (2, 4, 2, 'Este es el comentario 2', '2020-06-07');
INSERT INTO Comentario VALUES (3, 6, 4, 'Este es el comentario 3', '2020-06-16');
INSERT INTO Comentario VALUES (4, 2, 13, 'Este es el comentario 4', '2020-06-15');
INSERT INTO Comentario VALUES (5, 6, 6, 'Este es el comentario 5', '2020-05-14');
INSERT INTO Comentario VALUES (6, 3, 3, 'Este es el comentario 6', '2020-07-08');
INSERT INTO Comentario VALUES (7, 6, 1, 'Este es el comentario 7', '2020-05-22');
INSERT INTO Comentario VALUES (8, 6, 7, 'Este es el comentario 8', '2020-07-09');
INSERT INTO Comentario VALUES (9, 8, 13, 'Este es el comentario 9', '2020-06-30');
INSERT INTO Comentario VALUES (10, 8, 6, 'Este es el comentario 10', '2020-06-19');
INSERT INTO Comentario VALUES (11, 5, 1, 'Este es el comentario 11', '2020-05-09');
INSERT INTO Comentario VALUES (12, 8, 15, 'Este es el comentario 12', '2020-06-17');
INSERT INTO Comentario VALUES (13, 1, 9, 'Este es el comentario 13', '2020-05-01');
INSERT INTO Comentario VALUES (14, 2, 5, 'Este es el comentario 14', '2020-05-31');
INSERT INTO Comentario VALUES (15, 4, 3, 'Este es el comentario 15', '2020-06-28');

--Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
SELECT usuario.id, usuario.email, post.titulo FROM USUARIO INNER JOIN Post ON usuario.id=post.usuario_id WHERE usuario.id=5;

--Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email ​usuario06@hotmail.com​.
SELECT usuario.email, usuario.id, comentario.texto FROM USUARIO FULL OUTER JOIN Comentario on usuario.id=comentario.usuario_id WHERE usuario.email <> 'usuario06@hotmail.com';

--Listar los usuarios que NO han publicado ningún post.
SELECT usuario.email FROM POST FULL OUTER JOIN USUARIO ON usuario.id=post.usuario_id WHERE post.titulo IS NULL;

--Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).
SELECT post.titulo, comentario.texto FROM POST FULL OUTER JOIN COMENTARIO on comentario.usuario_id=post.usuario_id;

--Listar todos los usuarios que hayan publicado un post en Junio.
SELECT post.usuario_id FROM POST LEFT JOIN usuario on usuario.id=post.usuario_id WHERE fecha BETWEEN '2020-05-31' AND '2020-07-01';

--FIN DESAFIO--