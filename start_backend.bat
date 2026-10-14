@echo off
chcp 65001 >nul
echo ==============================================
echo   SPARK EDU - Запуск локального бэкенда и БД
echo ==============================================

cd /d "%~dp0"

echo [1/3] Проброс портов adb reverse для Android эмулятора...
adb reverse tcp:8000 tcp:8000 >nul 2>&1
adb reverse tcp:8081 tcp:8081 >nul 2>&1

echo [2/3] Запуск Docker контейнеров (PostgreSQL 15, Redis 7, Backend)...
docker compose up -d

echo [3/3] Ожидание готовности бэкенда...
timeout /t 4 >nul
curl -s http://localhost:8000/

echo.
echo ==============================================
echo  Готово! Локальный бэкенд: http://localhost:8000
echo  База данных PostgreSQL: localhost:5432
echo  Redis: localhost:6379
echo ==============================================
