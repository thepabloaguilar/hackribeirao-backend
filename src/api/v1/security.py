import datetime
import jwt

from functools import wraps
from flask import abort, request
from passlib.context import CryptContext


_pwd_context = CryptContext(
            schemes=['pbkdf2_sha256'])


def encrypt_password(password):
    return _pwd_context.encrypt(password)


def check_encrypted_password(password, hashed):
    return _pwd_context.verify(password, hashed)


def generate_auth_token(user):
    try:
        payload = {
            'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=120),
            'iat': datetime.datetime.utcnow(),
            'sub': {
                'id': user['_id'],
                'email': user['email']
            }
        }
        token = jwt.encode(payload, 'CHAVE_DE_CRIPTOGRAFIA', algorithm='HS256')
        return token.decode()
    except Exception as e:
        return e


def decode_auth_token(token):
    try:
        payload = jwt.decode(token, 'CHAVE_DE_CRIPTOGRAFIA')
        return payload['sub']
    except jwt.ExpiredSignatureError:
        abort(401, 'Token Invalido ou Expirado')
    except jwt.InvalidSignatureError:
        abort(401, 'Token Invalido ou Expirado')
    except jwt.exceptions.DecodeError:
        abort(401, 'Token Invalido ou Expirado')


def auth_token_required(func):
    @wraps(func)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authentication', None)

        if not token:
            abort(403, 'Token não especificado no header')
        
        args[0].user_info = decode_auth_token(token)
        return func(*args, **kwargs)
    return decorated
