data E = Cte Float | Div E E

eval :: E -> Float
eval (Cte n)     = n
eval (Div e1 e2) = let v1 = eval e1
                       in let v2 = eval e2
                           in v1 / v2




-- Recordemos que
-- data Maybe = Nothing | Just a

eval1 :: E -> Maybe Float
eval1 (Cte n)     = Just n
eval1 (Div e1 e2) =
    case (eval e1) of
        Nothing -> Nothing
        Just v1 ->
            case (eval e2) of
                Nothing -> Nothing
                Just v2 ->
                    if v2 == 0 then Nothing
                               else Just (v1 / v2)




type Screen = String
type Output a = (Screen, a)

eval2 :: E -> Output Float
eval2 (Cte n)     = ("", n)
eval2 (Div e1 e2) =
    let (o1, v1) = eval2 e1
        in let (o2, v2) = eval2 e2
            in let o3 = printf (eval Div v1 v2)
                in (o1 ++ o2 ++ o3, v1 / v2)

printf :: String -> Screen
printf msg = msg





-- Recordar que
-- cuantoVale :: Mem -> String -> Maybe Int
-- recordar :: Mem -> String -> Int -> Mem
-- enBlanco :: Mem

eval3 :: E -> (Foat, Mem)
eval3 e = eval3' e (recordar enBlanco "div" 0)

type StateT a = Mem -> (a, Mem)

eval3' :: E -> StateT Float
eval3' (Cte n)     = \mem0 -> (n, mem0)
eval3' (Div e1 e2) =
    \mem0 -> let (v1, v2) = eval3' e1 mem0
        in let (v2, mem2) = eval3' e2 mem1
            in let mem3 = inc "div" mem2
                in (v1 / v2, mem3)

inc :: String -> Mem -> Mem
inc x mem = recordar mem x (from Just (cuantoVale mem x) + 1)





-- Podemos reescribir eval1 asi:
eval1 :: E -> Maybe Float
eval1 (Cte n)     = Just n
eval1 (Div e1 e2) =
    case (eval e1) of
        Nothing -> Nothing
        Just v1' ->
            (\v1 -> case (eval e2) of
                        Nothing -> Nothing
                        Just v2' ->
                            (\v2 -> if v2 == 0 then Nothing
                                    else Just (v1 / v2)
                            ) v2'
            ) v1'

-- Ahora lo rescribo con bindM y returnM
bindM :: Maybe a -> (a -> Maybe b) -> Maybe b
bindM m k = case m of
                Nothing -> Nothing
                Just v  -> k v

returnM :: a -> Maybe a
returnM x = Just x

raiseError :: Maybe a
raiseError = Nothing

eval1 :: E -> Maybe Float
eval1 (Cte n)     = returnM n
eval1 (Div e1 e2) =
    bindM (eval1 e1)
          (\v1 -> bindM (eval1 e2)
                        (\v2 -> if v2 == 0
                                then raiseError
                                else returnM (v1 / v2)))

-- Reescrito con otra indentacion
eval1 :: E -> Maybe Float
eval1 (Cte n)     = returnM n
eval1 (Div e1 e2) =
    eval1 e1 `bindM` \v1 ->
    eval1 e2 `bindM` \v2 ->
    if v2 == 0
    then raiseError
    else returnM (v1 / v2)))




-- Reescribo eval2 con lambdas
eval2 :: E -> Output Float
eval2 (Cte n)     = ("", n)
eval2 (Div e1 e2) =
    (\v1 -> let (o1, v1) = eval2 e1
        in (\v2 -> let (o2, v2) = eval2 e2
                in let o3 = printf (eval Div v1 v2)
                    in (o1 ++ o2 ++ o3, v1 / v2)
           ) v2'
    ) v1'

-- Ahora con bindO y returnO
returnO :: a -> (String, a)
returnO x = ("", x)

bindO ::
bindO m k = 


-- Reescribo eval3' con lambdas
eval3' :: E -> StateT Float
eval3' (Cte n)     = \mem0 -> (n, mem0)
eval3' (Div e1 e2) =
    \mem0 -> let (v1', mem1') = eval3' e1 mem0
        in (\v1 -> \mem1 -> let (v2', mem2') = eval3' e2 mem1
            in (\v2 -> \mem2 -> let (vd, mem3') = inc "div" mem2
                in (\_ -> \mem3 -> (v1 / v2, mem3)
                ) vd mem3'
                -- donde vd significa valor dummy para poder hacer que
                -- el ultimo let devuelva un par
            ) v2' mem2'
        ) v1' mem1'

-- returnS :: a -> Mem -> (a, Mem)
returnS :: a -> StateT a
returnS x = \mem0 -> (x, mem0)

-- bindS :: (Mem -> (a, Mem)) -> (a -> Mem -> (b, Mem)) -> (Mem -> (b, Mem)) 
bindS :: StateT a -> (a -> StateT b) -> StateT b
bindS m k = \mem0 -> let (v, mem1) = m mem0
                     in k v mem1

-- Ahora que definimos returnS y bindS las uso
eval3' :: E -> StateT Float
eval3' (Cte n)     = returnS n
eval3' (Div e1 e2) =
    bindS (eval3' e1)
          (\v1 -> bindS (eval3' e2)
                        (\v2 -> bindS (inc "div")
                                      (\_ -> returnS (v1 / v2))
                        )
          )

-- Por ultimo con otra indentacion
eval3' :: E -> StateT Float
eval3' (Cte n) = returnS n
eval3' (Div e1 e2) =
    eval3' e1 `bindS` \v1 ->
    eval3' e2 `bindS` \v2 ->
    inc "div" `bindS` \_  ->
    returnS (v1 / v2)


-- Una monada es una estructura que tiene esta pinta
-- M a
-- return :: a -> M a
-- (>>=) :: M a -> (a -> M b) -> M b
--
-- Lo que hace el return es agregarle un efecto nulo al valor que le paso para
-- no decir "te devuelvo vacio".
-- Y lo que hace bind es tomar un valor n con un efecto, y lo conecta con
-- una funcion que toma x y devuelve un b con un efecto, y por ultimo la
-- funcion entera devuelve el n con una mezcla entre el efecto original con el
-- efecto que le pone la funcion parametro anteriormente mencionada (la de x).
