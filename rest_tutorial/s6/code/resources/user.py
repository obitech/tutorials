import sqlite3
from flask_restful import Resource, reqparse
from models.user import UserModel

# Resource so we can add it to API
class UserRegister(Resource):
  parser = reqparse.RequestParser()
  parser.add_argument('username',
    type=str,
    required=True,
    help="This field has cannot be left blank"
  )
  parser.add_argument('password',
    type=str,
    required=True,
    help="Password field cannot be left blank"
  )

  def post(self):
    data = UserRegister.parser.parse_args()
    
    # Check if user exists already
    if UserModel.find_by_username(data['username']):
      return {"message": f"Error: User {data['username']} already exists."}, 400

    user = UserModel(**data)
    user.save_to_db()

    return {"message": f"User {data['username']} created successfully."}, 201