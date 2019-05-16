import Data.Char

--WEEK 7--

--Sum
 sum2 :: [Int] -> Int
 sum2 [] = 0
 sum2 (x:xs) = x + foldr (+) 0 xs

--product
 product2 :: [Int] -> Int
 product2 [] = 0
 product2 (x:xs) = x * foldr (*) 1 xs



