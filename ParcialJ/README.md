# Enunciado: Sistema de Gestión de Biblioteca

Una biblioteca necesita un sistema para gestionar préstamos de libros. Cada libro se representa como una tupla `(Título, Autor, Género)`, donde:

- `Título` y `Autor` son String
- `Género` es un tipo String: `"Novela" | "Ciencia" | "Infantil" | "Historia" | etc`

Los préstamos se modelan como una lista de tuplas `(Libro, FechaPréstamo, FechaDevolución)` donde las fechas son enteros (días desde una fecha base).

# Ejercicio 1 (2 puntos)
```hs
librosPorGenero :: [Libro] -> Genero -> [Libro]
```
```
problema librosPorGenero (libros: seq⟨Libro⟩, genero: Genero) : seq⟨Libro⟩ {
  requiere: {True}
  asegura: {res contiene exactamente los libros de género especificado}
  asegura: {El orden relativo de los libros se mantiene}
}
```
> Ejemplo
```hs

librosPorGenero [("1984", "Orwell", "Novela"), ("Breve historia del tiempo", "Hawking", "Ciencia"), ("El Principito", "Saint-Exupéry", Infantil)] "Ciencia"

-- Resultado: [("Breve historia del tiempo", "Hawking", "Ciencia")]

```

# Ejercicio 2 (2 puntos)

```hs
prestamosVencidos :: [Prestamo] -> Int -> [Libro]
```
```
problema prestamosVencidos (prestamos: seq⟨Prestamo⟩, hoy: Z) : seq⟨Libro⟩ {
  requiere: {hoy ≥ 0}
  requiere: {Para todo préstamo, fechaPréstamo ≤ fechaDevolución}
  asegura: {res contiene los libros con fechaDevolución < hoy}
  asegura: {Sin duplicados}
}
```

> Ejemplo 
```hs 
libro1 = ("1984", "Orwell", "Novela")
libro2 = ("El Principito", "Saint-Exupéry", "Infantil")

prestamos = [(libro1, 10, 20), (libro2, 15, 25), (libro1, 30, 40)]
prestamosVencidos prestamos 35

-- Resultado: [("1984", "Orwell", "Novela"), ("El Principito", "Saint-Exupéry", "Infantil")]

```
# Ejercicio 3 (3 puntos)
```hs
generoMasPrestado :: [Prestamo] -> Genero
```
```
problema generoMasPrestado (prestamos: seq⟨Prestamo⟩) : Genero {
  requiere: {|prestamos| > 0}
  asegura: {res es el género con más préstamos}
  asegura: {En empate, devuelve cualquiera de los géneros con máxima frecuencia}
}
```
> Ejemplo 
```hs 
prestamos = [
  (("1984", "Orwell", "Novela"), 1, 5),
  (("Breve historia del tiempo", "Hawking", "Ciencia"), 2, 6),
  (("El Principito", "Saint-Exupéry", "Infantil"), 3, 7),
  (("1984", "Orwell", "Novela"), 4, 8)
]
generoMasPrestado prestamos
-- Resultado: "Novela" (porque aparece 2 veces)

```
# Ejercicio 4 (3 puntos)

```hs
consolidarPrestamos :: [Prestamo] -> [(Libro, Int)]
```
```
problema consolidarPrestamos (prestamos: seq⟨Prestamo⟩) : seq⟨(Libro, Z)⟩ {
  requiere: {True}
  asegura: {Cada libro aparece una vez en res}
  asegura: {Para cada libro, el número asociado es la cantidad de veces que fue prestado}
}

```
>Ejemplo 
```hs
prestamos = [
  (("1984", "Orwell", "Novela"), 1, 5),
  (("El Principito", "Saint-Exupéry", "Infantil"), 3, 7),
  (("1984", "Orwell", "Novela"), 4, 8)
]
consolidarPrestamos prestamos
-- Resultado: [(("1984", "Orwell", "Novela"), 2), (("El Principito", "Saint-Exupéry", "Infantil"), 1)]

```