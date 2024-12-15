# Используем базовый образ Python
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Копируем приложение в контейнер
COPY app/ app/

# Открываем порт 5000
EXPOSE 5000

# Запускаем приложение
CMD ["python", "app/app.py"]
