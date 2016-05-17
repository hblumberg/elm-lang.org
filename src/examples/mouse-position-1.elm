import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse

main : Signal Element
main =
  Signal.map draw Mouse.position

draw : (Int,Int) -> Element
draw (x,y) =
  collage 500 500 [
    circle 50
      |> filled red
      |> move (toFloat x, toFloat y)
  ]
