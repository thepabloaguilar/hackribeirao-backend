from flask import abort
from flask_restful import Resource

from ..security import auth_token_required, encrypt_password
from ..parsers import create_student_user_parser, create_professor_user_parser
from ..model import PostgresSession
from ..model.user import StudentUser
from ..model.professor import ProfessorUser

class StudentUserResource(Resource):

    def _get_user(self, email):
        session = PostgresSession()

        user = session.query(StudentUser). \
            select_from(StudentUser).\
            filter(StudentUser.email == email).one_or_none()

        return user

    def _create_user(self, informations):
        if self._get_user(informations.email):
            abort(400, 'User already exist')
        
        password = encrypt_password(informations.password)
        user = StudentUser(
            name=informations.name,
            password=password,
            birth_date=informations.birth_date,
            gender=informations.gender,
            ra=informations.ra,
            telephone_number=informations.telephone_number,
            email=informations.email,
            mother_name=informations.mother_name,
            father_name=informations.father_name,
        )

        session = PostgresSession()
        session.add(user)
        session.commit()
        return True

    @auth_token_required
    def get(self):
        user = self._get_user(self.user_info['email'])
        informations = {
            'name': user.name,
            'birth_date': user.birth_date.strftime('%Y-%m-%d'),
            'gender': user.gender,
            'ra': user.ra,
            'telephone_number': user.telephone_number,
            'email': user.email,
            'mother_name': user.mother_name,
            'father_name': user.father_name,
            'image_url': '',
        }
        return informations

    def post(self):
        args = create_student_user_parser.parse_args()
        self._create_user(args)
        return {'status': f'User {args.email} was created successfuly'}, 201


class ProfessorUserResource(Resource):

    def _get_user(self, email):
        session = PostgresSession()

        user = session.query(ProfessorUser). \
            select_from(ProfessorUser).\
            filter(ProfessorUser.email == email).one_or_none()

        return user

    def _create_user(self, informations):
        if self._get_user(informations.email):
            abort(400, 'User already exist')
        
        password = encrypt_password(informations.password)
        user = ProfessorUser(
            name=informations.name,
            password=password,
            email=informations.email,
            subjects=informations.subjects,
            image_url='url'
        )

        session = PostgresSession()
        session.add(user)
        session.commit()
        return True

    @auth_token_required
    def get(self):
        user = self._get_user(self.user_info['email'])
        informations = {
            'name': user.name,
            'email': user.email,
            'subjects': [item.strip() for item in user.subjects.split(',')],
            'image_url': '',
        }
        return informations

    def post(self):
        args = create_professor_user_parser.parse_args()
        self._create_user(args)
        return {'status': f'User {args.email} was created successfuly'}, 201
