from db import db

class ItemModel(db.Model):
  __tablename__ = 'items'

  id  = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(80))
  price = db.Column(db.Float(precision=2))

  # db.ForeignKey(<table_name>.<column_name>)
  store_id = db.Column(db.Integer, db.ForeignKey('stores.id'))
  store = db.relationship('StoreModel')

  def __init__(self, name, price, store_id):
    self.name = name
    self.price = price
    self.store_id = store_id

  def json(self):
    return {'id': self.id, 'name': self.name, 'price': self.price, 'store_id': self.store_id}

  @classmethod
  def find_by_name(cls, name):
    # .query comes from db.Model
    # -> SELECT * FROM items WHERE name=name LIMIT 1
    return cls.query.filter_by(name=name).first()

  def save_to_db(self):
    # Session is collcetion of objects we're writing to DB
    # will automatically update
    db.session.add(self)
    db.session.commit()

  def delete_from_db(self):
    db.session.delete(self)
    db.session.commit()