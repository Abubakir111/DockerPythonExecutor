from flask import Flask, request, jsonify
import sys
import io

app = Flask(__name__)

@app.route('/execute', methods=['POST'])
def execute_code():
    # Получаем код из POST-запроса
    code = request.json.get('code', '')

    # Перехватываем вывод
    old_stdout = sys.stdout
    sys.stdout = io.StringIO()

    try:
        # Выполняем код
        exec(code)
        output = sys.stdout.getvalue()
    except Exception as e:
        output = str(e)
    finally:
        # Восстанавливаем стандартный вывод
        sys.stdout = old_stdout

    # Возвращаем результат выполнения кода
    return jsonify({"result": output})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
