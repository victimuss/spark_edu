from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from core.config import settings
from sqlalchemy.pool import NullPool

# The database runs in the `db` Docker service.  Keep the configured hostname
# intact: inside the backend container `localhost` refers to the backend itself.
engine = create_async_engine(settings.DATABASE_URL, echo=True, poolclass=NullPool)

# 2. Создаем фабрику сессий
async_session = async_sessionmaker(
    bind=engine, 
    class_=AsyncSession, 
    expire_on_commit=False
)

# 3. Единственная важная функция-зависимость для ваших эндпоинтов
async def get_db():
    """Dependency для получения сессии БД в эндпоинтах FastAPI"""
    async with async_session() as session:
        try:
            yield session
        finally:
            await session.close()
