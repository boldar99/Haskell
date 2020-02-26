{-# LANGUAGE UnicodeSyntax #-}

module Lesson2 where

import Prelude hiding (head, null)

headInt ∷ [Int] → Int
headInt (x:_) = x
headInt [] = error "The list must contain at least one element"

{-
headInt [5, 6, 7] == 5(x:_)
headInt [10] == 10
-}

tailChar ∷ [Char] → [Char]
tailChar (_:xs) = xs 
{-
tailChar ['a', 'b', 'c'] == ['b', 'c']
tailChar "abc" == "bc"
tailChar ['_'] == []
-}

head ∷ [a] → a
head (x:_) = x

{-
head [1..10] == 1
head "Haskell" == 'H'
-}

null ∷ [a] → Bool
null [] = True
null _ = False

{-
null ""
null []
not (null [1,2])
not $ null "Haskell"
-}

singleton ∷ a → [a]
singleton x = [x]

{-
singleton 'a' == "a"
singleton "a" == ["a"]
singleton 1 == [1]
singleton True == [True]
-}
 