module ParcialA where
type Formulas = [(String, String)]
type Votos = [Integer]
type CantVotos = Integer


sumarVotosDeCandidatos :: Votos-> Integer
sumarVotosDeCandidatos [x]  = x
sumarVotosDeCandidatos (votoCandidato:votos) = votoCandidato + sumarVotosDeCandidatos votos

division :: Integer -> Integer -> Float
division a b = fromIntegral a / fromIntegral b

porcentajeDeVotosAfirmativos :: Votos -> CantVotos -> Float
porcentajeDeVotosAfirmativos votos votosTotales =
    (division cantVotos votosTotales) * 100 
    where 
        cantVotos = (sumarVotosDeCandidatos votos)

seRepitePresidente :: Eq b => (b, b) -> [(b, b)] -> Bool
seRepitePresidente _ [] = False
seRepitePresidente (presidente, vise) ((presidente2, vise2):formulas) = 
    presidente == presidente2 || presidente == vise2 || vise == presidente2 || vise == vise2 || seRepitePresidente (presidente, vise) formulas


formulasInvalidas :: Formulas -> Bool
formulasInvalidas [(x,y)] = x == y
formulasInvalidas ((presidente, vise):candidatos)
    | presidente == vise = True
    | seRepitePresidente (presidente, vise) candidatos = True
    | otherwise = formulasInvalidas candidatos

cantVotosVice :: String -> Formulas -> Votos -> Integer
cantVotosVice _ _ [] = 0
cantVotosVice vice ((_,viceGuardado):formulas) (voto:votos)
    | vice == viceGuardado = voto 
    | otherwise = cantVotosVice vice formulas votos

porcentajeDeVotos :: String -> Formulas -> Votos -> Float
porcentajeDeVotos vice formulas votos = 
    (division (cantVotosVice vice formulas votos) (sumarVotosDeCandidatos votos)) * 100


menosVotado :: Formulas -> Votos -> (String, String)
menosVotado [x] [_] = x
menosVotado (candidato1:candidato2:candidatos) (voto1:voto2: votos)
    | voto1 < voto2 = menosVotado (candidato1:candidatos) (voto1:votos)
    | otherwise = menosVotado (candidato2:candidatos) (voto2:votos)