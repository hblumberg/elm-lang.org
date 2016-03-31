import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse exposing (..)

w = 500

type Player = O | X | None

type alias Game =
  { board : List Player
  , curPlayer : Player
  }

game : Game
game =
  { board = [ None, None, None
            , None, None, None
            , None, None, None ]
  , curPlayer = X
  }

main : Signal Element
main = Signal.map draw (Signal.foldp updateGame game inputSignal)

inputSignal : Signal (Int,Int)
inputSignal = Signal.sampleOn Mouse.clicks Mouse.position

draw : Game -> Element
draw game =
  collage w w
    ([ lines ] ++ (List.map2 getXOs [0..8] game.board))

updateGame : (Int,Int) -> Game -> Game
updateGame (x,y) game =
  let index = getIndex (toFloat x, toFloat y) in
  let occupied = (nth index game.board None) /= None in
  if occupied then game else 
    { game |
        board = List.map2 (updateSpace index game.curPlayer) [0..8] game.board
    ,   curPlayer = if game.curPlayer == X then O else X
    }

updateSpace : Int -> Player -> Int -> Player -> Player
updateSpace index player i p =
  if index == i && p == None then player else p

getXOs : Int -> Player -> Form
getXOs index player =
  if player == X 
    then xShape (getCoordinate index)  
  else if player == O
    then oShape (getCoordinate index)    
  else group []

lines : Form
lines = group
  [ rect (w/50) w
      |> filled black
      |> move (w/3-w/2,0)
  , rect (w/50) w
      |> filled black
      |> move (2*w/3-w/2,0)
  , rect w (w/50)
      |> filled black
      |> move (0,w/3-w/2)
  , rect w (w/50)
      |> filled black
      |> move (0,2*w/3-w/2)
  ]

xShape : (Int,Int) -> Form
xShape (x,y) = group
  [ rect (w/200) (w/3)
      |> filled red
      |> move (toFloat x, toFloat y)
      |> rotate (degrees 45)
  , rect (w/200) (w/3)
      |> filled red
      |> move (toFloat x, toFloat y)
      |> rotate (degrees -45)
  ]

oShape : (Int,Int) -> Form
oShape (x,y) = group
  [ circle (w/7)
      |> outlined (solid red) 
      |> move (toFloat x, toFloat y)
  ]

getCoordinate : Int -> (Int,Int)
getCoordinate index = 
  let row = (index // 3) in
  let col = (index % 3) in
  ((col - 1) * (round (w/3)), (1 - row) * (round (w/3)))

getIndex : (Float,Float) -> Int
getIndex (x,y) =
  let row = 
    if (y < w/3) then 0
    else if (y > 2/3 * w) then 2
    else 1 in
  let col = 
    if (x < w/3) then 0
    else if (x > 2/3 * w) then 2
    else 1 in
  row * 3 + col

{-- Evaluates to the nth member of the given list or default if there is no such element. --}
nth : Int -> List a -> a -> a
nth n list default =
  case (List.head (List.drop n list)) of
    Just a -> a
    Nothing -> default
