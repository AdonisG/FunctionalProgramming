import Data.List
import Data.Char

----------MERGE SORTED LISTS----------

--(Line8,9)The function expects two lists then adds them together
--and returns one sorted list
mergeList :: [Int] -> [Int] -> [Int]
mergeList xs ys  =  quicksort (xs ++ ys)

--(Line15,16)Expects a list, checks if its empty
--(Line17-20)If not empty a number is grabbed and compared one by one
--with the rest of the numbers in the List
--(according to if its lesser or greater than the next number
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs