from sqlalchemy import Column, Integer, String, ForeignKey
from . import PostgresBase

class Answer(PostgresBase):
    __tablename__ = 'answer'

    _id = Column('id', Integer, primary_key=True)
    student_id = Column('student_id', ForeignKey('student_user.id'))
    question_id = Column('question_id', ForeignKey('question.id'))
    answer = Column('answer', String)
