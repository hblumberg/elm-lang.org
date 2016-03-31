import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse exposing (..)
import Text exposing (..)

w = 500

type alias Game = 
  { matched : List Int
  , uncovered : List Int
  , colors : List Color
  }

game : Game
game =
  { matched = []
  , uncovered = []
  , colors = [ red, blue, yellow, red
         , purple, orange, blue, green
         , orange, green, purple, yellow ]
  }

main = Signal.map draw (Signal.foldp updateGame game inputSignal)

inputSignal : Signal (Int,Int)
inputSignal = Signal.sampleOn Mouse.clicks Mouse.position

updateGame : (Int,Int) -> Game -> Game
updateGame (x,y) game =
  let isMatch = List.length game.uncovered == 2 &&
    nth (nth 0 game.uncovered -1) game.colors gray ==
    nth (nth 1 game.uncovered -1) game.colors gray in
  let newMatched = 
    if isMatch then game.matched ++ game.uncovered
    else game.matched in
  let newUncovered =
    if List.length game.uncovered == 2 then [toIndex (x,y)]
    else game.uncovered ++ [toIndex (x,y)] in
  { game | 
      matched = newMatched
  ,   uncovered = newUncovered
  }

draw : Game -> Element
draw game =
  collage w w
    ((List.map2 drawColor [0..11] game.colors) ++
    (List.map (drawCard game) [0..11]))

drawCard : Game -> Int -> Form
drawCard game index =
  if List.member index game.uncovered || List.member index game.matched then group []
  else square (w/4.25)
    |> filled black
    |> move (fromIndex index)

drawColor : Int -> Color -> Form
drawColor index color =
  circle (w/8.5)
    |> filled color
    |> move (fromIndex index)

fromIndex : Int -> (Float,Float)
fromIndex index =
  ((toFloat (index % 4 - 2)) * (w/4) + w/8, -(toFloat (index // 4 - 1)) * (w/4))

toIndex : (Int,Int) -> Int
toIndex (a,b) =
  let (x,y) = (toFloat a,toFloat b) in
  let col =
    if x - w/2 < -w/4 then 0
    else if x - w/2 < 0 then 1
    else if x - w/2 < w/4 then 2
    else 3 in
  let row = 
    if w/2 - y > w / 8 then 0
    else if w/2 - y > -w/8 then 1
    else 2 in
  row * 4 + col

{-- Evaluates to the nth member of the given list or default if there is no such element. --}
nth : Int -> List a -> a -> a
nth n list default =
  case (List.head (List.drop n list)) of
    Just a -> a
    Nothing -> default
