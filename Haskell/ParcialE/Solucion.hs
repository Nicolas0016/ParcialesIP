type Equipo = String
type Goleador = String
type GoleadoresPorEquipo = [(Equipo, Goleador)]
type Goles = [Integer]

-- Ejercicio 1 
totalGolesTorneo :: Goles -> Integer
totalGolesTorneo [] = 0
totalGolesTorneo (goles:resto) = goles + totalGolesTorneo resto

golesDeNoGoleadores :: GoleadoresPorEquipo -> Goles -> Integer -> Integer
golesDeNoGoleadores _ goles golesTotales = totalGolesTorneo goles - golesTotales

-- Ejercicio 2

hayRepetidos :: Goleador -> GoleadoresPorEquipo -> Bool
hayRepetidos t [] = False
hayRepetidos nombre ((equipo, arquero):resto) = 
    nombre == equipo || 
    nombre == arquero || 
    hayRepetidos nombre resto

tienenElMismoNombre :: GoleadoresPorEquipo -> Bool
tienenElMismoNombre [] = False
tienenElMismoNombre ((equipo, nombre):resto) = 
    equipo == nombre || tienenElMismoNombre resto

equiposValidos :: GoleadoresPorEquipo -> Bool
equiposValidos [] = True
equiposValidos ((equipo, nombre):equipos) = 
    not (hayRepetidos equipo equipos) &&
    not (hayRepetidos nombre equipos) &&
    not (tienenElMismoNombre ((equipo, nombre):equipos))
-- Ejercicio 3

division :: Integer -> Integer -> Float
division a b = fromIntegral a / fromIntegral b

golesConvertidos :: Goleador -> GoleadoresPorEquipo -> Goles -> Integer
golesConvertidos jugador ((_,jugadorGuardado):resto) (cantGoles:goles)
    | jugador == jugadorGuardado = cantGoles
    | otherwise = golesConvertidos jugador resto goles


porcentajeDeGoles :: Goleador -> GoleadoresPorEquipo -> Goles -> Float
porcentajeDeGoles jugador goleadoresPorEquipo goles = 
    division golesJugador golesTotales * 100
    where 
        golesJugador = golesConvertidos jugador goleadoresPorEquipo goles
        golesTotales = totalGolesTorneo goles


-- Ejercicio 4
botinDeOro :: GoleadoresPorEquipo -> Goles -> Goleador 
botinDeOro [(_, nombre)] [_] = nombre
botinDeOro (jugador1:jugador2:jugadoresPorEquipo) (gol1:gol2:goles) 
    | gol1 >= gol2 = botinDeOro (jugador1:jugadoresPorEquipo) (gol1:goles)
    | otherwise = botinDeOro (jugador2:jugadoresPorEquipo) (gol2:goles)