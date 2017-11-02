from flask import Flask
from flask_restful import Resource, Api, reqparse
from flask_jwt import JWT, jwt_required

from security import authenticate, identity

from resources.user import UserRegister
from resources.item import Item, ItemList
from resources.store import Store, StoreList

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///data.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = "superSecretKey"
api = Api(app)

# SQLAlch will create tables it sees going through imports
@app.before_first_request
def create_tables():
  db.create_all()

# JWT creates new endpoint - /auth 
# 1. Browser calls /auth endpoint, sending username/pw with it
# 2. JWT sends u/pw to authenticate function
# 3. authenticate() is finding correct user object + comparing password
# 4. Returned user becomes identity, JWT returns token
# 5. Sending JWT next request we make: calls identity() and returns correct user (or not)
jwt = JWT(app, authenticate, identity)

# Make Resource accessible to API, define route
api.add_resource(Item, '/item/<string:name>')
api.add_resource(ItemList, '/items')
api.add_resource(UserRegister, '/register')
api.add_resource(Store, '/store/<string:name>')
api.add_resource(StoreList, '/stores')

if __name__ == "__main__":
  from db import db
  db.init_app(app)
  app.run(port=5000, debug=True)