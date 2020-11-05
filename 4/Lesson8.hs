module Lesson8 where

elem :: Eq a => a -> [a]{-véges-} -> Bool
elem _ [] = False
elem a (x:xs)
 | a == x    = True
 | otherwise = False


nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) = x : nub [a | a <- xs, a /= x]


runs :: Int -> [a] -> [[a]]
runs _ [] = []
runs n ls = take n ls : runs n (drop n ls)


qsort :: Ord a => [a] -> [a]
qsort (x:xs) = qsort smaller ++ [x] ++ qsort bigger
 where
  smaller = [a | a <- xs, a <= x]
  bigger  = [a | a <- xs, a > x]


drop :: Int -> [a] -> [a]
drop _ [] = []
drop n ls@(_:xs)
 | n <= 0    = ls
 | otherwise = drop (n - 1) xs
