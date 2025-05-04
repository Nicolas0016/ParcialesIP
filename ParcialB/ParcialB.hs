module  ParcialB where  
type Relaciones = [(String,String)]
type Persona = String

seRepite :: (String, String) -> Relaciones -> Bool
seRepite x [(a,b)] = x == (a,b) || x == (b,a)  
seRepite relacion ((persona1,persona2):resto)
    = relacion == (persona1,persona2) || relacion== (persona2,persona1) || seRepite relacion resto   

relacionesValidas :: Relaciones -> Bool
relacionesValidas [] = True
relacionesValidas [(x, y)] = x /= y
relacionesValidas (relacion: resto) = 
    not(seRepite relacion resto) &&
    relacionesValidas resto

quitarTodos _ [] = []
quitarTodos t (x:xs)
    | t == x = quitarTodos t xs
    | otherwise = x: quitarTodos t xs

convertirEnLista [] = []
convertirEnLista ((persona1,persona2):resto) = persona1:persona2:convertirEnLista resto

auxPersonas :: [Persona] ->  [Persona]
auxPersonas [] = []
auxPersonas (persona:resto) = persona : auxPersonas (quitarTodos persona resto)

personas relaciones 
    =  auxPersonas (convertirEnLista relaciones) 

amigosDe :: Persona-> Relaciones -> [Persona]
amigosDe _ [] = []
amigosDe persona ((persona1, persona2):resto)
    | persona == persona1 = persona2 : amigosDe persona resto
    | persona == persona2 = persona1 : amigosDe persona resto
    | otherwise = amigosDe persona resto

longitud [x] = 1 
longitud (_:xs) = 1+ longitud xs


auxPersonaConMasAmigos :: [Persona] -> Relaciones -> Persona
auxPersonaConMasAmigos [x] _ = x
auxPersonaConMasAmigos (persona1:persona2:personas) relaciones
    | cantidadAmigosPersona1 > cantidadAmigosPersona2  = auxPersonaConMasAmigos (persona1:personas) relaciones
    | otherwise = auxPersonaConMasAmigos (persona2:personas) relaciones
    where 
        cantidadAmigosPersona1 = longitud (amigosDe persona1 relaciones)
        cantidadAmigosPersona2 = longitud (amigosDe persona2 relaciones)


personaConMasAmigos :: Relaciones -> Persona
personaConMasAmigos relaciones = auxPersonaConMasAmigos (personas(relaciones)) relaciones 