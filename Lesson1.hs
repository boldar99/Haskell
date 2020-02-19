module Lesson1 where

import Prelude hiding (null) 

-- Explicit típusdeklaráció a következő sor
and :: Bool -> Bool -> Bool

and True True = True
and True False = False
and False True = False
and False False = False

or :: Bool -> Bool -> Bool
or False False = False
or _ _ = True


foo :: Int -> String
foo 2 = "Ha"
foo 10 = "sk"
foo _ = "l"
foo 13 = "Clean" -- Az előző minta mindenre illeszkedik, ez redundáns lesz

goo :: [Int] -> [Char] -- [Char] teljesen ugyanaz mint String
goo [1,2,3] = "l1"
goo [1,3] = "list2"
goo (1:xs) = "list begins with 1"
goo (a:b:c:d:xs) = "long list"
goo _ = "asdf"

bar :: ((Bool, [Char]), Bool) -> Char
bar ((False, ('A':_)), True) = 'c' -- Lehet egymásba ágyazni a mintaillesztést

isSmile :: String -> Bool
isSmile ":)" = True
isSmile ";)" = True
isSmile ";D" = True 
isSmile ":D" = True 
isSmile _ = False

null [] = True
null _ = False
