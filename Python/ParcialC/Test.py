import unittest
from Template import alarma_epidemiologica, orden_de_atencion, nivel_de_ocupacion, empleados_del_mes
from queue import Queue

class TestAlarmaEpidemiologica(unittest.TestCase):
    def test_ejemplo(self):
        registros = [(1, "COVID"), (2, "Dengue"), (3, "COVID"), (4, "Gripe"), (5, "COVID")]
        infecciosas = ["COVID", "Dengue"]
        umbral = 0.2
        esperado = {"COVID": 0.6}
        self.assertEqual(alarma_epidemiologica(registros, infecciosas, umbral), esperado)

    def test_ninguna_supera_umbral(self):
        registros = [(1, "Gripe"), (2, "Dengue"), (3, "Gripe")]
        infecciosas = ["Dengue"]
        umbral = 0.5
        self.assertEqual(alarma_epidemiologica(registros, infecciosas, umbral), {})

    def test_todas_superan_umbral(self):
        registros = [(1, "COVID"), (2, "COVID"), (3, "Dengue")]
        infecciosas = ["COVID", "Dengue"]
        umbral = 0.2
        esperado = {"COVID": 2/3, "Dengue": 1/3}
        self.assertEqual(alarma_epidemiologica(registros, infecciosas, umbral), esperado)

    def test_registros_vacios(self):
        self.assertEqual(alarma_epidemiologica([], ["COVID"], 0.1), {})

    def test_umbral_exacto(self):
        registros = [(1, "COVID"), (2, "Dengue")]
        infecciosas = ["COVID", "Dengue"]
        umbral = 0.5
        esperado = {"COVID": 0.5, "Dengue": 0.5}
        self.assertEqual(alarma_epidemiologica(registros, infecciosas, umbral), esperado)


class TestOrdenDeAtencion(unittest.TestCase):
    def test_ejemplo(self):
        urgentes = Queue()
        urgentes.put(1)
        urgentes.put(3)
        postergables = Queue()
        postergables.put(2)
        postergables.put(4)
        
        resultado = orden_de_atencion(urgentes, postergables)
        esperado = [1, 2, 3, 4]
        self.assertEqual(list(resultado.queue), esperado)

    def test_un_elemento(self):
        urgentes = Queue()
        urgentes.put(1)
        postergables = Queue()
        postergables.put(2)
        
        resultado = orden_de_atencion(urgentes, postergables)
        self.assertEqual(list(resultado.queue), [1, 2])

    def test_varios_elementos(self):
        urgentes = Queue()
        [urgentes.put(i) for i in [1, 3, 5]]
        
        postergables = Queue()
        [postergables.put(i) for i in [2, 4, 6]]
        
        resultado = orden_de_atencion(urgentes, postergables)
        esperado = [1, 2, 3, 4, 5, 6]
        self.assertEqual(list(resultado.queue), esperado)

    def test_colas_vacias(self):
        urgentes = Queue()
        postergables = Queue()
        resultado = orden_de_atencion(urgentes, postergables)
        self.assertEqual(list(resultado.queue), [])


class TestNivelDeOcupacion(unittest.TestCase):
    def test_ejemplo(self):
        camas = [
            [True, False, True],
            [False, False, False],
            [True, True, True]
        ]
        esperado = [2/3, 0/3, 3/3]
        self.assertEqual(nivel_de_ocupacion(camas), esperado)

    def test_todas_ocupadas(self):
        camas = [[True, True], [True, True]]
        self.assertEqual(nivel_de_ocupacion(camas), [1.0, 1.0])

    def test_ninguna_ocupada(self):
        camas = [[False, False], [False, False]]
        self.assertEqual(nivel_de_ocupacion(camas), [0.0, 0.0])

    def test_un_piso(self):
        camas = [[True, False, True, False]]
        self.assertEqual(nivel_de_ocupacion(camas), [0.5])

    def test_mezcla(self):
        camas = [
            [True, False],
            [True, True],
            [False, False]
        ]
        esperado = [0.5, 1.0, 0.0]
        self.assertEqual(nivel_de_ocupacion(camas), esperado)
    

class TestEmpleadosDelMes(unittest.TestCase):
    def test_ejemplo(self):
        horas = {
            1: [8, 8, 8, 8],
            2: [10, 10, 10, 10],
            3: [12, 8, 12, 8]
        }
        self.assertEqual(empleados_del_mes(horas), [3])

    def test_empate(self):
        horas = {
            101: [8, 8, 8, 8],
            102: [10, 6, 10, 6],
            103: [8, 8, 8, 8]
        }
        resultado = empleados_del_mes(horas)
        self.assertCountEqual(resultado, [101, 103])

    def test_un_empleado(self):
        horas = {1: [8, 8, 8, 8]}
        self.assertEqual(empleados_del_mes(horas), [1])

    def test_variacion_horas(self):
        horas = {
            10: [5, 5, 5, 5],
            20: [6, 4, 6, 4],
            30: [7, 3, 7, 3]
        }
        self.assertEqual(empleados_del_mes(horas), [30])

    def test_dias_distintos(self):
        horas = {
            1: [8, 8, 8, 8, 8],
            2: [10, 10, 10],
            3: [12, 12]
        }
        self.assertEqual(empleados_del_mes(horas), [1])

if __name__ == '__main__':
    unittest.main(verbosity=2)