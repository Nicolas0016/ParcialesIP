import Test.HUnit
import Integradora

-- Tablero de prueba
tableroPrueba :: Tablero
tableroPrueba = [
    [13, 12,  6,  4],
    [ 1,  1, 32, 25],
    [ 9,  2, 14,  7],
    [ 7,  3,  5, 16],
    [27,  2,  8, 18]
    ]

-- Camino de prueba (Fibonacci: 1, 1, 2, 3, 5)
caminoPrueba :: Camino
caminoPrueba = [(2,1), (2,2), (3,2), (4,2), (4,3)]

-- Test Ejercicio 5: maximo
testsEj1 = test [
    "Máximo en tablero normal" ~: maximo tableroPrueba ~?= 32,
    "Máximo en esquina inferior derecha" ~: maximo [[1,2],[3,4]] ~?= 4,
    "Máximo en tablero 1x1" ~: maximo [[42]] ~?= 42
    ]

-- Test Ejercicio 6: masRepetido
testsEj2 = test [
    "Número más repetido (empate)" ~: masRepetido tableroPrueba ~?= 1,  -- Hay dos 1s y dos 2s
    "Todos números únicos" ~: masRepetido [[1,2],[3,4]] ~?= 1,        -- Cualquiera en empate
    "Un solo número repetido" ~: masRepetido [[1,1],[2,3]] ~?= 1
    ]

-- Test Ejercicio 7: valoresCamino
testsEj3 = test [
    "Camino Fibonacci" ~: valoresCamino tableroPrueba caminoPrueba ~?= [1,1,2,3,5],
    "Camino vertical" ~: valoresCamino tableroPrueba [(1,1),(2,1),(3,1)] ~?= [13,1,9],
    "Camino horizontal" ~: valoresCamino tableroPrueba [(3,1),(3,2),(3,3)] ~?= [9,2,14]
    ]

-- Test Ejercicio 8: esCaminoFibo
testsEj4 = test [
    "Secuencia Fibonacci correcta" ~: esCaminoFibo [1,1,2,3,5] 1 ~?= True,
    "Secuencia Fibonacci incorrecta" ~: esCaminoFibo [1,2,3,5,8] 1 ~?= False,
    "Fibonacci empezando en 2" ~: esCaminoFibo [2,3,5,8] 2 ~?= True,
    "Secuencia vacía" ~: esCaminoFibo [] 1 ~?= True,
    "Solo primer elemento" ~: esCaminoFibo [5] 5 ~?= True
    ]

-- Ejecutar todos los tests
run = runTestTT $ TestList [
    testsEj1, 
    testsEj2, 
    testsEj3, 
    testsEj4
    ]
