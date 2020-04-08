module ProbaZH where


------------------------- Költözködés -------------------------  
{- 
    Áron és családja költöznek. A csomagokat dobozokba pakolták, 
    minden doboz 12 kg. A teherautóba 245 kg csomag fér be. 
    Írj egy trips :: Int -> Int függvényt, amely a dobozok számától 
    függően megadja, hogy hány fuvarra van szükség.
-}

trips :: Int -> Int
trips n = 12*n `div` 245 + 1


------------------------- Pár rendezése -------------------------  
{-
    Készíts egy pairSort :: (Int,Int) -> (Int,Int) függvényt, 
    ami egy pár elemeit rendezi úgy, hogy a kisebb elem legyen az első helyen.
-}

pairSort :: (Int,Int) -> (Int,Int)
pairSort t@(a,b) 
    | a <= b    = (a,b) 
    | otherwise = (b,a)


------------------------- Elem mozgatása -------------------------  
{-
    Definiáld a moveToBack :: String -> Int -> String függvényt, amely egy 
    szöveg adott indexű karakterét kiveszi és a legvégére teszi. 
    Feltesszük, hogy az index nem túl nagy, se nem túl kicsi.
-}

moveToBack :: String -> Int -> String
moveToBack s n = front ++ back ++ [x]
    where
        (front, (x:back)) = splitAt n s
{-
moveToBack (x:xs) 0 = xs ++ [x]
moveToBack (x:xs) n = x : moveToBack xs (n-1)
-}


------------------------- Művelet végrehajtása -------------------------  
{-
    Definiáld a calc :: String -> Int -> Int -> Int függvényt, ami néhány 
    egyszerű parancsot hajt végre a paraméterként kapott számokra: 
        add: összeadás 
        mul: szorzás 
        sub: kivonás 
        pow: hatványozás 
    Más parancsokkal nem kell működnie a függvénynek.
-}

calc :: String -> Int -> Int -> Int
calc "add" a b = a + b
calc "sub" a b = a - b
calc "mul" a b = a * b
calc "pow" a b = a ^ b
{-
-- eta expansion
calc "add" = (+)
calc "sub" = (-)
calc "mul" = (*)
calc "pow" = (^)
-}
{-
calc str a b
    | str == "add" = a + b
    | str == "mul" = a * b
    | str == "sub" = a - b
    | str == "pow" = a ^ b
-}


------------------------- Space átírása -------------------------  
{-
    Írj egy replaceSpaces :: String -> String függvényt, amely egy 
    szövegben az összes szóközt aláhúzásra (’_’) cseréli.
-}

replaceSpaces :: String -> String
replaceSpaces str = [ if c == ' ' then '_' else c | c <- str ]
{-
replaceSpaces [] = []
replaceSpaces (x:xs)
    | x == ' '  = '_' : replaceSpaces xs
    | otherwise =  x  : replaceSpaces xs
-}


------------------------- Skaláris szorzat -------------------------  
{-
    Készíts egy függvényt (dotProduct :: [Int] -> [Int] -> Int), amely két lista 
    skaláris szorzatát számitja ki, azaz páronként összeszorozza az elemeket, 
    majd a szorzatokat összeadja. Feltehető, hogy a két lista hossza megegyezik.
-}

dotProduct :: [Int] -> [Int] -> Int
dotProduct (x:xs) (y:ys) = x * y + dotProduct xs ys
dotProduct [] [] = 0
{-
dotProduct xs ys = sum [x * y | (x,y) <- zip xs ys]
-}
{-
dotProduct xs ys = sum (zipWith (*) xs ys)
-}


------------------------- Elem után beszúrás -------------------------  
{-
    Készíts egy függvényt (insertAfter :: [Int] -> Int -> Int -> [Int]), 
    amely egy adott elem utáni helyre beszúr egy másik adott elemet. 
    Ha a keresett elem többször is előfordul, akkor az első előfordulás 
    után kell beszúrni. Ha nem található a listában a keresett elem, 
    akkor a lista legvégére kell beszúrni az új elemet.
-}

insertAfter :: [Int] -> Int -> Int -> [Int]
insertAfter [] _ e = [e]
insertAfter (x:xs) f e
    | x == f    = f:e:xs
    | otherwise = x : insertAfter xs f e
