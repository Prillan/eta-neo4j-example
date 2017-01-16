{-# LANGUAGE MagicHash #-}
module Export where

import Data.List (intercalate)
import Java
import Java.String

-- Our exported class
data {-# CLASS "eta.example.Exported" #-} Exported
  = Exported (Object# Exported)

fib' 0 = 1
fib' 1 = 1
fib' n = fib' (n - 1) + fib' (n - 2)

fib :: Int -> Java Exported Int
fib n = return $ fib' n

foreign export java fib :: Int -> Java Exported Int


join :: JString -> JStringArray -> Java Exported JString
join delim strings = do

  -- Convert the Java array into a haskell list
  xs <- strings <.> toList

  -- Convert from JString to String
  -- and from [JString] to [String]
  let delim' = fromJString delim
      xs' = map fromJString xs

  return $ toJString $ intercalate delim' xs'

foreign export java join :: JString -> JStringArray -> Java Exported JString
