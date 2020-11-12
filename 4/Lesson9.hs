module Lesson9 where

import Prelude hiding (unzip, splitAt, flip, (.), ($), curry, uncurry, map, filter, takeWhile, dropWhile)
import Data.Char (isUpper, toLower)


unzip :: [(a, b)] -> ([a], [b])
unzip []          = ([], [])
unzip ((x,y):xys) = (x:xs, y:ys)
 where
  (xs, ys) = unzip xys


splitAt :: Int -> [a] -> ([a], [a])
-- splitAt n l = (take n l, drop n l)
splitAt _ [] = ([], [])
splitAt n ls@(x:xs)
 | n <= 0    = ([],   ls)
 | otherwise = (x:tk, dr)
 where
  (tk, dr) = splitAt (n-1) xs


--------------------------------------------------------------------------------


add7 :: Int -> Int
add7 n = n + 7
{-
add7 8 == 15
add7 0 == 7
-}

multiplyBy5 :: Int -> Int
multiplyBy5 n = n * 5
{-
multiplyBy5 5 == 25
multiplyBy5 2 == 10
-}

max5 :: Int -> Int
max5 n = max n 5
{-
max5 10 == 10
max5 5 == 5
max5 0 == 5
-}


-- http://learnyouahaskell.com/higher-order-functions
--------------------------------------------------------------------------------


apply :: (a -> b) -> a -> b
apply f x = f x
{-
apply add7 4 == 11
apply (const 5) 0 == 5
apply abs (-7) == 7
-}

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
{-
applyTwice add7 4 == 18
applyTwice (const 5) 0 == 5
applyTwice tail [1..10] == [3..10]
-}

applyN :: Int -> (a -> a) -> a -> a
applyN 0 _ x = x
applyN n f x = applyN (n-1) f (f x)
{-
applyN 10 add7 4 == 74
applyN 10 abs (-7) == 7
-}

fullName :: String -> String -> String
fullName last first = first ++ " " ++ last

--flip :: (a -> b -> c) -> b -> a -> c
flip :: (a -> b -> c) -> (b -> a -> c)
flip f b a = f a b
{-
flip apply 5 add7 == 12
flip (+) 1 2 == 3
-}

(.) ::  (b -> c) -> (a -> b) -> (a -> c)
infixr 9 .
(.) f g x = f (g x)
{-
(add7 . multiplyBy5) 1 == 12
(multiplyBy5 . add7) 1 == 40
-}

($) :: (a -> b) -> a -> b
infixr 0 $
f $ x = f x
{-
not $ isFaculty "GTI"
-}

-- ($!) ugyanez, csak a "kiértékeli" a paramétert

curry :: ((a, b) -> c) -> a -> b -> c
curry = undefined
{-
f (x,y) = sqrt (x**2 + abs y)
uf = curry f
fx = uf 1
fx 0 == 1
-}

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry = undefined
{-
add = uncurry (+)
add (7,8) == 15
-}

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs


filter :: (a -> Bool) -> [a] -> [a]
-- filter p ls = [x | x <- ls, p x]
filter _ [] = []
filter p (x:xs)
 | p x       = x : filter p xs
 | otherwise = filter p xs


{-
    Számoljuk meg egy adott tulajdonságú elem előfordulásait egy listában!
-}
count :: (a -> Bool) -> [a] -> Int
count p ls = length $ filter p ls
{-
count (==3) [1,2,3,4,5,4,3,2,1] == 2
-}

{-
    Definiálj egy upperToLower nevű függvényt, mely minden nagybetűt kisbetűvé 
    alakít, a többit eldobja!
-}
upperToLower :: String -> String
upperToLower str = map toLower $ filter isUpper str
-- upperToLower str = [toLower c | c <- str, isUpper c]
{-
upperToLower "" == ""
upperToLower "Hello World!" == "hw"
upperToLower "haSKell" == "sk"
-}

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs)
 | p x       = x : takeWhile p xs
 | otherwise = []


dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile p ls@(x:xs)
 | p x       = dropWhile p xs
 | otherwise = ls
