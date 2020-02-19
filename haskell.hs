module Lesson1 where

and' :: Bool -> Bool -> Bool
and' True True = True
and' True False = False
and' False True = False
and' False False = False

or' :: Bool -> Bool -> Bool
or' False False = False
or' _ _ = True


foo :: Int -> String
foo 2 = "Ha"
foo 10 = "sk"
foo _ = "l"
foo 13 = "Clean"

goo :: [Int] -> [Char]
goo [1,2,3] = "l1"
goo [1,3] = "list2"
goo (1:xs) = "list begins with 1"
goo (a:b:c:d:xs) = "long list"
goo _ = "asdf"

bar :: ((Bool, [Char]), Bool) -> Char
bar ((False, ('A':_)), True) = 'c'

isSmile :: String -> Bool
isSmile ":)" = True
isSmile ";)" = True
isSmile ";D" = True 
isSmile ":D" = True 
isSmile _ = False

isSmileee (eye:mouth:cs) = eye `elem` ";:" && mouth `elem` "D)" && null cs


null' [] = True
null' _ = False