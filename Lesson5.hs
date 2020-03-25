module Lesson5 where

import Prelude hiding 
    (sum, last, init, minimum, concat, (++), merge, zip, isPrefixOf, elem, nub)

sum :: Num a => [a] -> a
sum []     = 0
sum (x:xs) = x + sum xs

last :: [a] -> a
last [x]    = x
last (x:xs) = last xs
-- Lehet errort dobni nem megfelelő esetben:
last [] = error "empty list"

init :: [a] -> [a]
init [x]    = []
init (x:xs) = x : init xs
-- Lehet errort dobni nem megfelelő esetben:
init [] = error "empty list"

minimum :: Ord a => [a] -> a
minimum [x]    = x
minimum (x:xs) = x `min` minimum xs
--               min x (minimum xs)

concat :: [[a]] -> [a]
concat []     = []
concat (l:ls) = l ++ concat ls
--              (++) l (concat ls)

(++) :: [a] -> [a] -> [a]
[]     ++ ls = ls
(x:xs) ++ ls = x : (xs ++ ls)

merge :: [a] -> [a] -> [a]
merge []     ys     = ys
merge xs     []     = xs
merge (x:xs) (y:ys) = x : y : merge xs ys

zip :: [a] -> [b] -> [(a,b)]
zip = undefined

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] [] = True
isPrefixOf _  [] = False
isPrefixOf [] _  = True
isPrefixOf (x:xs) (y:ys)
   | x == y = isPrefixOf xs ys
   | x /= y = False
-- | otherwise = ..
-- | True = ..

elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem a (x:xs)
  | a == x    = True
  | otherwise = a `elem` xs
-- elem a (x:xs) = a == x || elem a xs
