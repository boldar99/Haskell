module Lesson4 where

-- infrastruktúra
--------------------------------------------------------------------------------
-- ghci parancsok, ghc, holes

-- ghci parancsok:
--   :load file         ~ :l file         -- betöltés
--   :reload            ~ :r              -- újratöltés
--   :browse            ~ :bro            -- listázza a jelenleg betöltött definíciókat
--   :type kifejezés    ~ :t kifejezés    -- kifejezés típusa
--   :info definíciónév ~ :i definíciónév -- "információ" névről  (név: érték definíció, típusnév, osztály, operátor(!))

-- példa: operátor precedenciáját lekérdezni :i-vel:
-- > :i (+)

num :: Int
num = 1000


-- feladatok
--------------------------------------------------------------------------------



----------------------------------
-- Mintaillesztés alaptípusokon --
----------------------------------


-- Definiáljunk egy függvényt, ami egy számot megnövel 1-el.
inc :: Int -> Int
inc = undefined


-- Definiáljuk a faktoriális függvényt a rekurzív formula alapján:
--   0! = 1
--   n! = n * (n - 1)!
factorial :: Integer -> Integer
factorial = undefined


-- 0-tól 5-ig visszaadja a számot betűkkel leírva. Máskülönben vlmi szöveget.
sayMe :: Int -> String
sayMe = undefined


-- Definiáljunk a függvényt, ami néhány karakterhez visszaadja a kódszavát.
-- https://en.wikipedia.org/wiki/NATO_phonetic_alphabet
charName :: Char -> String
charName = undefined


-- Definiáljuk a tagadás függvényt, ami a logikai értékek ellentétét adja vissza.
not' :: Bool -> Bool
not' = undefined


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
swap = undefined


-- Definiáljuk a három hosszú tuple-ra az alábbi függvényeket. (első, második, harmadik komponense a tuple-nek)
-- Az alsóbb függvényekhez adjunk típusdeklarációt is.
fst3 :: (a, b, c) -> a
fst3 = undefined

snd3 = undefined

trd3 = undefined


-- Tükrözzünk egy pontot az x tengelyre!
mirrorX :: Floating t => (t, t) -> (t, t)
mirrorX = undefined


-- Számoljuk ki két pont távolságát!
-- Írjunk típusdeklarációt is!
distance = undefined



--------------------------
-- lista mintaillesztés --
--------------------------


-- Döntsük el, hogy egy lista üres-e?
null' :: [a] -> Bool
null' = undefined


-- Döntsük el, hogy egy lista egyelemű-e?
-- Írjunk típusdeklarációt is!
isSingleton = undefined


-- Adjuk vissza egy lista első elemét!
head' :: [a] -> a
head' = undefined


-- Egy tetszőleges szót alakítsunk át úgy, hogy nagybetűvel kezdődjön!
-- A megoldásban használjuk a Data.Char modul toUpper függvényét!
toUpperFirst :: String -> String
toUpperFirst = undefined


-- Egy tetszőleges szöveg minden szavát alakítsuk át nagybetűvel kezdődőre! 
-- A megoldásban használjuk a words és az unwords függvényeket!
toUpperFirsts :: String -> String
toUpperFirsts = undefined


-- Írjunk infókat 0, 1, 2 és 2+ hosszú listákról. Írjuk ki a szövegbe - ha lehetséges - az első két elemét a listának, és hogy milyen hosszú.
tell :: (Show a) => [a] -> String  
tell = undefined


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
