
1. Adott az alábbi függvénydefiníció. Mi lesz az eredménye a függvényhívásoknak
a következő paraméterekkel: "a", "alm", "cic", "cica", ""

~~~~{.haskell}
boo :: String -> Int
boo "alma" = 1
boo ('a':_) = 2
boo "" = 3
boo _ = 4
boo "cica" = 5
~~~~

2. Írd ki a rejtett zárójeleket a kifejezésben, úgy hogy a kiértékelés ne változzon!

~~~~{.haskell}
11 == 4^2^3 || 8 > 23 `mod` 9 `div` 2 && not False

-- not :: Bool -> Bool, függvény
~~~~
