import Color exposing (..)
import Graphics.Collage exposing (..)

main =
  collage 500 500
    [ square 200
        |> filled red
        |> move (0,-150)
    , polygon [(-100,0), (100,0), (0,100)]
        |> filled black
        |> move (0,-50)
    , window (-50,-100)
    , window (50,-100)
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
