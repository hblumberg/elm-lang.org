import Color exposing (..)
import Graphics.Collage exposing (..)

main =
  collage 300 300
    [ circle 100
        |> filled yellow
        |> move (0,0)
    ]
