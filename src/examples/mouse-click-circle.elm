import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Mouse exposing (..)

main : Signal Element
main =
  Signal.map2 draw Mouse.position Mouse.isDown
  
draw : (Int,Int) -> Bool -> Element
draw (x,y) isClicked =
  let c = if isClicked then blue else red in
  collage 500 500 [
    circle 50
      |> filled c
      |> move (toFloat x - 250, 250 - toFloat y)
  ]
