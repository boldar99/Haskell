module HigherOrderFunctions where

import Prelude hiding (flip, (.), ($), curry, uncurry, iterate, until, any, all, map, filter, takeWhile, dropWhile, span, break, zipWith, foldr)

-- http://learnyouahaskell.com/higher-order-functions

--------------------------------------------------------------------------------
-- https://en.wikipedia.org/wiki/Currying
-- https://wiki.haskell.org/Eta_conversion
-- :i (->)

add7' :: Int -> Int
add7' = undefined
{-
add7' 8 == 15
add7' 0 == 7
-}

add7 :: Int -> Int
add7 = undefined
{-
add7 8 == 15
add7 0 == 7
-}

multiplyBy5' :: Int -> Int
multiplyBy5' = undefined
{-
multiplyBy5' 5 == 25
multiplyBy5' 2 == 10
-}

multiplyBy5 :: Int -> Int
multiplyBy5 = undefined
{-
multiplyBy5 5 == 25
multiplyBy5 2 == 10
-}

max5 :: Int -> Int
max5 = undefined
-- max5 n = if n > 5 then n else 5
{-
max5 10 == 10
max5 5 == 5
max5 0 == 5
-}

isUpper :: Char -> Bool
isUpper = undefined
{-
isUpper 'A'
not (isUpper 'a')
-}

faculties = ["ik", "ttk", "tátk", "ájk", "btk"] -- ...

isFaculty :: String -> Bool
isFaculty = undefined
{-
isFaculty "ik"
isFaculty "TTK"
not (isFaculty "GTI")
-}


--------------------------------------------------------------------------------


apply :: (a -> b) -> a -> b
apply = undefined
{-
apply add7 4 == 11
apply (const 5) 0 == 5
apply abs (-7) == 7
-}

applyTwice :: (a -> a) -> a -> a
applyTwice = undefined
{-
applyTwice add7 4 == 18
applyTwice (const 5) 0 == 5
applyTwice tail [1..10] == [3..10]
-}

applyN :: Int -> (a -> a) -> a -> a
applyN = undefined
{-
applyN 10 add7 4 == 74
applyN 10 abs (-7) == 7
-}

--flip :: (a -> b -> c) -> b -> a -> c
flip :: (a -> b -> c) -> (b -> a -> c)
flip = undefined
{-
flip apply 5 add7 == 12
flip (+) 1 2 == 3
-}

(.) ::  (b -> c) -> (a -> b) -> (a -> c)
infixr 9 .
(.) f g  = undefined
-- f . g = undefined
{-
(add7 . multiplyBy5) 1 == 12
(multiplyBy5 . add7) 1 == 40
-}

($) :: (a -> b) -> a -> b
infixr 0 $
($) = undefined
{-
map ($ 3) [(4+), (10*), (^2)] == [7,30,9]
not $ isFaculty "GTI"
-}

-- ($!) ugyanez, csak a "kiértékeli" a paramétert

curry :: ((a, b) -> c) -> a -> b -> c
curry = undefined
{-
f (x,y) = sqrt (x**2 + abs y)
uf = curry f
fx = uf 1
fx 0 == 0
-}

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry = undefined
{-
add = uncurry (+)
add (7,8) == 15
-}


--------------------------------------------------------------------------------
-- Lambda függvények
-- https://wiki.haskell.org/Anonymous_function


map :: (a -> b) -> [a] -> [b]
map = undefined
{-
map (\n -> n + 2) [] == []
map (\n -> n + 2) [2,3,4] == [4,5,6]
map even [2,3,4] == [True, False, True]
-}

filter :: (a -> Bool) -> [a] -> [a]
filter = undefined
{-
filter (\n -> n > 5) [] == []
filter (\n -> n > 5) [1,2,5,6,0] == [6]
filter even [1,2,5,6,0] == [2,6,0]
filter (elem 0) [[5,6],[4,1,2,0],[0,5]] == [[4,1,2,0],[0,5]]
-}

{-
    Definiálj egy upperToLower nevű függvényt, mely minden nagybetűt kisbetűvé 
    alakít, a többit eldobja!
-}
{-
upperToLower "" == ""
upperToLower "Hello World!" == "hw"
upperToLower "haSKell" == "sk"
-}

