import Data.List
import Data.Char

----------POWER OPERATORS----------

powerOperator :: Int -> Int -> Int

--(Line9)This line defines that (x (y = 0)) = 1
powerOperator x 0 = 1

--(Line13)This is a recursion that repeats the same action in order to
--reach the final answer. Better explained within the report.
powerOperator x y = x * powerOperator x (y - 1)