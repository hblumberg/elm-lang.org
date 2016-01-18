import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main : Element
main = show (List.map fizzBuzz [1..100])
  
fizzBuzz : Int -> String
fizzBuzz n =
  if (n % 3 == 0 && n % 5 == 0) then "FizzBuzz"
  else if n % 3 == 0 then "Fizz"
  else if n % 5 == 0 then "Buzz"
  else (toString n)
