module Lesson7 where

import Prelude hiding (sum, last, init, (++), zip)


-- Definiáljuk újra a sum függvényt, amely összegez egy számlistát!
sum :: Num a => [a] -> a
sum []     = 0
sum (x:xs) = x + sum xs


-- Definiáljuk újra a last függvényt, amely visszaadja egy lista utolsó elemét!
last :: [a]{-nemüres-} -> a
last [x]    = x
last (_:xs) = last xs


-- Definiáljuk újra az init függvényt, amely egy lista összes elemét visszaadja, az utolsót kivéve!
init :: [a]{-nemüres-} -> [a]
init [_]    = []
init (x:xs) = x : init xs


-- Definiáljuk újra a minimum függvényt, amely több elem minimumát adja vissza! Használjuk a min függvényt: ez két elem minimumát adja vissza.
minimum1 :: Ord a => [a]{-véges, nemüres-} -> a
minimum1 [x] = x
minimum1 (x:xs)
  | x < xsMin = x
  | otherwise = xsMin 
  where
    xsMin = minimum1 xs

minimum2 :: Ord a => [a]{-véges, nemüres-} -> a
minimum2 [x] = x
minimum2 (x:xs) = min x (minimum2 xs)

minimum3 :: Ord a => [a]{-véges, nemüres-} -> a
minimum3 (x:xs) = foldl min x xs

minimum4 :: Ord a => [a]{-véges, nemüres-} -> a
minimum4 = foldl1 min


-- Definiáljuk újra a concat függvényt, amely sok listát fűz össze!
concat1 :: [[a]] -> [a]
concat1 []     = []
concat1 (x:xs) = x ++ concat1 xs

concat2 :: [[a]] -> [a]
concat2 = foldl (++) []


-- Definiáljuk újra a (++) operátort, amely két listát fűz össze!
(++) :: [a] -> [a] -> [a]
[]     ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)


-- Definiáljuk az összefésülést! Az eredmény lista elemei a bemenő listák váltogatott elemei lesznek.
merge :: [a] -> [a] -> [a]
merge []     ys     = ys
merge xs     []     = xs
merge (x:xs) (y:ys) = x : y : merge xs ys


-- Definiáljuk újra az elemenkénti párosítást!
zip :: [a] -> [b] -> [(a,b)]
zip (x:xs) (y:ys) = (x,y) : zip xs ys
zip _      _      = []


-- Definiáljuk újra a Data.List modulbeli isPrefixOf függvényt, amely megállapítja, hogy az egyik szöveg kiegészítése-e a másik!
isPrefixOf1 :: Eq a => [a] -> [a] -> Bool
isPrefixOf1 []      _     = True
isPrefixOf1 _      []     = False
isPrefixOf1 (x:xs) (y:ys) = x == y && isPrefixOf1 xs ys

isPrefixOf2 :: Eq a => [a] -> [a] -> Bool
isPrefixOf2 [] _ = True
isPrefixOf2 _ [] = False
isPrefixOf2 (x:xs) (y:ys) 
  | x == y    = isPrefixOf2 xs ys
  | otherwise = False


-- Definiáljuk újra az elem függvényt, amely megállapítja, hogy egy érték szerepel-e egy listában!
elem1 :: Eq a => a -> [a]{-véges-} -> Bool
elem1 _ [] = False
elem1 e (x:xs) = e == x || e `elem1` xs

elem2 :: Eq a => a -> [a]{-véges-} -> Bool
elem2 _ [] = False
elem2 e (x:xs)
  | e == x    = True
  | otherwise = e `elem2` xs

elem3 :: Eq a => a -> [a]{-véges-} -> Bool
elem3 e ls = not (null [x | x <- ls, x == e])
