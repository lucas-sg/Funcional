data Pizza = Prepizza | Capa Ingrediente Pizza
data Ingrediente = Aceitunas Int | Anchoas | Cebolla | Jamon | Queso | Salsa

cantidadDeCapas :: Pizza -> Int
cantidadDeCapas Prepizza = 0
cantidadDeCapas Capa _ p = 1 + cantidadDeCapas p

cantidadDeAceitunas :: Pizza -> Int
cantidadDeAceitunas Prepizza = 0
cantidadDeAceitunas Capa (Aceitunas n) p = n + cantidadDeAceitunas p
cantidadDeAceitunas Capa _ p = cantidadDeAceitunas p

duplicarAceitunas :: Pizza -> Pizza
duplicarAceitunas Prepizza = Prepizza
duplicarAceitunas Capa (Aceitunas n) p = Capa Aceitunas (2 * n) (duplicarAceitunas p)
duplicarAceitunas Capa _ p = duplicarAceitunas p

sinLactosa :: Pizza -> Pizza
sinLactosa Prepizza = Prepizza
sinLactosa Capa Queso p =  sinLactosa p
sinLactosa Capa i p = Capa i (sinLactosa p)

aptaIntolerantesLactosa :: Pizza -> Bool
aptaIntolerantesLactosa p = p == sinLactosa p

agregaAceitunasCorrectamente :: Pizza -> Bool
agregaAceitunasCorrectamente Prepizza = True
agregaAceitunasCorrectamente Capa (Aceitunas n) p = (n > 0) && agregaAceitunasCorrectamente p

conDescripcionMejorada :: Pizza -> Pizza
conDescripcionMejorada Prepizza = Prepizza
-- Pendiente: conDescripcionMejorada Capa 

tiene :: Ingrediente -> Pizza -> Bool
tiene i Prepizza = False
tiene i1 (Capa i2 p) = i1 == i2 || tiene i1 p