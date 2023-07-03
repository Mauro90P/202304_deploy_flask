from flask import render_template, request, redirect, session, flash
from app.models.usuarios import Usuario
from app.models.viajes import Viajes
from app import app
from flask_bcrypt import Bcrypt        
bcrypt = Bcrypt(app) 

#1_/login: Renderiza la plantilla 'auth/login.html'

@app.route('/index')
def login():

    if 'usuario' in session:
        return redirect('/')
    return render_template('index.html')

#2_/procesar_login: Procesa el formulario de inicio de sesión enviado por POST

@app.route('/procesar_login', methods=['POST'])
def procesar_login():
    print("POST: ", request.form)
    
    usuario_encontrado = Usuario.get_by_email(request.form['email'])

    if not usuario_encontrado:
        flash('Existe un error en tu correo o contraseña', 'danger')
        return redirect('/index')

    login_seguro = bcrypt.check_password_hash(usuario_encontrado.password, request.form['password'])

    data = {
        "usuario_id": usuario_encontrado.id,
        "email": usuario_encontrado.email,
        "apellido": usuario_encontrado.apellido,
        "nombre": usuario_encontrado.nombre,
        "password": usuario_encontrado.password,
    }

    if login_seguro:
        session['usuario'] = data
        flash('Genial, pudiste entrar sin problemas!!!!', 'success')

    else:
        flash('Existe un error en tu correo o contraseña', 'danger')
        return redirect('/registro')

    return redirect('/index')



#3_/procesar_registro: Procesa el formulario de registro enviado por POST


@app.route('/procesar_registro', methods=['POST'])
def procesar_registro():
    print("POST: ", request.form)

    if request.form['password'] != request.form['confirm_password']:
        flash("La contraseña no es igual", "danger")
        return redirect('/registro')
    
    if not Usuario.validar(request.form):
        return redirect('/index')

    password_hash = bcrypt.generate_password_hash(request.form['password'])

    data = {
        'nombre': request.form['nombre'],
        'email': request.form['email'],
        'apellido': request.form['apellido'],
        'password': password_hash,
    }

    existe_usuario = Usuario.get_by_email(request.form['email'])
    if existe_usuario:
        flash("el correo ya está registrado.", "danger")
        return redirect('/index')


    resultado = Usuario.save(data)
    if resultado:
        flash("Registrado Correctamente", "success")
    else:
        flash("Errores", "danger")

    return redirect('/index')


#4_/salir: Borra todos los datos de la sesión 

@app.route('/salir')
def salir():
    session.clear()
    flash('Saliste sin problemas!!!', 'info')
    return redirect('/index')

