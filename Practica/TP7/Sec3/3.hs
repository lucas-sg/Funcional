data Dungeon a = Habitacion a
    | Pasaje (Maybe a) (Dungeon a)
    | Bifurcacion (Maybe a) (Dungeon a) (Dungeon a)

cantidadDeBifurcaciones :: Dungeon -> Int
cantidadDeBifurcaciones (Habitacion _) = 0
cantidadDeBifurcaciones (Pasaje _ d) = cantidadDeBifurcaciones d
cantidadDeBifurcaciones (Bifurcacion _ d1 d2) = cantidadDeBifurcaciones d1 + cantidadDeBifurcaciones d2

cantidadDePuntosInteresantes :: Dungeon -> Int
cantidadDePuntosInteresantes (Habitacion _)  = 0
cantidadDePuntosInteresantes (Pasaje _ d) = 1 + cantidadDePuntosInteresantes d
cantidadDePuntosInteresantes (Bifurcacion _ d1 d2) = 1 + cantidadDePuntosInteresantes d1 + cantidadDePuntosInteresantes d2

cantidadDePuntosVacios :: Dungeon -> Int
cantidadDePuntosVacios (Habitacion _)  = 0
cantidadDePuntosVacios (Pasaje mo d) = unoSiesVacio mo + cantidadDePuntosVacios d
cantidadDePuntosVacios (Bifurcacion mo d1 d2) = unoSiEsVacio mo + cantidadDePuntosVacios d1 + cantidadDePuntosVacios d2

unoSiEsVacio :: Maybe t -> Int
unoSiEsVacio Nothing = 1
unoSiEsVacio _ = 0

cantidadDePuntosCon :: Eq t => t -> Dungeon -> Int
cantidadDePuntosCon elem (Habitacion h) = elem == h
cantidadDePuntosCon elem (Pasaje (Just p) d) = elem == p

esLineal :: Dungeon -> Bool
esLineal (Habitacion _) = True
esLineal (Pasaje _ d) = esLineal d
esLineal (Bifurcacion _ _ _) = False

llenoDe :: t -> Dungeon -> Bool
-- ??? Checkear