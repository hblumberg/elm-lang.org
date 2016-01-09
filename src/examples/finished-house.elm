import Color exposing (..)
import Graphics.Collage exposing (..)

main =
  collage 500 500
    [ square 500
        |> filled blue
        |> move (0,0)
    , rect 500 50
        |> filled green
        |> move (0,-225)
    , square 200
        |> filled red
        |> move (0,-150)
    , polygon [(-100,0), (100,0), (0,100)]
        |> filled black
        |> move (0,-50)
    , window (-50,-100)
    , window (50,-100)
    , door
    , bush (-50,-225)
    , bush (-80,-225)
    , bush (50,-225)
    , bush (80,-225)
    ]

window (x,y) = group
  [ square 50
      |> filled white
      |> move (x,y)
  , rect 50 5
      |> filled black
      |> move (x,y)
  , rect 5 50
      |> filled black
      |> move (x,y)
  ]
    
door = group
  [ rect 50 80
      |> filled black
      |> move (0,-210)
  , circle 5
      |> filled white
      |> move(15,-215)
  ]

bush (x,y) = group
  [ circle 25
      |> filled darkGreen
      |> move (x,y)
  ]
