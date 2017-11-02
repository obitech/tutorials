from flask_restful import Resource
from flask_jwt import jwt_required
from models.store import StoreModel

class Store(Resource):
  @jwt_required()
  def get(self, name):
    store = StoreModel.find_by_name(name)
    if store:
      # returns store and items
      return store.json()

    return {'message': f'Store {name} not found.'}, 400

  @jwt_required()
  def post(self, name):
    if StoreModel.find_by_name(name):
      return {'message': f'Store {name} already exists!'}, 400

    store = StoreModel(name)
    try:
      store.save_to_db()
    except:
      return {'message': f'Error while trying to create store {name}.'}, 500

    return {'message': f'Store {name} created.'}, 200

  @jwt_required()
  def delete(self, name):
    store = StoreModel.find_by_name(name)
    if not store:
      return {'message': f'Store {name} not found!'}, 400

    try:
      store.delete_from_db()
    except:
      return {'message': f'Error while trying to delete store {name}.'}, 500

    return {'message': f'Store {name} deleted.'}, 200

class StoreList(Resource):
  @jwt_required()
  def get(self):
    return {'stores': [store.json() for store in StoreModel.query.all()]}