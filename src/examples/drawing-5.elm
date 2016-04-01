import Char exposing (..)
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard exposing (..)
import Mouse exposing (..)

type alias Input =
  { mousePos : (Int,Int)
  , mouseIsClicked : Bool
  , spaceIsClicked : Bool
  , keyCode : KeyCode
  }

halfWidth = 250

inputSignal : Signal Input
inputSignal = Signal.map4 Input
  Mouse.position Mouse.isDown Keyboard.space Keyboard.presses

main : Signal Element
main =
  Signal.map draw (Signal.foldp drawCircle [] inputSignal)

draw : List Form -> Element
draw form_list =
  collage (halfWidth * 2) (halfWidth * 2) form_list
  
drawCircle : Input -> List Form -> List Form
drawCircle userInput circleList =
  let { mousePos, mouseIsClicked, spaceIsClicked, keyCode } =
    userInput in
  let (x,y) = mousePos in
  if spaceIsClicked then [] else
  let c = 
    if Char.fromCode keyCode == 'r' then red
    else if Char.fromCode keyCode == 'y' then yellow
    else if Char.fromCode keyCode == 'b' then blue
    else black in
  if mouseIsClicked 
    then (List.append circleList [
      circle 10
        |> filled c
        |> move (toFloat x - halfWidth, halfWidth - toFloat y)
    ])
  else circleList
