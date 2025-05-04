# Problema 1: relacionesValidas 

**Descripción**:
Implementar la función `relacionesValidas` que verifique si una lista de relaciones de amistad es válida.

**Requisitos**:
- Una relación no puede tener la misma persona en ambas posiciones (ej. `("Ana","Ana")` es inválido)
- No puede haber relaciones duplicadas (considerar que `("A","B")` es igual a `("B","A")`)

**Tipo**:
```haskell
relacionesValidas :: [(String, String)] -> Bool
```

**Especificación:** 
```
problema relacionesValidas (relaciones: seq⟨String × String⟩) : Bool {
    requiere: {True}
    asegura: {(res = true) ↔ no hay tuplas en relaciones con ambas componentes iguales ni tuplas repetidas (sin considerar
    el orden)}
}
```


**Ejemplos:**
```haskell
relacionesValidas [("Ana","Carlos"), ("Juan","Maria")]  == True
relacionesValidas [("Ana","Ana"), ("Carlos","Juan")]    == False
relacionesValidas [("A","B"), ("B","A")]                == False
```

# Problema 2: personas

**Descripción**:
Implementar la función `personas` que devuelva todas las personas distintas mencionadas en las relaciones.

**Requisitos**:
- No debe haber nombres repetidos en el resultado
- Debe incluir personas de ambas posiciones de las tuplas

**Tipo**:
```hs
personas :: [(String, String)] -> [String]
```

**Especificación**: 
```
problema personas (relaciones: seq⟨String × String⟩) : seq⟨String⟩ {
    requiere: {relacionesValidas(relaciones)}
    asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones en cualquiera de las dos posiciones, sin repetir}
}
```

**Ejemplos**
```hs
personas [("Ana","Carlos"), ("Juan","Maria")]  == ["Ana","Carlos","Juan","Maria"] 
personas [("A","B"), ("B","C")] == ["A","B","C"]
```

# Problema 3: amigosDe 

**Descripción**:

Implementar la función `amigosDe` que devuelva los amigos directos de una persona dada.

**Requisitos**:

- Si la persona no tiene amigos o no aparece, devolver lista vacía
- Considerar ambas posiciones en las tuplas

**Tipo**:
```hs
amigosDe :: String -> [(String, String)] -> [String]
```
**Especificación:**
```
problema amigosDe (persona: String, relaciones: seq⟨String × String⟩) : seq⟨String⟩ {
requiere: {relacionesV alidas(relaciones)}
asegura: {resu tiene exactamente los elementos que figuran en alguna tupla de relaciones en las que alguna de las
componentes es persona}
}

```
**Ejemplos:**
```hs
amigosDe "Ana" [("Ana","Carlos"), ("Juan","Maria")] == ["Carlos"]
amigosDe "B" [("A","B"), ("B","C"), ("D","B")] == ["A","C","D"]
amigosDe "Pedro" [("Ana","Carlos"), ("Juan","Maria")] == []
```

# Problema 4: personaConMasAmigos (2 puntos)

**Descripción**:
Implementar la función `personaConMasAmigos` que identifique a la persona con más conexiones.

**Requisitos**:

La lista de relaciones no debe estar vacía en caso de empate, puede devolver cualquiera de las personas con máximo de amigos

**Tipo**:
```hs
personaConMasAmigos :: [(String, String)] -> String
```

**Especificación**:
```
problema personaConMasAmigos (relaciones: seq⟨String × String⟩) : String {
requiere: {relaciones no vac´ıa}
requiere: {relacionesV alidas(relaciones)}
asegura: {resu es el Strings que aparece m´as veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
}

```
**Ejemplos**
```hs
personaConMasAmigos [("Ana","Carlos"), ("Ana","Juan")] == "Ana"
personaConMasAmigos [("A","B"), ("B","C"), ("D","B")] == "B"
personaConMasAmigos [("X","Y"), ("Y","X")] -- Puede devolver "X" o "Y"
```