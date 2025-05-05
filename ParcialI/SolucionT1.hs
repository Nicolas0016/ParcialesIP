module SolucionT1 where

-- EJERCICIO 1

mapeoTest :: [(Char,Char)]
mapeoTest = [('a','b'),('b','c'),('c','d'),('d','e'),('o','k')]

hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar c [] = False 
hayQueCodificar c ((a,b):mapeo) | c == a = True
                                | otherwise = hayQueCodificar c mapeo 
    
-- EJERCICIO 2

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo | not (hayQueCodificar c mapeo) = 0
                                          | otherwise = cantApariciones c frase

cantApariciones :: Eq t => t -> [t] -> Int
cantApariciones elem [] = 0
cantApariciones elem (x:xs) | elem == x = 1 + cantApariciones elem xs
                            | otherwise = cantApariciones elem xs

-- EJERCICIO 3

--laQueMasHayQueCodificar :: Frase -> Mapeo -> Char
--laQueMasHayQueCodificar frase mapeo 
--    | cuantasVecesHayQueCodificar head (carsEnMapeo mapeo) >= cuantasVecesHayQueCodificar (laQueMasHayQueCodificar frase (tail mapeo)) frase mapeo = head (carsEnMapeo mapeo)

laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar (c:cars) mapeo | hayQueCodificar c mapeo && cuantasVecesHayQueCodificar c (c:cars) mapeo == maximo (codificacionesPorCar mapeo (c:cars)) = c 
                                       | otherwise = laQueMasHayQueCodificar cars mapeo

codificacionesPorCar :: [(Char,Char)] -> [Char] -> [Int]
codificacionesPorCar [] frase = []
codificacionesPorCar ((a,b):mapeo) frase = cuantasVecesHayQueCodificar a frase ((a,b):mapeo) : codificacionesPorCar mapeo frase

maximo :: Ord t => [t] -> t
maximo [x] = x
maximo (x:xs) | x >= maximo xs = x
              | otherwise = maximo xs 

--pertenece :: Eq t => t -> [t] -> Bool
--pertenece elem [] = False
--pertenece elem (x:xs) = elem == x || pertenece elem xs

-- EJERCICIO 4

codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] mapeo = []
codificarFrase (c:frase) mapeo | not (hayQueCodificar c mapeo) = c : codificarFrase frase mapeo 
                               | otherwise = carCodificado c mapeo : codificarFrase frase mapeo

carCodificado :: Char -> [(Char,Char)] -> Char
carCodificado c [] = c 
carCodificado c ((a,b):mapeo) | c == a = b
                              | otherwise = carCodificado c mapeo
