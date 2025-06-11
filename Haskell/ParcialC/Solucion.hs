module Solucion where
type Alumno = String
type Notas = [Integer]
type Registros = [(Alumno, Notas)]
type Alumnos = [Alumno]
-- Ejercicio 1
numeroDeMateriasAprobadas :: Notas -> Integer
numeroDeMateriasAprobadas [] = 0
numeroDeMateriasAprobadas (x:xs) 
    | x >= 4 = 1+ numeroDeMateriasAprobadas xs
    | otherwise = numeroDeMateriasAprobadas xs 


aproboMasDeNMaterias :: Registros-> Alumno -> Integer -> Bool
aproboMasDeNMaterias ((nombreAlumno,notas):registro) alumno numeroMateriasAprobadas
    | esElAlumno = numeroDeMateriasAprobadas notas > numeroMateriasAprobadas
    | otherwise = aproboMasDeNMaterias registro alumno numeroMateriasAprobadas
    where 
        esElAlumno = alumno == nombreAlumno

-- Ejercicio 2
tieneAplazos :: Notas -> Bool
tieneAplazos [] = False
tieneAplazos (nota:notas) = nota <= 4 ||  tieneAplazos notas 

sumarNotas :: Notas -> Integer
sumarNotas [] = 0
sumarNotas (x:xs) = x + sumarNotas xs

division :: Integer -> Integer -> Float
division a b = fromIntegral a / fromIntegral b

promedio :: Notas -> Float
promedio notas = division (sumarNotas notas) (numeroDeMateriasAprobadas notas)   

buenosAlumnos :: Registros -> Alumnos
buenosAlumnos [] = []
buenosAlumnos ((nombreAlumno,materias): registro)
    | noTieneAplazos && buenPromedio  = nombreAlumno: buenosAlumnos registro
    | otherwise = buenosAlumnos registro
    where 
        buenPromedio = promedio materias >= 8
        noTieneAplazos = not (tieneAplazos materias)

-- Ejercicio 3
mejorPromedio:: Registros -> Alumno
mejorPromedio [(nombreAlumno, x)] = nombreAlumno
mejorPromedio ((nombreAlumno1,notasAlumno1):(nombreAlumno2,notasAlumno2):registro) 
    | promedio notasAlumno1 >= promedio notasAlumno2 = mejorPromedio ((nombreAlumno1,notasAlumno1):registro)
    | otherwise = mejorPromedio ((nombreAlumno2,notasAlumno2):registro)

-- Ejercicio 4 
pertenece :: Eq t => t -> [t]-> Bool
pertenece _ [] = False
pertenece t (x:xs) = t == x || pertenece t xs 

buscarNotas :: Alumno-> Registros-> Notas
buscarNotas _ [] = []
buscarNotas alumno ((alumnoGuardado, nota):registro)
    | alumno == alumnoGuardado = nota 
    | otherwise = buscarNotas alumno registro

type CantidadDeMateriasDeLaCarrera = Integer
seGraduoConHonores :: Registros -> CantidadDeMateriasDeLaCarrera -> Alumno -> Bool
seGraduoConHonores registro cantidadMaterias alumno = 
    aproboMasDeNMaterias registro alumno (cantidadMaterias-1)  
    && pertenece alumno (buenosAlumnos registro)  &&
    promedio (buscarNotas alumno registro) >= (promedio (buscarNotas (mejorPromedio registro) registro) )-1