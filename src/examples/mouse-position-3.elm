import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse

halfWidth = 250

main : Signal Element
main =
  Signal.map draw Mouse.position

draw : (Int,Int) -> Element
draw (x,y) =
  let mouseX = toFloat x - halfWidth in
  let mouseY = halfWidth - toFloat y in
  {- Modify the following line to change the color of the circle! -}
  let c = red in
  collage (halfWidth * 2) (halfWidth * 2) [
    circle 50
      |> filled c
      |> move (mouseX,mouseY)
  ]
