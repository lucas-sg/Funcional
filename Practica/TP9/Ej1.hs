import TP8.Sec3.Ej6

data EA = Const Int | BOp BinOp EA EA
data BinOp = SumOp | MulOp

evalEA :: EA -> Int
evalEA (Const n)      = n
evalEA (BOp op e1 e2) = evalBinOp op (evalEA e1) (evalEA e2)

evalBinOp :: Num a => BinOp -> (a -> a -> a)
evalBinOp SumOp = (+)
evalBinOp MulOp = (*)

ea2ExpA :: EA -> ExpA
ea2ExpA (Const n)      = Cte n
ea2ExpA (BOp op e1 e2) = case op of 
                            SumOp -> Sum (ea2ExpA e1) (ea2ExpA e2)
                            MulOp -> Prod (ea2ExpA e1) (ea2ExpA e2)