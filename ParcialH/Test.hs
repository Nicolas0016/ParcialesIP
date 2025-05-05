import Test.HUnit
import SolucionT2
-- Ejercicio 1: generarStock
testHayQueCodificar = test [
    "Lista vacía" ~: 
        hayQueCodificar 'a' [] ~?= False,
    
    "C se encuentra en el primer indice" ~: 
        hayQueCodificar 'a' [('a', 'b'),('c', 'b')] ~?= True,
    
    "C se encuentra en otro indice" ~: 
        hayQueCodificar 'a' [('h', 'b'),('c', 'b'),('a', 'b')] ~?= True,
    
    "C no esta en el mapeo" ~:
        hayQueCodificar 'a' [('h', 'b'),('c', 'b'),('a', 'b')] ~?= True
    ]

-- Ejercicio 2: stockDeProducto
testCuantasVecesHayQueCodificar = test [
    "C esta en la frase" ~: 
        cuantasVecesHayQueCodificar 'c' "Hola como estas" [('c', 'b')] ~?= 1,
    
    "No hay mapeo" ~: 
        cuantasVecesHayQueCodificar 'o' "Hola como estas" [] ~?= 0,

    "C no esta en la frase" ~: 
        cuantasVecesHayQueCodificar 'd' "Hola como estas" [] ~?= 0
    ]

-- Ejercicio 3: dineroEnStock
testLaQueMasHayQueCodificar = test [
    "Frase con espacios y multiples caracteres" ~: 
        laQueMasHayQueCodificar "Hola como estas" [('a', 'b'), ('c', 'b')] ~?= 'a',
    
    "Mapa de un solo componente" ~: 
        laQueMasHayQueCodificar "Hola como estas" [('c', 'b')] ~?= 'c'
    ]

-- Ejercicio 4: aplicarOferta
testCodificarFrase = test [
    "Frase sin mayusculas" ~: 
        codificarFrase "hola como estas" [('a', 'b'),('e', 'b')] ~?= "holb como bstbs",
    
    "Frase con mayusculas" ~: 
        codificarFrase "HolA como estas" [('a', 'b'),('e', 'b')] ~?= "HolA como bstbs",
    "Frase intacta" ~:
        codificarFrase "Hola como estas" [] ~?= "Hola como estas"
    ]

-- Ejecutar todos los tests
runTests = runTestTT $ TestList [
    testHayQueCodificar,
    testCuantasVecesHayQueCodificar,
    testLaQueMasHayQueCodificar,
    testCodificarFrase
    ]
