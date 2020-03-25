module Lesson5 where

sum :: Num a => [a] -> a
sum = undefined

last :: [a] -> a
last = undefined

init :: [a] -> [a]
init = undefined

minimum :: Ord a => [a] -> a
minimum = undefined

concat :: [[a]] -> [a]
concat = undefined

(++) :: [a] -> [a] -> [a]
(++) = undefined

merge :: [a] -> [a] -> [a]
merge = undefined

zip :: [a] -> [b] -> [(a,b)]
zip = undefined

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf = undefined

elem :: Eq a => a -> [a] -> Bool
elem = undefined

-- Egyik házi lesz
nub :: Eq a => [a] -> [a]
nub = undefined