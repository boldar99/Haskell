module Lesson5 where

import Data.Char (toUpper)



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
toUpperFirsts :: String -> String
toUpperFirsts = undefined


-- [nehéz] Adjuk meg milyen hosszú egy lista!
length' :: (Num b) => [a] -> b  
length' = undefined
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
abs' :: Real a => a -> a
abs' = undefined
-- class (Num a, Ord a) => Real a where
--      ...


-- Mondjunk dolgokat bmi alapján (18.5, 25.0, 30.0)!
bmiTell :: (RealFloat a) => a -> String  
bmiTell = undefined


-- Írjuk át az előbbi függvényt úgy, hogy mi számoljuk ki a bmi-t (weight / height ^ 2).


-- bmiTell :: (RealFloat a) => a -> a -> String



-----------
-- where --
-----------


-- Írjuk át az előbbi függvényt úgy, hogy where-t használunk.
-- bmiTell :: (RealFloat a) => a -> a -> String


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
area = undefined


-- Definiálj egy függvényt, mely megvizsgálja, hogy egy egész szám oszt-e egy másikat?
{-
divides 2 4
not (divides 4 2)
-}
divides :: Int -> Int -> Bool
divides = undefined


-- Definiálj egy függvényt, mely megmondja három egész számról, hogy azok pitagoraszi számhármasok-e?
{-
pythagoreanTriple 3 4 5
pythagoreanTriple 5 3 4
not (pythagoreanTriple 2 3 4)
-}
pythagoreanTriple :: Int -> Int -> Int -> Bool
pythagoreanTriple = undefined


-- Hogyan zárójelezi a Haskell az alábbi kifejezést?
-- 1 + 1 + 1 * 2 ^ 3 ^ 4 == 10 || 4 > 2 || False && True && False


-- Adjuk meg a 100001. elemét annak a számtani sorozatnak, amelynek az első két eleme 13 és 44!
{-
sequenceElement == 3100013
-}
sequenceElement :: Integer
sequenceElement = undefined


-- Soroljuk fel az angol ábécé minden 3. karakterét egy listában
{-
charters == "adgjmpsvy"
-}
charters :: [Char]
charters = undefined


-- Hányféleképpen választhatunk ki n különböző elemből k elemet?
{-
alatt 70 30 == 55347740058143507128
-}
alatt :: Integer -> Integer -> Integer
alatt = undefined


-- Milyen hosszú a saját nevünk. (A space-ket ne számoljuk)
{-
Ha a nevem "Haskell Brooks Curry"
nameLen == 18
-}
nameLen :: Int
nameLen = undefined


-- Egy vezeték és egy kereszt névből készítsünk egy teljes nevet (Angolosan)!
{-
fullName "Curry" "Haskell" == "Haskell Curry"
-}
fullName :: String -> String -> String
fullName = undefined


--  Definiálj egy függvényt, mely egy növekvő majd csökkenő számlistát állít elő!
{-
mountain 3 == [1, 2, 3, 2, 1]
mountain 5 == [1, 2, 3, 4, 5, 4, 3, 2, 1]
-}



-- 3. Óra
{-
    - Listák
        - head, tail, zip, elem, take, concat, null
    - Lista generátorok
    - Típusok
        - Függvények típusa
        - Típusváltozó
        - Típus osztályok
-}


-- Definiáld újra az isLetter függvényt! Elég csak az angol ábécé betűit felismerni.
{-
isLetter 'a'
isLetter 'A'
isLetter 'b'
isLetter 'X'
not (isLetter '?')
-}
isLetter :: Char -> Bool
isLetter = undefined


-- Definiálj egy függvényt, mely előállítja egy szám osztóit!
-- 0 osztója az összes természetes szám.
{-
divisors 10 == [1, 2, 5, 10]
divisors 16 == [1, 2, 4, 8, 16]
divisors 3 == [1, 3]
-}
divisors :: Int -> [Int]
divisors = undefined


-- Sorszámozd meg egy String karaktereinek betűit!
-- Írjunk típusdeklaríciót is!
{-
indexString "alma" == [(1,'a'),(2,'l'),(3,'m'),(4,'a')]
take 8 (indexString "Haskell Brooks Curry") == [(1,'H'),(2,'a'),(3,'s'),(4,'k'),(5,'e'),(6,'l'),(7,'l'),(8,' ')]
-}
indexString = undefined


