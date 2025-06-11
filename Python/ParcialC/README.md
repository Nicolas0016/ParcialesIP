# 1. Alerta Enfermedades Infecciosas (3 puntos)

Necesitamos detectar la aparición de posibles epidemias. Para esto contamos con un lista de enfermedades infecciosas y los registros de atención por guardia dados por una lista expedientes. Cada expediente es `una tupla con ID paciente y enfermedad que motivó la atención`. Debemos devolver un diccionario cuya clave son las enfermedades infecciosas y su valor es la proporción de pacientes que se atendieron por esa enfermedad. En este diccionario deben aparecer solo aquellas enfermedades infecciosas cuya proporción supere cierto umbral.

```
problema alarma_epidemiologica (registros: seq⟨ZxString⟩, infecciosas: seq⟨String⟩, umbral: R) : dict⟨String,R⟩ {
  requiere: {0 < umbral < 1}
  asegura: {claves de res pertenecen a infecciosas}
  asegura: {Para cada enfermedad perteneciente a infecciosas, si el porcentaje de pacientes que se atendieron por esa enfermedad sobre el total de registros es mayor o igual al umbral, entonces res[enfermedad] = porcentaje}
  asegura: {Para cada enfermedad perteneciente a infecciosas, si el porcentaje de e pacientes que se atendieron por esa enfermedad sobre el total de registros es menor que el umbral, entonces enfermedad no aparece en res}
}
```
> Ejemplo:
```py
registros = [
    (1, "COVID"), 
    (2, "Dengue"), 
    (3, "COVID"), 
    (4, "Gripe"), 
    (5, "COVID")
]
infecciosas = ["COVID", "Dengue"]
umbral = 0.2
alarma_epidemiologica(registros, infecciosas, umbral) 
# Retorna: {"COVID": 0.6} (porque 3/5 = 0.6 ≥ 0.2)
```

# 2. Orden de atención (1 punto)

Desde el Hospital Fernandez nos pidieron solucionar una serie de problemas relacionados con la información que maneja sobre los pacientes y el personal de salud. En primer lugar debemos resolver en qué orden se deben atender los pacientes que llegan a la guardia. En enfermería, hay una primera instancia que clasifica en dos colas a los pacientes: una urgente y otra postergable (esto se llama hacer triage). A partir de dichas colas que contienen la identificación del paciente, se pide devolver una nueva cola según la siguiente especificación.

```
problema orden_de_atencion ( in urgentes: cola⟨Z⟩, in postergables: cola⟨Z⟩) : cola⟨Z⟩ {
  requiere: {no hay elementos repetidos en urgentes}
  requiere: {no hay elementos repetidos en postergables}
  requiere: {la intersección entre postergables y urgentes es vacía}
  requiere: {|postergables| = |urgentes|}
  asegura: {no hay repetidos en res }
  asegura: {res es permutación de la concatenación de urgentes y postergables}
  asegura: {Si urgentes no es vacía, en tope de res hay un elemento de urgentes}
  asegura: {En res no hay dos seguidos de urgentes}
  asegura: {En res no hay dos seguidos de postergables}
  asegura: {Para todo c1 y c2 de tipo "urgente" pertenecientes a urgentes si c1 aparece antes que c2 en urgentes entonces c1 aparece antes que c2 en res}
  asegura: {Para todo c1 y c2 de tipo "postergable" pertenecientes a postergables si c1 aparece antes que c2 en postergables entonces c1 aparece antes que c2 en res}
}
```
> Ejemplo
```py
urgentes = Queue()
urgentes.put(1)
urgentes.put(3)
postergables = Queue()
postergables.put(2)
postergables.put(4)

orden_de_atencion(urgentes, postergables) 
# Retorna cola con orden: [1, 2, 3, 4]
# Alterna urgentes (1,3) con postergables (2,4)
```


# 3. Camas ocupadas en el hospital (2 puntos)

Queremos saber qué porcentaje de ocupación de camas hay en el hospital. El hospital se representa por una matriz en donde las filas son los pisos, y las columnas son las camas. Los valores de la matriz son booleanos que indican si la cama está ocupada o no. Si el valor es verdadero (True) indica que la cama está ocupada. Se nos pide programar en Python una función que Retorna una secuencia de enteros, indicando la proporción de camas ocupadas en cada piso.

```
problema nivel_de_ocupacion(camas_por_piso: seq⟨seq⟨Bool⟩⟩) : seq⟨ℝ⟩ {
    requiere: {Todos los pisos tienen la misma cantidad de camas.}
    requiere: {Hay por lo menos 1 piso en el hospital.}
    requiere: {Hay por lo menos una cama por piso.}
    asegura: {|res| = |camas_por_piso|}
    asegura: {∀ 0 ≤ i < |res|: res[i] = (#camas_ocupadas_piso_i / #camas_totales_piso_i)}
}
```
> Ejemplo
```py
camas = [
    [True, False, True],  
    [False, False, False],
    [True, True, True]    
]
nivel_de_ocupacion(camas) 
# Retorna: [2/3, 0/3, 3/3]
```

# 4. Quiénes trabajaron más? (2 puntos)

Dado un diccionario con la cantidad de horas trabajadas por empleado, en donde la clave es el ID del empleado y el valor es una lista de las horas trabajadas por día, queremos saber quienes trabajaron más para darles un premio. Se deberá buscar la o las claves para la cual se tiene el máximo valor de cantidad total de horas, y devolverlas en una lista.

```
problema empleados_del_mes(horas:dicc⟨Z,seq⟨Z⟩⟩) : seq⟨Z⟩ {
  requiere: {No hay valores en horas que sean listas vacías}
  asegura: {Si ID pertence a res entonces ID pertence a las claves de horas}
  asegura: {Si ID pertenece a res, la suma de sus valores de horas es el máximo de la suma de elementos de horas de todos los otros IDs}
  asegura: {Para todo ID de claves de horas, si la suma de sus valores es el máximo de la suma de elementos de horas de los otros IDs, entonces ID pertences a res}
}
```
> Ejemplo
```py
horas = {
    1: [8, 8, 8, 8],    # Total: 32 horas
    2: [10, 10, 10, 10], # Total: 40 horas
    3: [12, 8, 12, 8]    # Total: 40 horas
}
empleados_del_mes(horas) 
# Retorna: [2, 3] (empate en horas máximas)
```