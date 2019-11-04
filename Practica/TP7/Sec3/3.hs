data Dungeon a = Habitacion a
    | Pasaje (Maybe a) (Dungeon a)
    | Bifurcacion (Maybe a) (Dungeon a) (Dungeon a)

cantidadDeBifurcaciones :: Dungeon -> Int
cantidadDeBifurcaciones Habitacion _ = 0
cantidadDeBifurcaciones Pasaje _ d = cantidadDeBifurcaciones d
cantidadDeBifurcaciones Bifurcacion _ d1 d2 = cantidadDeBifurcaciones d1 + cantidadDeBifurcaciones d2

cantidadDePuntosInteresantes :: Dungeon -> Int
cantidadDePuntosInteresantes Habitacion _  = 0
cantidadDePuntosInteresantes Pasaje _ d = 1 + cantidadDePuntosInteresantes d
cantidadDePuntosInteresantes Bifurcacion _ d1 d2 = 1 + cantidadDePuntosInteresantes d1 + cantidadDePuntosInteresantes d2

cantidadDePuntosVacios :: Dungeon -> Int
cantidadDePuntosVacios Habitacion _  = 0
cantidadDePuntosVacios Pasaje Nothing d = cantidadDePuntosVacios d
cantidadDePuntosVacios Bifurcacion Nothing d1 d2 = cantidadDePuntosVacios d1 + cantidadDePuntosVacios d2

cantidadDePuntosCon :: t -> Dungeon -> Int
-- ??? Checkear

esLineal :: Dungeon -> Bool
esLineal Habitacion _ = True
esLineal Pasaje _ d = esLineal d
esLineal Bifurcacion _ _ _ = False

llenoDe :: t -> Dungeon -> Bool
-- ??? Checkear