from flask_restful import reqparse

create_student_user_parser = reqparse.RequestParser()
create_student_user_parser.add_argument('name', type=str)
create_student_user_parser.add_argument('password', type=str)
create_student_user_parser.add_argument('birth_date', type=str)
create_student_user_parser.add_argument('gender', type=str)
create_student_user_parser.add_argument('ra', type=str)
create_student_user_parser.add_argument('telephone_number', type=str)
create_student_user_parser.add_argument('email', type=str)
create_student_user_parser.add_argument('mother_name', type=str)
create_student_user_parser.add_argument('father_name', type=str)

create_professor_user_parser = reqparse.RequestParser()
create_professor_user_parser.add_argument('name', type=str)
create_professor_user_parser.add_argument('password', type=str)
create_professor_user_parser.add_argument('email', type=str)
create_professor_user_parser.add_argument('subjects', type=str)

login_parser = reqparse.RequestParser()
login_parser.add_argument('email', type=str)
login_parser.add_argument('password', type=str)
login_parser.add_argument('is_student', type=bool, required=True)

get_questions = reqparse.RequestParser()
get_questions.add_argument('question_type', type=str,
    choices=['classroom', 'entertainment', 'school_problems', 'integration'])

post_answer = reqparse.RequestParser()
post_answer.add_argument('question_id', type=str)
post_answer.add_argument('answer', type=str)
