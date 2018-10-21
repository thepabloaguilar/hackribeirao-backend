from flask import abort
from flask_restful import Resource
from flasgger import swag_from

from ..security import encrypt_password, check_encrypted_password, \
    generate_auth_token
from ..model import PostgresSession
from ..model.user import StudentUser
from ..model.professor import ProfessorUser
from ..parsers import login_parser


class LoginResource(Resource):

    def _get_user_info(self, email):
        session = PostgresSession()

        user = session.query(
            StudentUser._id,
            StudentUser.email,
            StudentUser.password
        ).select_from(StudentUser).\
        filter(StudentUser.email == email).one_or_none()

        if not user:
            abort(404, 'Usuario não encontrado')
        return user._asdict()
    
    def _get_professor_info(self, email):
        session = PostgresSession()

        user = session.query(
            ProfessorUser._id,
            ProfessorUser.email,
            ProfessorUser.password
        ).select_from(ProfessorUser).\
        filter(ProfessorUser.email == email).one_or_none()

        if not user:
            abort(404, 'Usuario não encontrado')
        return user._asdict()

    def post(self):
        args = login_parser.parse_args()
        if args.is_student:
            user = self._get_user_info(args.email)
        else:
            user = self._get_professor_info(args.email)
        if check_encrypted_password(args.password, user['password']):
            return {'token': generate_auth_token(user)}
        abort(401, 'Senha Incorreta')
