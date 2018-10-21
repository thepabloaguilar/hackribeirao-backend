from sqlalchemy import Column, Integer, String, Boolean, Date
from . import PostgresBase

class QuestionType(PostgresBase):
    __tablename__ = 'question_type'

    _id = Column('id', Integer, primary_key=True)
    _type = Column('type', String)
