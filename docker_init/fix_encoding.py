# -*- coding: utf-8 -*-
import asyncio
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker
from sqlalchemy import text

DATABASE_URL = "postgresql+asyncpg://admin:root@localhost:5432/my_project"

STATEMENTS = [
    ("UPDATE lessons SET lesson_name = :name, description = :desc WHERE id = 1", {"name": "Основы Python и алгоритмов", "desc": "Базовые концепции Python, структуры данных и базовые алгоритмы."}),
    ("UPDATE lessons SET lesson_name = :name, description = :desc WHERE id = 2", {"name": "React Native & Expo Мастер", "desc": "Создание современных мобильных интерфейсов с анимациями и жестами."}),
    ("UPDATE lessons SET lesson_name = :name, description = :desc WHERE id = 3", {"name": "Архитектура P2P и ZKP", "desc": "Криптографические доказательства с нулевым разглашением и P2P сети."}),
    ("UPDATE lesson_sheets SET sheet_header = :h, content = :c WHERE id = 1", {"h": "Введение в переменные", "c": "Переменные в Python создаются динамически при первом присваивании значения. Тип данных определяется автоматически интерпретатором."}),
    ("UPDATE lesson_sheets SET sheet_header = :h, content = :c WHERE id = 2", {"h": "Проверка знаний", "c": "Какой тип данных используется для целых чисел в Python?"}),
    ("UPDATE lesson_sheets SET sheet_header = :h, content = :c WHERE id = 3", {"h": "Компоненты в React Native", "c": "В React Native базовыми строительными блоками являются компоненты View, Text, Image и TouchableOpacity."}),
]

async def main():
    engine = create_async_engine(DATABASE_URL)
    async_session = sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)
    async with async_session() as session:
        for stmt, params in STATEMENTS:
            await session.execute(text(stmt), params)
        await session.commit()
    await engine.dispose()
    print("SUCCESS: UTF-8 Russian text applied to DB!")

if __name__ == "__main__":
    asyncio.run(main())
