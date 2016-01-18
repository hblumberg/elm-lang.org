import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (..)

main : Element
main = collage 500 500
  (List.map2 draw [6,5,4,3,2,1] [red,orange,yellow,green,blue,purple])

draw : Float -> Color -> Form
draw r c =
  circle (r * 40)
    |> filled c
    |> move (0,0)

