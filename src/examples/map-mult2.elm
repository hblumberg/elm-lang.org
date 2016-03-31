import Graphics.Element exposing (..)

main = show (List.map mult2 [1..100])

mult2 : Int -> Int
mult2 x = 2 * x
