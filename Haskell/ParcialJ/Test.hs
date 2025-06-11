import Test.HUnit
import Solucion 

-- Ejercicio 1: librosPorGenero
testLibrosPorGenero = test [
    "Un solo libro del género" ~:
        librosPorGenero [("1984", "Orwell", "Novela")] "Novela" ~?=
        [("1984", "Orwell", "Novela")],
    "Varios libros, uno del género" ~:
        librosPorGenero [("1984", "Orwell", "Novela"), ("El Principito", "Saint-Exupéry", "Infantil")] "Infantil" ~?=
        [("El Principito", "Saint-Exupéry", "Infantil")],
    "Varios libros del género" ~:
        librosPorGenero [("1984", "Orwell", "Novela"), ("Rebelión en la granja", "Orwell", "Novela")] "Novela" ~?=
        [("1984", "Orwell", "Novela"), ("Rebelión en la granja", "Orwell", "Novela")],
    "Ningún libro del género" ~:
        librosPorGenero [("1984", "Orwell", "Novela")] "Ciencia" ~?= [],
    "Lista vacía" ~:
        librosPorGenero [] "Novela" ~?= []
    ]

-- Ejercicio 2: prestamosVencidos
testPrestamosVencidos = test [
    "Vencidos sin duplicados" ~:
        prestamosVencidos [(("1984", "Orwell", "Novela"), 10, 20), (("El Principito", "Saint-Exupéry", "Infantil"), 15, 25), (("1984", "Orwell", "Novela"), 30, 40)] 35
        ~?= [("1984", "Orwell", "Novela"), ("El Principito", "Saint-Exupéry", "Infantil")],
    "Ninguno vencido" ~:
        prestamosVencidos [(("1984", "Orwell", "Novela"), 10, 50)] 40 ~?= [],
    "Todos vencidos" ~:
        prestamosVencidos [(("1984", "Orwell", "Novela"), 10, 20), (("Otro", "Autor", "Historia"), 5, 15)] 25
        ~?= [("1984", "Orwell", "Novela"), ("Otro", "Autor", "Historia")],
    "Lista vacía" ~:
        prestamosVencidos [] 10 ~?= []
    ]

-- Ejercicio 3: generoMasPrestado
testGeneroMasPrestado = test [
    "Género con más préstamos" ~:
        generoMasPrestado [(("1984", "Orwell", "Novela"), 1, 2), (("El Principito", "Saint-Exupéry", "Infantil"), 3, 4), (("1984", "Orwell", "Novela"), 5, 6)]
        ~?= "Novela",
    "Empate entre géneros" ~:
        let res = generoMasPrestado [(("1984", "Orwell", "Novela"), 1, 2), (("Breve historia", "Hawking", "Ciencia"), 3, 4)]
        in res `elem` ["Novela", "Ciencia"] ~? "Empate válido",
    "Un solo préstamo" ~:
        generoMasPrestado [(("1984", "Orwell", "Novela"), 1, 2)] ~?= "Novela"
    ]

-- Ejercicio 4: consolidarPrestamos
testConsolidarPrestamos = test [
    "Libros con múltiples préstamos" ~:
        consolidarPrestamos [(("1984", "Orwell", "Novela"), 1, 2), (("1984", "Orwell", "Novela"), 3, 4), (("El Principito", "Saint-Exupéry", "Infantil"), 5, 6)]
        ~?= [(("1984", "Orwell", "Novela"), 2), (("El Principito", "Saint-Exupéry", "Infantil"), 1)],
    "Cada libro una vez" ~:
        consolidarPrestamos [(("Libro1", "Autor1", "Genero1"), 1, 2), (("Libro2", "Autor2", "Genero2"), 2, 3)]
        ~?= [(("Libro1", "Autor1", "Genero1"), 1), (("Libro2", "Autor2", "Genero2"), 1)],
    "Ningún préstamo" ~:
        consolidarPrestamos [] ~?= []
    ]

-- Ejecutar todos los tests
runTests = runTestTT $ TestList [
    testLibrosPorGenero,
    testPrestamosVencidos,
    testGeneroMasPrestado,
    testConsolidarPrestamos
    ]

