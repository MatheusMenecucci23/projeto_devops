from fastapi import FastAPI
from pydantic import BaseModel
import re
import mysql.connector
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

import os

db_config = {
    'user': os.getenv('DB_USER', 'root'),
    'password': os.getenv('DB_PASSWORD', ''),
    'host': os.getenv('DB_HOST', 'db'),
    'database': os.getenv('DB_NAME', ''),
}


origins = [
    "http://localhost:5173",  # porta do seu frontend Vue
    "http://localhost",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,           # quais origens podem acessar
    allow_credentials=True,
    allow_methods=["*"],             # métodos permitidos (GET, POST, OPTIONS...)
    allow_headers=["*"],             # cabeçalhos permitidos
)

class Expression(BaseModel):
    expression: str


def save_operation(expression, result):
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        query = "INSERT INTO history (expression, result) VALUES (%s, %s)"
        cursor.execute(query, (expression, result))
        conn.commit()
        cursor.close()
        conn.close()
    except mysql.connector.Error as err:
        print(f"Erro no banco: {err}")


@app.post("/calculate")
async def calculate(expr: Expression):
    # Permitir só números, espaços, operadores básicos e parênteses
    if not re.match(r'^[0-9+\-*/().\s]+$', expr.expression):
        return {"error": "Expressão contém caracteres inválidos."}

    try:
        # Avalia a expressão com eval
        # Atenção: aqui é simplificado, não execute eval em ambiente de produção sem filtros!
        result = eval(expr.expression, {"__builtins__": None}, {})
    except Exception as e:
        return {"error": f"Erro na avaliação da expressão: {e}"}

    save_operation(expr.expression, result)
    return {"result": result}