-- Adjuk meg az első n elemét annak a számtani sorozatnak, amelynek az első két eleme 13 és 44!
-- Írjunk típusdeklaríciót is!
{-
firstN 5 == [13,44,75,106,137]
-}
firstN = undefined


-- Egy vezetéknévből és egy keresztnévek listájából készítsünk egy teljes nevet (Angolosan)!
-- Érdemes bevetni az unwords függvényt!
-- Írjunk típusdeklaríciót is!
{-
fullName2 "Curry" ["Haskell", "Brooks"] == "Haskell Brooks Curry"
-}
fullName2 = undefined


-- Vizsgáld meg, hogy egy lista csak pozitív számokat tartalmaz-e!
-- Érdemes bevetni a null függvényt a hatékonyság miatt.
-- Írjunk típusdeklaríciót is!
{-
allPositive [4, 5, 6, 8, 14]
allPositive [1..100]
allPositive []
not (allPositive [10, 9 ..])
not (allPositive [100, 98 .. 0])
-}
allPositive = undefined


-- [nehéz] Adott egy "aaaabccaadeeee" betűsorozat. Tömörítsd össze úgy, hogy az egymást követő betűk tárolása darabszám-betű pár legyen:
-- [(4,'a'), (1,'b'), (2,'c'), (2,'a'), (1,'d'), (4,'e')]!
-- Tipp: itt hasznos lehet a group függvény.
-- Írjunk típusdeklaríciót is!
{-
compress "aaaabccaadeeee" == [(4,'a'), (1,'b'), (2,'c'), (2,'a'), (1,'d'), (4,'e')]
compress "oh hello!!" == [(1,'o'),(1,'h'),(1,' '),(1,'h'),(1,'e'),(2,'l'),(1,'o'),(2,'!')]
compress "" == []
-}
compress = undefined


-- [nehéz] Definiálj egy decompress függvényt, mely visszaállítja a karaktersorozatot a tömörített formából!
-- Tipp: itt hasznos lehet a replicate :: Int -> a -> [a] függvény.
{-
decompress [(4,'a'), (1,'b'), (2,'c'), (2,'a'), (1,'d'), (4,'e')] == "aaaabccaadeeee"
decompress [(1,'o'),(1,'h'),(1,' '),(1,'h'),(1,'e'),(2,'l'),(1,'o'),(2,'!')] == "oh hello!!"
decompress [] == ""
-}
decompress = undefined


-- 4. Óra
{-
    - Mintaillesztés
        - Alaptípusokon
        - Rendezett n-eseken (tuple)
        - Listákon
-}


-- Definiálj egy függvényt, mely megvizsgálja, hogy két zárójel összeillik-e!
{-
paren '(' ')'
paren '[' ']'
paren '{' '}'
not (paren '(' ']')
not (paren '(' '(')
not (paren '[' 'a')
-}
paren = undefined


-- Adjunk össze két óra,perc párt.
{-
addTime (00,45) (10,45) == (11,30)
addTime (23,30) (00,31) == (00,01)
-}
addTime :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTime = undefined


-- Adjuk össze két lista első elemeit!
{-
addHeads [1..] [10..] == 11
addHeads [0,1] [1,20] == 1
-}
addHeads = undefined


-- [nehéz] Adjuk össze egy lista összes elemét. A logika ugyanaz, mint az előző feladatnál.
-- [nehéz] Adjuk meg a legáltalánosabb típusdeklarációt is!
{-
sum' [1..10] == 55
sum' [10,10] == 20
-}
sum' = undefined



-- 5. Óra
{-
    - where
    - guard
    - as-pattern
    - Mintaillesztés listagenerátorokban
    - Ismétlés...
-}


-- [nehéz] Implementáljuk az Euklideszi algoritmust
-- https://hu.wikipedia.org/wiki/Euklideszi_algoritmus
-- gcd(a,0) = a
-- gcd(a,b) = gcd(b,a mod b)
{-
gcd' 10 14 == 2
gcd' 60 12 == 12
gcd' 14 77 == 7
-}
gcd' :: Int -> Int -> Int
gcd' = undefined

