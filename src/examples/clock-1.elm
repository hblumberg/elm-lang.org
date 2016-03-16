import Color
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main =
  collage 500 500
    [ image 400 400 "http://learn-elm.com/assets/clock.png"
        |> toForm
        |> move (0,0)
    ]
