data MayFail a = Raise Exception 
    | Ok a
data Exception = DivByZero 
    | NotFound 
    | NullPointer
    | Other String

type ExHandler a = Exception -> a

tryCatch :: MayFail a -> (a -> b) -> ExHandler b -> b
tryCatch (Raise e) f h = h e
tryCatch (Ok arg) f h = f arg
