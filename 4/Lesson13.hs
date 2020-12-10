{-# LANGUAGE ParallelListComp #-}

module Lesson13 where

import Data.Char
import Data.List


sortTuple :: Ord a => (a, a) -> (a, a)
sortTuple (a, b)
  | a <= b    = (a, b)
  | otherwise = (b, a)


caseSwap :: Char -> Char
caseSwap c
  | isLower c = toUpper c
  | isUpper c = toLower c
  | otherwise = c


count :: Eq a => a -> [a] -> Int
count e ls = length $ [x | x <- ls, e == x]

-- count e ls = length $ filter (== e) ls

-- count e = length . filter (== e)

-- count e = foldl' (\acc x -> acc + fromEnum (x == e)) 0


listMul :: [Int] -> [Int] -> Int
listMul xs ys = sum [x * y | (x, y) <- zip xs ys]

-- listMul xs ys = sum [x * y | x <- xs | y <- ys]

-- listMul xs ys = sum $ zipWith (*) xs ys

-- listMul xs = sum . zipWith (*) xs

-- listMul = (.) sum . zipWith (*)


sameSign :: [Int] -> Bool
sameSign ls = all (<= 0) ls || all (>= 0) ls


isCorrect :: [(Int, Int)] -> Bool
isCorrect ((_,a):xs@((b,_):_)) = a == b && isCorrect xs
isCorrect _ = True

-- isCorrect as@(_:bs) = and $ zipWith (\(_, a) (b, _) -> a == b) as bs
-- isCorrect _ = True

-- isCorrect ((_, x):xs) = snd $ foldl (\(p, c) (a, b) -> (b, a == p && c)) (x, True) xs
-- isCorrect [] = True


filterMany :: [a -> Bool] -> [a] -> [a]
filterMany (p:ps) ls = filterMany ps $ filter p ls
filterMany [] ls = ls

-- filterMany ps ls = filter (\x -> all ($ x) ps) ls

-- filterMany ps ls = foldl (flip filter) ls ps


conditionalMax :: Ord a => (a -> Bool) -> [a] -> Maybe a
conditionalMax p ls
  | any p ls  = Just $ maximum $ filter p ls
  | otherwise = Nothing

-- conditionalMax p ls 
--   | null fls  = Nothing
--   | otherwise = Just $ maximum fls
--   where 
--     fls = filter p ls

-- conditionalMax p (x:xs)
--   | p x       = max (Just x) $ conditionalMax p xs
--   | otherwise = conditionalMax p xs
-- conditionalMax _ [] = Nothing


data Season = Winter | Spring | Summer | Autumn
  deriving (Eq, Show, Enum)


nextSeason :: Season ->  Season
nextSeason Autumn = Winter
nextSeason c = succ c

-- nextSeason Winter = Spring
-- nextSeason Spring = Summer
-- nextSeason Summer = Autumn
-- nextSeason Autumn = Winter


seasonAfterMonths :: Int -> Season
seasonAfterMonths n = [Winter, Spring, Summer, Autumn] !! ([0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 0] !! (n `mod` 12))


removeSpecial :: String -> String
removeSpecial = filter (\c -> isAlphaNum c || isSpace c)


isSublist :: Eq a => [a] -> [a] -> Bool
isSublist sub ls@(_:xs) = sub `isPrefixOf` ls || sub `isSublist` xs
isSublist _ _ = False


multipleElems :: Eq a => [a] -> [a]
multipleElems ls = filter (\x -> count x ls > 1) $ nub ls


maxTempChange :: [(Int, Int)] -> Int
maxTempChange ls = snd $ maximum $ zip (map (\(a, b) -> b - a) ls) [1..]


primeIndex :: [a] -> [a]
primeIndex ls = [ls !! (p - 1) | p <- primesTo $ length ls]
  where
    primesTo m = sieve [2..m]
      where
        sieve (x:xs) = x : sieve (xs \\ [x,x+x..m])
        sieve [] = []
