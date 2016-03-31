import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard exposing (..)
import Random exposing (..)
import Text exposing (..)
import Time exposing (..)

w = 500

type alias Object =
  { x : Float
  , y : Float
  , w : Float
  , v : Float
  }

type alias Dog =
  { x : Float
  , w : Float
  }

type alias Game = 
  { bone : Object
  , net : Object
  , dog : Dog
  , seed : Seed
  , points : Int
  , lost : Bool
  }

game : Game
game =
  { bone = {x = -w/4, y = w/2, w = 50, v = 1}
  , net = {x = w/4, y = w/2, w = 100, v = 1}
  , dog = {x = 0, w = 100}
  , seed = initialSeed 0
  , points = 0
  , lost = False
  }

main = Signal.map draw (Signal.foldp updateGame game inputSignal)

inputSignal =
  Signal.sampleOn (Time.fps 60) Keyboard.arrows

updateGame : {x:Int, y:Int} -> Game -> Game
updateGame arrows game = 
  if game.lost then game else
    let oldDog = game.dog in
    {-- Update bone --}
    let resetBone = game.bone.y < -w/2 || areTouching game.dog game.bone in
    let (newBone, seed') = updateObj resetBone game.seed game.bone in
    {-- Update net --}
    let (newNet, seed'') = updateObj (game.net.y < -w/2) seed' game.net in
    { game | 
        dog = { oldDog | x = game.dog.x + (toFloat arrows.x) }
    ,   bone = newBone
    ,   net = newNet
    ,   seed = seed''
    ,   points =
          if areTouching game.dog game.bone then game.points + 1 
          else if resetBone then game.points - 1
          else game.points
    ,   lost = areTouching game.dog game.net
    }

draw : Game -> Element
draw game =
  let dog = game.dog in
  let lost = if game.lost then
    [ fromString "GAME OVER"
        |> Text.height 80
        |> text
        |> move (0,0)
    ] else [] in
  collage w w
    ([ square w
        |> filled lightBlue
        |> move (0,0)
    , fromString ("Points: " ++ (toString game.points))
        |> Text.height 20
        |> text
        |> move (0,w/2 - 20)
    , image (round dog.w) (round (dog.w * 1.5)) "http://learn-elm.com/assets/dog.png"
        |> toForm
        |> move (dog.x, -w/2 + dog.w/2)
    , drawBone game.bone
    , drawNet game.net
    ] ++ lost)

drawBone : Object -> Form
drawBone bone =
  image (round bone.w) (round bone.w) "http://learn-elm.com/assets/bone.png"
   |> toForm
   |> move (bone.x,bone.y)

drawNet : Object -> Form
drawNet net =
  image (round net.w) (round net.w) "http://learn-elm.com/assets/net.png"
   |> toForm
   |> move (net.x,net.y)

areTouching : Dog -> Object -> Bool
areTouching dog obj =
  let xClose = abs (dog.x - obj.x) < (dog.w/2.5 + obj.w/2.5) in
  let yClose = abs (-w/2 + dog.w/2 - obj.y) < (dog.w/2.5 + obj.w/2.5) in
  xClose && yClose

updateObj : Bool -> Seed -> Object -> (Object, Seed)
updateObj reset seed obj =
  if not reset then ({ obj | y = obj.y - obj.v }, seed) else
    let (newX, seed') = generate (float (-w/2) (w/2)) seed in
    let (newV, seed'') = generate (float 1 3.5) seed' in
    ({ obj | 
        x = newX
    ,   y = w/2
    ,   v = newV
    }, seed'')
