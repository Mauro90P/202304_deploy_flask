from app.controllers import login
from app.controllers import viaje
from app.controllers import base

from app import app
if __name__=="__main__":
    app.run(debug=True,port=5001)   