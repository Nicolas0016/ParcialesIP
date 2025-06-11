import unittest
from Template import ultima_aparicion, elementos_exclusivos, contar_traducciones_iguales, convertir_a_diccionario

class TestUltimaAparicion(unittest.TestCase):
    def test_ejemplo(self):
        s = [-1,4,0,4,100,0,100,0,-1,-1]
        e = 0
        self.assertEqual(ultima_aparicion(s, e), 7)

    def test_ultimo_elemento(self):
        s = [1, 2, 3, 4, 5]
        e = 5
        self.assertEqual(ultima_aparicion(s, e), 4)

    def test_primer_elemento(self):
        s = [10, 20, 30, 20, 10]
        e = 10
        self.assertEqual(ultima_aparicion(s, e), 4)

    def test_unico_elemento(self):
        s = [7]
        e = 7
        self.assertEqual(ultima_aparicion(s, e), 0)

    def test_elemento_repetido(self):
        s = [5, 5, 5, 5, 5]
        e = 5
        self.assertEqual(ultima_aparicion(s, e), 4)
class TestElementosExclusivos(unittest.TestCase):
    def test_ejemplo(self):
        s = [-1,4,0,4,3,0,100,0,-1,-1]
        t = [0,100,5,0,100,-1,5]
        resultado = elementos_exclusivos(s, t)
        self.assertCountEqual(resultado, [3,4,5])
        self.assertEqual(len(resultado), len(set(resultado)))

    def test_conjuntos_disjuntos(self):
        s = [1, 2, 3]
        t = [4, 5, 6]
        resultado = elementos_exclusivos(s, t)
        self.assertCountEqual(resultado, [1,2,3,4,5,6])
        self.assertEqual(len(resultado), len(set(resultado)))

    def test_conjuntos_iguales(self):
        s = [1, 2, 3]
        t = [1, 2, 3]
        resultado = elementos_exclusivos(s, t)
        self.assertEqual(resultado, [])

    def test_un_elemento_comun(self):
        s = [1, 2, 3, 4]
        t = [4, 5, 6]
        resultado = elementos_exclusivos(s, t)
        self.assertCountEqual(resultado, [1,2,3,5,6])
        self.assertEqual(len(resultado), len(set(resultado)))

    def test_listas_vacias(self):
        s = []
        t = []
        self.assertEqual(elementos_exclusivos(s, t), [])

class TestContarTraduccionesIguales(unittest.TestCase):
    def test_ejemplo(self):
        aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
        ingles = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
        self.assertEqual(contar_traducciones_iguales(ingles, aleman), 2)

    def test_ninguna_igual(self):
        aleman = {"Mano": "Hand", "Pie": "Fuss"}
        ingles = {"Mano": "Arm", "Pie": "Leg"}
        self.assertEqual(contar_traducciones_iguales(ingles, aleman), 0)

    def test_todas_iguales(self):
        aleman = {"Mano": "Hand", "Pie": "Foot"}
        ingles = {"Mano": "Hand", "Pie": "Foot"}
        self.assertEqual(contar_traducciones_iguales(ingles, aleman), 2)

    def test_diccionarios_vacios(self):
        self.assertEqual(contar_traducciones_iguales({}, {}), 0)

    def test_sin_palabras_comunes(self):
        aleman = {"Mano": "Hand", "Pie": "Fuss"}
        ingles = {"Cabeza": "Head", "Ojo": "Eye"}
        self.assertEqual(contar_traducciones_iguales(ingles, aleman), 0)


class TestConvertirADiccionario(unittest.TestCase):
    def test_ejemplo(self):
        lista = [-1,0,4,100,100,-1,-1]
        esperado = {-1:3, 0:1, 4:1, 100:2}
        self.assertEqual(convertir_a_diccionario(lista), esperado)

    def test_lista_vacia(self):
        self.assertEqual(convertir_a_diccionario([]), {})

    def test_todos_elementos_unicos(self):
        lista = [1, 2, 3, 4, 5]
        esperado = {1:1, 2:1, 3:1, 4:1, 5:1}
        self.assertEqual(convertir_a_diccionario(lista), esperado)

    def test_todos_elementos_iguales(self):
        lista = [7, 7, 7, 7, 7]
        esperado = {7:5}
        self.assertEqual(convertir_a_diccionario(lista), esperado)

    def test_elementos_mezclados(self):
        lista = [1, 2, 1, 3, 2, 1, 4, 5, 4]
        esperado = {1:3, 2:2, 3:1, 4:2, 5:1}
        self.assertEqual(convertir_a_diccionario(lista), esperado)
        
if __name__ == '__main__':
    unittest.main()