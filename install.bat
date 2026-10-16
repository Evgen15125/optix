@echo off
title Optix - установка зависимостей
cd /d "%~dp0"

echo ========================================
echo   Optix - установка зависимостей
echo ========================================
echo.

where python >nul 2>&1
if errorlevel 1 (
    echo [ОШИБКА] Python не найден в PATH.
    echo.
    echo Скачайте Python 3.11 или 3.12 с:
    echo   https://www.python.org/downloads/
    echo.
    echo ВАЖНО: при установке отметьте галочку
    echo         "Add Python to PATH".
    echo.
    pause
    exit /b 1
)

echo Проверка версии Python:
python --version
echo.

echo Обновление pip...
python -m pip install --upgrade pip

echo.
echo Установка зависимостей из requirements.txt...
python -m pip install -r requirements.txt

if errorlevel 1 (
    echo.
    echo [ОШИБКА] Не удалось установить зависимости.
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ГОТОВО!
echo   Запускайте run_optix.bat
echo ========================================
pause