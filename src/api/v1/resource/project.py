from flask_restful import Resource


from ..security import auth_token_required
from ..model import PostgresSession
from ..model.project import Project
from ..parsers import post_project


class ProjectResource(Resource):

    def _get_projects(self):
        session = PostgresSession()

        qs = session.query(
            Project._id.label('id'),
            Project.name,
            Project.description
        )

        return [item._asdict() for item in qs]

    def _create_project(self, args):
        project = Project(
            name=args.name,
            description=args.description,
            professor_id=self.user_info['id']
        )

        session = PostgresSession()
        session.add(project)
        session.commit()
        session.close()
        return True

    @auth_token_required
    def post(self):
        args = post_project.parse_args()
        self._create_project(args)
        return {'status': 'Project created!'}, 201
    
    @auth_token_required
    def get(self):
        return self._get_projects()
