import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse exposing (..)

secretX = 10
secretY = 100
halfWidth = 250

main : Signal Element
main = Signal.map2 draw Mouse.position Mouse.isDown

draw : (Int,Int) -> Bool -> Element
draw (x,y) isClicked =
  let mouseX = toFloat x - halfWidth in
  let mouseY = halfWidth - toFloat y in
  let d = distance (mouseX,mouseY) (secretX,secretY) in
  let c =
    if d <= 10 then green
    else if isClicked && (d > 100) then red
    else if isClicked && (d <= 100) && (d > 50) then orange
    else if isClicked && (d <= 50) && (d > 10) then yellow
    else purple
  in
  collage (halfWidth * 2) (halfWidth * 2) [
    circle 10
      |> filled c
      |> move (mouseX,mouseY)
  ]

distance : (Float,Float) -> (Float,Float) -> Int
distance (x1,y1) (x2,y2) =
  round (sqrt ((x1 - x2)^2 + (y1 - y2)^2))
