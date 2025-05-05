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
laQueMasHayQueCodificar _ [(c,_)] = c  
laQueMasHayQueCodificar frase (x:y:rest)
    | count1 >= count2 = laQueMasHayQueCodificar frase (x:rest)
    | otherwise       = laQueMasHayQueCodificar frase (y:rest)
    where
        (c1,_) = x
        (c2,_) = y
        count1 = cuantasVecesHayQueCodificar c1 frase (x:rest)
        count2 = cuantasVecesHayQueCodificar c2 frase (y:rest)

codificarLetra :: Char -> [(Char, Char)] -> Char
codificarLetra c [] = c
codificarLetra c ((to,from):map)
    | c == to = from
    | otherwise = codificarLetra c map

codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] _  = []
codificarFrase (letra:frase) mapa = codificarLetra letra mapa : codificarFrase frase mapa