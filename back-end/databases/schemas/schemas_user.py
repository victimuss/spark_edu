# src/schemas/user.py
from pydantic import BaseModel, EmailStr, ConfigDict
from typing import Optional, List
from datetime import datetime


# --- Схема для создания нового пользователя ---
class UserCreate(BaseModel):
    user_name: str
    email: EmailStr
    password: str
    is_teacher: Optional[bool] = False


# --- Схема для логина ---
class LoginUser(BaseModel):
    email: EmailStr
    password: str

    
# --- Схема для логина ---
class VerifyRequest(BaseModel):
    user_id: int | None = None
    public_key: str | None = None
    nonce: str
    signature: str

# --- Схема для отдельного урока пользователя ---
class UserLessonOut(BaseModel):
    lesson_id: int
    lesson_progress: float

    class Config:
        orm_mode = True


# --- Схема для вывода пользователя с уроками ---
class UserOut(BaseModel):
    id: Optional[int] = None
    user_name: str
    email: Optional[EmailStr] = None
    description: Optional[str] = None
    tag: Optional[str] = None
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None
    is_active: bool = True
    is_teacher: bool = False
    avatar: Optional[str] = None
    site: Optional[str] = None
    telegram: Optional[str] = None

    class Config:
        orm_mode = True


# --- Схема для токена и авторизации ---
class TokenOut(BaseModel):
    access_token: str
    refresh_token: Optional[str] = None
    token_type: str = "bearer"
    user: UserOut
    us_likes: int
    us_lessons: int
    us_learn_lessons: int
    
    
class SkillOut(BaseModel):
    id: int
    skill_name: str
    level: str
    class Config:
        orm_mode = True
    
class NewSkill(BaseModel):
    skill_name: str 
    level: str

class UserEdit(BaseModel):
    user_name: Optional[str] = None
    description: Optional[str] = None
    tag: Optional[str] = None
    site: Optional[str] = None
    telegram: Optional[str] = None
    avatar: Optional[str] = None
    is_teacher: Optional[bool] = None

