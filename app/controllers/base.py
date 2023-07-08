from flask import render_template, redirect, session
from app import app
from app.models.usuarios import Usuario
from app.models.viajes import Viajes

# @app.route('/')
# def inicio():

#     if 'usuario' not in session:
#         return redirect('/index')
#     return