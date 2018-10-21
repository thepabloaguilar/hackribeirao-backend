from sqlalchemy import Column, Integer, String, Boolean, Date
from . import PostgresBase

class ProfessorUser(PostgresBase):
    __tablename__ = 'professor_user'

    _id = Column('id', Integer, primary_key=True)
    name = Column('name', String)
    password = Column('password', String)
    email = Column('email', String)
    subjects = Column('subjects', String)
    image_url = String('image_url', String)
