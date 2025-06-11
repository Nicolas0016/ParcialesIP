from Template import ind_nesima_aparicion, mezclar, frecuencia_posiciones_por_caballo, matriz_capicua
import unittest

from copy import deepcopy

class TestIndNesimaAparicion(unittest.TestCase):
    def test_modificó_la_lista_original(self):
        s = [-1, 1, 1, 5, -7, 1, 3]
        n = 2
        elem = 1
        s_copy = (s).copy()  # Guardar copia de s
        self.assertEqual(ind_nesima_aparicion(s, n, elem), 2)
        self.assertEqual(s, s_copy)  # Verificar que s no ha sido modificado
    def test_primer_aparicion(self):
        s = [5, 3, 2, 5, 7, 5]
        self.assertEqual(ind_nesima_aparicion(s, 1, 5), 0)

    def test_ultima_aparicion(self):
        s = [1, 2, 3, 4, 1, 2, 3, 4, 1]
        self.assertEqual(ind_nesima_aparicion(s, 3, 1), 8)

    def test_aparicion_inexistente(self):
        s = [1, 2, 3, 4, 5]
        self.assertEqual(ind_nesima_aparicion(s, 2, 6), -1)

    def test_menos_apariciones_de_las_solicitadas(self):
        s = [1, 1, 1, 1]
        self.assertEqual(ind_nesima_aparicion(s, 5, 1), -1)

    def test_elemento_no_presente(self):
        s = [2, 4, 6, 8]
        self.assertEqual(ind_nesima_aparicion(s, 1, 1), -1)

class TestMezclar(unittest.TestCase):
    def test_se_modificó_la_lista_original(self):
        s1 = [1, 3, 0, 1]
        s2 = [4, 0, 2, 3]
        s1_copy = s1.copy()  # Guardar copia de s1
        s2_copy = s2.copy() # Guardar copia de s2
        self.assertEqual(mezclar(s1, s2), [1, 4, 3, 0, 0, 2, 1, 3])
        self.assertEqual(s1, s1_copy)  # Verificar que s1 no ha sido modificado
        self.assertEqual(s2, s2_copy)  # Verificar que s2 no ha sido modificado

    def test_listas_un_elemento(self):
        self.assertEqual(mezclar([5], [10]), [5, 10])

    def test_listas_vacias(self):
        self.assertEqual(mezclar([], []), [])

    def test_listas_strings(self):
        s1 = ["a", "b", "c"]
        s2 = ["x", "y", "z"]
        self.assertEqual(mezclar(s1, s2), ["a", "x", "b", "y", "c", "z"])

    def test_listas_mezcladas(self):
        s1 = [1.5, 2.5, 3.5]
        s2 = [10, 20, 30]
        self.assertEqual(mezclar(s1, s2), [1.5, 10, 2.5, 20, 3.5, 30])

    def test_listas_distintos_tipos(self):
        s1 = [1, "a", True]
        s2 = [False, 3.14, "b"]
        self.assertEqual(mezclar(s1, s2), [1, False, "a", 3.14, True, "b"])


class TestFrecuenciaPosicionesPorCaballo(unittest.TestCase):
    def test_se_modificó_la_lista_original(self):
        caballos = ["linda", "petisa", "mister", "luck"]
        carreras = {
            "carrera1": ["linda", "petisa", "mister", "luck"],
            "carrera2": ["petisa", "mister", "linda", "luck"]
        }
        esperado = {
            "petisa": [1, 1, 0, 0],
            "mister": [0, 1, 1, 0],
            "linda": [1, 0, 1, 0],
            "luck": [0, 0, 0, 2]
        }
        caballos_copy = deepcopy(caballos)  # Guardar copia de caballos
        carreras_copy = deepcopy(carreras)  # Guardar copia de carreras
        self.assertEqual(frecuencia_posiciones_por_caballo(caballos, carreras), esperado)
        self.assertEqual(caballos, caballos_copy)  # Verificar que caballos no ha sido modificado
        self.assertEqual(carreras, carreras_copy)  # Verificar que carreras no ha sido modificado

    def test_una_carrera(self):
        caballos = ["a", "b", "c"]
        carreras = {"carrera1": ["a", "b", "c"]}
        esperado = {"a": [1, 0, 0], "b": [0, 1, 0], "c": [0, 0, 1]}
        self.assertEqual(frecuencia_posiciones_por_caballo(caballos, carreras), esperado)

    def test_varias_carreras_mismo_orden(self):
        caballos = ["x", "y", "z"]
        carreras = {
            "c1": ["x", "y", "z"],
            "c2": ["x", "y", "z"],
            "c3": ["x", "y", "z"]
        }
        esperado = {"x": [3, 0, 0], "y": [0, 3, 0], "z": [0, 0, 3]}
        self.assertEqual(frecuencia_posiciones_por_caballo(caballos, carreras), esperado)

    def test_caballo_siempre_ultimo(self):
        caballos = ["a", "b", "c"]
        carreras = {
            "c1": ["a", "b", "c"],
            "c2": ["b", "a", "c"],
            "c3": ["a", "b", "c"]
        }
        esperado = {"a": [2, 1, 0], "b": [1, 2, 0], "c": [0, 0, 3]}
        self.assertEqual(frecuencia_posiciones_por_caballo(caballos, carreras), esperado)

    def test_carreras_vacias(self):
        caballos = ["a", "b"]
        carreras = {}
        esperado = {"a": [0, 0], "b": [0, 0]}
        self.assertEqual(frecuencia_posiciones_por_caballo(caballos, carreras), esperado)


class TestMatrizCapicua(unittest.TestCase):
    def test_se_modificó_la_matriz_original(self):
        m = [[1,2,2,1],[-5,6,6,-5],[0,1,1,0]]
        m_copy = deepcopy(m)
        self.assertTrue(matriz_capicua(m))  
        self.assertEqual(m, m_copy)

    def test_matriz_vacia(self):
        self.assertTrue(matriz_capicua([]))

    def test_matriz_un_elemento(self):
        self.assertTrue(matriz_capicua([[5]]))

    def test_matriz_no_capicua(self):
        m = [[1,2,3],[4,5,6]]
        self.assertFalse(matriz_capicua(m))

    def test_una_fila_no_capicua(self):
        m = [[1,2,2,1],[1,2,3,4]]
        self.assertFalse(matriz_capicua(m))

    def test_filas_impares(self):
        m = [[1,2,1],[3,4,3],[5,6,5]]
        self.assertTrue(matriz_capicua(m))

    def test_filas_pares(self):
        m = [[1,1],[2,2],[3,3]]
        self.assertTrue(matriz_capicua(m))

    def test_strings_capicua(self):
        m = [["a", "b", "a"], ["c", "d", "c"]]
        self.assertTrue(matriz_capicua(m))

    def test_strings_no_capicua(self):
        m = [["a", "b", "c"], ["d", "e", "f"]]
        self.assertFalse(matriz_capicua(m))

if __name__ == '__main__':
    unittest.main()