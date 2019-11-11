import Ej1
import TP8.Sec3.Ej6

data ExpS = CteS N
          | SumS ExpS ExpS
          | ProdS ExpS ExpS

evalES :: ExpS -> Int
evalES (Cte n) = evalN n
evalES (Sum e1 e2) = addN (int2N (evalES e1))
                          (int2N (evalES e2))
evalES (Prod e1 e2) = prodN (int2N (evalES e1))
                            (int2N (evalES e2))

es2ea :: ExpS -> ExpA
evalES (CteS n) = Cte (evalES n)
evalES (SumS es1 es2) = Sum (es2ea es1) (es2ea es2)
evalES (ProdS es1 es2) = Prod (es2ea es1) (es2ea es2)

ea2es :: ExpA -> ExpS
evalEA (Cte n) = CteS (int2N n)
evalEA (Sum ea1 ea2) = SumS (ea2es ea1) (ea2es ea2)
evalEA (Prod ea1 ea2) = Prod (ea2es ea1) (ea2es ea2)