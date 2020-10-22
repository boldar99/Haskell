module Lesson7 where

import Prelude hiding (sum, last, init, (++))


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
