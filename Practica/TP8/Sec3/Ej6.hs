module Ej6 where

data ExpA = Cte Int
    | Sum ExpA ExpA
    | Prod ExpA ExpA

evalEA :: ExpA -> Int
evalEA (Cte n) = n
evalEA (Sum e1 e2) = evalEA e1 + (evalEA e2)
evalEA (Prod e1 e2) = evalEA e1 * (evalEA e2)

-- Check este, no quedo muy lindo
simplificarEA :: ExpA -> ExpA
simplificarEA (Cte n) = Cte n
simplificarEA (Sum e1 e2) = sumaSinCerosEA (Sum e1 e2)
simplificarEA (Prod e1 e2) = if (evalEA e1 == 0 || (evalEA e2 == 0))
                             then Cte 0
                             else prodSinUnosEA (Prod e1 e2)

sumaSinCerosEA :: ExpA -> ExpA
sumaSinCerosEA (Sum e1 e2) = if evalEA e1 == 0
                             then simplificarEA e2
                             else if evalEA e2 == 0
                                  then simplificarEA e1
                                  else Sum (simplificarEA e1) (simplificarEA e2)
sumaSinCerosEA expA = expA

prodSinUnosEA :: ExpA -> ExpA
prodSinUnosEA (Prod e1 e2) = if evalEA e1 == 1
                             then simplificarEA e2
                             else if evalEA e2 == 1
                                  then simplificarEA e1
                                  else Prod (simplificarEA e1) (simplificarEA e2)
prodSinUnosEA expA = expA


cantidadDeSumaCero :: ExpA -> Int
cantidadDeSumaCero (Cte _) = 0
cantidadDeSumaCero (Sum e1 e2) = if sumaCero (Sum e1 e2)
                                 then evalEA (Sum (Cte 1) sumTotal)
                                 else evalEA sumTotal
                                 where sum1 = cantidadDeSumaCero e1
                                       sum2 = cantidadDeSumaCero e2
                                       sumTotal = Sum (Cte sum1) (Cte sum2)
cantidadDeSumaCero (Prod e1 e2) = evalEA (Sum (cantidadDeSumaCero e1)
                                              (cantidadDeSumaCero e2))

sumaCero :: ExpA -> Bool
sumaCero (Sum e1 e2) = esCero e1 || (esCero e2)
sumaCero _ = False

esCero :: ExpA -> Bool
esCero (Cte n) = n == 0
esCero _ = False
