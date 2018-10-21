from flask_restful import Resource

from ..model import PostgresSession
from ..model.question import Question
from ..model.question_type import QuestionType
from ..model.answer import Answer
from ..parsers import get_questions, post_answer
from ..security import auth_token_required


class QuestionResource(Resource):

    def _format_options(self, questions):
        if not questions:
            return questions

        for question in questions:
            if question['options']:
                options = question['options'].split(' ')
                options = [item.strip().replace('_', ' ') for item in options]
                question['options'] = options
                    
        return questions

    def _get_questions(self, question_type):
        session = PostgresSession()

        qs = session.query(
            Question._id.label('id'),
            Question.question,
            Question.options,
            Question.field_type
        ).select_from(Question). \
        join(QuestionType, QuestionType._id == Question.question_type_id). \
        filter(QuestionType._type == question_type)

        questions = [item._asdict() for item in qs]

        return self._format_options(questions)

    @auth_token_required
    def get(self):
        args = get_questions.parse_args()
        return self._get_questions(args.question_type)


class AnswerResource(Resource):

    def _make_answer(self, args):
        answer = Answer(
            student_id=self.user_info['id'],
            question_id=args.question_id,
            answer=args.answer
        )

        session = PostgresSession()
        session.add(answer)
        session.commit()
        session.close()

        return True

    @auth_token_required
    def post(self):
        args = post_answer.parse_args()
        self._make_answer(args)
        return {'status': 'Answer saved.'}, 201
