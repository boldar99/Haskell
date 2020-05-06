# Algebrai Adattípusok / Algebraic Data Type (ADT)

http://learnyouahaskell.com/making-our-own-types-and-typeclasses

Ha a mintaillesztés nem volt világos, mindenképpen nézzétek át!
http://learnyouahaskell.com/syntax-in-functions#pattern-matching

## Logikai műveletek és függvények magyarosítása
```Haskell
-- data Bool = True | False
data Logikai = Igaz | Hamis
  deriving (Eq, Show)

-- not
nem :: Logikai -> Logikai
-- Tesztek:
nem Igaz == Hamis
nem Hamis == Igaz

-- otherwise
máskülönben :: Logikai
-- Tesztek:
máskülönben == Igaz

-- (&&)
és :: Logikai -> Logikai -> Logikai
-- Tesztek:
Igaz `és` Igaz == Igaz
Igaz `és` Hamis == Hamis
Hamis `és` Igaz == Hamis
Hamis `és` Hamis == Hamis

-- (||)
vagy :: Logikai -> Logikai -> Logikai
-- Tesztek:
Igaz `vagy` Igaz == Igaz
Igaz `vagy` Hamis == Igaz
Hamis `vagy` Igaz == Igaz
Hamis `vagy` Hamis == Hamis

-- (==)
egyenlő :: Eq a => a -> a -> Logikai
-- Tesztek:
egyenlő 'c' 'd' == Hamis
egyenlő 1 1 == Igaz

-- and
listaÉs :: [Logikai] -> Logikai
-- Tesztek:
listaÉs [Igaz, Igaz] == Igaz
listaÉs [] == Igaz
listaÉs [Igaz, Hamis] == Hamis

-- any
bármelyik :: (a -> Logikai) -> [a] -> Bool
-- Tesztek:
bármelyik (\l -> l `egyenlő` []) [[1..10], [1..20], []]

-- takeWhile
veddElAmíg :: (a -> Logikai) -> [a] -> [a]
-- Tesztek:
veddElAmíg nem [Hamis, Igaz, Hamis] == [Hamis]
veddElAmíg (const Igaz) [] == []
```
---
## `Maybe` magyarosítása
Akkor használjuk, ha valamilyen számítás értéke nem biztos, hogy értelmes.
Elég kevés függvény van, amit tudni kell hozzá, de van pár érdekes itt:
http://hackage.haskell.org/package/base-4.12.0.0/docs/Data-Maybe.html
Lear You Some Haskell:
http://learnyouahaskell.com/making-our-own-types-and-typeclasses#type-parameters

### Tipikus vizsga feladatokkal `Maybe`-vel:
- biztonságos-
	- függvények listákkal, (head, tail, max...)
	- műveletek, (0/0, Mátrix/Vektor műveletek...)
- erőltetett feladatok (valamilyen fv, és a végeredményt csomagold be egy `Just`-ba, ha ...)
- Néha nehezebb témakörökből lopott feladatok elmagyarázva (`fmap`, `>==`...)

```Haskell
-- data Maybe a = Just a | Nothing
data Talán a = Csak a | Semmmi
  deriving (Eq, Show)

-- lookup
kikeres :: Eq a => a -> [(a, b)] -> Talán b
-- Tesztek:
kikeres 3 [(1, "alma"), (2, "cica"), (3, "roka")] == Csak "roka"
kikeres 4 [(1, "alma"), (2, "cica")] == Semmi
kikeres 5 [] == Semmi

-- find
keres :: (a -> Logikai) -> [a] -> Talán a
-- Tesztek:
keres (\(x:_) -> x `egyenlő` 'a') ["róka", "cica", "alma"] == Csak "alma"
keres (\(xs:x) -> x `egyenlő` "a") ["róka", "cica", "alma"] == Semmi
keres (const Igaz) [] == Semmi
```
---
### Feladatok `Maybe`-vel
1. Definiáld a négyzet-gyökvonás `Maybe`-s változatát! 
Az eredmény legyen `Nothing`, ha a paraméternek nincs valós négyzetgyöke!

```haskell
maybeSqrt :: Floating a => a -> Maybe a

maybeSqrt (-42) == Nothing
maybeSqrt (-9)  == Nothing
maybeSqrt 9     == Just 3.0
maybeSqrt 4     == Just 2.0
maybeSqrt 0     == Just 0.0
```

