module ExtraLesson where


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
isLetter c = c `elem` ['a'..'z'] ++ ['A'..'Z']


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
