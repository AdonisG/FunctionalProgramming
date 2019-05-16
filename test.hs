import Data.Char


--USER ATTEMPTS--

-- The [attempt] function returns and receives an Integer in a DO block.
attempt :: Integer -> IO()
-- The [attempt] function is a loop registered to complement the [mainBody] function
-- which complies to the number of attempts a User has to complete the game.
-- The [x] is set to 1 by the [main] function code, starts the [mainBody],
-- checks if the [x] is < 5, if the statement is True it adds 1 and repeats. otherwise GAMEOVER.
attempt x = do
   mainBody
   if x < 5
   then attempt (x + 1)
   else putStr "            Thanks for playing              "

-----------------------------------

--GAME INTRODUCTION--

-- The [intro] function introduces the purpose and the game`s tasks for the User.
intro :: IO ()
intro = do
   putStrLn "Welcome"
   getLine
-- Requests the Users name.
   putStrLn "How would you like to be called? "
   username <- getLine
   putStrLn ( username ++ ", lets begin!!" )
   getLine
   putStrLn "At this moment you have just entered a house where a crime has been committed."
   putStrLn "You are placed in a corridor between 5 other rooms."
   getLine
   putStrLn "There isn`t much time the case must be solved."
   getLine
   putStrLn "The five rooms are:"
   putStrLn "Room 1 KITCHEN"
   putStrLn "Room 2 LIVING ROOM"
   putStrLn "Room 3 BATHROOM"
   putStrLn "Room 4 MASTER BEDROOM"
   putStrLn "Room 5 GUEST BEDROOM"
   putStrLn "So....To begin."

------------------------------------

--MAIN GAME--

-- The [mainBody] function is a do block which requests a String value [roomNum] from the User,
-- begins an IF statement checking IF the value matches the contexts and acts accordingly--
mainBody :: IO()
mainBody = do
-- The [mainBody] is repeated based on the User [attempts] function.
   putStrLn "Please enter the number of the room you would like to enter."
-- Room Number request from User
   roomNum <- getLine
-- IF Statement checking if the number matches to the rooms.
   if (read roomNum) == "1"
      then do putStrLn "One of the knives is missing maybe it`s in one of the other rooms."
      else if (read roomNum) == "2"
         then do putStrLn "Unfortunately, nothing helpful is in the Room"
         else if (read roomNum) == "3"
             then do putStrLn "The Knife!! Maybe there are fingerprints to help find the criminal."
             else if (read roomNum) == "4"
                then do putStrLn "Unfortunately, nothing helpful is in the Room"
                else if (read roomNum) == "5"
                   then do putStrLn "The Room is heavily damaged this is where the intrusion broke out. Hair!! Hopefully these belong to the criminal."
                   else putStrLn "Invalid number of Room"

-----------------------------------

--GAME COMPRESSION--

-- The [main] function compresses and generates all the functions of the game.
main :: IO ()
-- The function begins with a do block activating the [intro] function (introduction),
-- calls the [attempt] function being the loop which is alredy set to 1
-- along with the [mainBody] function alredy inserted in the [attempt] function.
main = do
   intro
   attempt 1
-- The [main] function is the ghci command to begin the game.

-----------------------------------

--DIFFICULTY--(NOT IMPLEMENTED YET!!)

-- The [difficulty] function takes a String from the User,
-- converts it to an Integer and then returns the Integer.
difficulty :: String -> Int -> IO(Int)
difficulty diff conv = do
-- Requesting a String from User (difficulty level).
   putStrLn "Enter the difficulty you would like to play in"
   putStrLn "Type 1 for HARD, 2 for MEDIUM or 3 for EASY"
-- Sets the String to the variable [diff].
   diff <- getLine
-- converts the String [diff] into Integer [conv].
   let conv = (read diff :: Int)
-- Add 2 to the value of Integer [conv] to comply with the loop system.
   difficulty diff (conv + 2)

---------------------------------

--GAME PROGRESS--(NOT IMPLEMENTED YET!!)

-- The [gameProgress] function takes in a String from the User, two Boolean variables
-- and returns the value of the two Booleans
gameProgress :: String -> Bool -> Bool -> Bool
-- The function begins a do block checking if the String value inserted by the User,
-- matches the Strings "3" or "5" and if it does the two Booleans are set to True.
gameProgress roomNum room3 room5 = do
   if (read roomNum) == "3"
      then do room3 == True
      else if (read roomNum) == "5"
         then do room5 == True
         else return room3 room5

----------------------------------

--GAME RESULT---(NOT IMPLEMENTED YET!!)

-- The [gameResult] function takes two Booleans and returns a String.
gameResult :: Bool -> Bool -> String
-- The function uses guards to determine if the User entered Both rooms (3 and 5).
-- After checking the game result is printed to the User.
gameResult room3 room5
   | room3 == True && room5 == True = "Case solved 100%"
   | room3 == True && room5 == False = "Case solved 50%"
   | room3 == False && room5 == True = "Case solved 50%"
   | otherwise = "Case Not Solved"

----------------------------------
