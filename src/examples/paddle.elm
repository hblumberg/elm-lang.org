import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)
import Mouse exposing (..)

type alias Ball =
  { x : Float
  , y : Float
  , vx : Float
  , vy : Float
  , r : Float
  }
  
initBall =
  { x = 0
  , y = 0
  , vx = 4
  , vy = 8
  , r = 15
  }

type alias Paddle =
  { x : Float
  , width : Float
  , height : Float
  }
  
initPaddle =
  { x = 0
  , width = 50
  , height = 20
  }

type alias Game =
  { ball : Ball
  , paddle : Paddle
  , hasLost : Bool
  }
  
initGame =
  { ball = initBall
  , paddle = initPaddle
  , hasLost = False
  }

halfWidth = 250

main : Signal Element
main = Signal.map draw (Signal.foldp updateGame initGame inputSignals)

inputSignals : Signal (Int, Int)
inputSignals = Signal.sampleOn (Time.fps 30) (Mouse.position)

draw : Game -> Element
draw game =
  let (ball, paddle) = (game.ball, game.paddle) in
  collage (halfWidth * 2) (halfWidth * 2) 
    [ rect (halfWidth * 2) (halfWidth * 2)
        |> filled gray
        |> move (0,0)
    , circle ball.r
        |> filled black
        |> move (ball.x, ball.y)
    , rect paddle.width paddle.height
        |> filled purple
        |> move (paddle.x, paddle.height / 2 - halfWidth)
    ]

isTouchingSide : Ball -> Bool
isTouchingSide ball =
  ball.x < (-halfWidth + ball.r) || ball.x > (halfWidth - ball.r)
  
isTouchingTop : Ball -> Bool
isTouchingTop ball = ball.y > (halfWidth - ball.r)

isTouchingBottom : Ball -> Bool
isTouchingBottom ball = ball.y < (-halfWidth + ball.r)

isTouchingPaddle : Ball -> Paddle -> Bool
isTouchingPaddle ball paddle =
  ball.x > (paddle.x - paddle.width / 2) &&
    ball.x < (paddle.x + paddle.width / 2) &&
    (ball.y - ball.r) < paddle.height - halfWidth

updateGame : (Int, Int) -> Game -> Game
updateGame (mouseX, mouseY) game =
  if game.hasLost
    then game
  else
    let (ball, paddle) = (game.ball, game.paddle) in
    if isTouchingBottom ball
      then { game | hasLost = True }
    else
      let newPaddle =
        { paddle | x = toFloat mouseX - halfWidth } in
      let newBall = updateBall ball newPaddle in
      { game |
          ball = newBall,
          paddle = newPaddle
      }

updateBall : Ball -> Paddle -> Ball
updateBall ball paddle =
  let newVx =
    if isTouchingSide ball
      then -ball.vx
    else ball.vx in
  let newVy =
    if (isTouchingTop ball || isTouchingPaddle ball paddle)
      then -ball.vy
    else ball.vy in
  { ball |
      x = ball.x + newVx,
      y = ball.y + newVy,
      vx = newVx,
      vy = newVy
  }
