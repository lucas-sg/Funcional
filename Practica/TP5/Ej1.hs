data Gusto = Chocolate | DulceDeLeche | Frutilla | Sambayon
data Helado = Vasito Gusto
    | Cucurucho Gusto Gusto 
    | Pote Gusto Gusto Gusto

agregarChocolate consH = consH Chocolate

-- a) Vasito :: Gusto -> Helado
-- b) Chocolate :: Gusto
-- c) Cucurucho :: Gusto -> Gusto -> Helado
-- d) Sambayon :: Gusto      <---- mentira
-- e) Pote :: Gusto -> Gusto -> Gusto -> Helado
-- f) agregarChocolate :: (Gusto -> t) -> t 
-- g) agregarChocolate Vasito :: Helado
-- h) agregarChocolate Cucurucho :: Gusto -> Helado
-- i) agregarChocolate (Cucurucho Sambayon) :: Helado
-- j) agregarChocolate (agregarChocolate Cucurucho) :: Helado
-- k) agregarChocolate (Vasito DulceDeLeche) :: rompe
-- l) agregarChocolate Pote :: Gusto -> Gusto -> Helado
-- m) agregarChocolate (agregarChocolate (Pote Frutilla)) :: Helado