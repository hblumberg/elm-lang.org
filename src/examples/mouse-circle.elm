import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Mouse exposing (..)

main : Signal Element
main =
  Signal.map draw Mouse.position

draw : (Int,Int) -> Element
draw (x,y) =
  collage 500 500 [
    circle 50
      |> filled red
      |> move (toFloat x - 250, 250 - toFloat y)
  ]