2. Adjuk meg a `natApply` függvényt, ami a kapott függvényt alkalmazza a két másik paraméterre. 
Ha ezzel egy negatív számot kapunk akkor térjen vissza Nothing-al, egyébként Just az értékkel!

```haskell
natApply :: (Int -> Int -> Int) -> Int -> Int -> Maybe Int

natApply (+) 10 10 == Just 20
natApply (-) 20 10 == Just 10
natApply (-) 10 20 == Nothing
natApply (*) (-5) (-5) == Just 25 
natApply (*) (-5) 5 == Nothing 
```

3. Adjuk meg a `safeLength` függvényt, ami kap egy listát és egy maximum korlátot. Hogy ha a lista hossza a korlát alatt van, akkor adjuk vissza a hosszát Just-al. Hogy ha a lista hossza túllépné a korlátot akkor Nothing-al térjen vissza! Fontos, hogy a függvény működjön végtelen listákra is!
```haskell
safeLength :: Int -> [a] -> Maybe Int

safeLength 0 [] == Just 0
safeLength 0 [1] == Nothing
safeLength 1000 [1..100] == Just 100
safeLength 10 [1..100] == Nothing
safeLength 1000 [1..] == Nothing
```
---
### Példa egy ADT-s vizsgafeladatra
Definiáljuk az `Orientation` típust, melynek adatkonstruktorai kiolvashatóvá teszik, hogy a játékos melyik irányba néz, és a térkép melyik koordinátáján áll éppen. 

- `North :: Int -> Int -> Orientation`
- `South :: Int -> Int -> Orientation`
- `East :: Int -> Int -> Orientation`
- `West :: Int -> Int -> Orientation`

Gyakran így vannak az AST-s feladatok kiírva. Mit jelent ez?
`:t True`
`:t Just`

A fenti feladat megoldása:

```Haskell
data Orientation = 
	North Int Int | 
	South Int Int | 
	East Int Int  | 
	West Int Int
```
---
### Órás feladat
http://learnyouahaskell.com/types-and-typeclasses#typeclasses-101
http://learnyouahaskell.com/making-our-own-types-and-typeclasses#typeclasses-102
https://en.wikipedia.org/wiki/12-hour_clock

Definiálj egy USTime ADT-t, melyenk két típuskonstruktora legyen:
- `AM :: Int -> Int -> USTime`
- `PM :: Int -> Int -> USTime`
Az első paraméter az óra, a második a percet jelenti
Adjunk `deriving` záradékot az `Eq`-hoz

1. Példányosítsuk a Show típusosztályt
Egy időpont megjelenítésánek formátuma:
--   HH:MM a.m. vagy HH:MM p.m.
```Haskell
instance Show USTime where
  show t = undefined
-- Tesztesetek
show (AM 12 12) == "12:12 a.m."
show (PM 1 30) == "01:30 p.m."
show (AM 5 9) == "05:09 a.m."
```

2. Példányosítsuk az Ord típusosztályt
```Haskell
-- Tesztesetek
compare (AM 12 12) (AM 12 12) == EQ
compare (AM 12 10) (AM 12 12) == LT
compare (PM 10 0) (AM 10 0) == GT
(PM 10 0) > (AM 10 0)
```

3. Adjuk meg az isValid függvényt, mely eldönti, hogy egy idő megfelelő formátumú-e?
(1 <= óra <= 12 és 0 <= perc <= 59)
```Haskell
isValid :: USTime -> Bool
-- Tesztesetek
isValid (AM 10 12)
isValid (AM 12 59)
not $ isValid (AM 13 00)
not $ isValid (PM 00 00)
not $ isValid (PM 04 60)
```

4. Készítsük el az `add` függvényt, mely összead két USTime-t 
Túlcsordulás esetén újra kezdődik AM 01 00-tól
```Haskell
add :: USTime -> USTime -> USTime
-- Tesztesetek
```

5.  Írjuk meg az `earliest` függvényt, mely egy listából kiválasztja a legkorábbi időpont. 
```Haskell
earliest :: [USTime] -> USTime 
-- Tesztesetek
earliest [AM 5 0, AM 5 0, AM 10 0] == AM 5 0
earliest [PM h m | h <- [1..12], m <- [0..59]] == PM 1 0
```
