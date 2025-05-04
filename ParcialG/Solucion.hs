module Solucion where 
type Producto = String
type Productos = [Producto]
type Stock = [(Producto, Integer)]
type Precios = [(Producto, Float)]
-- Ejercicio 1

apariciones :: (Eq t) => t -> [t] -> Integer
apariciones _ [] = 0 
apariciones t (x:xs)
    | t == x = 1 + apariciones t xs
    | otherwise = apariciones t xs

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos t (x:xs)
    | t == x = quitarTodos t xs
    | otherwise = x : quitarTodos t xs 

generarStock :: Productos -> Stock
generarStock [] = []
generarStock (producto:productos) = 
    (producto, apariciones producto (producto:productos)) : generarStock (quitarTodos producto productos)

-- Ejercicio 2 
stockDeProducto :: Stock -> Producto -> Integer
stockDeProducto [] _ = 0
stockDeProducto ((nombreProducto, cantidad):stock) producto 
    | nombreProducto == producto = cantidad
    | otherwise = stockDeProducto stock producto


-- Ejercicio 3
dineroEnStock :: Stock -> Precios -> Float
dineroEnStock _ [] = 0
dineroEnStock stock ((nombreProducto, precio):precios) 
    = fromIntegral(stockDeProducto stock nombreProducto) * precio + dineroEnStock stock precios

-- Ejercicio 4
aplicarOferta :: Stock -> Precios -> Precios
aplicarOferta _ [] = []
aplicarOferta stock ((nombreProducto, precio):precios)
    | (stockDeProducto stock nombreProducto) > 10 = (nombreProducto,precio *0.80) : aplicarOferta stock precios
    | otherwise = (nombreProducto,precio) : aplicarOferta stock precios