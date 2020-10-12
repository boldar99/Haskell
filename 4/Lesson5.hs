module Lesson5 where

import Data.Char (toUpper)



--------------
-- Ismétlés --
--------------


foo x = undefined

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
toUpperFirsts :: String -> String
-- toUpperFirsts str = unwords [toUpperFirst ((words str) !! i) | i <- [0..length (words str)-1]]
toUpperFirsts str = unwords [toUpperFirst w | w <- words str]


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
goo ((a,b):(c,d):_) = a+b+c+d
-- goo t = sum [a + b | (a,b) <- take 2 t]
goo t = f list2
    where
        list2 = take 2 t
        f [(a,b),(c,d)] = a+b+c+d



----------------
-- as-pattern --
----------------


-- Adjunk vissza, hogy egy szövegnek mi az első betűje?
-- Figyeljünk az szélsőséges esetekre, és ne használjuk az `=` után a head vagy a (:) függvényt!  
-- Példa: 
--  capital "CAT" == "The first letter of CAT is C"
capital :: String -> String
capital str@(c:_) = "The first letter of " ++ str ++ " is " ++ [c]



---------------------------
-- Guards / Őrfeltételek --
---------------------------


-- Adjuk meg egy szám abszolútértékét!
abs' :: (Real a) => a -> a
abs' n
    | n <  0 = -n
    | n >= 0 = n


-- Mondjunk dolgokat bmi alapján (18.5, 25.0, 30.0)!
{-
bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi
    | bmi < 18.5 = "You are skinny"
    | bmi < 25.0 = "Your weight seems to be normal"
    | bmi < 30.0 = "You have a lil extra"
    | otherwise  = "You are overweight"
-}


-- Írjuk át az előbbi függvényt úgy, hogy mi számoljuk ki a bmi-t (weight / height ^ 2).


-- bmiTell :: (RealFloat a) => a -> a -> String  
-- bmiTell weight height
--     | weight / height ^ 2 < 18.5 = "You are skinny"
--     | weight / height ^ 2 < 25.0 = "Your weight seems to be normal"
--     | weight / height ^ 2 < 30.0 = "You have a lil extra"
--     | otherwise                  = "You are overweight"



-----------
-- where --
-----------


bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height
    | bmi < skinnyWeight  = "You are skinny" 
    | bmi < normalWeight  = "Your weight seems to be normal"
    | bmi < lilOverWeight = "You have a lil extra"
    | otherwise           = "You are overweight"
    where
        bmi = weight / height ^ 2
        skinnyWeight = 18.5
        normalWeight = 25
        lilOverWeight = 30


-- Írjuk át az előbbi függvényt úgy, hogy where-t használunk.


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
everyFifth :: [a] -> [a]
everyFifth ls = [x | (0,x) <- zip [i `mod` 5 | i <- [0..]] ls]
-- everyFifth ls = [x | (i,x) <- zip [0..] ls, i `mod` 5 == 0]
-- Használhatjuk a zip függvényt.


safeDiv :: Int -> Int -> Maybe Int
safeDiv 0 0 = Nothing
safeDiv a b = Just (a `div` b)


getJusts :: [Maybe a] -> [a]
getJusts ls = [x | Just x <- ls]


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
