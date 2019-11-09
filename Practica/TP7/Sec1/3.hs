data Pizza = Prepizza | Capa Ingrediente Pizza
data Ingrediente = Aceitunas Int | Anchoas | Cebolla | Jamon | Queso | Salsa

cantidadDeCapas :: Pizza -> Int
cantidadDeCapas Prepizza = 0
cantidadDeCapas (Capa _ p) = 1 + cantidadDeCapas p

cantidadDeAceitunas :: Pizza -> Int
cantidadDeAceitunas Prepizza = 0
cantidadDeAceitunas (Capa i p) = contarAceitunasEnIng i + cantidadDeAceitunas p

contarAceitunasEnIng :: Ingrediente -> Int
contarAceitunasEnIng (Aceitunas n) = n
contarAceitunasEnIng _ = 0

duplicarAceitunas :: Pizza -> Pizza
duplicarAceitunas Prepizza = Prepizza
duplicarAceitunas (Capa i p) = Capa (duplicAcEnIng i) (duplicarAceitunas p)

duplicAcEnIng :: Ingrediente -> Ingrediente
duplicAcEnIng (Aceitunas n) = Aceitunas (2 * n)
duplicAcEnIng ing = ing

sinLactosa :: Pizza -> Pizza
sinLactosa Prepizza = Prepizza
sinLactosa (Capa ing p) =
    if tieneLactosa ing
      then sinLactosa p 
      else Capa ing (sinLactosa p)

tieneLactosa :: Ingrediente -> Bool
tieneLactosa Queso = True
tieneLactosa _ = False

aptaIntolerantesLactosa :: Pizza -> Bool
aptaIntolerantesLactosa p = p == sinLactosa p

agregaAceitunasCorrectamente :: Pizza -> Bool
agregaAceitunasCorrectamente Prepizza = True
agregaAceitunasCorrectamente (Capa (Aceitunas n) p) = (n > 0) && agregaAceitunasCorrectamente p

conDescripcionMejorada :: Pizza -> Pizza
conDescripcionMejorada Prepizza = Prepizza
-- Pendiente: conDescripcionMejorada Capa 

tiene :: Ingrediente -> Pizza -> Bool
tiene i Prepizza = False
tiene i1 (Capa i2 p) = i1 == i2 || tiene i1 p