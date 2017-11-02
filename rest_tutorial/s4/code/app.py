from flask import Flask, request
from flask_restful import Resource, Api, reqparse
from flask_jwt import JWT, jwt_required

from security import authenticate, identity

app = Flask(__name__)
app.secret_key = "superSecretKey_ChangeItHere"
api = Api(app)

# JWT creates new endpoint - /auth 
# 1. Browser calls /auth endpoint, sending username/pw with it
# 2. JWT sends u/pw to authenticate function
# 3. authenticate() is finding correct user object + comparing password
# 4. Returned user becomes identity, JWT returns token
# 5. Sending JWT next request we make: calls identity() and returns correct user (or not)
jwt = JWT(app, authenticate, identity)

items = []

class ItemList(Resource):
  def get(self):
    return {'items': items}

class Item(Resource):
  parser = reqparse.RequestParser()
  parser.add_argument('price',
    type=float,
    required=True,
    help="This field has to be a float and cannot be left blank"
  )

  @jwt_required()
  def get(self, name):
    # Looping over every item and checking for name
    # next returns first item found by filter function or None
    item = next(filter(lambda x: x['name'] == name, items), None)
    return {'item': item}, 200 if item else 404

  def post(self, name):
    # 400 = bad request
    if next(filter(lambda x: x['name'] == name, items), None) is not None:
      return {'message': f"Item '{name}' already exists."}, 400

    data = Item.parser.parse_args()
    
    # force=True - Content-Type header not needed, will format automatically
    # silent=True - Doesn't give error, returns None 
    item = {'name': name, 'price': data['price']}
    items.append(item)

    # 201 = created
    return item, 201

  def delete(self, name):
    global items
    items = list(filter(lambda x: x['name'] != name, items))
    return {'message': 'Item deleted'}

  # Needs to be idempotent
  def put(self, name):
    # Parser will parse arguments of request, as defined above
    # Extra arguments (other than defined above) will be 'deleted'
    data = Item.parser.parse_args()
    item = next(filter(lambda x: x['name'] == name, items), None)

    if item:
      item.update(data)
    else:
      item = {'name': name, 'price': data['price']}
      items.append(item)
    return item, 201


# Make Resource accessible to API, define route
api.add_resource(Item, '/item/<string:name>')
api.add_resource(ItemList, '/items')

app.run(port=5000, debug=True)