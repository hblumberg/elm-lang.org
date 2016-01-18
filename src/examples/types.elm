import Color exposing (..)
import Graphics.Collage exposing (..)

main =
  collage 500 500
    [ circle 100
        |> filled red
        |> move (0,0)
    ]
