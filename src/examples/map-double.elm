import Graphics.Element exposing (..)

main = show (List.map double [1..100])

double : Int -> Int
double x = 2 * x
