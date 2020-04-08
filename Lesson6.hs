module Lesson6 where

import RandomStudentGenerator

{-
   Készítsük el a `bimBam` függvényt, mely egy egész
   számot kap paraméterűl, és ha a szám 3-al osztható,
   visszaadja, hogy "Bim", ha 5-el osztható, visszaadja,
   hogy "Bam" és ha osztható 3-al és 5-el is, 
   akkor visszaadja, hogy "BimBam", máskülönben "".

   ~~~~{.haskell}
   bimBam :: Int -> String

   bimBam 0 == "BimBam"
   bimBam 1 == ""
   bimBam 2 == ""
   bimBam 3 == "Bim"
   bimBam 4 == ""
   bimBam 5 == "Bam"
   bimBam 15 == "BimBam"
   ~~~~
-}


bimBam :: Int -> String
bimBam n
 | mod n 15 == 0 = "BimBam"
 | mod n 5 == 0  = "Bam"
 | mod n 3 == 0  = "Bim"
 | otherwise     = ""

isPrime :: Int -> Bool
isPrime = undefined

primes :: [Int]
primes = [n | n <- [2..], isPrime n]



