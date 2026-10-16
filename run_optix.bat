@echo off
title Optix
cd /d "%~dp0"

if not exist "app.pyw" (
    echo [ОШИБКА] Файл app.pyw не найден в текущей папке.
    echo Убедитесь, что run_optix.bat лежит рядом с app.pyw.
    pause
    exit /b 1
)

where pythonw >nul 2>&1
if errorlevel 1 (
    where python >nul 2>&1
    if errorlevel 1 (
        echo [ОШИБКА] Python не найден в PATH.
        echo Сначала запустите install.bat.
        pause
        exit /b 1
    )
    REM pythonw нет - используем python
    python "app.pyw"
) else (
    REM Запускаем через pythonw - без чёрной консоли
    start "" pythonw "app.pyw"
)