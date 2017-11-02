from flask import Flask, jsonify, request, render_template

# Create new app
app = Flask(__name__)

stores = [
  {
    'name': 'My Test Store',
    'items': [
      {
      'name': 'My Item',
      'price': 15.99
      }
    ]
  }
]

@app.route('/')
def home():
  # Flask will look in template folder
  return render_template('index.html')

# Create a new store with given name
# POST /store data: {name:}
@app.route('/store', methods=['POST'])
def create_store():
  request_data = request.get_json()
  new_store = {
    'name': request_data['name'],
    'items': []
  }
  stores.append(new_store)
  return jsonify(new_store)

# Return store with given name
# GET /store/<name>
@app.route('/store/<string:name>', methods=['GET'])
def get_store(name):
  # Iterate over stores, return matching store or error message
  for store in stores:
    if store['name'] == name:
      return jsonify(store)
    else:
      return jsonify({'message': "Store not found!"})


# Return list of all stores
# GET /store
@app.route('/store', methods=['GET'])
def get_stores():
  # Convert stores variable into JSON, needs to be dict not list !
  return jsonify({'stores': stores})

# Create item inside a store with given name
# POST /store/<name>/item
@app.route('/store/<string:name>/item', methods=['POST'])
def create_item_in_store(name):
  request_data = request.get_json()
  for store in stores:
    if store['name'] == name:
      new_item = {
        'name': request_data['name'],
        'price': request_data['price']
      }
      store['items'].append(new_item)
      return jsonify(new_item)
  return jsonify({'message': 'Store not found!'})


# Return specific item from a store
# GET /store/<name>/item
@app.route('/store/<string:name>/item', methods=['GET'])
def get_item_in_store(name):
  for store in stores:
    if store['name'] == name:
      return jsonify(store['items'])
    else:
      return jsonify({'message': "Store not found!"})

# Start app
app.run(port=8080)  