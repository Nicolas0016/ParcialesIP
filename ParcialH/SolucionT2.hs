module SolucionT2 where
hayQueCodificar::Char-> [(Char,Char)] ->Bool
hayQueCodificar _ [] = False
hayQueCodificar caracter ((x,_):mapa) = caracter == x || hayQueCodificar  caracter mapa


apariciones :: (Eq t) => t -> [t] -> Int
apariciones _ [] = 0
apariciones t (x:xs)
    | t ==x = 1 + apariciones t xs
    | otherwise = apariciones t xs 

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char, Char)] -> Int
cuantasVecesHayQueCodificar char frase mapeo 
    | hayQueCodificar char mapeo = apariciones char frase 
    | otherwise = 0 

laQueMasHayQueCodificar :: [Char] -> [(Char, Char)] -> Char
laQueMasHayQueCodificar _ [(x,_)] = x
laQueMasHayQueCodificar word (x:y:rest)
    | aparicionesPrimeraLetra > aparicionesSegundaLetra = laQueMasHayQueCodificar word (x:rest)
    | otherwise = laQueMasHayQueCodificar word (y:rest)
    where
        (x1,_) = x
        (y1,_) = y
        aparicionesPrimeraLetra = cuantasVecesHayQueCodificar x1 word (x:rest) 
        aparicionesSegundaLetra = cuantasVecesHayQueCodificar y1 word (y:rest)

codificarLetra :: Char -> [(Char, Char)] -> Char
codificarLetra c [] = c
codificarLetra c ((to,from):map)
    | c == to = from
    | otherwise = codificarLetra c map

codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] _  = []
codificarFrase (letra:frase) mapa = codificarLetra letra mapa : codificarFrase frase mapa