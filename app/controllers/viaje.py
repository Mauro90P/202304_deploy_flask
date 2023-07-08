from flask import render_template, request, redirect, session, flash
from app.models.viajes import Viajes
from app.models.usuarios import Usuario
from app import app

#PROCESAR EL FORMULARIO DE JOB 


@app.route('/procesar_addtrip', methods=['POST'])
def procesar_addtrip():
    print("POST: RESULTADO", request.form)

    data = {
        'creador_id': session["usuario"]["usuario_id"],
        'destino': request.form['destino'],
        'descripcion': request.form['descripcion'],
        'fecha_desde': request.form['fecha_desde'],
        'fecha_hasta': request.form['fecha_hasta'],
    }
    Viajes.save(data)
    return redirect('/')







@app.route('/')
def datos():
    if 'usuario' not in session:
        return redirect('/login')
    data = {
        'usuario_id': session["usuario"]["usuario_id"],
    }
    dato_viaje =Viajes.get_all(data)
    otros_viajes = Viajes.get_otros_viajes(data)
    return render_template('detalle.html', data=dato_viaje,otros_viajes=otros_viajes)









@app.route('/registro')
def registro():
    return render_template('/registro.html')


@app.route('/addtrip')
def addtrip():
    return render_template('/addtrip.html')

@app.route('/detalle')
def detalle():
    return render_template('/detalle.html')

@app.route('/viaje/<int:id>')
def viaje(id):
    data={"id":id}
    viaje=Viajes.get(data)
    return render_template('/vista_viaje.html',viaje=viaje)


@app.route('/delete/<int:id>')
def delete(id):
    Viajes.delete(id)
    return redirect('/')


@app.route('/join/<int:id>')
def join(id):
    query = f" FROM Viajes where id = {id}"
    return render_template('/vista_viaje.html')