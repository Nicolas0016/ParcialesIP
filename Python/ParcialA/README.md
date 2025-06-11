# Ejercicio 1
```
 problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
  requiere: {e pertenece a s }
  asegura: {res es la posición de la última aparició de e en s}
}
```

> Ejemplo

``` py
s = [-1,4,0,4,100,0,100,0,-1,-1]
e = 0
ultima_aparicion(s,e) = 7
```

# Ejercicio 2

```
problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
    requiere: -
    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
    asegura: {res no tiene elementos repetidos }
  }
```
> Ejemplo
```py
s = [-1,4,0,4,3,0,100,0,-1,-1]
t = [0,100,5,0,100,-1,5]
elementos_exclusivos(s,t) = [3,4,5]  # ó [3,5,4] ó [4,3,5] ó [4,5,3] ó [5,3,4] ó [5,4,3]
```


# Ejercicio 3

Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de palabras que tienen la misma traducción en inglés y en alemán.

```
problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
  requiere: True
  asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
}
```

> Ejemplo:
```py
alemán = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
contar_traducciones_iguales(inglés, alemán) = 2
```

# Ejercicio 4

Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, y sus valores la cantidad de veces que cada uno de esos números aparece en s

```
problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
  requiere: -
  asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
}
```

>  Ejemplo

```py
lista = [-1,0,4,100,100,-1,-1]
convertir_a_diccionario(lista) = {-1:3, 0:1, 4:1, 100:2}
```