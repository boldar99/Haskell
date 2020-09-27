module RandomStudentGenerator (randomStudent) where

import System.IO
import System.Random

atRandIndex :: [a] -> IO a
atRandIndex l = do
    i <- randomRIO (0, length l - 1)
    return $ l !! i

randomStudent :: IO String
randomStudent = atRandIndex students
    where
        students = 
            [
                "Budvig Alexandra Krisztina",
                "Cserei Norbert",
                "Denkler Nikosz Patrik",
                "Fajtai András",
                "Gál Rupert Bence",
                "Gergely Dániel",
                "Hajas Máté",
                "Hollósi Tamás",
                "Horváth László Barna",
                "Kapocsi Dániel Antal",
                "Márik András",
                "Mihácsi Alen",
                "Nyírő Levente Gyula",
                "Oláh Dániel",
                "Orosz Zoltán",
                "Poór Boldizsár",
                "Somogyi Máté Levente",
                "Sótér Anna",
                "Szabó Edit Krisztina",
                "Szabó Patrik Ferenc",
                "Tóth Szabolcs Tamás",
                "Tuskán Bence",
                "Zsóri Dominik"
            ]
