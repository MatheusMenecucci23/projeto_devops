<template>
  <div class="calculator">
    <h1>Calculadora Web</h1>
    <div class="display">
      <div class="expression">{{ expression || "0" }}</div>
      <div class="result" v-if="result !== null">= {{ result }}</div>
      <div class="error" v-if="error">{{ error }}</div>
    </div>

    <div class="buttons">
      <!-- Números -->
      <button @click="append('7')">7</button>
      <button @click="append('8')">8</button>
      <button @click="append('9')">9</button>
      <button @click="append('/')">÷</button>

      <button @click="append('4')">4</button>
      <button @click="append('5')">5</button>
      <button @click="append('6')">6</button>
      <button @click="append('*')">×</button>

      <button @click="append('1')">1</button>
      <button @click="append('2')">2</button>
      <button @click="append('3')">3</button>
      <button @click="append('-')">−</button>

      <button @click="append('0')">0</button>
      <button @click="append('.')">.</button>
      <button @click="clear">C</button>
      <button @click="append('+')">+</button>

      <button class="equal" @click="calculate">=</button>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const expression = ref('')
const result = ref(null)
const error = ref(null)

function append(char) {
  error.value = null
  // Previne dois operadores seguidos (ex: ++ ou +*), só se o último for operador
  const operadores = ['+', '-', '*', '/', '.']
  const lastChar = expression.value.slice(-1)

  if (operadores.includes(char)) {
    // Não permite começar com operador, exceto '-'
    if (expression.value === '' && char !== '-') return
    // Não permite dois operadores seguidos (exceto '.' para número decimal)
    if (operadores.includes(lastChar) && !(char === '.' && lastChar !== '.')) return
  }

  expression.value += char
}

function clear() {
  expression.value = ''
  result.value = null
  error.value = null
}

async function calculate() {
  if (!expression.value) return
  error.value = null
  result.value = null

  try {
    const res = await axios.post('http://localhost:8000/calculate', { expression: expression.value })
    if (res.data.error) {
      error.value = res.data.error
    } else {
      result.value = res.data.result
    }
  } catch (e) {
    error.value = 'Erro ao conectar ao servidor.'
  }
}
</script>

<style scoped>
.calculator {
  max-width: 320px;
  margin: 40px auto;
  background: #222;
  color: white;
  border-radius: 10px;
  padding: 20px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  box-shadow: 0 4px 12px rgba(0,0,0,0.6);
}

h1 {
  text-align: center;
  margin-bottom: 20px;
}

.display {
  background: #333;
  border-radius: 6px;
  padding: 15px;
  margin-bottom: 15px;
  min-height: 60px;
  user-select: none;
}

.expression {
  font-size: 1.5em;
  word-wrap: break-word;
  min-height: 1.2em;
}

.result {
  font-size: 1.8em;
  font-weight: bold;
  margin-top: 5px;
  color: #4caf50;
}

.error {
  color: #e53935;
  margin-top: 5px;
  font-weight: bold;
}

.buttons {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 12px;
}

button {
  font-size: 1.4em;
  padding: 15px;
  border: none;
  border-radius: 6px;
  background: #444;
  color: white;
  cursor: pointer;
  transition: background 0.3s ease;
  user-select: none;
}

button:hover {
  background: #666;
}

button.equal {
  grid-column: span 4;
  background: #2196f3;
}

button.equal:hover {
  background: #1976d2;
}
</style>
