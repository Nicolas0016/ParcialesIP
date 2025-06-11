module Solucion where
-- Ejercicio 1 
division :: Integer -> Integer -> Float
division a b = fromIntegral a / fromIntegral b 

sumaElementos :: [Integer] -> Integer
sumaElementos [] = 0
sumaElementos (x:xs) = x + sumaElementos xs

longitud :: [Integer] -> Integer
longitud [] = 0
longitud (_:xs) = 1+ longitud xs

media :: [Integer] -> Float
media xs = division (sumaElementos xs) (longitud xs)

mediaMovilN :: [Integer]-> Integer -> Float
mediaMovilN (x:lista) n
    | n == 1 = media (x:lista)
    | otherwise = mediaMovilN lista (n-1)

-- Ejercicio 2 

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n i 
    | mod n i == 0 = i
    | otherwise = menorDivisorDesde n (i+1)

menorDivisor:: Integer -> Integer
menorDivisor n = menorDivisorDesde n 2

esPrimo :: Integer -> Bool
esPrimo n = menorDivisor n == n 

descomponerEnPrimos :: Integer -> [Integer]
descomponerEnPrimos 1 = []
descomponerEnPrimos n = primoDeN : descomponerEnPrimos (div n primoDeN )
    where
        primoDeN = menorDivisor n

esAtractivo :: Integer -> Bool
esAtractivo numero = esPrimo numero == False && esPrimo(longitud(descomponerEnPrimos numero))


-- Ejercicio 3

quitarBlancos :: String -> String
quitarBlancos [] = []
quitarBlancos (x:xs)
    | x == ' ' = quitarBlancos xs
    | otherwise = x: quitarBlancos xs

palabraOrdenadaAux :: String -> Bool
palabraOrdenadaAux [] = True 
palabraOrdenadaAux (a:b:letras) = a < b && palabraOrdenada (b:letras) 

palabraOrdenada palabra = palabraOrdenadaAux (quitarBlancos palabra)
-- Ejercicio 4 

cantidadDeApariciones :: Eq t => t -> [t] -> Integer
cantidadDeApariciones _ [] = 0
cantidadDeApariciones t (x:xs) 
    | t== x = 1+  cantidadDeApariciones t xs 
    | otherwise = cantidadDeApariciones t xs  

quitarTodos :: Eq t=>t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos t (x:xs)
    | t == x = quitarTodos t xs
    | otherwise = x : quitarTodos t xs

mismaCantidadLetras :: String -> String -> Bool
mismaCantidadLetras [] [] = True
mismaCantidadLetras (x:xs) ys =
    cantidadDeApariciones x (x:xs) == cantidadDeApariciones x ys &&
    mismaCantidadLetras (quitarTodos x xs) (quitarTodos x ys)

similAnagrama :: String -> String -> Bool
similAnagrama palabra1 palabra2 = 
    palabra1 /= palabra2 &&                     
    mismaCantidadLetras palabra1 palabra2       



