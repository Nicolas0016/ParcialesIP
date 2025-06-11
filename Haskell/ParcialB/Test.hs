import Test.HUnit
import Solucion
-- Test para relacionesValidas
testsRelacionesValidas = test [
  "Relaciones válidas básicas" ~: relacionesValidas [("Ana","Carlos"),("Juan","María")] ~?= True,
  "Auto-relación inválida" ~: relacionesValidas [("Ana","Ana")] ~?= False,
  "Relaciones duplicadas inválidas" ~: relacionesValidas [("Ana","Carlos"),("Carlos","Ana")] ~?= False,
  "Lista vacía válida" ~: relacionesValidas [] ~?= True
  ]

-- Test para personas
testsPersonas = test [
  "Todas personas distintas" ~: personas [("Ana","Carlos"),("Juan","María")] ~?= ["Ana","Carlos","Juan","María"],
  "Personas repetidas" ~: personas [("Ana","Carlos"),("Carlos","María")] ~?= ["Ana","Carlos","María"],
  "Lista vacía" ~: personas [] ~?= []
  ]

-- Test para amigosDe
testsAmigosDe = test [
  "Un solo amigo" ~: amigosDe "Ana" [("Ana","Carlos"),("Juan","María")] ~?= ["Carlos"],
  "Múltiples amigos" ~: amigosDe "Carlos" [("Ana","Carlos"),("Carlos","María"),("Pedro","Carlos")] ~?= ["Ana","María","Pedro"],
  "Sin amigos" ~: amigosDe "Luis" [("Ana","Carlos"),("Juan","María")] ~?= []
  ]

-- Test para personaConMasAmigos
testsPersonaConMasAmigos = test [
  "Claramente Ana" ~: personaConMasAmigos [("Ana","Carlos"),("Ana","Juan"),("Pedro","María")] ~?= "Ana",
  "Empate Ana/Juan" ~: (personaConMasAmigos [("Ana","Carlos"),("Juan","María"),("Pedro","Ana"),("Juan","Felipe")] == "Ana" || 
                       personaConMasAmigos [("Ana","Carlos"),("Juan","María"),("Pedro","Ana"),("Juan","Felipe")] == "Juan") ~?= True,
  "Caso mínimo" ~: (personaConMasAmigos [("Ana","Carlos")] == "Ana" || 
                  personaConMasAmigos [("Ana","Carlos")] == "Carlos") ~?= True
  ]

-- Ejecutar todos los tests
run = runTestTT $ TestList [
  testsRelacionesValidas,
  testsPersonas,
  testsAmigosDe,
  testsPersonaConMasAmigos
  ]
