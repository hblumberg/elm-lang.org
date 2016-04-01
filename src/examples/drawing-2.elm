import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse exposing (..)

halfWidth = 250

inputSignal : Signal ((Int,Int), Bool)
inputSignal = Signal.map2 (,) Mouse.position Mouse.isDown

main : Signal Element
main =
  Signal.map draw (Signal.foldp drawCircle [] inputSignal)

drawCircle : ((Int,Int), Bool) -> List Form -> List Form
drawCircle ((x,y), isClicked) circleList =
  List.append circleList [
    circle 10
      |> filled red
      |> move (toFloat x - halfWidth, halfWidth - toFloat y)
  ]

draw : List Form -> Element
draw form_list =
  collage (halfWidth * 2) (halfWidth * 2) form_list
