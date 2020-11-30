module Lesson12 where

data Logikai = Igaz | Hamis
  deriving (Eq, Show)


nem :: Logikai -> Logikai
-- Tesztek:
nem Igaz = Hamis
nem Hamis = Igaz


máskülönben :: Logikai
máskülönben = Igaz


-- (&&)
és :: Logikai -> Logikai -> Logikai
Igaz `és` Igaz = Igaz
_ `és` _       = Hamis


-- (||)
vagy :: Logikai -> Logikai -> Logikai
Igaz `vagy` _ = Igaz
_ `vagy` Igaz = Igaz
_ `vagy` _    = Hamis


-- (==)
egyenlő :: Eq a => a -> a -> Logikai
egyenlő a b
 | a == b    = Igaz
 | otherwise = Hamis


-- and
listaÉs :: [Logikai] -> Logikai
listaÉs (Igaz:xs) = listaÉs xs
listaÉs (_:xs)    = Hamis
listaÉs []        = Igaz

-- listaÉs [] = Igaz
-- listaÉs (x:xs) = x `és` listaÉs xs

-- listaÉs (x:xs)
--  | x == Igaz = listaÉs xs
--  | otherwise = Hamis
-- listaÉs [] = Igaz


listaVagy [] = Hamis
listaVagy (x:xs) = x `vagy` listaVagy xs


-- any
bármelyik :: (a -> Logikai) -> [a] -> Logikai
bármelyik p ls = listaVagy $ map p ls 
-- bármelyik p = foldr (vagy . p) Hamis


maybeSqrt :: (Floating a, Ord a) => a -> Maybe a
maybeSqrt x
 | x < 0     = Nothing
 | otherwise = Just (sqrt x)


-- safeLength :: Int -> [a] -> Maybe Int
-- safeLength _ [] = Just 0
-- safeLength 0 _ = Nothing
-- safeLength n (_:xs) = incJust $ safeLength (n - 1) xs
--  where
--   incJust Nothing = Nothing
--   incJust (Just n) = Just (n + 1)

safeLength :: Int -> [a] -> Maybe Int
safeLength _ [] = Just 0
safeLength 0 _  = Nothing
safeLength n (_:xs) =
  case safeLength (n - 1) xs of
    Nothing -> Nothing
    Just n  -> Just (n + 1)


data Orientation = 
    North Int Int |
    South Int Int |
    East Int Int |
    West Int Int
    deriving (Show, Eq, Ord)

data USTime = AM Int Int | PM Int Int deriving (Eq)

instance Show USTime where
  show (AM h m) = format h m ++ " a.m."
  show (PM h m) = format h m ++ " p.m."

format h m = doubleDigit h ++ ":" ++ doubleDigit m
doubleDigit n
 | n < 9 = '0' : show n
 | True = show n

instance Ord USTime where
  compare (AM h1 m1) (AM h2 m2) = (h1, m1) `compare` (h2, m2)
  compare (PM h1 m1) (PM h2 m2) = (h1, m1) `compare` (h2, m2)
  compare (AM 12 10) (PM 12 12) = LT
  compare (PM 10 0) (AM 10 0)   = GT

earliest :: [USTime] -> USTime 
earliest = minimum
