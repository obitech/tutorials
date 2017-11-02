from db import db

class StoreModel(db.Model):
  __tablename__ = 'stores'

  id  = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(80))

  # without lazy='dynamic', a new object for every item gets created, anytime a new StoreModel gets created
  # now it's a query builder!
  items = db.relationship('ItemModel', lazy='dynamic')

  def __init__(self, name):
    self.name = name

  # Everytime we call .json(), we have to go into table
  # Trade-off: slower when store gets created or slower when .json() gets accessed?
  def json(self):
    return {'id': self.id, 'name': self.name, 'items': [item.json() for item in self.items.all()]}

  @classmethod
  def find_by_name(cls, name):
    return cls.query.filter_by(name=name).first()

  def save_to_db(self):
    db.session.add(self)
    db.session.commit()

  def delete_from_db(self):
    db.session.delete(self)
    db.session.commit()