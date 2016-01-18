import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main : Element
main = collage 500 500
  (List.map draw_circle [1..10])

draw_circle : Int -> Form
draw_circle i =
  circle 25
    |> filled red
    |> move (toFloat (i*50-275),0)
