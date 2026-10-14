from fastapi.security import OAuth2PasswordBearer
from fastapi import Depends
from .jwt_tokens import verify_token, decode_token
from fastapi import HTTPException
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="users/login")

from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from jose import JWTError, jwt
from sqlalchemy.ext.asyncio import AsyncSession

from core.config import settings
from databases.main_databases import get_db
from databases.users_db.users_db import User 
from sqlalchemy import select



async def get_current_user(
    token: str = Depends(oauth2_scheme), 
    db: AsyncSession = Depends(get_db)
) -> int:
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Не удалось валидировать учетные данные",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = decode_token(token)
        user_id_raw = payload.get("sub")
        if user_id_raw is None:
            raise credentials_exception
        user_id: int = int(user_id_raw)
    except (JWTError, ValueError):
        raise credentials_exception

    result = await db.execute(select(User).where(User.id == user_id))
    user = result.scalar_one_or_none()
    
    if user is None:
        raise credentials_exception
    return user_id


async def get_current_user_object(
    token: str = Depends(oauth2_scheme), 
    db: AsyncSession = Depends(get_db)
) -> User:
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Не удалось валидировать учетные данные",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = decode_token(token)
        user_id_raw = payload.get("sub")
        if user_id_raw is None:
            raise credentials_exception
        user_id: int = int(user_id_raw)
    except (JWTError, ValueError):
        raise credentials_exception

    result = await db.execute(select(User).where(User.id == user_id))
    user = result.scalar_one_or_none()
    
    if user is None:
        raise credentials_exception
    return user


async def get_current_teacher_user(
    user: User = Depends(get_current_user_object)
) -> int:
    if not getattr(user, "is_teacher", False):
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Доступ запрещен: действие доступно только преподавателям (is_teacher=true)"
        )
    return user.id

    
    
    
