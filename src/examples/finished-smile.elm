import Color exposing (..)
import Graphics.Collage exposing (..)

main =
  collage 300 300
    [ circle 100
        |> filled yellow
        |> move (0,0)
    , circle 15
        |> filled black
        |> move (-30,30)
    , circle 15
        |> filled black
        |> move (30,30)
    , polygon [(-50,25), (-20,0), (20,0), (50,25)]
        |> filled black
        |> move (0,-60)
    ]
