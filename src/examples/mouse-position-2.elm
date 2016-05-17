import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse

main : Signal Element
main =
  Signal.map draw Mouse.position

draw : (Int,Int) -> Element
draw (x,y) =
  let mouseX = toFloat x - 250 in
  let mouseY = 250 - toFloat y in
  collage 500 500 [
    circle 50
      |> filled red
      |> move (mouseX,mouseY)
  ]
