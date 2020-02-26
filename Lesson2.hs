{-# LANGUAGE UnicodeSyntax #-}

module Lesson2 where

import Prelude hiding (head)

headInt ∷ [Int] → Int
headInt = undefined

{-
headInt [5, 6, 7] == 5
headInt [10] == 10
-}

tailChar ∷ [Char] → [Char]
tailChar = undefined

{-
tailChar ['a', 'b', 'c'] == ['b', 'c']
tailChar "abc" == "bc"
tailChar ['_'] == []
-}

head ∷ [a] → a
head = undefined

{-
head [1..10] == 1
head "Haskell" = 'H'
-}

null ∷ [a] → Bool
null = undefined

{-
null ""
null []
not (null [1,2])
not $ null "Haskell"
-}

singleton ∷ a → [a]
singleton = undefined

{-
singleton 'a' == "a"
singleton "a" == ["a"]
singleton 1 == [1]
singleton True == [True]
-}



