import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard exposing (..)
import Mouse exposing (..)

inputSignal : Signal ((Int,Int), Bool, Bool)
inputSignal = 
  Signal.map3 (,,) Mouse.position Mouse.isDown Keyboard.space

main : Signal Element
main =
  Signal.map draw (Signal.foldp drawCircle [] inputSignal)

draw : List Form -> Element
draw form_list = collage 500 500 form_list
  
drawCircle : ((Int,Int), Bool, Bool) -> List Form -> List Form
drawCircle ((x,y), mouseIsClicked, spaceIsClicked) circleList =
  if spaceIsClicked then [] else
  if mouseIsClicked 
  then (List.append circleList [
      circle 10
        |> filled red
        |> move (toFloat x - 250, 250 - toFloat y)
    ])
  else circleList
