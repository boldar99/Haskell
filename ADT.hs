module ADT where

import RandomStudentGenerator

-- data Bool = True | False
data Logikai = Igaz | Hamis
  deriving (Eq, Show)

not' :: Bool -> Bool
not' True = False
not' False = True

-- not
nem :: Logikai -> Logikai
nem Igaz = Hamis
nem Hamis = Igaz

-- otherwise = True
máskülönben :: Logikai
máskülönben = Igaz

-- (&&)
és :: Logikai -> Logikai -> Logikai
és Igaz Igaz = Igaz
és _ _ = Hamis

-- (||)
vagy :: Logikai -> Logikai -> Logikai
vagy Hamis Hamis = Hamis
vagy _ _ = Igaz

-- (==)
egyenlő :: Eq a => a -> a -> Logikai
egyenlő a b = if a == b then Igaz else Hamis

-- and
listaÉs :: [Logikai] -> Logikai
listaÉs [] = Igaz
listaÉs (Igaz:at) = listaÉs at
listaÉs _ = Hamis

-- any
bármelyik :: (a -> Logikai) -> [a] -> Logikai
bármelyik _ [] = Hamis
bármelyik f (x:xs) = f x `vagy` bármelyik f xs

-- takeWhile
veddElAmíg :: (a -> Logikai) -> [a] -> [a]
veddElAmíg _ [] = []
veddElAmíg f (x:xs)
 |f x==Igaz = x:veddElAmíg f xs 
 |otherwise = []

truthTable :: [(Logikai -> Logikai -> Logikai)] -> [[Logikai]]
truthTable fs = p : q : [zipWith f p q | f <- fs]
 where
   p = [Igaz,Igaz,Hamis,Hamis]
   q = [Igaz,Hamis,Igaz,Hamis]

--------------------------------------------------------------------------------

-- data Maybe a = Just a | Nothing
data Talán a = Csak a | Semmi
  deriving (Eq, Show)

-- lookup
kikeres :: Eq a => a -> [(a, b)] -> Talán b
kikeres _ [] = Semmi
kikeres k ((key,value):xs)
 | k == key  = Csak value
 | otherwise = kikeres k xs

-- find
keres :: (a -> Logikai) -> [a] -> Talán a
keres _ [] = Semmi
keres pred (x:xs)
 | pred x == Igaz = Csak x
 | otherwise      = keres pred xs

--------------------------------------------------------------------------------

maybeSqrt :: (Ord a, Floating a) => a -> Maybe a
maybeSqrt a 
  | a >= 0    = Just $ sqrt a
  | otherwise = Nothing

natApply :: (Int -> Int -> Int) -> Int -> Int -> Maybe Int
natApply f a b
 | f a b < 0 = Nothing
 | otherwise = Just (f a b)

len [] = 0
len (_:xs) = 1 + len xs

safeLength :: Int -> [a] -> Maybe Int
safeLength _ [] = Just 0
safeLength 0 _ = Nothing
safeLength a (x:xs) = maybeAdd 1 (safeLength (a-1) xs)
-- safeLength a (x:xs) = fmap (+1) (safeLength (a-1) xs)

maybeAdd :: Int -> Maybe Int -> Maybe Int
maybeAdd n (Just m) = Just $ n + m 
maybeAdd _ Nothing  = Nothing

--------------------------------------------------------------------------------

data USTime = AM Int Int | PM Int Int
  deriving (Eq)

instance Show USTime where
 show (AM h m) = format h m ++ " a.m."
 show (PM h m) = format h m ++ " p.m."

format h m = doubleDigit h ++ ':' : doubleDigit m

doubleDigit n
 | n < 10  = '0' : show n
 | n >= 10 = show n

instance Ord USTime where
  compare (AM _ _) (PM _ _) = LT
  compare (PM _ _) (AM _ _) = GT
  compare (AM h1 m1) (AM h2 m2) = compare (h1, m1) (h2, m2)
  compare (PM h1 m1) (PM h2 m2) = compare (h1, m1) (h2, m2)

isValid :: USTime -> Bool
isValid t = undefined

add :: USTime -> USTime -> USTime
add a b = undefined

earliest :: [USTime] -> USTime 
earliest = undefined



-- Akkor fog átmenni az összes teszten, ha a test változó True lesz
test :: Bool
test = and [showTest, compareTest, isValidTest, addTest, earliestTest]

-- Mindegyik fügvényünk helyességét tesztelhetjük a hozzá tartoz Test konstans kiértékelésével.
showTest     = and [show (AM 12 12) == "12:12 a.m.", show (PM 1 30) == "01:30 p.m.", 
                    show (AM 5 9) == "05:09 a.m."]
compareTest  = and [compare (AM 12 12) (AM 12 12) == EQ, compare (AM 12 10) (AM 12 12) == LT, 
                    compare (PM 10 0) (AM 10 0) == GT]
isValidTest  = and [isValid (AM 10 12), isValid (AM 12 59), not $ isValid (AM 13 00), 
                    not $ isValid (PM 00 00), not $ isValid (PM 04 60)]
addTest      = and [add (AM 5 0) (AM 5 0) == (AM 10 0), add (AM 12 59) (AM 0 1) == (PM 1 0), 
                    add (AM 5 0) (PM 1 0) == (PM 6 0), add (PM 1 0) (AM 1 0) == (PM 2 0), 
                    add (PM 1 0) (PM 1 0) == (AM 2 0)]
earliestTest = and [earliest [AM 5 0, AM 5 0, AM 10 0] == AM 5 0, 
                    earliest [PM h m | h <- [1..12], m <- [0..59]] == PM 1 0]