iterate :: (a -> a) -> a -> [a]
iterate = undefined
{-
take 10 $ iterate (+1) 0 == [0,1,2,3,4,5,6,7,8,9]
take 3 $ iterate tail [1..5] == [[1,2,3,4,5],[2,3,4,5],[3,4,5]]
-}

until :: (a -> Bool) -> (a -> a) -> a -> a
until = undefined
{-
until (\ls -> length ls < 20) (\(x:xs) -> filter (/= x) xs) $ concat [[i..100] | i <- [1,3,4,5,77,1]] == [98,99,100,98,99,100,98,99,100,98,99,100,98,99,100,98,99,100]
snd $ until (\(y,x) -> abs (x*x - 2) < 1.0e-15) (\(a,b) -> let c = (a+b)/2 in if c*c < 2 then (c,b) else (a,c)) (1,2) == 1.4142135623730954
-}

{-
    Definiálj egy root nevű függvényt, mely egy n szám gyökét
    közelíti e pontosságig. (Az until második tesztesetéből érdemes kiindulni)
    Írj teszteseteket is.
-}

any :: Foldable t => (a -> Bool) -> t a -> Bool
any = undefined
{-
any even [1,2,5,9,2,0,3,2]
any (>3) [1..10]
any (id) [False, True]
-}

all :: Foldable t => (a -> Bool) -> t a -> Bool
all = undefined
{-
not $ all (>3) [1..10]
all (id) [True, True]
all (>0) [1,2,3]
all odd [1,3,5,9,1]
-}

{-
    Definiálj egy hasLongLines nevű függvényt, mely megvizsgálja,
    hogy egy fájl sorai között van-e legalább 3 szóból álló!
-}
{-
not (hasLongLines "elso\nmasodik\nharmadik")
hasLongLines "elso\negy nagy alma\nharmadik"
-}

{-
    Definiáld a hasAny függvényt, mely megvizsgálja, hogy egy lista
    elemei közül valamelyik előfordul-e egy másik listában!
-}
{-
hasAny "abc" "I like Haskell"
hasAny [5,9] [4, 3, 2, 0, 9]
not (hasAny ["haskell", "python"] ["c", "java"])
-}


--------------------------------------------------------------------------------


takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile = undefined
{-
takeWhile (\n -> n > 5) [] == []
takeWhile (\n -> n > 5) [6,7,9,5,2,1] == [6,7,9]
takeWhile odd [6,7,9,5,2,1] == []
takeWhile isUpper "ALMAAfa" == "fa"
-}

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile = undefined
{-
dropWhile (\n -> n > 5) [] == []
dropWhile (\n -> n > 5) [6,7,9,5,2,1] == [5,2,1]
dropWhile odd [6,7,9,5,2,1] == [6,7,9,5,2,1]
dropWhile odd [7,9,5,2,1] == [2,1]
dropWhile isUpper "ALMAAfa" == "ALMAA"
-}

{-
    Definiálj egy dropWord nevű függvényt, mely eldobja az első
    szót egy szöveg elejéről!
-}
{-
dropWord "" == ""
dropWord " fa" == " fa"
dropWord "alma fa" == " fa"
dropWord "almafa" == ""
-}

span :: (a -> Bool) -> [a] -> ([a], [a])
span = undefined
{-
span isUpper "ALMAAfa" == ("ALMAA", "fa")
span (< 3) [1,2,3,4] == ([1,2],[3,4])
-}

break :: (a -> Bool) -> [a] -> ([a], [a])
break = undefined
{-
break (not . isUpper) "ALMAAfa" == ("ALMAA", "fa")
break (> 3) [1,2,3,4] == ([1,2,3],[4])
-}

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith = undefined
{-
zipWith min [1,9,2,5] [5,0,3,8] == [1,0,2,5]
zipWith min [1,0,3] [5,2,10,1] == [1,0,3]
zipWith (*) [2,0,6] [1,5,4,9] == [2,0,24]
-}

-- zipWith3

--------------------------------------------------------------------------------
-- https://wiki.haskell.org/Pointfree


foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
foldr = undefined
{-
foldl (+) 0 [1..10] == sum [1..10]
foldl (\a _ -> a + 1) 0 [1,2,3,0,1,23] == length [1,2,3,0,1,23]
-}


--------------------------------------------------------------------------------
-- Ha megvan minden, ebből a még nem megcsinált feladatokat is csináld meg
-- https://people.inf.elte.hu/poor_a/fp11.pdf

