from flask import render_template, request, redirect, session, flash
from app.models.usuarios import Usuario
from datetime import datetime
from app import app
from flask_bcrypt import Bcrypt        
bcrypt = Bcrypt(app) 



#1_/login: Renderiza la plantilla 'auth/login.html'
@app.route('/login')
def login():

    if 'usuario' in session:
        return redirect('/')
    session['start_time'] = datetime.now()
        
    return render_template('auth/login.html')

#2_/procesar_login: Procesa el formulario de inicio de sesión enviado por POST

@app.route('/procesar_login', methods=['POST'])
def procesar_login():
    print("POST: ", request.form)
    
    usuario_encontrado = Usuario.get_by_email(request.form['email'])

    if not usuario_encontrado:
        flash('Existe un error en tu correo o contraseña', 'danger')
        return redirect('/login')

    login_seguro = bcrypt.check_password_hash(usuario_encontrado.password, request.form['password'])

    data = {
        "usuario_id": usuario_encontrado.id,
        "email": usuario_encontrado.email,
        "password": usuario_encontrado.password,
        "nombre": usuario_encontrado.nombre,
        "alias": usuario_encontrado.alias,
        "pokes_recibidos": usuario_encontrado.pokes_recibidos,

    }

    if login_seguro:
        session['usuario'] = data
        flash('Genial, pudiste entrar sin problemas!!!!', 'success')

    else:
        flash('Existe un error en tu correo o contraseña', 'danger')
        return redirect('/login')

    return redirect('/')




#3_/procesar_registro: Procesa el formulario de registro enviado por POST


@app.route('/procesar_registro', methods=['POST'])
def procesar_registro():
    print("POST: ", request.form)

    if request.form['password'] != request.form['confirm_password']:
        flash("La contraseña no es igual", "danger")
        return redirect('/login')
    
    if not Usuario.validar(request.form):
        return redirect('/login')

    password_hash = bcrypt.generate_password_hash(request.form['password'])

    data = {
        'nombre': request.form['nombre'],
        'alias': request.form['alias'],
        'email': request.form['email'],
        'fecha_nacimiento': request.form['fecha_nacimiento'],
        'password': password_hash,
    }

    existe_usuario = Usuario.get_by_email(request.form['email'])
    if existe_usuario:
        flash("el correo ya está registrado.", "danger")
        return redirect('/login')


    resultado = Usuario.save(data)
    if resultado:
        flash("Registrado Correctamente", "success")
    else:
        flash("Errores", "danger")

    return redirect('/login')


#4_/salir: Borra todos los datos de la sesión 

@app.route('/salir')
def salir():
    session.clear()
    flash('Saliste sin problemas!!!', 'info')
    return redirect('/login')

