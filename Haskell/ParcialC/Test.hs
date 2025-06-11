import Test.HUnit
import Solucion
-- Ejercicio 1: aproboMasDeNMaterias
testAproboMasDeNMaterias = test [
    "Aprobó más de N materias (caso verdadero)" ~: 
        aproboMasDeNMaterias [("Juan",[8,6,5,7]), ("Maria",[4,2,3,1]), ("Pedro",[9,8,7,6])] "Juan" 2 ~?= True,
    
    "Aprobó más de N materias (caso falso)" ~: 
        aproboMasDeNMaterias [("Juan",[8,6,5,7]), ("Maria",[3,2,3,1]), ("Pedro",[9,8,7,6])] "Maria" 1 ~?= False,
    
    "Aprobó exactamente N materias (debe ser falso)" ~: 
        aproboMasDeNMaterias [("Ana",[4,4,3,2])] "Ana" 2 ~?= False
    ]

-- Ejercicio 2: buenosAlumnos
testBuenosAlumnos = test [
    "Un buen alumno" ~: 
        buenosAlumnos [("Juan",[8,9,9]), ("Maria",[4,5,6]), ("Pedro",[9,8,8])] ~?= ["Juan","Pedro"],
    
    "Ningún buen alumno" ~: 
        buenosAlumnos [("Ana",[7,7,7]), ("Luis",[4,5,3])] ~?= [],
    
    "Buen alumno con exactamente 8 de promedio" ~: 
        buenosAlumnos [("Carlos",[8,8,8])] ~?= ["Carlos"]
    ]

-- Ejercicio 3: mejorPromedio
testMejorPromedio = test [
    "Unico alumno" ~: 
        mejorPromedio [("Juan",[9,9,9])] ~?= "Juan",
    
    "Mejor promedio único" ~: 
        mejorPromedio [("Ana",[8,8,8]), ("Luis",[9,9,9]), ("Maria",[7,7,7])] ~?= "Luis",
    
    "Empate en mejor promedio (devuelve el primero)" ~: 
        mejorPromedio [("Carlos",[9,9,9]), ("Pedro",[9,9,9])] ~?= "Carlos"
    ]

-- Ejercicio 4: seGraduoConHonores
testSeGraduoConHonores = test [
    "Graduación con honores (caso verdadero)" ~: 
        seGraduoConHonores [("Juan",[9,9,9]), ("Maria",[8,8,8])] 3 "Juan" ~?= True,
    
    "Graduación sin honores (promedio bajo)" ~: 
        seGraduoConHonores [("Ana",[7,7,7]), ("Luis",[9,9,9])] 3 "Ana" ~?= False,
    
    "Graduación sin honores (no aprobó suficientes)" ~: 
        seGraduoConHonores [("Carlos",[9,9,3]), ("Pedro",[9,9,9])] 3 "Carlos" ~?= False
    ]

-- Ejecutar todos los tests
run = runTestTT $ TestList [
  testAproboMasDeNMaterias,
  testBuenosAlumnos,
  testMejorPromedio,
  testSeGraduoConHonores
  ]