{-# LANGUAGE MagicHash #-}
module Export where

import Java

data {-# CLASS "eta.example.Exported" #-} Exported
  = Exported (Object# Exported)

fib' 0 = 1
fib' 1 = 1
fib' n = fib' (n - 1) + fib' (n - 2)

fib :: Int -> Java Exported Int
fib n = return $ fib' n

foreign export java fib :: Int -> Java Exported Int
