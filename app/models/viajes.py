import re
import os
from app.config.mysqlconnection import connectToMySQL
from flask import flash


class Viajes:

    def __init__(self, data):
        self.id = data.get('id', 0)
        self.creador_id = data.get('creador_id')
        self.destino = data.get('destino')
        self.descripcion = data.get('descripcion')
        self.fecha_desde = data.get('fecha_desde')
        self.fecha_hasta = data.get('fecha_hasta')

    def crear(self):
        sql = "INSERT INTO Viajes (creador_id,destino, descripcion, fecha_desde, fecha_hasta) VALUES (%(creador_id)s,(%(destino)s, %(descripcion)s, %(fecha_desde)s, %(fecha_hasta)s);"
        data = {
            'creador_id': self.creador_id,
            'destino': self.destino,
            'descripcion': self.descripcion,
            'fecha_desde': self.fecha_desde,
            'fecha_hasta': self.fecha_hasta,
        }
        self.id = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data)
        return self



    @classmethod
    def save(cls, data):
        sql = "INSERT INTO Viajes (creador_id, destino, descripcion, fecha_desde, fecha_hasta) VALUES (%(creador_id)s,%(destino)s, %(descripcion)s, %(fecha_desde)s, %(fecha_hasta)s);"
        id = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data)
        print("ID:", id)
        resultado = None
        if id:
            resultado = cls.get(id)
        return resultado
    print('return')


    @classmethod
    def get(cls,id):
        data={"id":id}
        sql = """ 
         SELECT id,destino,fecha_desde, fecha_hasta,descripcion,creador_id FROM  Viajes WHERE id=%(id)s;
        """
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data);
        return cls(result[0])

    @classmethod
    def get_all(cls,data):
        todos_los_datos = []

        sql = """
        SELECT Viajes.id,descripcion,fecha_desde,fecha_hasta,destino,creador_id FROM Viajes INNER JOIN Usuarios ON Usuarios.id = Viajes.creador_id WHERE creador_id = %(usuario_id)s;
        """
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql,data);
        for fila in result:
            instancia = cls(fila)
            todos_los_datos.append(instancia)
        return todos_los_datos
    
    @classmethod
    def get_otros_viajes(cls,data):
        todos_los_datos = []

        sql = """
        SELECT Viajes.id,descripcion,fecha_desde,fecha_hasta,destino,creador_id FROM Viajes INNER JOIN Usuarios ON Usuarios.id = Viajes.creador_id WHERE creador_id != %(usuario_id)s;
        """
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql,data);
        for fila in result:
            instancia = cls(fila)
            todos_los_datos.append(instancia)
        return todos_los_datos



#3_/procesar_login procesa el regsitro del login donde hace match el correo con password

    @classmethod
    def get_by_email(cls, email):
        sql = """
        SELECT id, email, password, nombre FROM usuarios where email = %(email)s;
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
        DELETE FROM Viajes where id = %(id)s;
        """
        data = {
            'id': id
        }
        result = connectToMySQL(os.getenv("BASE_DE_DATOS")).query_db(sql, data);

        return result