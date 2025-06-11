import Test.HUnit
import Solucion

-- Ejercicio 1: atajaronSuplentes
testAtajaronSuplentes = test [
    "Ningún suplente atajó (todos titulares)" ~:
        atajaronSuplentes [("Boca", "Romero"), ("River", "Armani")] [2, 1] 5 ~?= 0,

    "Un suplente atajó en un equipo" ~:
        atajaronSuplentes [("Boca", "Suplente"), ("River", "Armani")] [3, 1] 5 ~?= 3,

    "Dos suplentes atajaron" ~:
        atajaronSuplentes [("Boca", "Otro"), ("River", "Otro2")] [2, 4] 10 ~?= 6
    ]

-- Ejercicio 2: equiposValidos
testEquiposValidos = test [
    "Equipos válidos sin repeticiones" ~:
        equiposValidos [("Boca", "Romero"), ("River", "Armani"), ("Racing", "Arias")] ~?= True,

    "Nombre del club igual al arquero (inválido)" ~:
        equiposValidos [("Boca", "Boca"), ("River", "Armani")] ~?= False,

    "Arquero repetido (inválido)" ~:
        equiposValidos [("Boca", "Romero"), ("River", "Romero")] ~?= False,

    "Club repetido (inválido)" ~:
        equiposValidos [("Boca", "Romero"), ("Boca", "Armani")] ~?= False
    ]

-- Ejercicio 3: porcentajeDeGoles
testPorcentajeDeGoles = test [
    "Porcentaje correcto de un arquero" ~:
        porcentajeDeGoles "Romero" [("Boca", "Romero"), ("River", "Armani")] [2, 2] ~?= 50.0,

    "Porcentaje con total distinto" ~:
        porcentajeDeGoles "Armani" [("Boca", "Romero"), ("River", "Armani")] [1, 3] ~?= 75.0,

    "Porcentaje único arquero" ~:
        porcentajeDeGoles "Romero" [("Boca", "Romero")] [5] ~?= 100.0
    ]

-- Ejercicio 4: vallaMenosVencida
testVallaMenosVencida = test [
    "Un solo arquero, debe devolver ese" ~:
        vallaMenosVencida [("Boca", "Romero")] [3] ~?= "Romero",

    "El arquero con menos goles" ~:
        vallaMenosVencida [("Boca", "Romero"), ("River", "Armani")] [3, 1] ~?= "Armani",

    "Empate, devuelve cualquiera de los con menor cantidad" ~:
        vallaMenosVencida [("Boca", "Romero"), ("River", "Armani")] [2, 2] ~?= "Romero"
    ]

-- Ejecutar todos los tests
run = runTestTT $ TestList [
  testAtajaronSuplentes,
  testEquiposValidos,
  testPorcentajeDeGoles,
  testVallaMenosVencida
  ]
