import Test.HUnit
import Solucion

-- Ejercicio 1: golesDeNoGoleadores
testGolesDeNoGoleadores = test [
    "Ningún gol de no goleadores" ~:
        golesDeNoGoleadores [("A", "Juan"), ("B", "Pedro")] [2, 3] 5 ~?= 0,

    "Algunos goles de no goleadores" ~:
        golesDeNoGoleadores [("A", "Juan"), ("B", "Pedro")] [2, 3] 10 ~?= 5,

    "Todos los goles de no goleadores" ~:
        golesDeNoGoleadores [("A", "Juan"), ("B", "Pedro")] [0, 0] 6 ~?= 6
    ]

-- Ejercicio 2: equiposValidos
testEquiposValidos = test [
    "Equipos válidos" ~:
        equiposValidos [("A", "Juan"), ("B", "Pedro"), ("C", "Luis")] ~?= True,

    "Club repetido" ~:
        equiposValidos [("A", "Juan"), ("A", "Pedro")] ~?= False,

    "Goleador repetido" ~:
        equiposValidos [("A", "Juan"), ("B", "Juan")] ~?= False,

    "Jugador con nombre igual al club" ~:
        equiposValidos [("Boca", "Boca"), ("River", "Luis")] ~?= False
    ]

-- Ejercicio 3: porcentajeDeGoles
testPorcentajeDeGoles = test [
    "Porcentaje exacto 50%" ~:
        porcentajeDeGoles "Juan" [("A", "Juan"), ("B", "Pedro")] [3, 3] ~?= 50.0,

    "Porcentaje 100%" ~:
        porcentajeDeGoles "Pedro" [("A", "Luis"), ("B", "Pedro")] [0, 5] ~?= 100.0,

    "Porcentaje 0%" ~:
        porcentajeDeGoles "Luis" [("A", "Luis"), ("B", "Pedro")] [0, 5] ~?= 0.0
    ]

-- Ejercicio 4: botinDeOro
testBotinDeOro = test [
    "Uno solo es máximo goleador" ~:
        botinDeOro [("A", "Juan"), ("B", "Pedro")] [2, 4] ~?= "Pedro",

    "Empate (devuelve el primero)" ~:
        botinDeOro [("A", "Juan"), ("B", "Pedro")] [3, 3] ~?= "Juan",

    "Solo un jugador" ~:
        botinDeOro [("A", "Luis")] [5] ~?= "Luis"
    ]

-- Ejecutar todos los tests
run = runTestTT $ TestList [
    testGolesDeNoGoleadores,
    testEquiposValidos,
    testPorcentajeDeGoles,
    testBotinDeOro
    ]
