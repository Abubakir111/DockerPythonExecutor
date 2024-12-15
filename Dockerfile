# Используем официальный Python образ
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install -r requirements.txt

# Копируем весь проект в контейнер
COPY . .

# Открываем порт 5000
EXPOSE 5000

# Запускаем Flask приложение
CMD ["python", "app.py"]
