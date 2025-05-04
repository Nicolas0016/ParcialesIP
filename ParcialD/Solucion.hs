module Solucion where 
type Equipo = String
type Arquero = String
type ArquerosPorEquipo = [(Equipo, Arquero)] 
type Goles = [Integer]

-- Ejercicio 1
totalGolesTorneo :: Goles -> Integer
totalGolesTorneo [] = 0
totalGolesTorneo (cantGoles:resto) = cantGoles + totalGolesTorneo resto

atajaronSuplentes :: ArquerosPorEquipo -> Goles -> Integer -> Integer
atajaronSuplentes _ goles golesTotales = totalGolesTorneo goles - golesTotales

-- Ejercicio 2
hayRepetidos :: String -> ArquerosPorEquipo -> Bool
hayRepetidos t [] = False
hayRepetidos nombre ((equipo, arquero):resto) = 
    nombre == equipo || 
    nombre == arquero || 
    hayRepetidos nombre resto

tienenElMimoNombre:: ArquerosPorEquipo -> Bool
tienenElMimoNombre [] = False
tienenElMimoNombre ((equipo, arquero):resto) = equipo == arquero || tienenElMimoNombre resto

equiposValidos :: ArquerosPorEquipo -> Bool
equiposValidos [] = True
equiposValidos ((equipo, arquero):equipos) = 
    noHayEquiposRepetidos &&
    noHayArquerosRepetidos &&
    not (tienenElMimoNombre ((equipo, arquero):equipos))
    where 
        noHayEquiposRepetidos = not (hayRepetidos equipo equipos)
        noHayArquerosRepetidos = not (hayRepetidos arquero equipos)
        noTienenElMismoNombre = not (tienenElMimoNombre ((equipo, arquero):equipos))

-- Ejercicio 3

division :: Integer -> Integer -> Float
division a b = fromIntegral a / fromIntegral b


golesConvertidosAlArquero :: Arquero -> ArquerosPorEquipo -> Goles -> Integer
golesConvertidosAlArquero arquero ((_,arqueroGuardado):resto) (golesConvertidos:goles)
    | arquero == arqueroGuardado = golesConvertidos
    | otherwise = golesConvertidosAlArquero arquero resto goles

porcentajeDeGoles :: Arquero -> ArquerosPorEquipo -> Goles -> Float
porcentajeDeGoles arquero arquerosPorEquipo goles 
    = (division golesConvertidos golesTotalesDelCampionato) * 100
    where 
        golesConvertidos = golesConvertidosAlArquero arquero arquerosPorEquipo goles
        golesTotalesDelCampionato = totalGolesTorneo goles 

vallaMenosVencida :: ArquerosPorEquipo -> Goles -> Arquero
vallaMenosVencida [(_, nombre)] [_] = nombre
vallaMenosVencida (arquero1:arquero2:arquerosPorEquipo) (gol1:gol2:goles) 
    | gol1 <= gol2 = vallaMenosVencida (arquero1:arquerosPorEquipo) (gol1:goles)
    | otherwise = vallaMenosVencida (arquero2:arquerosPorEquipo) (gol2:goles)