from flask_restful import Resource, reqparse
from flask_jwt import jwt_required
from models.item import ItemModel

class ItemList(Resource):
  @jwt_required()
  def get(self):
    # Returns all of objects in DB
    # alternative: list(map(lambda x: x.json(), ItemModel.query.all()))
    return {'items': [x.json() for x in ItemModel.query.all()]}


class Item(Resource):
  parser = reqparse.RequestParser()
  parser.add_argument('price',
    type=float,
    required=True,
    help="This field has to be a float and cannot be left blank"
  )
  parser.add_argument('store_id',
    type=int,
    required=True,
    help="Every item needs a store id."
  )

  @jwt_required()
  def get(self, name):
    try:
      item = ItemModel.find_by_name(name)
    except:
      return {'message': 'Error retrieving Item'}, 502

    if item:
      return item.json()
    
    return {'message': 'Item does not exist'}, 400

  @jwt_required()  
  def post(self, name):
    if ItemModel.find_by_name(name):
      return {'message': "Item already exists!"}, 400

    data = Item.parser.parse_args()
    
    # force=True - Content-Type header not needed, will format automatically
    # silent=True - Doesn't give error, returns None 
    item = ItemModel(name, **data)

    try:
      item.save_to_db()
    except:
      return {'message': "An error occurred inserting the item"}, 500

    # 201 = created
    return item.json(), 201

  @jwt_required()
  def delete(self, name):
    item = ItemModel.find_by_name(name)
    if item:
      item.delete_from_db()
      return {'message': 'Item deleted'}, 200

    return {'message': 'Item not found'}, 400

  # Needs to be idempotent
  @jwt_required()
  def put(self, name):
    # Parser will parse arguments of request, as defined above
    # Extra arguments (other than defined above) will be 'deleted'
    data = Item.parser.parse_args()
    item = ItemModel.find_by_name(name)
    if item is None:
      item = ItemModel(name, **data)
    else:
      item.price = data['price']
      item.store_id = data['store_id']

    item.save_to_db()
    return item.json(), 201

