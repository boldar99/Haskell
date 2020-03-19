module Lesson4 where

import Data.Char

rmSpace :: String -> String
rmSpace str = [ c | c <- str, not (isSpace c) ]

toUpperString :: String -> String
toUpperString str = [ toUpper c | c <- str ]

toLowerString :: String -> String
toLowerString str = [ toLower c | c <- str ]

isVowel :: Char -> Bool
isVowel c = (toLower c) `elem` "aeiou" -- ['a', 'e'...]

dropVowels :: String -> String
dropVowels str = [ c | c <- str, not (isVowel c) ]

toIntegerList :: [Int] -> [Integer]
toIntegerList ls = [ fromIntegral x | x <- ls ]

fact :: Int -> Integer
fact 0 = 1
fact n = fromIntegral n * fact (n-1)

fib :: Int -> Integer
fib 0 = 1
fib 1 = 1
fib a = fib (a-1) + fib (a-2)

pow :: Int -> Int -> Int
pow n 0 = 1
pow n k = n * pow n (k-1)

range :: Int -> Int -> [Int]
range x y
  | x == y = [x]
  | x < y  = x : range (x+1) y
  | x > y  = x : range (x-1) y

length' :: [a] -> Int
length' []     = 0
length' (x:xs) = 1 + length' xs

minimum' :: [Int] -> Int
minimum' [x]    = x
minimum' (x:xs) = min x (minimum' xs)


minimum'' :: [Int] -> Int
minimum'' [x]    = x
minimum'' (x:xs)
 | x < ret   = x
 | otherwise = ret
 where
  ret = minimum'' xs

