module Lesson9 where

import Prelude hiding (unzip, splitAt, flip, (.), ($), curry, uncurry)


unzip :: [(a, b)] -> ([a], [b])
unzip [] = ([], [])
unzip ((a,b):abs) = (a:as, b:bs)
 where
  (as, bs) = unzip abs

splitAt n [] = ([], [])
splitAt n ls@(x:xs)
 | n <= 0 = ([], ls)
 | n >  0 = (x:as, bs)
 where
  (as, bs) = splitAt (n-1) xs


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
applyN = undefined
{-
applyN 10 add7 4 == 74
applyN 10 abs (-7) == 7
-}

--flip :: (a -> b -> c) -> b -> a -> c
flip :: (a -> b -> c) -> (b -> a -> c)
flip f b a = f a b
{-
flip apply 5 add7 == 12
flip (+) 1 2 == 3
-}

(.) :: (b -> c) -> (a -> b) -> (a -> c)
infixr 9 .
(.) f g x = f (g x)
{-
(add7 . multiplyBy5) 1 == 12
(multiplyBy5 . add7) 1 == 40
-}

($) :: (a -> b) -> a -> b
infixr 0 $
($) f x = f x
{-
not $ null [1]
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
filter _ [] = []
filter f (x:xs)
 | f x       = x : filter f xs
 | otherwise = filter f xs

count :: (a -> Bool) -> [a] -> Int
count f ls = length $ filter f ls

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile f (x:xs)
 | f x       = x : takeWhile f xs
 | otherwise = []
