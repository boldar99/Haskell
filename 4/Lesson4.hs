module Lesson4 where

import Data.Char (toUpper)

-- infrastruktúra
--------------------------------------------------------------------------------
-- ghci parancsok, ghc, holes

-- ghci parancsok:
--   :load file         ~ :l file         -- betöltés
--   :reload            ~ :r              -- újratöltés
--   :browse            ~ :bro            -- listázza a jelenleg betöltött definíciókat
--   :type kifejezés    ~ :t kifejezés    -- kifejezés típusa
--   :info definíciónév ~ :i definíciónév -- "információ" névről  (név: érték definíció, típusnév, osztály, operátor(!))
--   :quit              ~ :q              -- Kilépés a ghci-ből

-- példa: operátor precedenciáját lekérdezni :i-vel:
-- > :i (+)

num :: Int
num = 1010


-- feladatok
--------------------------------------------------------------------------------



----------------------------------
-- Mintaillesztés alaptípusokon --
----------------------------------


-- Definiáljunk egy függvényt, ami egy számot megnövel 1-el.
inc :: Int -> Int
inc n = n + 1


-- Definiáljuk a faktoriális függvényt a rekurzív formula alapján:
--   0! = 1
--   n! = n * (n - 1)!
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)


-- 0-tól 5-ig visszaadja a számot betűkkel leírva. Máskülönben vlmi szöveget.
sayMe :: Int -> String
sayMe 0 = "null"
sayMe 1 = "one"
sayMe 2 = "two"
sayMe 3 = "three"
sayMe 4 = "four"
sayMe 5 = "five"
sayMe _ = "Sorry, this number is not between 0 and 5"


-- Definiáljunk a függvényt, ami néhány karakterhez visszaadja a kódszavát.
-- https://en.wikipedia.org/wiki/NATO_phonetic_alphabet
charName :: Char -> String
charName 'a' = "Alfa"
charName 'w' = "Whiskey"
charName  _  = "Sorry, I don't know..."


-- Definiáljuk a tagadás függvényt, ami a logikai értékek ellentétét adja vissza.
not' :: Bool -> Bool
not' True = False
not' False = True


----------------------
-- Ellenörző kérdés --
----------------------
-- foo 10 = "Alma"
-- foo 100 = "Körte"
-- foo n = "Ajjaj"
-- foo 1 = "Cica"



--------------------------
-- tuple mintaillesztés --
--------------------------


-- Egy tuple két elemének megcserélése.
swap :: (a, b) -> (b, a)
swap (a,b) = (b,a)


-- Definiáljuk a három hosszú tuple-ra az alábbi függvényeket. (első, második, harmadik komponense a tuple-nek)
-- Az alsóbb függvényekhez adjunk típusdeklarációt is.
fst3 :: (a, b, c) -> a
fst3 (a,_,_) = a

snd3 :: (a, b, c) -> b
snd3 (_,b,_) = b

trd3 :: (a, b, c) -> c
trd3 (_,_,c) = c


-- Tükrözzünk egy pontot az x tengelyre!
mirrorX :: Floating t => (t, t) -> (t, t)
mirrorX (x,y) = (x,-y)


-- Számoljuk ki két pont távolságát!
-- Írjunk típusdeklarációt is!
distance :: Floating t => (t, t) -> (t, t) -> t
distance (a,b) (c,d) = sqrt ((a-c)^2 + (b-d)^2)



--------------------------
-- lista mintaillesztés --
--------------------------


-- Döntsük el, hogy egy lista üres-e?
null' :: [a] -> Bool
null' [] = True
null' _  = False


-- Döntsük el, hogy egy lista egyelemű-e?
-- Írjunk típusdeklarációt is!
isSingleton :: [a] -> Bool
isSingleton [_] = True
isSingleton  _  = False


-- Adjuk vissza egy lista első elemét!
head' :: [a] -> a
head' (x:_) = x


-- Egy tetszőleges szót alakítsunk át úgy, hogy nagybetűvel kezdődjön!
-- A megoldásban használjuk a Data.Char modul toUpper függvényét!
toUpperFirst :: String -> String
toUpperFirst (x:xs) = toUpper x : xs


-- Egy tetszőleges szöveg minden szavát alakítsuk át nagybetűvel kezdődőre! 
-- A megoldásban használjuk a words és az unwords függvényeket!
toUpperFirsts :: String -> String
toUpperFirsts = undefined


-- Írjunk infókat 0, 1, 2 és 2+ hosszú listákról. Írjuk ki a szövegbe - ha lehetséges - az első két elemét a listának, és hogy milyen hosszú.
tell :: [Int] -> String  
tell [] = "This list is empty"
tell [x] = "This list has one element: " ++ show x
tell [x,y] = "This list has two elements: " ++ show x ++ ", " ++ show y
tell (x1:x2:_) = "This list is too long. Its first two elemnts are: " ++ show x1 ++ ", " ++ show x2

-- [nehéz] Adjuk meg milyen hosszú egy lista!
length' :: (Num b) => [a] -> b  
length' = undefined
-- Tipp: Egy üres lista hossza 0, és egy lista tail-jének a hossza egyel kisebb, mint az eredeti lista hossza.


-- [nehéz] Adjuk össze egy lista összes elemét. A logika ugyanaz, mint az előző feladatnál.
-- [nehéz] Adjuk meg a legáltalánosabb típusdeklarációt is!
sum' = undefined


-----------------------
-- Ellenőrző feladat --
-----------------------
-- Írjuk meg az `goo` függvényt, mely egy minimum két elemű, Int párok listájának az első két pár összes elemét összeadja.
-- Példa:
--  goo [(1, 1), (1, 1)] == 4
--  goo [(1, 2), (3, 4), (5, 6)] == 10
--  goo [(0, 10), (-10, 0), (9999, 1)] == 0
goo :: [(Int, Int)] -> Int
goo = undefined



----------------
-- as-pattern --
----------------


-- Adjunk vissza, hogy egy szövegnek mi az első betűje?
-- Figyeljünk az szélsőséges esetekre, és ne használjuk az `=` után a head vagy a (:) függvényt!  
-- Példa: 
--  capital "CAT" == "The first letter of CAT is C"
capital :: String -> String
capital = undefined



---------------------------
-- Guards / Őrfeltételek --
---------------------------


-- Adjuk meg egy szám abszolútértékét!
abs' :: Num a => a -> a
abs' = undefined


-- Mondjunk dolgokat bmi alapján (18.5, 25.0, 30.0)!
bmiTell :: (RealFloat a) => a -> String  
bmiTell = undefined


add = (>>=)

-- Írjuk át az előbbi függvényt úgy, hogy mi számoljuk ki a bmi-t (weight / height ^ 2).



-----------
-- where --
-----------


-- Írjuk át az előbbi függvényt úgy, hogy where-t használunk.


-- Nézzük át az eddig definiált függvényeinket, és ahol érdemes, írjuk át where-el.



---------------------------------------
-- Mintaillesztés lista generátorban --
---------------------------------------
-- Minták halmazkifejezésekben is alkalmazhatóak. Erre egy intuitív példa:
-- [x | (x,1)<- [('c',2),('d',1),('e',1)]] == "de"


-- Számoljuk meg, hogy egy Bool-ok listájában hány True van!
countTrue :: [Bool] -> Int
countTrue = undefined


-- [nehéz] Vegyük egy lista minden 5. elemét!
everyFifth :: [a] -> [a]
everyFifth = undefined
-- Használhatjuk a zip függvényt.
