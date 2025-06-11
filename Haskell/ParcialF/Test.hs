import Test.HUnit
import Solucion

-- Ejercicio 1: mediaMovilN
testMediaMovilN = test [
    "Media de últimos 3 elementos" ~: 
        mediaMovilN [1, 2, 3, 4, 5] 3 ~?= 4.0,
    
    "Media de único elemento" ~: 
        mediaMovilN [10] 1 ~?= 10.0,
    
    "Media de todos los elementos" ~: 
        mediaMovilN [2, 4, 6] 1 ~?= 4.0,
    
    "Media con números negativos" ~:
        mediaMovilN [(-1), 0, 1] 2 ~?= 0.5
    ]

-- Ejercicio 2: esAtractivo
testEsAtractivo = test [
    "Número atractivo (30)" ~: 
        esAtractivo 30 ~?= True,
    
    "Número no atractivo (9)" ~: 
        esAtractivo 9 ~?= True,
    
    "Caso borde primo (2)" ~: 
        esAtractivo 2 ~?= False,
    
    "Número grande atractivo (210)" ~:
        esAtractivo 210 ~?= False
    ]

-- Ejercicio 3: palabraOrdenada
testPalabraOrdenada = test [
    "Palabra ordenada 'abc'" ~: 
        palabraOrdenada "abc" ~?= True,
    
    "Palabra desordenada 'cba'" ~: 
        palabraOrdenada "cba" ~?= False,
    
    "Palabra con espacios ordenada" ~: 
        palabraOrdenada "a b c" ~?= True,
    
    "Palabra con espacios desordenada" ~:
        palabraOrdenada "c b a" ~?= False,
    
    "Palabra vacía" ~: 
        palabraOrdenada "" ~?= True
    ]

-- Ejercicio 4: similAnagrama
testSimilAnagrama = test [
    "Anagrama verdadero" ~: 
        similAnagrama "roma" "amor" ~?= True,
    
    "Misma palabra" ~: 
        similAnagrama "hola" "hola" ~?= False,
    
    "Diferentes caracteres" ~: 
        similAnagrama "abc" "def" ~?= False,
    
    "Con espacios" ~: 
        similAnagrama "hola mundo" "mundo hola" ~?= True,
    
    "Mismas letras pero mismo orden" ~:
        similAnagrama "aab" "aba" ~?= True,
    
    "Diferente cantidad de letras" ~:
        similAnagrama "aa" "a" ~?= False
    ]

-- Ejecutar todos los tests
run = runTestTT $ TestList [
    testMediaMovilN,
    testEsAtractivo,
    testPalabraOrdenada,
    testSimilAnagrama
    ]
