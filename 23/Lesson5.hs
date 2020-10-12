module Lesson5 where

import Data.Char (toUpper)
import Data.List (sort)



--------------
-- Ismétlés --
--------------


-- Definiáljunk a függvényt, ami néhány karakterhez visszaadja a kódszavát.
-- https://en.wikipedia.org/wiki/NATO_phonetic_alphabet
charName :: Char -> String
charName 'a' = "Alpha"
charName 'w' = "Whiskey"
charName 'x' = "X-ray"
charName  _  = "Sorry, I don't know"


-- Tükrözzünk egy pontot az x tengelyre!
mirrorX :: Floating t => (t, t) -> (t, t)
mirrorX (x, y) = (x, -y)


-- Írjunk infókat 0, 1, 2 és 2+ hosszú listákról. Írjuk ki a szövegbe - ha lehetséges - az első két elemét a listának, és hogy milyen hosszú.
tell :: (Show a) => [a] -> String  
tell [] = "This is an empty list"
tell [x] = "This list has one element: " ++ show x
tell [x, y] = "This list has two elements: " ++ show x ++ ", " ++ show y
tell (x:y:xs) = "This list is too long. Its first two elements are: " ++ show x ++ ", " ++ show y


-- Egy tetszőleges szót alakítsunk át úgy, hogy nagybetűvel kezdődjön!
-- A megoldásban használjuk a Data.Char modul toUpper függvényét!
toUpperFirst :: String -> String
toUpperFirst (x:xs) = toUpper x : xs


-- Egy tetszőleges szöveg minden szavát alakítsuk át nagybetűvel kezdődőre! 
-- A megoldásban használjuk a words és az unwords függvényeket!
-- toUpperFirsts :: String -> String
toUpperFirsts sentence = unwords [toUpperFirst w | w <- words sentence]
-- lines, unlines ~ sorokra


-- [nehéz] Adjuk meg milyen hosszú egy lista!
length' :: (Num b) => [a] -> b  
length' []     = 0
length' (_:xs) = 1 + length' xs
-- Tipp: Egy üres lista hossza 0, és egy lista tail-jének a hossza egyel kisebb, mint az eredeti lista hossza.


-----------------------
-- Ellenőrző feladat --
-----------------------
-- Írjuk meg az `goo` függvényt, mely egy minimum két elemű, Int párok listájának az első két pár összes elemét összeadja.
-- Példa:
--  goo [(1, 1), (1, 1)] == 4
--  goo [(1, 2), (3, 4), (5, 6)] == 10
--  goo [(0, 10), (-10, 0), (9999, 1)] == 0
goo :: [(Int, Int)] -> Int
goo ((x1,x2):(y1,y2):_) = x1 + x2 + y2 + y1



----------------
-- as-pattern --
----------------


-- Adjunk vissza, hogy egy szövegnek mi az első betűje?
-- Figyeljünk az szélsőséges esetekre, és ne használjuk az `=` után a head vagy a (:) függvényt!  
-- Példa: 
--  capital "CAT" == "The first letter of CAT is C"
capital :: String -> String
capital str@(x:_) = "The first letter of " ++ str ++ " is " ++ [x]



---------------------------
-- Guards / Őrfeltételek --
---------------------------


-- Adjuk meg egy szám abszolútértékét!
abs' :: (Num a, Ord a) => a -> a
abs' n
    | n < 0  = -n
    | n >= 0 = n


-- Mondjunk dolgokat bmi alapján (18.5, 25.0, 30.0)!
-- bmiTell :: (RealFloat a) => a -> String  
-- bmiTell bmi
--     | bmi < 18.5 = "Sovány vagy!"
--     | bmi < 25.0 = "Normális testsúlyod van!"
--     | bmi < 30.0 = "Enyhén túlsúlyos vagy!"
--     | otherwise  = "Túlsúlyos vagy!"


