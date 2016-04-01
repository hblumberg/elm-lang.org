import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse exposing (..)

halfWidth = 250

main : Signal Element
main =
  Signal.map show (Signal.foldp drawCircle [] Mouse.position)

drawCircle : (Int,Int) -> List Form -> List Form
drawCircle (x,y) circleList =
  List.append circleList [
    circle 10
      |> filled red
      |> move (toFloat x - halfWidth, halfWidth - toFloat y)
  ]
