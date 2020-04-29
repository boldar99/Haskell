module ADT where

--import RandomStudentGenerator

-- data Bool = True | False
data Logikai = Igaz | Hamis
  deriving (Eq, Show)

-- Ne használjátok, teszteléshez kell
b2l True = Igaz
b2l False = Hamis

-- not
nem :: Logikai -> Logikai
nem = undefined

-- otherwise
máskülönben :: Logikai
máskülönben = undefined

-- (&&)
és :: Logikai -> Logikai -> Logikai
infixr 3 `és`
és = undefined

-- (||)
vagy :: Logikai -> Logikai -> Logikai
infixr 2 `vagy`
vagy = undefined

-- and
listaÉs :: [Logikai] -> Logikai
listaÉs = undefined

-- any
bármelyik :: (a -> Logikai) -> [a] -> Bool
bármelyik = undefined

-- takeWhile
veddElAmíg :: (a -> Logikai) -> [a] -> [a]
veddElAmíg = undefined

--------------------------------------------------------------------------------

-- data Maybe a = Just a | Nothing
data Talán a = Csak a | Semmmi
  deriving (Eq, Show)

-- lookup
kikeres :: Eq a => a -> [(a, b)] -> Talán b
kikeres = undefined

-- find
keres :: (a -> Logikai) -> [a] -> Talán a
keres = undefined

--------------------------------------------------------------------------------

data USTime = Undefined

instance Show USTime where
 show t = undefined



isValid :: USTime -> Bool
isValid t = undefined

add :: USTime -> USTime -> USTime
add a b = undefined

earliest :: [USTime] -> USTime 
earliest = undefined


{-
-- Akkor fog átmenni az összes teszten, ha a test változó True lesz
test :: Bool
test = and [showTest, compareTest, isValidTest, addTest, earliestTest]

-- Mindegyik fügvényünk helyességét tesztelhetjük a hozzá tartoz Test konstans kiértékelésével.
showTest     = and [show (AM 12 12) == "12:12 a.m.", show (PM 1 30) == "01:30 p.m.", 
                    show (AM 5 9) == "05:09 a.m."]
compareTest  = and [compare (AM 12 12) (AM 12 12) == EQ, compare (AM 12 10) (AM 12 12) == LT, 
                    compare (PM 10 0) (AM 10 0) == GT]
isValidTest  = and [isValid (AM 10 12), isValid (AM 12 59), not $ isValid (AM 13 00), 
                    not $ isValid (PM 00 00), not $ isValid (PM 04 60)]
addTest      = and [add (AM 5 0) (AM 5 0) == (AM 10 0), add (AM 12 59) (AM 0 1) == (PM 1 0), 
                    add (AM 5 0) (PM 1 0) == (PM 6 0), add (PM 1 0) (AM 1 0) == (PM 2 0), 
                    add (PM 1 0) (PM 1 0) == (AM 2 0)]
earliestTest = and [earliest [AM 5 0, AM 5 0, AM 10 0] == AM 5 0, 
                    earliest [PM h m | h <- [1..12], m <- [0..59]] == PM 1 0]
-}