
# Parcial Haskell - Tema 2

Importante
Template de funciones a implementar aca
Lista de funciones permitidas aca
Ejemplo de hunit aca

Enunciado
La codificación por sustitución es una de las técnicas de cifrado más simples, en el que un caracter en el texto original es reemplazado por otro caracter dependiendo de un mapeo. Este mapeo puede representarse con una secuencia de tuplas de dos caracteres, donde la primera componente de la tupla representa el caracter original y la segunda componente el caracter por el cual se lo va a sustituir. Por simplicidad, en este problema codificaremos solo los caracteres que aparecen en el mapeo dado. Todos los restantes caracteres quedan inalterados en el mensaje codificado.

Para implementar este sistema de codificación nos enviaron las siguientes especificaciones y nos pidieron que hagamos el desarrollo enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en la materia Introducción a la Programación / Algoritmos y Estructuras de Datos I (FCEyN-UBA).

# Ejercicio 1 (2 puntos)

```
problema hayQueCodificar (c: Char, mapeo: seq⟨Char x Char⟩ ) : Bool {
  requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
  requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
  asegura: {res = true <=> c es igual a la primera componente de alguna tupla de mapeo}
}
```
# Ejercicio 2 (2 puntos)
```
problema cuantasVecesHayQueCodificar (c: Char, frase: seq⟨Char⟩, mapeo: seq⟨Char x Char⟩ ) : Z {
  requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
  requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
  requiere: {|frase| > 0 }
  requiere: {c pertenece a frase}
  asegura: {(res = 0 y hayQueCodificar (c, mapeo) = false) o (res = cantidad de veces que c aparece en frase y hayQueCodificar (c, mapeo) = true)}
}
```

# Ejercicio 3 (2 puntos)
```
problema laQueMasHayQueCodificar (frase: seq⟨Char⟩, mapeo: seq⟨Char x Char⟩ ) : Char {
  requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
  requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
  requiere: {|frase| > 0 }
  requiere: {Existe al menos un c que pertenece a frase y hayQueCodificar(c, mapeo)=true}
  asegura: {res = c donde c es el caracter tal que cuantasVecesHayQueCodificar(c, frase, mapeo) es mayor a cualquier otro caracter perteneciente a frase}
  asegura: {Si existen más de un caracter c que cumple la condición anterior, devuelve el que aparece primero en frase }
}
```
# Ejercicio 4 (3 puntos)

```
problema codificarFrase (frase: seq⟨Char⟩, mapeo: seq⟨Char x Char⟩ ) : seq ⟨Char⟩ {
  requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
  requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
  requiere: {|frase| > 0 }
  asegura: {|res| = | frase|}
  asegura: { Para todo 0 <= i < |frase| si hayQueCodificar(frase[i], mapeo) = true entonces res[i]= (mapeo[j]1, para un j tal que 0 <= j < |mapeo| y mapeo[j])0=frase[i]}
  asegura: { Para todo 0 <= i < |frase| si hayQueCodificar(frase[i], mapeo) = false entonces res[i]= frase[i]}
}
```
# Ejercicio 5 (1 punto) Conteste marcando la opción correcta. 

Si un usuario no cumple con la precondición de la especificación de un programa y el programa no termina (se cuelga) :

- [] El usuario tiene derecho a quejarse porque el programador debería haber contemplado ese caso.
- [] El usuario no tiene derecho a quejarse, pero el programa es incorrecto porque no debería colgarse.
- [x] El usuario no tiene derecho a quejarse y no importa que el programa se cuelgue para este caso.
