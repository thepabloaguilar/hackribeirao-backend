import flask_restful

from flask import Blueprint
from .resource import login, user, question, project

api_bp = Blueprint('v1', __name__)
api = flask_restful.Api(api_bp)

VERSION = 1

api.add_resource(login.LoginResource, '/login')

api.add_resource(user.StudentUserResource, '/student')
api.add_resource(user.ProfessorUserResource, '/professor')

api.add_resource(question.QuestionResource, '/questions')
api.add_resource(question.AnswerResource, '/answers')

api.add_resource(project.ProjectResource, '/projects')
