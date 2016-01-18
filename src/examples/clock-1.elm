import Color
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main =
  collage 500 500
    [ image 400 400 "http://bit.ly/elm_clock"
        |> toForm
        |> move (0,0)
    ]
