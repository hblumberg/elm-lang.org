import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main =
  collage 500 500
    [ image 400 400 "http://bit.ly/elm_clock"
        |> toForm
        |> move (0,0)
    , segment (0,0) (hourHandEnd 2)
        |> traced (solid black)
    ]

hourHandEnd hour = 
  let angle = hour * 30 in
  let x = 100 * sin (degrees angle) in
  let y = 100 * cos (degrees angle) in
    (x,y)
