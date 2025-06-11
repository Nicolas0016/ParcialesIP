module Solucion where

type Fila = [Integer]
type Tablero = [Fila]
type Posicion = (Integer, Integer)
type Camino = [Posicion]

-- Ejercicio 1

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos item [] = []
quitarTodos item (x:xs)
    | x == item = quitarTodos item xs
    | otherwise = x : quitarTodos item xs

filaLarga :: Tablero-> Fila
filaLarga [x] = x
filaLarga (fila:tablero) = fila ++ filaLarga tablero


maximoAux :: Fila -> Integer
maximoAux [x]= x
maximoAux (a:b:xs)
    | a > b = maximoAux(a:xs)
    | otherwise = maximoAux (b:xs)

maximo :: Tablero -> Integer
maximo tablero = maximoAux (filaLarga tablero)

-- Ejercicio 2
masRepetido :: Tablero -> Integer
masRepetido tablero = masRepetidoAux (concatenarFilas tablero)

masRepetidoAux :: Fila -> Integer
masRepetidoAux [n] = n
masRepetidoAux (n:fila)
    | contarApariciones n (n:fila) >= contarApariciones (masRepetidoAux fila) (quitarTodos n fila) = n
    | otherwise = masRepetidoAux fila

concatenarFilas :: Tablero -> Fila
concatenarFilas [fila] = fila
concatenarFilas (fila:tablero) = fila ++ concatenarFilas tablero

contarApariciones :: Integer -> Fila -> Integer
contarApariciones item [] = 0
contarApariciones item (n:fila)
    | n == item = 1 + contarApariciones item fila
    | otherwise = contarApariciones item fila
-- Ejercicio 3
valoresCamino :: Tablero -> Camino -> [Integer]
valoresCamino _ [] = []
valoresCamino tablero (posicion:camino) = obtenerElemento posicion tablero : valoresCamino tablero camino

obtenerElemento :: Posicion -> Tablero -> Integer
obtenerElemento (a,b) (fila:tablero)
    | a == 1 = recorrerFila b fila
    | otherwise = obtenerElemento (a-1,b) tablero

recorrerFila :: Integer -> Fila -> Integer
recorrerFila b (x:xs)
    | b == 1 = x
    | otherwise = recorrerFila (b-1) xs

-- EJERCICIO 4

esCaminoFibo :: [Integer] -> Integer -> Bool
esCaminoFibo [] _ = True
esCaminoFibo (x:xs) i = fibonacci i == x && esCaminoFibo xs (i+1)

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)