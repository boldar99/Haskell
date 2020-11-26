module Lesson11 where

import Prelude hiding (foldr, foldl, sum, product, and, or, concat, length)

maximumOfMinimums :: Ord a => [[a]] -> a
maximumOfMinimums = maximum . map minimum

mapMap :: (a -> b) -> [[a]] -> [[b]]
mapMap = map . map

firstLetters :: String -> String
firstLetters = unwords . (map $ take 1) . words

monogram :: String -> String
monogram = unwords . (map $ (++ ".") . take 1) . words


foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f b (x:xs) = x `f` (foldr f b xs)
foldr _ b [] = b

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f b (x:xs) = foldl f (b `f` x) xs
foldl _ b [] = b

sum :: Num a => [a]{-véges-} -> a
sum ls = foldr (+) 0 ls

product :: Num a => [a]{-véges-} -> a
product = foldr (*) 1

and :: [Bool]{-véges-} -> Bool
and = foldr (&&) True

or :: [Bool]{-véges-} -> Bool
or = foldr (||) False

concat :: [[a]] -> [a]
concat = foldr (++) []

length :: [a]{-véges-} -> Int
length = foldl (\s _ -> s + 1) 0

reverse :: [a]{-véges-} -> [a]
reverse = foldl (flip (:)) []
