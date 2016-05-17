import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse

halfWidth = 250

main : Signal Element
main =
  Signal.map2 draw Mouse.position Mouse.isDown

draw : (Int,Int) -> Bool -> Element
draw (x,y) isClicked =
  let mouseX = toFloat x - halfWidth in
  let mouseY = halfWidth - toFloat y in
  let c = if isClicked then blue else red in
  collage (halfWidth * 2) (halfWidth * 2) [
    circle 50
      |> filled c
      |> move (mouseX,mouseY)
  ]
