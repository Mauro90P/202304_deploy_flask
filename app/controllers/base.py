from flask import render_template, redirect, session
from app import app
from app.models.usuarios import Usuario

@app.route('/')
def inicio():

    if 'usuario' not in session:
        return redirect('/login')

    usuarios=Usuario.get_all()
    return render_template('inicio.html',usuarios=usuarios)