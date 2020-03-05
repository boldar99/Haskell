1. Mik lesznek az alábbi kifejezések eredményei (True/False/Forditási hiba)?

~~~~{.haskell}
[1, 2, 3] == [3, 2, 1]
[True] == True
[1] == [1, 1]
"String" == "String"
[1, True] == [1, True]
~~~~

2. Írj egy `positives` nevű függvényt, mely vár egy `Int`-ek listáját paraméterül, és az eredménye egy lista melyben a kapott lista pozitív elemei vannak. 

~~~~{.haskell}
positives :: [Int] -> [Int]
~~~~
~~~~{.haskell}
--példa:
positives [-1, 1, -2, 2] == [1, 2]
~~~~


