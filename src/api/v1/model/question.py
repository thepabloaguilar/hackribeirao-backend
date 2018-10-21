from sqlalchemy import Column, Integer, String, ForeignKey
from . import PostgresBase

class Question(PostgresBase):
    __tablename__ = 'question'

    _id = Column('id', Integer, primary_key=True)
    question_type_id = Column('question_type_id', ForeignKey('question_type.id'))
    question = Column('question', String)
    options = Column('options', String)
    field_type = Column('field_type', String)
