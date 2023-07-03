from flask import render_template, redirect, session
from app import app
from app.models.usuarios import Usuario
from app.models.viajes import Viajes

@app.route('/')
def inicio():

    if 'usuario' not in session:
        return redirect('auth/index')

    usuarios=Usuario.get_all()
    return render_template('detalle.html',usuarios=usuarios)

@app.route('/')
def inicio1():
    viaje=Viajes.get_all()
    return render_template('detalle.html',viaje=viaje)
