module Lesson10 where

import Prelude hiding (dropWhile, all, any, elem, zipWith)


dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile p ls@(x:xs)
 | p x       = dropWhile p xs
 | otherwise = ls
dropWhile _ [] = []


all :: (a -> Bool) -> [a]{-véges-} -> Bool
all p ls = and $ map p ls
-- all p ls = null [x | x <- ls, not $ p x]
{-
all p (x:xs)
 | p x = all p xs
 | otherwise = False
all _ [] = True
-}


any :: (a -> Bool) -> [a]{-véges-} -> Bool
any p ls = or $ map p ls
-- any = (.) or . map


elem :: Eq a => a -> [a]{-véges-} -> Bool
elem x ls = any (==x) ls
-- elem = any . (==)


filters :: Eq a => [a] -> [a] -> [a]
filters fs ls = filter (`notElem` fs) ls
-- filters = filter . flip notElem
{-
filters ls (x:xs)
 | x `notElem` ls = x : filters ls xs
 | otherwise      = filters ls xs
filters _ [] = []
-}

zipWith f (a:as) (b:bs) = f a b : zipWith f as bs
zipWith _ _ _ = []

