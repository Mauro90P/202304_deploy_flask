import re
import os
from app.config.mysqlconnection import connectToMySQL
from flask import flash

SEGURA_REGEX = re.compile(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$')

class Usuario:

    def __init__(self, data):
        self.id = data.get('id', 0)
        self.nombre = data.get('nombre')
        self.alias = data.get('alias')
        self.email = data.get('email')
        self.password = data.get('password')
        self.fecha_nacimiento = data.get('fecha_nacimiento')
        self.pokes_recibidos = data.get('pokes_recibidos')


    @staticmethod
    def validar(data):

        todo_ok = True

        if not SEGURA_REGEX.match(data['password']):
            flash("Tu contraseña debe tener 8 caracteres, una mayuscula, minuscula, numero y caracter especial", "danger")
            todo_ok = False

        return todo_ok

    @classmethod
    def get_all(cls):
        todos_los_datos = []

        sql = """
        SELECT id, nombre, alias, email, password, fecha_nacimiento FROM usuarios;
        """
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql);
        for fila in result:
            instancia = cls(fila)
            todos_los_datos.append(instancia)
        return todos_los_datos

    def crear(self):
        sql = "INSERT INTO usuarios (nombre, alias, email, password, fecha_nacimiento) VALUES (%(nombre)s, %(alias)s, %(email)s, %(password)s, %(fecha_nacimiento)s);"
        data = {
            'nombre': self.nombre,
            'alias': self.alias,
            'email': self.email,
            'password': self.password,
            'fecha_nacimiento': self.fecha_nacimiento,

        }
        self.id = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data)
        return self

    @classmethod
    def save(cls, data):
        sql = "INSERT INTO usuarios (nombre, alias, email, password, fecha_nacimiento) VALUES (%(nombre)s, %(alias)s, %(email)s, %(password)s, %(fecha_nacimiento)s);"
        id = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data)
        print("ID:", id)
        resultado = None
        if id:
            resultado = cls.get(id)
        return resultado

    @classmethod
    def get(cls, id):
        sql = """
        SELECT id, nombre, alias, email, password, fecha_nacimiento,pokes_recibidos FROM usuarios where id != %(id)s;
        """
        data = {
            'id': id
        }
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data);
        return cls(result[0])


#3_/procesar_login procesa el regsitro del login donde hace match el correo con password

    @classmethod
    def get_by_email(cls, email):
        sql = """
        SELECT id, email, password, nombre,alias FROM usuarios where email = %(email)s;
        """
        data = {
            'email': email
        }
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data)

        if result:
            return cls(result[0])

        return None
    


#4_/Elimina registros   
    @classmethod
    def delete(cls, id):
        sql = """
        DELETE FROM usuarios where id = %(id)s;
        """
        data = {
            'id': id
        }
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data);

        return result

    def actualizar(self):

        sql = """
            UPDATE usuarios
                SET
                email = %(email)s,
                password = %(password)s,
                nombre = %(nombre)s,
                alias = %(alias)s,
                pokes_recibidos = %(pokes_recibidos)s,
                WHERE id = %(id)s;
            """

        data = {
            'email': self.email,
            'password': self.password,
            'nombre': self.nombre,
            'alias': self.alias,
            'pokes_recibidos':self.pokes_recibidos,
            'id': self.id
        }
        self.id = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data)
        return self