-- Írjuk át az előbbi függvényt úgy, hogy mi számoljuk ki a bmi-t (weight / height ^ 2).
{-
bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height
    | (weight / height ^ 2) < 18.5 = "Sovány vagy!"
    | (weight / height ^ 2) < 25.0 = "Normális testsúlyod van!"
    | (weight / height ^ 2) < 30.0 = "Enyhén túlsúlyos vagy!"
    | otherwise                    = "Túlsúlyos vagy!"
-}



-----------
-- where --
-----------


-- Írjuk át az előbbi függvényt úgy, hogy where-t használunk.
bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height
    | bmi < thinBmi       = "Sovány vagy!"
    | bmi < normalBmi     = "Normális testsúlyod van!"
    | bmi < overWeightBmi = "Enyhén túlsúlyos vagy!"
    | otherwise           = "Túlsúlyos vagy!"
    where
        bmi           = weight / height ^ 2
        thinBmi       = 18.5
        normalBmi     = 25
        overWeightBmi = 30


-- Nézzük át az eddig definiált függvényeinket, és ahol érdemes, írjuk át where-el.



---------------------------------------
-- Mintaillesztés lista generátorban --
---------------------------------------
-- Minták halmazkifejezésekben is alkalmazhatóak. Erre egy intuitív példa:
-- [x | (x,1) <- [('c',2),('d',1),('e',1)]] == "de"


-- Számoljuk meg, hogy egy Bool-ok listájában hány True van!
countTrue :: [Bool] -> Int
countTrue ls = length [True | True <- ls]


-- [nehéz] Vegyük egy lista minden 5. elemét!
-- everyFifth :: [a] -> [a]
everyFifth ls = [a | (a, 1) <- zip ls [i `mod` 5| i <- [1..]]]
-- Használhatjuk a zip függvényt.



--------------------------------------------
-- Ismétlő feladatok az eddigi anyagokhoz --
--------------------------------------------



-- 2. Óra
{-
    - Egyszerű aritmetikai műveletek
        - (+), (-), (*), (/), div, mod, (^), (**), abs, sqrt
    - Precendencia
    - Listák
        - "pont-pont" kifejezések ~ pl.: [0,2..10]
        - sum, product, len, (!!), (++)
-}


-- Definiálj egy függvényt, mely kiszámolja egy téglalap területét két oldalának hosszából!
{-
area 6 10 == 60
-}
area :: Int -> Int -> Int
area h w = h * w
-- area = (*)


-- Definiálj egy függvényt, mely megvizsgálja, hogy egy egész szám oszt-e egy másikat?
{-
divides 2 4
not (divides 4 2)
-}
divides :: Int -> Int -> Bool
divides a b = b `mod` a == 0


-- Definiálj egy függvényt, mely megmondja három egész számról, hogy azok pitagoraszi számhármasok-e?
{-
pythagoreanTriple 3 4 5
pythagoreanTriple 5 3 4
not (pythagoreanTriple 2 3 4)
-}

pythagoreanTriple :: Int -> Int -> Int -> Bool
pythagoreanTriple x y z = a^2 + b^2 == c^2
    where
        [a,b,c] = sort [x, y, z]


-- Hogyan zárójelezi a Haskell az alábbi kifejezést?
-- 1 + 1 + 1 * 2 ^ 3 ^ 4 == 10 || 4 > 2 || False && True && False

-- 1 + 1 + 1 * (2 ^ (3 ^ 4)) == 10 || 4 > 2 || False && True && False
-- 1 + 1 + (1 * (2 ^ (3 ^ 4))) == 10 || 4 > 2 || False && True && False
-- ((1 + 1) + (1 * (2 ^ (3 ^ 4)))) == 10 || 4 > 2 || False && True && False
-- (((1 + 1) + (1 * (2 ^ (3 ^ 4)))) == 10) || (4 > 2) || False && True && False
-- (((1 + 1) + (1 * (2 ^ (3 ^ 4)))) == 10) || (4 > 2) || (False && (True && False))
-- ((((1 + 1) + (1 * (2 ^ (3 ^ 4)))) == 10) || ((4 > 2) || (False && (True && False))))
