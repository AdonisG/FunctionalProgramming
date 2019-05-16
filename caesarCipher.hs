import Data.List
import Data.Char

----------CAESAR CIPHER----------

--(Line8,9)Retrieve the length(number of characters) of two lists of
--all letters in the alphabet,1st-list in small caps,2nd-list in large caps
nlowers = length ['a'..'z']
nUppers = length ['A'..'Z']

--(Line13,14)Converts a lower-case letter between 'a' - 'z' into the corresponding
--integer between 0 - 25
let2int :: Char -> Int
let2int c = ord c - ord 'a'

--(Line18,19)Converts an upper-case letter between 'A' - 'Z' into the corresponding
--integer between 0 - 25
let2intUp :: Char -> Int
let2intUp c = ord c -ord 'A'

--(Line23,24)Performs the conversion of an Integer between 0 - 25 into the corresponding
--a lower-case letter between 'a' - 'z'
int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

--(Line28,29)Performs the conversion of an Integer between 0 - 25 into the corresponding
--an upper-case letter between 'A' - 'Z'
int2letUp :: Int -> Char
int2letUp n = chr (ord 'A' + n)

--(Line35-38)Function shift is where a letter shifts to another letter corresponding to the cipher
--The if statement checks if the letter is lower-case or upper-case and follows with the
--functions which are the explained above while adding the number of times to shift the letter
--Plus the `mod` which restricts the numbers to always be between 0 - 25
shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` nlowers)
          | isUpper c = int2letUp ((let2intUp c + n)`mod` nUppers)
          | otherwise      = c

--(Line42,43)Encode allows the shift function to continue
--through the list(cipher)letter by letter
encode :: Int -> String -> String
encode n cs = [shift n c | c <- cs]