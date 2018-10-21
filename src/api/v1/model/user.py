from sqlalchemy import Column, Integer, String, Boolean, Date
from . import PostgresBase

class StudentUser(PostgresBase):
    __tablename__ = 'student_user'

    _id = Column('id', Integer, primary_key=True)
    name = Column('name', String)
    password = Column('password', String)
    birth_date = Column('birth_date', Date, default=True)
    gender = Column('gender', String)
    ra = Column('ra', String)
    telephone_number = Column('telephone_number', String)
    email = Column('email', String)
    mother_name = Column('mother_name', String)
    father_name  = Column('father_name', String)
    image_url = String('image_url', String)
