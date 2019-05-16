import Data.Char

--WEEK 8--

main = do
    putStrLn "Enter the username: "
    username <- getLine
    putStrLn ("The Username is " ++ username )
    putStrLn "You have 3 directions to walk to: 1 -> left, 2 -> forward, 3 -> right "
    putStrLn "1: Has the giftbox to increase the blood. 2: Has the giftbox to increase the speed 3: Has the giftbox to have a weapon."
