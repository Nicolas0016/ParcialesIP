import Test.HUnit
import Solucion

-- Ejercicio 1: generarStock
testGenerarStock = test [
    "Lista vacía" ~: 
        generarStock [] ~?= [],
    
    "Productos sin repetir" ~: 
        generarStock ["Manzana", "Pera"] ~?= [("Manzana",1), ("Pera",1)],
    
    "Productos con repetidos" ~: 
        generarStock ["Manzana", "Pera", "Manzana", "Banana"] ~?= [("Manzana",2), ("Pera",1), ("Banana",1)],
    
    "Todos productos iguales" ~:
        generarStock ["Manzana", "Manzana", "Manzana"] ~?= [("Manzana",3)]
    ]

-- Ejercicio 2: stockDeProducto
testStockDeProducto = test [
    "Producto existente" ~: 
        stockDeProducto [("Manzana",5), ("Pera",3)] "Pera" ~?= 3,
    
    "Producto no existente" ~: 
        stockDeProducto [("Manzana",5), ("Pera",3)] "Banana" ~?= 0,
    
    "Stock vacío" ~: 
        stockDeProducto [] "Manzana" ~?= 0
    ]

-- Ejercicio 3: dineroEnStock
testDineroEnStock = test [
    "Stock básico" ~: 
        dineroEnStock [("Manzana",2), ("Pera",3)] [("Manzana",10.5), ("Pera",20.0)] ~?= 81.0,
    
    "Un solo producto" ~: 
        dineroEnStock [("Manzana",5)] [("Manzana",2.0)] ~?= 10.0,
    
    "Cantidad cero (aunque requisitos lo prohiben)" ~:
        dineroEnStock [("Manzana",0)] [("Manzana",10.0)] ~?= 0.0
    ]

-- Ejercicio 4: aplicarOferta
testAplicarOferta = test [
    "Con descuentos" ~: 
        aplicarOferta [("Manzana",15), ("Pera",5), ("Banana",20)] 
                      [("Manzana",100.0), ("Pera",150.0), ("Banana",80.0)] 
                      ~?= [("Manzana",80.0), ("Pera",150.0), ("Banana",64.0)],
    
    "Sin descuentos" ~: 
        aplicarOferta [("Manzana",5), ("Pera",3)] 
                      [("Manzana",10.0), ("Pera",20.0)] 
                      ~?= [("Manzana",10.0), ("Pera",20.0)],
    
    "Mezcla de casos" ~:
        aplicarOferta [("A",11), ("B",10), ("C",12)] [("A",10.0), ("B",20.0), ("C",30.0)] 
                      ~?= [("A",8.0), ("B",20.0), ("C",24.0)]
    ]

-- Ejecutar todos los tests
runTests = runTestTT $ TestList [
    testGenerarStock,
    testStockDeProducto,
    testDineroEnStock,
    testAplicarOferta
    ]

main = runTests