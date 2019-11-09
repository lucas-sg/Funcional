type Nombre = String
data Planilla = Fin | Registro Nombre Planilla
data Equipo = Becario Nombre | Investigador Nombre Equipo Equipo Equipo

largoDePlanilla :: Planilla -> Int
largoDePlanilla Fin = 0
largoDePlanilla (Registro _ p) = 1 + largoDePlanilla p

esta :: Nombre -> Planilla -> Bool
esta n Fin = False
esta n1 (Registro n2 p) = n1 == n2 || esta n1 p

juntarPlanillas :: Planilla -> Planilla -> Planilla
juntarPlanillas Fin p = p
juntarPlanillas (Registro n1 p1) p2 = Registro n1 (juntarPlanillas p1 p2)

nivelesJerarquicos :: Equipo -> Int
nivelesJerarquicos (Becario _) = 0
nivelesJerarquicos (Investigador _ e1 e2 e3) = 1 + max (nivelesJerarquicos e1) (max nivelesJerarquicos e2 e3)

cantidadDeIntegrantes :: Equipo -> Int
cantidadDeIntegrantes (Becario _) = 1
cantidadDeIntegrantes (Investigador _ e1 e2 e3) = 1 + cantidadDeIntegrantes e1 + cantidadDeIntegrantes e2 + cantidadDeIntegrantes e3

planillaDeIntegrantes :: Equipo -> Planilla
planillaDeIntegrantes (Becario n) = Registro n Fin
planillaDeIntegrantes (Investigador n e1 e2 e3) = Registro n (juntarPlanillas (planillaDeIntegrantes e1)
                                                                              (juntarPlanillas (planillaDeIntegrantes e2)
                                                                                               (planillaDeIntegrantes e3)))