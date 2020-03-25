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
  students = [
    "Bondar Renata",
    "Dobi Viktor",
    "Egri Ferenc",
    "Garai Adam",
    "Gargya Istvan",
    "Halmai Kristof Mate",
    "Horvath Gergo",
    "Ihnath Brigitta",
    "Jeney Bence",
    "Katai Kristof",
    "Laub Nora Melitta",
    "Laszlo Viktoria",
    "Negrut Akos",
    "Nyeste Todor David",
    "Oz Agoston",
    "Poor Boldizsar",
    "Prorok Ernest Benjamin",
    "Racz Renato",
    "Salgo Krisztian",
    "Schreier Tamas Norbert",
    "Szabo Bence",
    "Szabo Csongor Zsolt",
    "Timar Krisztina",
    "Vecsernyes Mark",
    "Zhang Zhichao"]
