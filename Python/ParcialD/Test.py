import unittest
from Template import promedio_de_salidas, tiempo_mas_rapido, racha_mas_larga, escape_en_solitario
class TestPromedioSalidas(unittest.TestCase):
    def test_ejemplo_basico(self):
        registro = {
            "Juan": [45, 60, 0, 30],
            "Maria": [0, 61, 45, 50],
            "Pedro": [30, 30, 30, 30]
        }
        esperado = {
            "Juan": (3, (45+60+30)/3),
            "Maria": (2, (45+50)/2),
            "Pedro": (4, 30.0)
        }
        self.assertEqual(promedio_de_salidas(registro), esperado)

    def test_ninguna_salida_exitosa(self):
        registro = {"Ana": [0, 61, 0, 61]}
        self.assertEqual(promedio_de_salidas(registro), {"Ana": (0, 0.0)})

    def test_todas_salidas_exitosas(self):
        registro = {"Luis": [45, 50, 55]}
        self.assertEqual(promedio_de_salidas(registro), {"Luis": (3, 50.0)})

    def test_varios_amigos(self):
        registro = {
            "A": [0, 0, 0],
            "B": [1, 60, 61],
            "C": [30, 30, 0]
        }
        esperado = {
            "A": (0, 0.0),
            "B": (2, (1+60)/2),
            "C": (2, 30.0)
        }
        self.assertEqual(promedio_de_salidas(registro), esperado)
    

class TestTiempoMasRapido(unittest.TestCase):
    def test_ejemplo_simple(self):
        tiempos = [45, 30, 0, 20, 61]
        self.assertEqual(tiempo_mas_rapido(tiempos), 3)  # 20 es el más rápido

    def test_primero_es_el_mas_rapido(self):
        tiempos = [10, 45, 30]
        self.assertEqual(tiempo_mas_rapido(tiempos), 0)

    def test_con_ceros_y_61(self):
        tiempos = [0, 61, 50, 35, 61, 0]
        self.assertEqual(tiempo_mas_rapido(tiempos), 3)

    def test_empate_rapido(self):
        tiempos = [40, 30, 30, 50]
        self.assertEqual(tiempo_mas_rapido(tiempos), 1)  # Devuelve el primero


class TestRachaMasLarga(unittest.TestCase):
    def test_racha_unica(self):
        tiempos = [0, 30, 45, 50, 0, 61]
        self.assertEqual(racha_mas_larga(tiempos), (1, 3))

    def test_dos_rachas_iguales(self):
        tiempos = [30, 45, 0, 30, 40, 61, 20]
        self.assertEqual(racha_mas_larga(tiempos), (0, 1))  # Devuelve la primera

    def test_racha_mas_larga_al_final(self):
        tiempos = [30, 0, 20, 25, 30, 35]
        self.assertEqual(racha_mas_larga(tiempos), (2, 5))

    def test_todos_exitosos(self):
        tiempos = [30, 40, 50]
        self.assertEqual(racha_mas_larga(tiempos), (0, 2))

    def test_una_sola_salida_exitosa(self):
        tiempos = [0, 61, 30, 0]
        self.assertEqual(racha_mas_larga(tiempos), (2, 2))


class TestEscapeSolitario(unittest.TestCase):
    def test_ejemplo_basico(self):
        salas = [
            [0, 0, 45, 0],   # 0 - Cumple
            [0, 0, 0, 0],     # No (tercero no fue)
            [1, 0, 30, 0],    # No (primero fue)
            [0, 0, 61, 0]     # 3 - Cumple (aunque no salió)
        ]
        self.assertEqual(escape_en_solitario(salas), [0, 3])

    def test_ninguna_cumple(self):
        salas = [
            [1, 0, 45, 0],
            [0, 1, 30, 0],
            [0, 0, 0, 0]
        ]
        self.assertEqual(escape_en_solitario(salas), [])

    def test_todas_cumplen(self):
        salas = [
            [0, 0, 30, 0],
            [0, 0, 45, 0],
            [0, 0, 60, 0]
        ]
        self.assertEqual(escape_en_solitario(salas), [0, 1, 2])

    def test_con_variaciones(self):
        salas = [
            [0, 0, 30, 1],  # No (cuarto fue)
            [0, 1, 45, 0],  # No (segundo fue)
            [0, 0, 0, 0],    # No (tercero no fue)
            [0, 0, 61, 0]   # 3 - Cumple
        ]
        self.assertEqual(escape_en_solitario(salas), [3])

if __name__ == '__main__':
    unittest.main(verbosity=2)