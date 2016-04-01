import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Mouse exposing (..)

halfWidth = 250

main : Signal Element
main =
  Signal.map2 draw Mouse.position Mouse.isDown
  
draw : (Int,Int) -> Bool -> Element
draw (x,y) isClicked =
  let c = if isClicked then blue else red in
  collage (halfWidth * 2) (halfWidth * 2) [
    circle 50
      |> filled c
      |> move (toFloat x - halfWidth, halfWidth - toFloat y)
  ]
