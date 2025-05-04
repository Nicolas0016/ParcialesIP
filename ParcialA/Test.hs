import Test.HUnit
import Solucion

-- Test Ejercicio 1: porcentajeDeVotosAfirmativos
testsEj1 = test [
  "Solo afirmativos" ~:
    porcentajeDeVotosAfirmativos [60, 40] 100 ~?= 100.0,

  "Con votos blancos" ~:
    porcentajeDeVotosAfirmativos [60, 40] 150 ~?= 66.66667
  ]

-- Test Ejercicio 2: formulasInvalidas
testsEj2 = test [
  "Vice igual que presidente" ~:
    formulasInvalidas [("Juan", "Juan")] ~?= True,

  "Mismo candidato en dos fórmulas" ~:
    formulasInvalidas [("Juan", "Pedro"), ("Juan", "Luis")] ~?= True,

  "Sin repetidos" ~:
    formulasInvalidas [("Juan", "Pedro"), ("Ana", "Luis")] ~?= False
  ]

testsEj3 = test [
  "Vice con mayoría" ~:
    porcentajeDeVotos "Martin" [("Eduardo", "Martin"), ("Juan", "Pepe")] [120, 20] ~?= 85.71429,

  "Vice con minoría" ~:
    porcentajeDeVotos "Pepe" [("Eduardo", "Martin"), ("Juan", "Pepe")] [120, 20] ~?= 14.285715
  ]

-- Test Ejercicio 4: menosVotado
testsEj4 = test [
  "Gana Juan (menos votos)" ~:
    menosVotado [("Eduardo", "Martin"), ("Juan", "Pepe")] [120, 20] ~?= ("Juan", "Pepe")
  ]

-- Ejecutar todos los tests
runTests = runTestTT $ TestList [
  testsEj1, 
  testsEj2, 
  testsEj3, 
  testsEj4
  ]
