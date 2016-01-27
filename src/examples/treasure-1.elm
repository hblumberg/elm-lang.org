import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Mouse exposing (..)

secretX = 10
secretY = 100
halfWidth = 250

main : Signal Element
main = Signal.map draw Mouse.position

draw : (Int,Int) -> Element
draw (x,y) =
  let mouseX = toFloat x - halfWidth in
  let mouseY = halfWidth - toFloat y in
  let c = purple in
  collage (halfWidth * 2) (halfWidth * 2) [
    circle 10
      |> filled c
      |> move (mouseX,mouseY)
  ]

distance : (Int,Int) -> (Int,Int) -> Int
distance (x1,y1) (x2,y2) =
  round (sqrt ((toFloat(x1 - x2))^2 + (toFloat(y1 - y2))^2))
