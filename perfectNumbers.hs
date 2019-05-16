import Data.List
import Data.Char

----------PERFECT NUMBERS----------

perfects :: Int->[Int]

--(Line10)Checks if the perfect number produced by sumfactors is True
--Returns it and checks for others
perfects n = [x | x<-[1..n],sumfactors x == x]

--(Line13)Returns the sum of a number's factors(excluding its-self)
sumfactors n = sum [x | x<-[1..n], n `mod` x == 0, x /= n]