from sqlalchemy import Column, Integer, String, ForeignKey
from . import PostgresBase

class Project(PostgresBase):
    __tablename__ = 'project'

    _id = Column('id', Integer, primary_key=True)
    name = Column('name', String)
    description = Column('description', String)
    professor_id = Column('professor_id', ForeignKey('professor_user.id'))
