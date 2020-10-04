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
                "Andor Gergely",
                "Arany Barnabás",
                "Balázs Zoltán",
                "Deák Dániel",
                "Ferancz Norbert",
                "Gergely Dominik Brúnó",
                "Hajdu Márton",
                "Hardi Roland",
                "Kámán Gergő",
                "Kenessei Zsombor",
                "Kövesi-Nagy Mihály Jakab",
                "Lelesz Hanna",
                "Matics Boglárka",
                "Nagy Krisztina",
                "Panyeczky Máté",
                "Poór Boldizsár",
                "Poros Tamás Gábor",
                "Rózsa Ferenc Koppány",
                "Schreier Tamás Norbert",
                "Soltész Ildikó",
                "Striegl Rómeó",
                "Szántó Gábor Tamás",
                "Szántó Péter Patrik",
                "Szigeti Dániel",
                "Vajda Fábiusz"
            ]
