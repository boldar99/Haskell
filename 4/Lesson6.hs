module Lesson6 where

import Data.List (sort, group)

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
divides n k = k `mod` n == 0


-- Definiálj egy függvényt, mely megmondja három egész számról, hogy azok pitagoraszi számhármasok-e?
{-
pythagoreanTriple 3 4 5
pythagoreanTriple 5 3 4
not (pythagoreanTriple 2 3 4)
-}
pythagoreanTriple :: Int -> Int -> Int -> Bool
pythagoreanTriple a b c = x^2 + y^2 == z^2
    where
        [x,y,z] = sort [a,b,c]


-- Hogyan zárójelezi a Haskell az alábbi kifejezést?
-- 1 + 1 + 1 * 2 ^ 3 ^ 4 == 10 || 4 > 2 || False && True && False
-- 1 + 1 + 1 * (2 ^ (3 ^ 4)) == 10 || 4 > 2 || False && True && False
-- 1 + 1 + (1 * (2 ^ (3 ^ 4))) == 10 || 4 > 2 || False && True && False
-- ((1 + 1) + (1 * (2 ^ (3 ^ 4)))) == 10 || 4 > 2 || False && True && False
-- (((1 + 1) + (1 * (2 ^ (3 ^ 4)))) == 10) || (4 > 2) || False && True && False
-- (((1 + 1) + (1 * (2 ^ (3 ^ 4)))) == 10) || (4 > 2) || (False && (True && False))
-- ((((1 + 1) + (1 * (2 ^ (3 ^ 4)))) == 10) || ((4 > 2) || (False && (True && False))))


-- Adjuk meg a 100001. elemét annak a számtani sorozatnak, amelynek az első két eleme 13 és 44!
{-
sequenceElement == 3100013
-}
sequenceElement :: Integer
sequenceElement = [13,44..] !! 100000
-- sequenceElement = last (take 100001 [13,44..])
-- sequenceElement = last $ take 100001 [13,44..]

{-
sequenceElement = [13,44..] !! 10000000               ~ 0.27 secs
-- sequenceElement = last (take 10000001 [13,44..])   ~ 0.43 secs
-}


-- Soroljuk fel az angol ábécé minden 3. karakterét egy listában
{-
charters == "adgjmpsvy"
-}
charters :: [Char]
charters = ['a','d'..'z']


-- Hányféleképpen választhatunk ki n különböző elemből k elemet?
{-
alatt 70 30 == 55347740058143507128
-}
alatt :: Integer -> Integer -> Integer
alatt n k = fact n `div` (fact k * fact (n - k))
    where
        fact n = product [1..n]


-- Milyen hosszú a saját nevünk. (A space-ket ne számoljuk)
{-
Ha a nevem "Haskell Brooks Curry"
nameLen == 18
-}
nameLen :: Int
nameLen = length "Haskell Brooks Curry" - 2


-- Egy vezeték és egy kereszt névből készítsünk egy teljes nevet (Angolosan)!
{-
fullName "Curry" "Haskell" == "Haskell Curry"
-}
fullName :: String -> String -> String
fullName last first = first ++ " " ++ last


--  Definiálj egy függvényt, mely egy növekvő majd csökkenő számlistát állít elő!
{-
mountain 3 == [1, 2, 3, 2, 1]
mountain 5 == [1, 2, 3, 4, 5, 4, 3, 2, 1]
-}
mountain :: Int -> [Int]
mountain n = [1 .. n] ++ [n-1, n-2 .. 1]


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
allPositive szamok = null [x | x <- szamok, x <= 0]


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

