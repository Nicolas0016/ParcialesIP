import Test.HUnit
import SolucionT2
import Data.Char (toLower)

-- Mapeo de ejemplo para usar en los tests
mapeoEjemplo = [('a', 'z'), ('e', 'x'), ('i', 'w'), ('o', 'y'), ('u', 't')]

-- Ejercicio 1: hayQueCodificar
testHayQueCodificar = test [
    "Caracter a codificar" ~: hayQueCodificar 'a' mapeoEjemplo ~?= True,
    "Caracter no a codificar" ~: hayQueCodificar 'b' mapeoEjemplo ~?= False,
    "Caracter en segundas componentes" ~: hayQueCodificar 'z' mapeoEjemplo ~?= False,
    "Mapeo vacío" ~: hayQueCodificar 'a' [] ~?= False,
    "Caracter mayúscula con mapeo minúscula" ~: hayQueCodificar 'A' [('a','z')] ~?= False
    ]

-- Ejercicio 2: cuantasVecesHayQueCodificar
testCuantasVecesHayQueCodificar = test [
    "Caracter que aparece una vez y se codifica" ~: 
        cuantasVecesHayQueCodificar 'a' "abac" mapeoEjemplo ~?= 2,
    "Caracter que aparece pero no se codifica" ~: 
        cuantasVecesHayQueCodificar 'b' "abac" mapeoEjemplo ~?= 0,
    "Caracter que aparece múltiples veces" ~: 
        cuantasVecesHayQueCodificar 'e' "elefante" mapeoEjemplo ~?= 3,
    "Único caracter en frase" ~: 
        cuantasVecesHayQueCodificar 'a' "a" mapeoEjemplo ~?= 1,
    "Caracter que no aparece" ~: 
        cuantasVecesHayQueCodificar 'z' "abc" mapeoEjemplo ~?= 0,
    "Frase vacía" ~: 
        cuantasVecesHayQueCodificar 'a' "" mapeoEjemplo ~?= 0
    ]

-- Ejercicio 3: laQueMasHayQueCodificar
testLaQueMasHayQueCodificar = test [
    "Unica letra a codificar" ~: 
        laQueMasHayQueCodificar "abc" [('a', 'z')] ~?= 'a',
    "Varias letras a codificar" ~: 
        laQueMasHayQueCodificar "abecedario" mapeoEjemplo ~?= 'a',
    "Empate en frecuencia" ~: 
        laQueMasHayQueCodificar "a e i o u" mapeoEjemplo ~?= 'a',
    "Frase más compleja" ~: 
        laQueMasHayQueCodificar "el que lee mucho anda mucho" mapeoEjemplo ~?= 'e',
    "Empate: debe devolver la primera (a)" ~:
        laQueMasHayQueCodificar "a e a e" [('a','z'), ('e','x')] ~?= 'a',
    "Empate con orden inverso" ~:
        laQueMasHayQueCodificar "y x" [('x','1'), ('y','2')] ~?= 'y',
    "Empate triple (debe devolver el primero: h)" ~:
        laQueMasHayQueCodificar "h o l a h o l a" [('h','!'), ('o','?'), ('l','*')] ~?= 'h',
    "Mapeo con un elemento, no aparece en frase" ~:
        laQueMasHayQueCodificar "xyz" [('a','z')] ~?= 'a',
    "Ningún caracter a codificar en frase" ~:
        laQueMasHayQueCodificar "xyz" mapeoEjemplo ~?= 'a',
    "Mapeo con un elemento, aparece en frase" ~:
        laQueMasHayQueCodificar "a" [('a','z')] ~?= 'a'
    ]

-- Ejercicio 4: codificarFrase
testCodificarFrase = test [
    "Frase simple" ~: 
        codificarFrase "abecedario" mapeoEjemplo ~?= "zbxcxdzrwy",
    "Con caracteres no codificables" ~: 
        codificarFrase "hola mundo" [('h','!'),('o','*'),('a','@')] ~?= "!*l@ mund*",
    "Todos caracteres codificables" ~: 
        codificarFrase "aeiou" mapeoEjemplo ~?= "zxwyt",
    "Ningún caracter codificable" ~: 
        codificarFrase "xyz" mapeoEjemplo ~?= "xyz",
    "Frase con mayúsculas" ~: 
        codificarFrase "AeIoU" mapeoEjemplo ~?= "AxIyU",
    "Frase vacía" ~: 
        codificarFrase "" mapeoEjemplo ~?= "",
    "Mapeo vacío" ~: 
        codificarFrase "abc" [] ~?= "abc",
    "Caracteres repetidos" ~: 
        codificarFrase "aaa" [('a','b')] ~?= "bbb",
    "Caracteres especiales" ~: 
        codificarFrase "!@#" [('!','?')] ~?= "?@#"
    ]

-- Ejecutar todos los tests
runTests = runTestTT $ TestList [
    testHayQueCodificar,
    testCuantasVecesHayQueCodificar,
    testLaQueMasHayQueCodificar,
    testCodificarFrase
    ]

main = runTests