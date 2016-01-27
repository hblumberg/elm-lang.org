import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse exposing (..)

main : Signal Element
main =
  Signal.map draw (Signal.foldp drawCircle [] Mouse.position)

drawCircle : (Int,Int) -> List Form -> List Form
drawCircle (x,y) circleList =
  List.append circleList [
    circle 10
      |> filled red
      |> move (toFloat x - 250, 250 - toFloat y)
  ]

draw : List Form -> Element
draw form_list =
  collage 500 500 form_list
