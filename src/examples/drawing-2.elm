import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse exposing (..)

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
      |> move (toFloat x - 250, 250 - toFloat y)
  ]

draw : List Form -> Element
draw form_list =
  collage 500 500 form_list
